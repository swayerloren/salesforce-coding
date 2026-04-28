# External Reference Repos

These repos were reviewed as public external references. They are not vendored into this repo.

Users can optionally clone them locally under `VENDOR_REFERENCES/_external/` with the helper scripts in [VENDOR_REFERENCES/](../VENDOR_REFERENCES/). That folder is ignored by git.

| Repo | URL | Best use |
| --- | --- | --- |
| Salesforce Code Analyzer | https://github.com/forcedotcom/code-analyzer | Static-analysis quality gate reference. |
| LWC Recipes | https://github.com/trailheadapps/lwc-recipes | LWC pattern and test reference. Map: [EXTERNAL_LWC_RECIPES_MAP.md](../SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_LWC_RECIPES_MAP.md). |
| Apex Recipes | https://github.com/trailheadapps/apex-recipes | Apex pattern and test reference. Map: [EXTERNAL_APEX_RECIPES_MAP.md](../SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_APEX_RECIPES_MAP.md). |
| Salesforce LWC Jest | https://github.com/salesforce/sfdx-lwc-jest | LWC unit testing tool reference. |
| Prettier Apex | https://github.com/dangmai/prettier-plugin-apex | Apex formatter reference. |
| ESLint Plugin LWC | https://github.com/salesforce/eslint-plugin-lwc | LWC lint rule reference. |
| ESLint Config LWC | https://github.com/salesforce/eslint-config-lwc | LWC ESLint config reference. |
| ESLint Plugin LWC Mobile | https://github.com/salesforce/eslint-plugin-lwc-mobile | Mobile/offline LWC lint reference. |
| ESLint Plugin LWC Graph Analyzer | https://github.com/salesforce/eslint-plugin-lwc-graph-analyzer | Advanced LWC graph analysis reference. |
| Salesforce DX VS Code | https://github.com/forcedotcom/salesforcedx-vscode | Salesforce developer workflow reference. |
| SFDX Scan Pull Request | https://github.com/mitchspano/sfdx-scan-pull-request | Optional PR scanner action reference. |

See [VENDOR_REFERENCES/](../VENDOR_REFERENCES/) for attribution and license notes.

Before adapting public recipe patterns, read [EXTERNAL_PATTERN_USAGE_RULES.md](../SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_PATTERN_USAGE_RULES.md).

Distilled strategy docs live in [SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/](../SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/). Codex should read those first, then inspect optional local clones only when they exist and only as references.

For command and option selection, use:

- [Command maps](../SALESFORCE_KNOWLEDGE/COMMANDS/)
- [Parameter maps](../SALESFORCE_KNOWLEDGE/PARAMETERS/)
- [Quality strategies](../SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/)
- [Validation flows](../SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/)

## Codex Rules

- Inspect local clones only when present.
- Do not require optional clones for normal use.
- Do not copy external source code blindly.
- Do not commit `VENDOR_REFERENCES/_external/`.
- Verify the real Salesforce DX project before adapting any external pattern.
- Do not copy external source files, workflow files, generated artifacts, package internals, or sample metadata into this repo.
