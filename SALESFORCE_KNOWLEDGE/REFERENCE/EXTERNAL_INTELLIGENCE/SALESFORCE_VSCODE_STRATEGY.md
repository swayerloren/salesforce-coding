# Salesforce VS Code Strategy

Source reference: https://github.com/forcedotcom/salesforcedx-vscode

The Salesforce VS Code Extensions repo is a developer workflow reference. It should not be copied into this repo.

## What Codex Should Learn

| Workflow idea | How this repo should use it |
| --- | --- |
| Language services | Encourage users to use Salesforce extensions for Apex, LWC, metadata, SOQL, Visualforce, and org browser support. |
| Layered quality gates | Use compile, lint, tests, link checks, duplicate checks, dependency checks, and public-safety scans where appropriate. |
| Local-first validation | Prefer local checks before claiming a fix is ready. |
| Tool detection | Detect available tools before recommending commands. |
| Public repo hygiene | Keep link checks and secret scans in release gates. |

## Practical Guidance

- This repo's `AUTOMATION/` scripts are the local wrapper for Codex.
- `TOOLS/` explains optional tools users may install in their real project.
- `QUALITY_GATES/` explains what evidence each validation step provides.
- VS Code extensions are optional developer aids, not requirements for this repo to function.

## Do Not

- Do not copy extension source, scripts, test workspaces, or workflows.
- Do not assume a user has the Salesforce Extension Pack installed.
- Do not use IDE behavior as proof that metadata deploys.
