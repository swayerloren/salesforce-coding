# Automation

`AUTOMATION/` contains local validation scripts Codex can run before claiming Salesforce code changes are good.

The scripts are public-safe. They do not deploy, require Salesforce org login, install packages, edit Salesforce files, or copy external repositories.

## What The Scripts Do

| Script | Platform | Purpose |
| --- | --- | --- |
| [local-quality-check.ps1](local-quality-check.ps1) | Windows PowerShell | Locate the real Salesforce DX project, check local tools, inspect package scripts, recommend or run safe quality gates, and run public-safety scans. |
| [validate-salesforce-project.ps1](validate-salesforce-project.ps1) | Windows PowerShell | Locate and validate `force-app/main/default` from `FORCE_APP_DIRECTORY/`, an external path note, or the repo root. |
| [local-quality-check.sh](local-quality-check.sh) | Linux/macOS shell | Shell equivalent of the local quality check. |
| [validate-salesforce-project.sh](validate-salesforce-project.sh) | Linux/macOS shell | Shell equivalent of Salesforce DX project validation. |

## Project Discovery Order

The scripts look for the real Salesforce DX project in this order:

1. Explicit path passed to the script.
2. A project copied under `FORCE_APP_DIRECTORY/`.
3. A filled external path note in `FORCE_APP_DIRECTORY/README.md`.
4. The repo root, only if `force-app/main/default` exists there.

## Status Words

| Status | Meaning |
| --- | --- |
| `FOUND` | A file, folder, command, or package script exists. |
| `MISSING` | Something optional or expected was not found. |
| `SKIPPED` | A check could not or should not run safely. |
| `PASS` | A validation step passed. |
| `FAIL` | A blocking validation problem was found. |

## Windows PowerShell

Validate the real Salesforce DX project:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\AUTOMATION\validate-salesforce-project.ps1
```

Validate a known project path:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\AUTOMATION\validate-salesforce-project.ps1 -ProjectPath .\FORCE_APP_DIRECTORY\my-project
```

Run local quality checks without running project npm scripts:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\AUTOMATION\local-quality-check.ps1
```

Run detected safe project scripts where available:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\AUTOMATION\local-quality-check.ps1 -RunProjectScripts
```

Run against this helper repo before a user has placed a Salesforce DX project:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\AUTOMATION\local-quality-check.ps1 -AllowMissingProject
```

## Linux/macOS Shell

Validate the real Salesforce DX project:

```bash
bash ./AUTOMATION/validate-salesforce-project.sh
```

Validate a known project path:

```bash
bash ./AUTOMATION/validate-salesforce-project.sh ./FORCE_APP_DIRECTORY/my-project
```

Run local quality checks without running project npm scripts:

```bash
bash ./AUTOMATION/local-quality-check.sh
```

Run detected safe project scripts where available:

```bash
bash ./AUTOMATION/local-quality-check.sh --run-project-scripts
```

Run against this helper repo before a user has placed a Salesforce DX project:

```bash
bash ./AUTOMATION/local-quality-check.sh --allow-missing-project
```

## Codex Usage

Before claiming a Salesforce code fix is good, Codex should:

1. Run the project validator.
2. Confirm `force-app/main/default` was found.
3. Run `local-quality-check`.
4. Run detected project scripts only when safe and relevant.
5. Report exact `FOUND`, `MISSING`, `SKIPPED`, `PASS`, and `FAIL` lines.

Codex must not treat missing optional tools as proof that the code is valid. Missing tools should be reported as limits.
