# Tool Registry

This registry lists the external tools and reference repos that can inform quality gates for real Salesforce DX projects.

| Tool or repo | Upstream URL | Required? | Best use | Main risk |
| --- | --- | --- | --- | --- |
| Salesforce Code Analyzer | https://github.com/forcedotcom/code-analyzer | Optional, recommended | Static analysis quality gate. | Findings and engines vary by installed version. |
| LWC Recipes | https://github.com/trailheadapps/lwc-recipes | Reference only | LWC pattern map and example categories. | Sample app code is not a drop-in dependency. |
| Apex Recipes | https://github.com/trailheadapps/apex-recipes | Reference only | Apex pattern map and example categories. | Sample app code uses recipe metadata and objects. |
| Salesforce LWC Jest | https://github.com/salesforce/sfdx-lwc-jest | Optional | LWC unit testing. | Existing projects may already customize Jest. |
| Prettier Apex | https://github.com/dangmai/prettier-plugin-apex | Optional | Apex formatting checks. | Broad formatting creates noisy diffs. |
| ESLint Plugin LWC | https://github.com/salesforce/eslint-plugin-lwc | Optional, recommended for LWC | LWC static analysis. | ESLint versions/configs differ by project. |
| ESLint Config LWC | https://github.com/salesforce/eslint-config-lwc | Optional | Shareable LWC ESLint config. | Should be adapted to the real project. |
| ESLint Plugin LWC Mobile | https://github.com/salesforce/eslint-plugin-lwc-mobile | Advanced | Mobile/offline LWC rules. | Relevant only to mobile/offline constraints. |
| ESLint Plugin LWC Graph Analyzer | https://github.com/salesforce/eslint-plugin-lwc-graph-analyzer | Advanced | LWC composition and wire graph checks. | Specialized and version-sensitive. |
| Salesforce VS Code Extensions | https://github.com/forcedotcom/salesforcedx-vscode | Reference only | Developer workflow and language-server reference. | Large product repo; do not copy internals. |
| SFDX Scan Pull Request | https://github.com/mitchspano/sfdx-scan-pull-request | Optional GitHub Action | PR static-analysis reporting. | External action should be pinned. |

## Required Codex Behavior

- Verify the real project has `package.json`, `sfdx-project.json`, or existing config before recommending tool changes.
- Do not assume a tool is installed.
- Do not add a tool as a dependency without explicit user approval.
- Treat analyzer and lint output as evidence to inspect, not automatic permission to refactor.
- Use [command maps](../SALESFORCE_KNOWLEDGE/COMMANDS/) and [parameter maps](../SALESFORCE_KNOWLEDGE/PARAMETERS/) before choosing exact commands.
- Use [quality strategies](../SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/) and [validation flows](../SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/) to decide when a tool applies.

## Distilled Intelligence Layer

The external intelligence strategy is now captured in original repo docs:

| Layer | Path |
| --- | --- |
| External intelligence strategy | [../SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/](../SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/) |
| Command maps | [../SALESFORCE_KNOWLEDGE/COMMANDS/](../SALESFORCE_KNOWLEDGE/COMMANDS/) |
| Parameter maps | [../SALESFORCE_KNOWLEDGE/PARAMETERS/](../SALESFORCE_KNOWLEDGE/PARAMETERS/) |
| Quality strategies | [../SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/](../SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/) |
| Validation flows | [../SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/](../SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/) |
