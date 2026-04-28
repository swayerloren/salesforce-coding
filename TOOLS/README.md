# Tools

`TOOLS/` explains optional external tooling that can improve Codex work on a real Salesforce DX project.

These docs are guidance only. This repo does not vendor Salesforce tooling packages or cloned external repositories.

## Tool Map

| Tool guide | Required? | Use |
| --- | --- | --- |
| [SALESFORCE_CODE_ANALYZER.md](SALESFORCE_CODE_ANALYZER.md) | Optional, recommended | Static analysis for Apex, LWC, metadata-adjacent source, dependencies, and security signals. |
| [LWC_JEST.md](LWC_JEST.md) | Optional, recommended for LWC | Unit tests for Lightning Web Components. |
| [ESLINT_LWC.md](ESLINT_LWC.md) | Optional, recommended for LWC | LWC lint rules and Salesforce-specific JavaScript checks. |
| [LWC_MOBILE_LINT.md](LWC_MOBILE_LINT.md) | Advanced | Mobile/offline LWC rule checks. |
| [PRETTIER_APEX.md](PRETTIER_APEX.md) | Optional | Apex formatting checks. |
| [INSTALL_TOOLING.md](INSTALL_TOOLING.md) | Optional | Installation guidance for real Salesforce DX projects. |
| [EXTERNAL_REFERENCE_REPOS.md](EXTERNAL_REFERENCE_REPOS.md) | Reference only | External source repos reviewed for ideas. |
| [TOOL_REGISTRY.md](TOOL_REGISTRY.md) | Reference only | Tool status, upstream URL, and safe-use classification. |

## How Codex Should Use This Folder

1. Locate the real Salesforce DX project first.
2. Check whether the project already has tooling configured.
3. Prefer existing project scripts and config.
4. Suggest optional tools only when they fit the task.
5. Run quality gates after code changes when available.
6. Report exact commands and results.

Codex must not install packages, edit package files, or add workflows unless the user asks for that implementation.

## Where This Fits In Onboarding

New users should not start here. They should first download or clone the repo, open it in VS Code, place or reference the real Salesforce DX project, and tell Codex to read `START_HERE.md`.

Codex reaches `TOOLS/` after it has read the instructions, located `force-app/main/default`, read the Salesforce knowledge index, and identified the task type. This folder helps Codex decide whether Salesforce Code Analyzer, LWC Jest, ESLint, mobile lint, Apex formatting, or external reference docs are relevant to validation.

Tool availability is not validation success. Codex may report a tool as available, missing, skipped, passed, or failed only from actual inspection or command output.

## No Vendoring

Do not copy external repo source into this repo. Use upstream URLs and attribution in [VENDOR_REFERENCES/](../VENDOR_REFERENCES/).
