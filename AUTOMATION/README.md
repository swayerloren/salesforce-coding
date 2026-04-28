# Automation

`AUTOMATION/` contains local validation scripts Codex can run before claiming Salesforce code changes are good.

The scripts are public-safe. They do not deploy, require Salesforce org login, install packages, edit Salesforce files, or copy external repositories.

These scripts are the local wrapper layer. They discover the real Salesforce DX project and report available tools. They do not replace the command maps, parameter maps, quality strategies, or validation flows:

- [Command maps](../SALESFORCE_KNOWLEDGE/COMMANDS/)
- [Parameter maps](../SALESFORCE_KNOWLEDGE/PARAMETERS/)
- [Quality strategies](../SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/)
- [Validation flows](../SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/)

## Where This Fits In Onboarding

After a new user downloads the release ZIP, extracts it, opens the repo in VS Code, and places or references the real Salesforce DX project, Codex may use these scripts to confirm the local workspace shape.

The normal order is:

1. Codex reads `START_HERE.md` and `INSTRUCTIONS/`.
2. Codex locates the real `force-app/main/default`.
3. Codex reads task-specific Salesforce knowledge, command maps, parameter maps, quality strategies, and validation flows.
4. Codex uses these scripts only as local wrappers for project discovery and safe quality checks.
5. Codex reports exact `FOUND`, `MISSING`, `SKIPPED`, `PASS`, or `FAIL` evidence.

## What The Scripts Do

| Script | Platform | Purpose |
| --- | --- | --- |
| [local-quality-check.ps1](local-quality-check.ps1) | Windows PowerShell | Locate the real Salesforce DX project, check local tools, inspect package scripts, recommend or run safe quality gates, and run public-safety scans. |
| [validate-salesforce-project.ps1](validate-salesforce-project.ps1) | Windows PowerShell | Locate and validate `force-app/main/default` from `FORCE_APP_DIRECTORY/`, an external path note, or the repo root. |
| [local-quality-check.sh](local-quality-check.sh) | Linux/macOS shell | Shell equivalent of the local quality check. |
| [validate-salesforce-project.sh](validate-salesforce-project.sh) | Linux/macOS shell | Shell equivalent of Salesforce DX project validation. |

`local-quality-check` also checks whether current Salesforce CLI help is available for common command families such as deploy start, deploy validate, deploy report, deploy quick, retrieve start, Apex tests, and Code Analyzer. That is command-shape evidence only. It does not prove that any deploy, retrieve, test, or analyzer command ran.

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

Run current Salesforce Code Analyzer when a real project is found:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\AUTOMATION\local-quality-check.ps1 -RunCodeAnalyzer
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

Run current Salesforce Code Analyzer when a real project is found:

```bash
bash ./AUTOMATION/local-quality-check.sh --run-code-analyzer
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

When a script recommends a command, Codex should confirm that command against the relevant command map and the real project's installed tools before treating it as validation evidence.

Codex must not claim deploy, retrieve, test, quick deploy, or analyzer success from this wrapper unless the wrapper actually ran that gate and reported `PASS`. Command help availability is useful preflight evidence, not validation success.
