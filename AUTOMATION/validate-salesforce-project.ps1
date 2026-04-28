param(
    [string]$ProjectPath = "",
    [switch]$AllowMissing
)

$ErrorActionPreference = "Stop"
$script:HasFailure = $false
$script:CandidateRoots = New-Object System.Collections.Generic.List[object]

function Write-Check {
    param(
        [ValidateSet("FOUND", "MISSING", "SKIPPED", "PASS", "FAIL", "INFO")]
        [string]$Status,
        [string]$Message
    )
    Write-Host ("{0}: {1}" -f $Status, $Message)
}

function Set-Failure {
    param([string]$Message)
    $script:HasFailure = $true
    Write-Check "FAIL" $Message
}

function Test-UsablePathNote {
    param([string]$Value)
    if ([string]::IsNullOrWhiteSpace($Value)) { return $false }
    $trimmed = $Value.Trim()
    if ($trimmed -match "^\[PASTE .+ HERE\]$") { return $false }
    if ($trimmed -match '^```') { return $false }
    if ($trimmed -match '^Actual .+ Path:') { return $false }
    if ($trimmed -match '^Target Org Alias:') { return $false }
    return $true
}

function Convert-ToProjectRoot {
    param([string]$Path)

    $normalized = $Path -replace "/", "\"
    if ($normalized -match "\\force-app\\main\\default$") {
        $main = Split-Path -Path $Path -Parent
        $forceApp = Split-Path -Path $main -Parent
        return Split-Path -Path $forceApp -Parent
    }

    return $Path
}

function Add-CandidateRoot {
    param(
        [string]$Path,
        [string]$Source
    )

    if (-not (Test-UsablePathNote $Path)) { return }

    $clean = [Environment]::ExpandEnvironmentVariables($Path.Trim().Trim('"').Trim("'"))
    $resolved = Resolve-Path -LiteralPath $clean -ErrorAction SilentlyContinue
    if (-not $resolved) {
        Write-Check "MISSING" ("{0} path not found: {1}" -f $Source, $Path)
        return
    }

    foreach ($item in $resolved) {
        $root = Convert-ToProjectRoot $item.ProviderPath
        $fullRoot = Resolve-Path -LiteralPath $root -ErrorAction SilentlyContinue
        if (-not $fullRoot) { continue }

        $alreadyAdded = $false
        foreach ($candidate in $script:CandidateRoots) {
            if ($candidate.Path -eq $fullRoot.ProviderPath) {
                $alreadyAdded = $true
                break
            }
        }

        if (-not $alreadyAdded) {
            $script:CandidateRoots.Add([pscustomobject]@{
                Path = $fullRoot.ProviderPath
                Source = $Source
            }) | Out-Null
        }
    }
}

function Add-MetadataRootCandidate {
    param(
        [string]$MetadataRoot,
        [string]$Source
    )

    $main = Split-Path -Path $MetadataRoot -Parent
    $forceApp = Split-Path -Path $main -Parent
    $projectRoot = Split-Path -Path $forceApp -Parent
    Add-CandidateRoot -Path $projectRoot -Source $Source
}

