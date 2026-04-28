# External Intelligence

This folder stores original, public-safe strategy notes distilled from public Salesforce tooling and reference repositories.

These files are not copies of external source. They explain what Codex can learn from upstream projects and how to apply that knowledge safely to a user's real Salesforce DX project.

## Use Rules

- Treat external repos as learning references, not source to paste.
- Inspect the user's real `force-app/main/default` before applying any pattern.
- Verify object, field, Apex, component, metadata, permission, and record page names in the real project.
- Prefer this repo's distilled docs first.
- Optionally inspect local external clones only when they are present and relevant.
- Preserve attribution with upstream URLs.
- Do not vendor external repos, `.git` folders, `node_modules`, generated artifacts, or sample app metadata.

## Strategy Map

| File | Use |
| --- | --- |
| [EXTERNAL_REPO_INTELLIGENCE_MAP.md](EXTERNAL_REPO_INTELLIGENCE_MAP.md) | Master map of external sources and safe integration types. |
| [APEX_RECIPES_STRATEGY.md](APEX_RECIPES_STRATEGY.md) | Apex pattern extraction strategy. |
| [LWC_RECIPES_STRATEGY.md](LWC_RECIPES_STRATEGY.md) | LWC pattern extraction strategy. |
| [CODE_ANALYZER_STRATEGY.md](CODE_ANALYZER_STRATEGY.md) | Static analysis strategy. |
| [LWC_JEST_STRATEGY.md](LWC_JEST_STRATEGY.md) | LWC unit test strategy. |
| [LWC_ESLINT_STRATEGY.md](LWC_ESLINT_STRATEGY.md) | LWC lint strategy. |
| [LWC_MOBILE_STRATEGY.md](LWC_MOBILE_STRATEGY.md) | Mobile/offline LWC strategy. |
| [APEX_FORMATTING_STRATEGY.md](APEX_FORMATTING_STRATEGY.md) | Apex formatting strategy. |
| [SALESFORCE_VSCODE_STRATEGY.md](SALESFORCE_VSCODE_STRATEGY.md) | Local developer workflow strategy. |
| [PR_SCAN_STRATEGY.md](PR_SCAN_STRATEGY.md) | Pull request scan strategy. |

## Codex Rule

Codex may use these strategy files to choose commands, validation flows, and quality gates. Codex must still inspect the real Salesforce DX project and must not claim validation passed without command evidence.
