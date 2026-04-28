# Local Automation Parameters

These are parameters for this repo's own local wrapper scripts in `AUTOMATION/`.

## PowerShell

| Script | Parameter | Use |
| --- | --- | --- |
| `validate-salesforce-project.ps1` | `-ProjectPath <path>` | Validate a known Salesforce DX project path. |
| `local-quality-check.ps1` | `-ProjectPath <path>` | Run quality checks against a known project path. |
| `local-quality-check.ps1` | `-RunProjectScripts` | Run detected safe npm scripts instead of only recommending them. |
| `local-quality-check.ps1` | `-RunCodeAnalyzer` | Run detected current Salesforce Code Analyzer against the selected project. |
| `local-quality-check.ps1` | `-AllowMissingProject` | Allow helper-repo-only validation when no real project is present. |

## Shell

| Script | Parameter | Use |
| --- | --- | --- |
| `validate-salesforce-project.sh` | `<project-path>` | Validate a known Salesforce DX project path. |
| `local-quality-check.sh` | `<project-path>` | Run quality checks against a known project path. |
| `local-quality-check.sh` | `--run-project-scripts` | Run detected safe npm scripts. |
| `local-quality-check.sh` | `--run-code-analyzer` | Run detected current Salesforce Code Analyzer against the selected project. |
| `local-quality-check.sh` | `--allow-missing-project` | Allow helper-repo-only validation. |

## Codex Rule

The automation scripts are wrappers. They do not replace task-specific source inspection, tests, deploy dry runs, or analyzer evidence.

They do not deploy, retrieve, create orgs, assign permissions, insert data, or run anonymous Apex. When they report CLI command availability, that means installed help was available, not that a deploy or test ran.
