# External Repos To Clone Optionally

Users may clone these repos locally for study. They are not required for this repo to work and are not vendored into the public repo.

## Clone Helpers

Windows PowerShell:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\VENDOR_REFERENCES\clone-reference-repos.ps1
```

Linux/macOS:

```bash
bash ./VENDOR_REFERENCES/clone-reference-repos.sh
```

The helpers clone into:

```text
VENDOR_REFERENCES/_external/
```

Existing folders are skipped by default.

## Optional Repos

| Repo | URL | Local folder |
| --- | --- | --- |
| Salesforce Code Analyzer | https://github.com/forcedotcom/code-analyzer | `code-analyzer` |
| LWC Recipes | https://github.com/trailheadapps/lwc-recipes | `lwc-recipes` |
| Apex Recipes | https://github.com/trailheadapps/apex-recipes | `apex-recipes` |
| Salesforce LWC Jest | https://github.com/salesforce/sfdx-lwc-jest | `sfdx-lwc-jest` |
| Prettier Apex | https://github.com/dangmai/prettier-plugin-apex | `prettier-plugin-apex` |
| ESLint Plugin LWC | https://github.com/salesforce/eslint-plugin-lwc | `eslint-plugin-lwc` |
| ESLint Config LWC | https://github.com/salesforce/eslint-config-lwc | `eslint-config-lwc` |
| ESLint Plugin LWC Mobile | https://github.com/salesforce/eslint-plugin-lwc-mobile | `eslint-plugin-lwc-mobile` |
| ESLint Plugin LWC Graph Analyzer | https://github.com/salesforce/eslint-plugin-lwc-graph-analyzer | `eslint-plugin-lwc-graph-analyzer` |
| Salesforce DX VS Code | https://github.com/forcedotcom/salesforcedx-vscode | `salesforcedx-vscode` |
| SFDX Scan Pull Request | https://github.com/mitchspano/sfdx-scan-pull-request | `sfdx-scan-pull-request` |

## Manual Clone Commands

```bash
git clone https://github.com/forcedotcom/code-analyzer VENDOR_REFERENCES/_external/code-analyzer
git clone https://github.com/trailheadapps/lwc-recipes VENDOR_REFERENCES/_external/lwc-recipes
git clone https://github.com/trailheadapps/apex-recipes VENDOR_REFERENCES/_external/apex-recipes
git clone https://github.com/salesforce/sfdx-lwc-jest VENDOR_REFERENCES/_external/sfdx-lwc-jest
git clone https://github.com/dangmai/prettier-plugin-apex VENDOR_REFERENCES/_external/prettier-plugin-apex
git clone https://github.com/salesforce/eslint-plugin-lwc VENDOR_REFERENCES/_external/eslint-plugin-lwc
git clone https://github.com/salesforce/eslint-config-lwc VENDOR_REFERENCES/_external/eslint-config-lwc
git clone https://github.com/salesforce/eslint-plugin-lwc-mobile VENDOR_REFERENCES/_external/eslint-plugin-lwc-mobile
git clone https://github.com/salesforce/eslint-plugin-lwc-graph-analyzer VENDOR_REFERENCES/_external/eslint-plugin-lwc-graph-analyzer
git clone https://github.com/forcedotcom/salesforcedx-vscode VENDOR_REFERENCES/_external/salesforcedx-vscode
git clone https://github.com/mitchspano/sfdx-scan-pull-request VENDOR_REFERENCES/_external/sfdx-scan-pull-request
```

## Safe Clone Rules

- Do not commit `VENDOR_REFERENCES/_external/`.
- Preserve upstream license files.
- Use upstream docs as references and package installs as dependencies, not vendored source.
- Codex may inspect local clones when present, but must still verify the user's real Salesforce DX project first.
- Do not copy external code, workflows, configs, generated files, or sample app metadata without explicit owner approval and license review.
