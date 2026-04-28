# Tool Source Map

This map records public external Salesforce repos that can be used as optional local references.

No external source files are intentionally copied into this repo.

| Source | URL | Local folder | License signal | Safe use |
| --- | --- | --- | --- | --- |
| Salesforce Code Analyzer | https://github.com/forcedotcom/code-analyzer | `code-analyzer` | BSD-3-Clause | Reference, optional tool guide, quality gate. |
| LWC Recipes | https://github.com/trailheadapps/lwc-recipes | `lwc-recipes` | CC0-1.0 | Reference map and pattern categories. See [EXTERNAL_LWC_RECIPES_MAP.md](../SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_LWC_RECIPES_MAP.md). |
| Apex Recipes | https://github.com/trailheadapps/apex-recipes | `apex-recipes` | CC0-1.0 | Reference map and pattern categories. See [EXTERNAL_APEX_RECIPES_MAP.md](../SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_APEX_RECIPES_MAP.md). |
| Salesforce LWC Jest | https://github.com/salesforce/sfdx-lwc-jest | `sfdx-lwc-jest` | MIT | Optional dev dependency and testing guide. |
| Prettier Apex | https://github.com/dangmai/prettier-plugin-apex | `prettier-plugin-apex` | MIT | Optional dev dependency and formatting guide. |
| ESLint Plugin LWC | https://github.com/salesforce/eslint-plugin-lwc | `eslint-plugin-lwc` | MIT | Optional dev dependency and lint rule reference. |
| ESLint Config LWC | https://github.com/salesforce/eslint-config-lwc | `eslint-config-lwc` | MIT | Optional dev dependency and config reference. |
| ESLint Plugin LWC Mobile | https://github.com/salesforce/eslint-plugin-lwc-mobile | `eslint-plugin-lwc-mobile` | MIT | Advanced optional mobile lint reference. |
| ESLint Plugin LWC Graph Analyzer | https://github.com/salesforce/eslint-plugin-lwc-graph-analyzer | `eslint-plugin-lwc-graph-analyzer` | MIT | Advanced optional graph analysis reference. |
| Salesforce DX VS Code | https://github.com/forcedotcom/salesforcedx-vscode | `salesforcedx-vscode` | BSD-3-Clause | Reference only for developer workflow concepts. |
| SFDX Scan Pull Request | https://github.com/mitchspano/sfdx-scan-pull-request | `sfdx-scan-pull-request` | Apache-2.0 | Optional GitHub Action reference. |

## Copy Status

External repos may be cloned locally under:

```text
VENDOR_REFERENCES/_external/
```

That folder is ignored by git. It is not part of the public repo.

Before adapting public recipe patterns, read [EXTERNAL_PATTERN_USAGE_RULES.md](../SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_PATTERN_USAGE_RULES.md).

Distilled original guidance derived from these sources lives in:

- [External intelligence strategies](../SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/)
- [Command maps](../SALESFORCE_KNOWLEDGE/COMMANDS/)
- [Parameter maps](../SALESFORCE_KNOWLEDGE/PARAMETERS/)
- [Quality strategies](../SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/)
- [Validation flows](../SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/)

These docs are the public-safe integration layer. They do not vendor or copy upstream source.