function Add-NestedMetadataCandidates {
    param(
        [string]$BasePath,
        [string]$Source
    )

    if (-not (Test-Path -LiteralPath $BasePath -PathType Container)) { return }

    $metadataRoots = Get-ChildItem -LiteralPath $BasePath -Recurse -Directory -Filter "default" -ErrorAction SilentlyContinue |
        Where-Object { ($_.FullName -replace "/", "\") -match "\\force-app\\main\\default$" }

    foreach ($metadataRoot in $metadataRoots) {
        Add-MetadataRootCandidate -MetadataRoot $metadataRoot.FullName -Source $Source
    }
}

function Add-ExternalReadmeCandidates {
    param([string]$RepoRoot)

    $readme = Join-Path $RepoRoot "FORCE_APP_DIRECTORY\README.md"
    if (-not (Test-Path -LiteralPath $readme -PathType Leaf)) {
        Write-Check "SKIPPED" "FORCE_APP_DIRECTORY/README.md external path note not found."
        return
    }

    $lines = Get-Content -LiteralPath $readme
    $foundPathNote = $false

    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        if ($line -match "^\s*(Actual Salesforce Project Path|Actual force-app/main/default Path):\s*(.*)\s*$") {
            $inline = $Matches[2].Trim()
            if (Test-UsablePathNote $inline) {
                Add-CandidateRoot -Path $inline -Source "FORCE_APP_DIRECTORY/README.md"
                Add-NestedMetadataCandidates -BasePath $inline -Source "FORCE_APP_DIRECTORY/README.md"
                $foundPathNote = $true
            }

            for ($j = $i + 1; $j -lt [Math]::Min($i + 5, $lines.Count); $j++) {
                $next = $lines[$j].Trim()
                if ([string]::IsNullOrWhiteSpace($next)) { continue }
                if (Test-UsablePathNote $next) {
                    Add-CandidateRoot -Path $next -Source "FORCE_APP_DIRECTORY/README.md"
                    Add-NestedMetadataCandidates -BasePath $next -Source "FORCE_APP_DIRECTORY/README.md"
                    $foundPathNote = $true
                }
                break
            }
        }
    }

    if ($foundPathNote) {
        Write-Check "FOUND" "External Salesforce project path note in FORCE_APP_DIRECTORY/README.md."
    } else {
        Write-Check "SKIPPED" "No filled external Salesforce project path note found in FORCE_APP_DIRECTORY/README.md."
    }
}

function Get-FirstValidProject {
    foreach ($candidate in $script:CandidateRoots) {
        $metadataRoot = Join-Path $candidate.Path "force-app\main\default"
        if (Test-Path -LiteralPath $metadataRoot -PathType Container) {
            return [pscustomobject]@{
                ProjectRoot = $candidate.Path
                MetadataRoot = (Resolve-Path -LiteralPath $metadataRoot).ProviderPath
                Source = $candidate.Source
            }
        }
    }
    return $null
}

function Get-FilesByNamePattern {
    param(
        [string]$Root,
        [string[]]$Patterns
    )

    if (-not (Test-Path -LiteralPath $Root -PathType Container)) { return @() }

    return @(Get-ChildItem -LiteralPath $Root -Recurse -File -ErrorAction SilentlyContinue |
        Where-Object {
            $name = $_.Name
            foreach ($pattern in $Patterns) {
                if ($name -like $pattern) { return $true }
            }
            return $false
        })
}

function Test-SalesforceProjectShape {
    param(
        [string]$ProjectRoot,
        [string]$MetadataRoot
    )

    Write-Check "PASS" ("force-app/main/default exists: {0}" -f $MetadataRoot)

    $sfdxProject = Join-Path $ProjectRoot "sfdx-project.json"
    if (Test-Path -LiteralPath $sfdxProject -PathType Leaf) {
        Write-Check "FOUND" ("sfdx-project.json: {0}" -f $sfdxProject)
    } else {
        Write-Check "MISSING" "sfdx-project.json not found at the selected project root."
    }

    $classesDir = Join-Path $MetadataRoot "classes"
    $triggersDir = Join-Path $MetadataRoot "triggers"
    $lwcDir = Join-Path $MetadataRoot "lwc"
    $objectsDir = Join-Path $MetadataRoot "objects"

    $apexClassFiles = @()
    if (Test-Path -LiteralPath $classesDir -PathType Container) {
        $apexClassFiles = Get-FilesByNamePattern -Root $classesDir -Patterns @("*.cls", "*.cls-meta.xml")
    }
    $strayApexClassFiles = @(Get-FilesByNamePattern -Root $MetadataRoot -Patterns @("*.cls", "*.cls-meta.xml") |
        Where-Object { $_.FullName -notlike "$classesDir*" })
    $triggerFiles = @()
    if (Test-Path -LiteralPath $triggersDir -PathType Container) {
        $triggerFiles = Get-FilesByNamePattern -Root $triggersDir -Patterns @("*.trigger", "*.trigger-meta.xml")
    }

    if ($apexClassFiles.Count -gt 0 -and (Test-Path -LiteralPath $classesDir -PathType Container)) {
        Write-Check "PASS" ("Apex classes folder exists and contains Apex class metadata: {0}" -f $classesDir)
    } elseif ($strayApexClassFiles.Count -gt 0 -and -not (Test-Path -LiteralPath $classesDir -PathType Container)) {
        Set-Failure "Apex class metadata exists but classes/ is missing under force-app/main/default."
    } elseif (Test-Path -LiteralPath $classesDir -PathType Container) {
        Write-Check "FOUND" ("classes/ exists but no Apex class files were detected: {0}" -f $classesDir)
    } else {
        Write-Check "SKIPPED" "No Apex class files detected; classes/ is not required for this check."
    }

    if ($triggerFiles.Count -gt 0) {
        Write-Check "PASS" ("Apex triggers folder exists and contains trigger metadata: {0}" -f $triggersDir)
    } elseif (Test-Path -LiteralPath $triggersDir -PathType Container) {
        Write-Check "FOUND" ("triggers/ exists but no trigger files were detected: {0}" -f $triggersDir)
    } else {
        Write-Check "SKIPPED" "No Apex trigger files detected."
    }

    if (Test-Path -LiteralPath $lwcDir -PathType Container) {
        $lwcFiles = @(Get-ChildItem -LiteralPath $lwcDir -Recurse -File -ErrorAction SilentlyContinue)
        if ($lwcFiles.Count -gt 0) {
            Write-Check "PASS" ("lwc/ exists and contains Lightning Web Component files: {0}" -f $lwcDir)
        } else {
            Write-Check "FOUND" ("lwc/ exists but appears empty: {0}" -f $lwcDir)
        }
    } else {
        Write-Check "SKIPPED" "No lwc/ folder detected under force-app/main/default."
    }

    $objectFilesAnywhere = Get-FilesByNamePattern -Root $MetadataRoot -Patterns @("*.object-meta.xml")
    if (Test-Path -LiteralPath $objectsDir -PathType Container) {
        $objectFiles = Get-FilesByNamePattern -Root $objectsDir -Patterns @("*.object-meta.xml", "*.field-meta.xml")
        if ($objectFiles.Count -gt 0) {
            Write-Check "PASS" ("objects/ exists and contains object metadata: {0}" -f $objectsDir)
        } else {
            Write-Check "FOUND" ("objects/ exists but no object metadata files were detected: {0}" -f $objectsDir)
        }
    } elseif ($objectFilesAnywhere.Count -gt 0) {
        Set-Failure "Object metadata exists but objects/ is missing under force-app/main/default."
    } else {
        Write-Check "SKIPPED" "No object metadata detected; objects/ is not required for this check."
    }

    Test-MetadataPathPatterns -ProjectRoot $ProjectRoot -MetadataRoot $MetadataRoot
}

function Test-MetadataFamily {
    param(
        [string]$MetadataRoot,
        [string]$RelativeFolder,
        [string[]]$Patterns,
        [string]$ValidRelativePathRegex,
        [string]$Label
    )

    $folder = Join-Path $MetadataRoot $RelativeFolder
    $folderExists = Test-Path -LiteralPath $folder -PathType Container
    $files = @()
    foreach ($pattern in $Patterns) {
        $files += @(Get-ChildItem -LiteralPath $MetadataRoot -Recurse -File -Filter $pattern -ErrorAction SilentlyContinue)
    }

    if ($files.Count -eq 0) {
        if ($folderExists) {
            Write-Check "FOUND" ("{0} exists but no matching files were detected: {1}" -f $RelativeFolder, $folder)
        } else {
            Write-Check "SKIPPED" ("No {0} metadata detected." -f $Label)
        }
        return
    }

    $bad = @()
    foreach ($file in $files) {
        $relative = $file.FullName.Substring($MetadataRoot.Length).TrimStart("\", "/") -replace "/", "\"
        if ($relative -notmatch $ValidRelativePathRegex) {
            $bad += $relative
        }
    }

    if ($bad.Count -gt 0) {
        Set-Failure ("{0} metadata found outside expected Salesforce DX source-format path." -f $Label)
        $bad | Select-Object -First 5 | ForEach-Object { Write-Check "INFO" ("Misplaced {0}: {1}" -f $Label, $_) }
        return
    }

    Write-Check "PASS" ("{0} metadata path check passed ({1} files)." -f $Label, $files.Count)
}

function Test-MetadataDirectory {
    param(
        [string]$MetadataRoot,
        [string]$RelativeFolder,
        [string]$Label
    )

    $folder = Join-Path $MetadataRoot $RelativeFolder
    if (Test-Path -LiteralPath $folder -PathType Container) {
        $count = @(Get-ChildItem -LiteralPath $folder -Recurse -File -ErrorAction SilentlyContinue).Count
        if ($count -gt 0) {
            Write-Check "PASS" ("{0} folder exists and contains files: {1}" -f $Label, $folder)
        } else {
            Write-Check "FOUND" ("{0} folder exists but appears empty: {1}" -f $Label, $folder)
        }
    } else {
        Write-Check "SKIPPED" ("No {0} folder detected." -f $Label)
    }
}

function Test-PackageManifest {
    param([string]$ProjectRoot)

    $manifest = Join-Path $ProjectRoot "manifest\package.xml"
    $rootManifest = Join-Path $ProjectRoot "package.xml"

    if (Test-Path -LiteralPath $manifest -PathType Leaf) {
        Write-Check "FOUND" ("package.xml manifest: {0}" -f $manifest)
    } elseif (Test-Path -LiteralPath $rootManifest -PathType Leaf) {
        Write-Check "FOUND" ("root package.xml manifest: {0}" -f $rootManifest)
    } else {
        Write-Check "SKIPPED" "No package.xml manifest detected."
    }

    $metadataRootManifest = Join-Path $ProjectRoot "force-app\main\default\package.xml"
    if (Test-Path -LiteralPath $metadataRootManifest -PathType Leaf) {
        Set-Failure "package.xml was found under force-app/main/default. Keep deployment manifests outside deployable metadata folders."
    }
}

function Test-MetadataPathPatterns {
    param(
        [string]$ProjectRoot,
        [string]$MetadataRoot
    )

    Write-Check "INFO" "Checking common Salesforce metadata source-format paths."
    Test-PackageManifest -ProjectRoot $ProjectRoot

    Test-MetadataFamily -MetadataRoot $MetadataRoot -RelativeFolder "objects" -Patterns @("*.object-meta.xml") -ValidRelativePathRegex '^objects\\[^\\]+\\[^\\]+\.object-meta\.xml$' -Label "Object"
    Test-MetadataFamily -MetadataRoot $MetadataRoot -RelativeFolder "objects" -Patterns @("*.field-meta.xml") -ValidRelativePathRegex '^objects\\[^\\]+\\fields\\[^\\]+\.field-meta\.xml$' -Label "Field"
    Test-MetadataFamily -MetadataRoot $MetadataRoot -RelativeFolder "objects" -Patterns @("*.validationRule-meta.xml") -ValidRelativePathRegex '^objects\\[^\\]+\\validationRules\\[^\\]+\.validationRule-meta\.xml$' -Label "Validation rule"
    Test-MetadataFamily -MetadataRoot $MetadataRoot -RelativeFolder "objects" -Patterns @("*.recordType-meta.xml") -ValidRelativePathRegex '^objects\\[^\\]+\\recordTypes\\[^\\]+\.recordType-meta\.xml$' -Label "Record type"
    Test-MetadataFamily -MetadataRoot $MetadataRoot -RelativeFolder "objects" -Patterns @("*.compactLayout-meta.xml") -ValidRelativePathRegex '^objects\\[^\\]+\\compactLayouts\\[^\\]+\.compactLayout-meta\.xml$' -Label "Compact layout"
    Test-MetadataFamily -MetadataRoot $MetadataRoot -RelativeFolder "layouts" -Patterns @("*.layout-meta.xml") -ValidRelativePathRegex '^layouts\\[^\\]+\.layout-meta\.xml$' -Label "Layout"
    Test-MetadataFamily -MetadataRoot $MetadataRoot -RelativeFolder "flexipages" -Patterns @("*.flexipage-meta.xml") -ValidRelativePathRegex '^flexipages\\[^\\]+\.flexipage-meta\.xml$' -Label "FlexiPage"
    Test-MetadataFamily -MetadataRoot $MetadataRoot -RelativeFolder "quickActions" -Patterns @("*.quickAction-meta.xml") -ValidRelativePathRegex '^(quickActions\\[^\\]+\.quickAction-meta\.xml|objects\\[^\\]+\\quickActions\\[^\\]+\.quickAction-meta\.xml)$' -Label "Quick action"
    Test-MetadataFamily -MetadataRoot $MetadataRoot -RelativeFolder "permissionsets" -Patterns @("*.permissionset-meta.xml") -ValidRelativePathRegex '^permissionsets\\[^\\]+\.permissionset-meta\.xml$' -Label "Permission set"
    Test-MetadataFamily -MetadataRoot $MetadataRoot -RelativeFolder "profiles" -Patterns @("*.profile-meta.xml") -ValidRelativePathRegex '^profiles\\[^\\]+\.profile-meta\.xml$' -Label "Profile"
    Test-MetadataFamily -MetadataRoot $MetadataRoot -RelativeFolder "tabs" -Patterns @("*.tab-meta.xml") -ValidRelativePathRegex '^tabs\\[^\\]+\.tab-meta\.xml$' -Label "Tab"
    Test-MetadataFamily -MetadataRoot $MetadataRoot -RelativeFolder "applications" -Patterns @("*.app-meta.xml") -ValidRelativePathRegex '^applications\\[^\\]+\.app-meta\.xml$' -Label "Application"
    Test-MetadataFamily -MetadataRoot $MetadataRoot -RelativeFolder "customMetadata" -Patterns @("*.md-meta.xml") -ValidRelativePathRegex '^customMetadata\\[^\\]+\.md-meta\.xml$' -Label "Custom metadata"
    Test-MetadataFamily -MetadataRoot $MetadataRoot -RelativeFolder "customPermissions" -Patterns @("*.customPermission-meta.xml") -ValidRelativePathRegex '^customPermissions\\[^\\]+\.customPermission-meta\.xml$' -Label "Custom permission"

    foreach ($dir in @(
        @{ Folder = "staticresources"; Label = "Static resource" },
        @{ Folder = "email"; Label = "Email" },
        @{ Folder = "reports"; Label = "Report" },
        @{ Folder = "dashboards"; Label = "Dashboard" }
    )) {
        Test-MetadataDirectory -MetadataRoot $MetadataRoot -RelativeFolder $dir.Folder -Label $dir.Label
    }
}

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).ProviderPath
Write-Host "Salesforce DX project validation"
Write-Host ("Repo: {0}" -f $repoRoot)

if (Test-UsablePathNote $ProjectPath) {
    Add-CandidateRoot -Path $ProjectPath -Source "explicit -ProjectPath"
    Add-NestedMetadataCandidates -BasePath $ProjectPath -Source "explicit -ProjectPath"
}

$forceAppDirectory = Join-Path $repoRoot "FORCE_APP_DIRECTORY"
if (Test-Path -LiteralPath $forceAppDirectory -PathType Container) {
    Write-Check "FOUND" ("FORCE_APP_DIRECTORY exists: {0}" -f $forceAppDirectory)
    Add-NestedMetadataCandidates -BasePath $forceAppDirectory -Source "FORCE_APP_DIRECTORY"
} else {
    Write-Check "MISSING" "FORCE_APP_DIRECTORY does not exist."
}

Add-ExternalReadmeCandidates -RepoRoot $repoRoot

$rootMetadata = Join-Path $repoRoot "force-app\main\default"
if (Test-Path -LiteralPath $rootMetadata -PathType Container) {
    Add-CandidateRoot -Path $repoRoot -Source "repo root"
}

if ($script:CandidateRoots.Count -gt 0) {
    Write-Check "FOUND" "Candidate Salesforce project roots:"
    foreach ($candidate in $script:CandidateRoots) {
        Write-Host (" - {0} [{1}]" -f $candidate.Path, $candidate.Source)
    }
} else {
    Write-Check "MISSING" "No candidate Salesforce project roots were found."
}

$project = Get-FirstValidProject
if (-not $project) {
    if ($AllowMissing) {
        Write-Check "SKIPPED" "No force-app/main/default folder found. This is allowed for placeholder/helper repo checks."
        exit 0
    }

    Set-Failure "No real Salesforce DX project with force-app/main/default was located."
    Write-Check "INFO" "Place a project under FORCE_APP_DIRECTORY/ or fill the external path note in FORCE_APP_DIRECTORY/README.md."
    exit 1
}

Write-Check "FOUND" ("Selected Salesforce project root: {0}" -f $project.ProjectRoot)
Write-Check "FOUND" ("Project source: {0}" -f $project.Source)
Test-SalesforceProjectShape -ProjectRoot $project.ProjectRoot -MetadataRoot $project.MetadataRoot

if ($script:HasFailure) {
    if ($AllowMissing) {
        Write-Check "SKIPPED" "Validation found shape problems, but AllowMissing was set."
        exit 0
    }
    exit 1
}

Write-Check "PASS" "Salesforce project validation complete."
exit 0
