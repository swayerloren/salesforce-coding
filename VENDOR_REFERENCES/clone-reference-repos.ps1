param(
    [string]$Destination = "",
    [switch]$FullClone
)

$ErrorActionPreference = "Stop"
$script:HadFailure = $false

function Write-Status {
    param([string]$Status, [string]$Message)
    Write-Host ("{0}: {1}" -f $Status, $Message)
}

function Add-Failure {
    param([string]$Message)
    $script:HadFailure = $true
    Write-Status "FAIL" $Message
}

$repoRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot "..")).ProviderPath
if ([string]::IsNullOrWhiteSpace($Destination)) {
    $Destination = Join-Path $PSScriptRoot "_external"
} elseif (-not [System.IO.Path]::IsPathRooted($Destination)) {
    $Destination = Join-Path $PSScriptRoot $Destination
}

$destinationFull = [System.IO.Path]::GetFullPath($Destination)
$vendorRoot = [System.IO.Path]::GetFullPath($PSScriptRoot)

if (-not $destinationFull.StartsWith($vendorRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "Destination must stay under VENDOR_REFERENCES. Refusing: $destinationFull"
}

$git = Get-Command git -ErrorAction SilentlyContinue
if (-not $git) {
    throw "git is required but was not found on PATH."
}

$repos = @(
    @{ Name = "code-analyzer"; Url = "https://github.com/forcedotcom/code-analyzer" },
    @{ Name = "lwc-recipes"; Url = "https://github.com/trailheadapps/lwc-recipes" },
    @{ Name = "apex-recipes"; Url = "https://github.com/trailheadapps/apex-recipes" },
    @{ Name = "sfdx-lwc-jest"; Url = "https://github.com/salesforce/sfdx-lwc-jest" },
    @{ Name = "prettier-plugin-apex"; Url = "https://github.com/dangmai/prettier-plugin-apex" },
    @{ Name = "eslint-plugin-lwc"; Url = "https://github.com/salesforce/eslint-plugin-lwc" },
    @{ Name = "eslint-config-lwc"; Url = "https://github.com/salesforce/eslint-config-lwc" },
    @{ Name = "eslint-plugin-lwc-mobile"; Url = "https://github.com/salesforce/eslint-plugin-lwc-mobile" },
    @{ Name = "eslint-plugin-lwc-graph-analyzer"; Url = "https://github.com/salesforce/eslint-plugin-lwc-graph-analyzer" },
    @{ Name = "salesforcedx-vscode"; Url = "https://github.com/forcedotcom/salesforcedx-vscode" },
    @{ Name = "sfdx-scan-pull-request"; Url = "https://github.com/mitchspano/sfdx-scan-pull-request" }
)

New-Item -ItemType Directory -Force -Path $destinationFull | Out-Null

Write-Status "INFO" ("Repo root: {0}" -f $repoRoot)
Write-Status "INFO" ("Clone destination: {0}" -f $destinationFull)
Write-Status "INFO" "These clones are local references only and must not be committed."

foreach ($repo in $repos) {
    $target = Join-Path $destinationFull $repo.Name
    if (Test-Path -LiteralPath $target) {
        Write-Status "SKIPPED" ("{0} already exists: {1}" -f $repo.Name, $target)
        continue
    }

    $args = @("clone")
    if (-not $FullClone) {
        $args += @("--depth", "1")
    }
    $args += @($repo.Url, $target)

    Write-Status "INFO" ("Cloning {0} from {1}" -f $repo.Name, $repo.Url)
    & git @args
    if ($LASTEXITCODE -eq 0) {
        Write-Status "PASS" ("Cloned {0}" -f $repo.Name)
    } else {
        Add-Failure ("Clone failed for {0}" -f $repo.Name)
    }
}

if ($script:HadFailure) {
    Write-Status "FAIL" "One or more optional reference repos failed to clone."
    exit 1
}

Write-Status "PASS" "Optional reference clone pass complete."
exit 0
