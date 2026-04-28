param(
    [string]$ProjectPath = "",
    [switch]$RunProjectScripts,
    [switch]$RunCodeAnalyzer,
    [switch]$AllowMissingProject
)

$ErrorActionPreference = "Stop"
$script:HasBlockingFailure = $false

function Write-Check {
    param(
        [ValidateSet("FOUND", "MISSING", "SKIPPED", "PASS", "FAIL", "INFO")]
        [string]$Status,
        [string]$Message
    )
    Write-Host ("{0}: {1}" -f $Status, $Message)
}

function Add-BlockingFailure {
    param([string]$Message)
    $script:HasBlockingFailure = $true
    Write-Check "FAIL" $Message
}

function Get-CurrentPowerShellExe {
    $current = (Get-Process -Id $PID -ErrorAction SilentlyContinue).Path
    if ($current -and (Test-Path -LiteralPath $current)) { return $current }

    $pwsh = Get-Command pwsh -ErrorAction SilentlyContinue
    if ($pwsh) { return $pwsh.Source }

    $powershell = Get-Command powershell -ErrorAction SilentlyContinue
    if ($powershell) { return $powershell.Source }

    return $null
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

function Add-ProjectCandidate {
    param(
        [System.Collections.Generic.List[object]]$Candidates,
        [string]$Path,
        [string]$Source
    )

    if (-not (Test-UsablePathNote $Path)) { return }
    $clean = [Environment]::ExpandEnvironmentVariables($Path.Trim().Trim('"').Trim("'"))
    $resolved = Resolve-Path -LiteralPath $clean -ErrorAction SilentlyContinue
    if (-not $resolved) { return }

    foreach ($item in $resolved) {
        $root = Convert-ToProjectRoot $item.ProviderPath
        $fullRoot = Resolve-Path -LiteralPath $root -ErrorAction SilentlyContinue
        if (-not $fullRoot) { continue }

        $exists = $false
        foreach ($candidate in $Candidates) {
            if ($candidate.Path -eq $fullRoot.ProviderPath) {
                $exists = $true
                break
            }
        }
        if (-not $exists) {
            $Candidates.Add([pscustomobject]@{ Path = $fullRoot.ProviderPath; Source = $Source }) | Out-Null
        }
    }
}

function Add-MetadataRootCandidate {
    param(
        [System.Collections.Generic.List[object]]$Candidates,
        [string]$MetadataRoot,
        [string]$Source
    )

    $main = Split-Path -Path $MetadataRoot -Parent
    $forceApp = Split-Path -Path $main -Parent
    $projectRoot = Split-Path -Path $forceApp -Parent
    Add-ProjectCandidate -Candidates $Candidates -Path $projectRoot -Source $Source
}

function Add-NestedMetadataCandidates {
    param(
        [System.Collections.Generic.List[object]]$Candidates,
        [string]$BasePath,
        [string]$Source
    )

    if (-not (Test-Path -LiteralPath $BasePath -PathType Container)) { return }

    $metadataRoots = Get-ChildItem -LiteralPath $BasePath -Recurse -Directory -Filter "default" -ErrorAction SilentlyContinue |
        Where-Object { ($_.FullName -replace "/", "\") -match "\\force-app\\main\\default$" }

    foreach ($metadataRoot in $metadataRoots) {
        Add-MetadataRootCandidate -Candidates $Candidates -MetadataRoot $metadataRoot.FullName -Source $Source
    }
}

function Add-ExternalReadmeCandidates {
    param(
        [System.Collections.Generic.List[object]]$Candidates,
        [string]$RepoRoot
    )

    $readme = Join-Path $RepoRoot "FORCE_APP_DIRECTORY\README.md"
    if (-not (Test-Path -LiteralPath $readme -PathType Leaf)) { return }

    $lines = Get-Content -LiteralPath $readme
    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        if ($line -match "^\s*(Actual Salesforce Project Path|Actual force-app/main/default Path):\s*(.*)\s*$") {
            $inline = $Matches[2].Trim()
            if (Test-UsablePathNote $inline) {
                Add-ProjectCandidate -Candidates $Candidates -Path $inline -Source "FORCE_APP_DIRECTORY/README.md"
                Add-NestedMetadataCandidates -Candidates $Candidates -BasePath $inline -Source "FORCE_APP_DIRECTORY/README.md"
            }
            for ($j = $i + 1; $j -lt [Math]::Min($i + 5, $lines.Count); $j++) {
                $next = $lines[$j].Trim()
                if ([string]::IsNullOrWhiteSpace($next)) { continue }
                if (Test-UsablePathNote $next) {
                    Add-ProjectCandidate -Candidates $Candidates -Path $next -Source "FORCE_APP_DIRECTORY/README.md"
                    Add-NestedMetadataCandidates -Candidates $Candidates -BasePath $next -Source "FORCE_APP_DIRECTORY/README.md"
                }
                break
            }
        }
    }
}

function Find-SalesforceProject {
    param([string]$RepoRoot)

    $candidates = New-Object System.Collections.Generic.List[object]

    if (Test-UsablePathNote $ProjectPath) {
        Add-ProjectCandidate -Candidates $candidates -Path $ProjectPath -Source "explicit -ProjectPath"
        Add-NestedMetadataCandidates -Candidates $candidates -BasePath $ProjectPath -Source "explicit -ProjectPath"
    }

    $forceAppDirectory = Join-Path $RepoRoot "FORCE_APP_DIRECTORY"
    if (Test-Path -LiteralPath $forceAppDirectory -PathType Container) {
        Add-NestedMetadataCandidates -Candidates $candidates -BasePath $forceAppDirectory -Source "FORCE_APP_DIRECTORY"
    }

    Add-ExternalReadmeCandidates -Candidates $candidates -RepoRoot $RepoRoot

    $rootMetadata = Join-Path $RepoRoot "force-app\main\default"
    if (Test-Path -LiteralPath $rootMetadata -PathType Container) {
        Add-ProjectCandidate -Candidates $candidates -Path $RepoRoot -Source "repo root"
    }

    foreach ($candidate in $candidates) {
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

function Get-PackageJson {
    param([string]$ProjectRoot)
    $path = Join-Path $ProjectRoot "package.json"
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { return $null }

    try {
        return [pscustomobject]@{
            Path = $path
            Json = Get-Content -LiteralPath $path -Raw | ConvertFrom-Json
        }
    } catch {
        Add-BlockingFailure ("package.json could not be parsed: {0}" -f $path)
        return $null
    }
}

function Test-PackageScript {
    param($PackageJson, [string]$Name)
    if (-not $PackageJson) { return $false }
    $scripts = $PackageJson.Json.scripts
    if (-not $scripts) { return $false }
    return [bool]($scripts.PSObject.Properties.Name -contains $Name)
}

function Get-FirstPackageScript {
    param($PackageJson, [string[]]$Names)
    foreach ($name in $Names) {
        if (Test-PackageScript -PackageJson $PackageJson -Name $name) {
            return $name
        }
    }
    return $null
}

function Test-PackageDependency {
    param($PackageJson, [string]$Name)
    if (-not $PackageJson) { return $false }
    foreach ($sectionName in @("dependencies", "devDependencies", "peerDependencies", "optionalDependencies")) {
        $section = $PackageJson.Json.$sectionName
        if ($section -and ($section.PSObject.Properties.Name -contains $Name)) {
            return $true
        }
    }
    return $false
}

function Write-PackageDependencyState {
    param($PackageJson, [string]$Name, [string]$Label)
    if (Test-PackageDependency -PackageJson $PackageJson -Name $Name) {
        Write-Check "FOUND" ("npm dependency: {0}" -f $Name)
    } else {
        Write-Check "MISSING" ("npm dependency: {0} ({1})" -f $Name, $Label)
    }
}

function Get-PackageText {
    param([string]$PackagePath)
    if (-not $PackagePath) { return "" }
    return Get-Content -LiteralPath $PackagePath -Raw
}

function Invoke-ProjectCommand {
    param(
        [string]$ProjectRoot,
        [string]$Command,
        [string[]]$Arguments,
        [string]$Reason
    )

    if (-not $RunProjectScripts) {
        Write-Check "SKIPPED" ("{0}. Recommended command from project root: {1} {2}" -f $Reason, $Command, ($Arguments -join " "))
        return
    }

    Push-Location $ProjectRoot
    try {
        Write-Check "INFO" ("Running: {0} {1}" -f $Command, ($Arguments -join " "))
        & $Command @Arguments
        if ($LASTEXITCODE -eq 0) {
            Write-Check "PASS" ("Command passed: {0} {1}" -f $Command, ($Arguments -join " "))
        } else {
            Add-BlockingFailure ("Command failed with exit code {0}: {1} {2}" -f $LASTEXITCODE, $Command, ($Arguments -join " "))
        }
    } finally {
        Pop-Location
    }
}

function Test-SfCommand {
    param([string[]]$Arguments)
    $oldProgress = $ProgressPreference
    $oldErrorAction = $ErrorActionPreference
    $ProgressPreference = "SilentlyContinue"
    $ErrorActionPreference = "Continue"
    try {
        $output = & sf @Arguments 2>&1 | Out-String
        if ($LASTEXITCODE -eq 0) { return $true }
        return [bool]($output -match "USAGE|Analyze your code|Scan a codebase")
    } catch {
        return $false
    } finally {
        $ProgressPreference = $oldProgress
        $ErrorActionPreference = $oldErrorAction
    }
}

function Test-SfdxCommand {
    param([string[]]$Arguments)
    $oldErrorAction = $ErrorActionPreference
    $ErrorActionPreference = "Continue"
    try {
        $output = & sfdx @Arguments 2>&1 | Out-String
        if ($LASTEXITCODE -eq 0) { return $true }
        return [bool]($output -match "USAGE|Analyze your code|Scan a codebase")
    } catch {
        return $false
    } finally {
        $ErrorActionPreference = $oldErrorAction
    }
}

function Get-CodeAnalyzerInvocation {
    param($ToolState)

    if ($ToolState["sf"] -and (Test-SfCommand @("code-analyzer", "run", "--help"))) {
        return [pscustomobject]@{
            Label = "Salesforce Code Analyzer through sf code-analyzer"
            Command = "sf"
            Arguments = @("code-analyzer", "run", "--target", "force-app/main/default", "--view", "table")
            Install = "sf plugins install @salesforce/plugin-code-analyzer"
        }
    }

    if ($ToolState["sf"] -and (Test-SfCommand @("scanner", "run", "--help"))) {
        return [pscustomobject]@{
            Label = "Salesforce Scanner through sf scanner run"
            Command = "sf"
            Arguments = @("scanner", "run", "--target", "force-app/main/default")
            Install = "sf plugins install @salesforce/sfdx-scanner"
        }
    }

    if ($ToolState["sfdx"] -and (Test-SfdxCommand @("scanner:run", "--help"))) {
        return [pscustomobject]@{
            Label = "Salesforce Scanner through sfdx scanner:run"
            Command = "sfdx"
            Arguments = @("scanner:run", "--target", "force-app/main/default")
            Install = "sfdx plugins:install @salesforce/sfdx-scanner"
        }
    }

    return $null
}

function Invoke-CodeAnalyzerGate {
    param(
        $Project,
        $Invocation
    )

    if (-not $Invocation) {
        Write-Check "MISSING" "Salesforce Code Analyzer was not detected."
        Write-Check "INFO" "Recommended install: sf plugins install @salesforce/plugin-code-analyzer"
        Write-Check "SKIPPED" "Salesforce Code Analyzer was not run because no analyzer command is available."
        return
    }

    Write-Check "FOUND" $Invocation.Label
    Write-Check "INFO" ("Analyzer command: {0} {1}" -f $Invocation.Command, ($Invocation.Arguments -join " "))
    Write-Check "INFO" "Supported targets include repo-root force-app/main/default or FORCE_APP_DIRECTORY/your-project/force-app/main/default."

    if (-not $Project) {
        Write-Check "SKIPPED" "Salesforce Code Analyzer was not run because no real Salesforce DX project target was found."
        return
    }

    if (-not $RunCodeAnalyzer) {
        Write-Check "SKIPPED" ("Salesforce Code Analyzer not run. To run it from the selected project root, pass -RunCodeAnalyzer. Project root: {0}" -f $Project.ProjectRoot)
        return
    }

    Push-Location $Project.ProjectRoot
    try {
        Write-Check "INFO" ("Running Salesforce Code Analyzer from {0}" -f $Project.ProjectRoot)
        & $Invocation.Command @($Invocation.Arguments)
        if ($LASTEXITCODE -eq 0) {
            Write-Check "PASS" "Salesforce Code Analyzer completed successfully."
        } else {
            Add-BlockingFailure ("Salesforce Code Analyzer failed or reported blocking findings with exit code {0}." -f $LASTEXITCODE)
        }
    } finally {
        Pop-Location
    }
}

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).ProviderPath
Write-Host "Local Salesforce quality check"
Write-Host ("Repo: {0}" -f $repoRoot)

$tools = @("git", "sf", "sfdx", "node", "npm", "npx", "rg")
$toolState = @{}
foreach ($tool in $tools) {
    $command = Get-Command $tool -ErrorAction SilentlyContinue
    if ($command) {
        $toolState[$tool] = $true
        Write-Check "FOUND" ("{0}: {1}" -f $tool, $command.Source)
    } else {
        $toolState[$tool] = $false
        Write-Check "MISSING" ("{0} is not installed or not on PATH." -f $tool)
    }
}

if ($toolState["git"]) {
    git -C $repoRoot status --short --branch
} else {
    Write-Check "SKIPPED" "git status was skipped because git is missing."
}

if ($toolState["rg"]) {
    $scanGlobs = @(
        "--hidden",
        "--glob", "!.git/*",
        "--glob", "!AUTOMATION/*",
        "--glob", "!VENDOR_REFERENCES/_external/**",
        "--glob", "!temp/**",
        "--glob", "!node_modules/**"
    )

    $temporaryReferencePattern = "SALES" + " FORCE" + " READ" + " ME"
    rg @scanGlobs --line-number --fixed-strings -- $temporaryReferencePattern $repoRoot
    if ($LASTEXITCODE -eq 0) { Add-BlockingFailure "Temporary folder reference found." } elseif ($LASTEXITCODE -eq 1) { Write-Check "PASS" "No temporary folder references found." }

    $localPathPattern = "[A-Za-z]:\\\\Users\\\\|[A-Za-z]:\\\\|/(Users|home)/[^/\s]+/"
    rg @scanGlobs --line-number -- $localPathPattern $repoRoot
    if ($LASTEXITCODE -eq 0) { Add-BlockingFailure "Local-only Windows path found in public-scanned files." } elseif ($LASTEXITCODE -eq 1) { Write-Check "PASS" "No local-only Windows paths found." }

    $secretPattern = "(api[_-]?key|access[_-]?token|refresh[_-]?token|client[_-]?secret|session[_-]?id|password|passwd|secret)\s*[:=]\s*[A-Za-z0-9_./+=-]{8,}"
    rg @scanGlobs --line-number -i -- $secretPattern $repoRoot
    if ($LASTEXITCODE -eq 0) { Add-BlockingFailure "Credential-like assignment found." } elseif ($LASTEXITCODE -eq 1) { Write-Check "PASS" "No credential-like assignments found." }
} else {
    Write-Check "SKIPPED" "Public-safety text scans skipped because ripgrep is missing."
}

$validator = Join-Path $PSScriptRoot "validate-salesforce-project.ps1"
$psExe = Get-CurrentPowerShellExe
if ($psExe -and (Test-Path -LiteralPath $validator -PathType Leaf)) {
    $validatorArgs = @("-NoProfile", "-ExecutionPolicy", "Bypass", "-File", $validator)
    if (Test-UsablePathNote $ProjectPath) { $validatorArgs += @("-ProjectPath", $ProjectPath) }
    if ($AllowMissingProject) { $validatorArgs += "-AllowMissing" }

    & $psExe @validatorArgs
    if ($LASTEXITCODE -eq 0) {
        Write-Check "PASS" "Salesforce project validator completed."
    } else {
        Add-BlockingFailure "Salesforce project validator failed. Codex must locate force-app/main/default before editing."
    }
} else {
    Add-BlockingFailure "Could not run validate-salesforce-project.ps1."
}

$project = Find-SalesforceProject -RepoRoot $repoRoot
if (-not $project) {
    if ($AllowMissingProject) {
        Write-Check "SKIPPED" "No real Salesforce DX project located; project-level package checks skipped."
    } else {
        Add-BlockingFailure "No real Salesforce DX project located for package-level checks."
    }
} else {
    Write-Check "FOUND" ("Selected Salesforce project root for quality gates: {0}" -f $project.ProjectRoot)
    $package = Get-PackageJson -ProjectRoot $project.ProjectRoot
    if ($package) {
        Write-Check "FOUND" ("package.json: {0}" -f $package.Path)
        $packageText = Get-PackageText $package.Path
        foreach ($scriptName in @("lint", "lint:lwc", "lint:mobile", "test", "test:unit", "test:unit:coverage", "prettier", "prettier:check")) {
            if (Test-PackageScript -PackageJson $package -Name $scriptName) {
                Write-Check "FOUND" ("npm script: {0}" -f $scriptName)
            } else {
                Write-Check "MISSING" ("npm script: {0}" -f $scriptName)
            }
        }

        foreach ($dependency in @(
            @{ Name = "eslint"; Label = "base ESLint" },
            @{ Name = "@salesforce/eslint-config-lwc"; Label = "Salesforce LWC ESLint config" },
            @{ Name = "@lwc/eslint-plugin-lwc"; Label = "LWC ESLint plugin" },
            @{ Name = "@salesforce/sfdx-lwc-jest"; Label = "LWC Jest" },
            @{ Name = "@salesforce/eslint-plugin-lwc-mobile"; Label = "LWC mobile lint" },
            @{ Name = "@salesforce/eslint-plugin-lwc-graph-analyzer"; Label = "advanced graph analyzer" }
        )) {
            Write-PackageDependencyState -PackageJson $package -Name $dependency.Name -Label $dependency.Label
        }

        $lwcLintScript = Get-FirstPackageScript -PackageJson $package -Names @("lint:lwc", "lint")
        $mobileLintScript = Get-FirstPackageScript -PackageJson $package -Names @("lint:mobile")
        $jestScript = Get-FirstPackageScript -PackageJson $package -Names @("test:unit", "test")

        $hasLwcJest = (Test-PackageDependency -PackageJson $package -Name "@salesforce/sfdx-lwc-jest") -or ($packageText -match "sfdx-lwc-jest") -or (Test-PackageScript -PackageJson $package -Name "test:unit")
        if ($hasLwcJest) {
            if ($toolState["npm"] -and $jestScript) {
                Invoke-ProjectCommand -ProjectRoot $project.ProjectRoot -Command "npm" -Arguments @("run", $jestScript) -Reason ("LWC Jest appears available via npm script '{0}'" -f $jestScript)
            } else {
                Write-Check "SKIPPED" "LWC Jest appears available, but no runnable npm test script was found."
            }
        } else {
            Write-Check "SKIPPED" "LWC Jest was not detected in package.json."
        }

        $hasEslint = (Test-PackageDependency -PackageJson $package -Name "eslint") -or (Test-PackageDependency -PackageJson $package -Name "@salesforce/eslint-config-lwc") -or (Test-PackageDependency -PackageJson $package -Name "@lwc/eslint-plugin-lwc") -or $lwcLintScript
        if ($hasEslint) {
            if ($toolState["npm"] -and $lwcLintScript) {
                Invoke-ProjectCommand -ProjectRoot $project.ProjectRoot -Command "npm" -Arguments @("run", $lwcLintScript) -Reason ("LWC ESLint appears available via npm script '{0}'" -f $lwcLintScript)
            } else {
                Write-Check "SKIPPED" "LWC ESLint appears available, but no runnable npm lint or lint:lwc script was found."
            }
        } else {
            Write-Check "SKIPPED" "ESLint was not detected in package.json."
        }

        $hasMobileLint = (Test-PackageDependency -PackageJson $package -Name "@salesforce/eslint-plugin-lwc-mobile") -or (Test-PackageDependency -PackageJson $package -Name "@salesforce/eslint-plugin-lwc-graph-analyzer") -or $mobileLintScript
        if ($hasMobileLint) {
            if ($toolState["npm"] -and $mobileLintScript) {
                Invoke-ProjectCommand -ProjectRoot $project.ProjectRoot -Command "npm" -Arguments @("run", $mobileLintScript) -Reason ("LWC mobile lint appears available via npm script '{0}'" -f $mobileLintScript)
            } else {
                Write-Check "SKIPPED" "LWC mobile lint or graph analyzer appears available, but no runnable npm lint:mobile script was found."
            }
        } else {
            Write-Check "SKIPPED" "LWC mobile lint and graph analyzer were not detected in package.json."
        }

        if ($toolState["npm"] -and (Test-PackageScript -PackageJson $package -Name "prettier:check")) {
            Invoke-ProjectCommand -ProjectRoot $project.ProjectRoot -Command "npm" -Arguments @("run", "prettier:check") -Reason "Prettier check script is available"
        } elseif (Test-PackageScript -PackageJson $package -Name "prettier") {
            Write-Check "SKIPPED" "npm run prettier exists, but it may write files. Prefer a non-mutating prettier:check script before validation."
        } else {
            Write-Check "SKIPPED" "No prettier:check script was detected."
        }
    } else {
        Write-Check "SKIPPED" "No package.json found at selected Salesforce project root."
    }
}

$codeAnalyzerInvocation = Get-CodeAnalyzerInvocation -ToolState $toolState
Invoke-CodeAnalyzerGate -Project $project -Invocation $codeAnalyzerInvocation

if (-not $toolState["sf"] -and -not $toolState["sfdx"] -and -not $toolState["node"] -and -not $toolState["npm"] -and -not $toolState["npx"]) {
    Write-Check "INFO" "Install checklist: Salesforce CLI (sf), Node.js, npm, project dev dependencies, Salesforce Code Analyzer, LWC Jest, ESLint, and an Apex formatter as needed."
}

if ($script:HasBlockingFailure) {
    Write-Check "FAIL" "Local quality check completed with blocking failures."
    exit 1
}

Write-Check "PASS" "Local quality check complete."
exit 0
