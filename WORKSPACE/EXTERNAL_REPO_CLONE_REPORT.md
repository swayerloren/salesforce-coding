# External Repo Clone Report

## Purpose

This report records external open-source Salesforce tooling/reference repositories cloned into an external temporary analysis folder.

No external source files were copied into this main repo. The cloned repositories remain outside the main repo and are for later analysis only.

## Clone Summary

| Repo | GitHub URL | Clone status | Latest cloned commit | License file found |
| --- | --- | --- | --- | --- |
| `code-analyzer` | https://github.com/forcedotcom/code-analyzer | Cloned successfully | `c191bed66074af0583e6166c64e67d978c981b63` | `LICENSE` |
| `lwc-recipes` | https://github.com/trailheadapps/lwc-recipes | Cloned successfully | `f0282a54adb5862437bfb414fc0b7043197e89a4` | `LICENSE.md` |
| `apex-recipes` | https://github.com/trailheadapps/apex-recipes | Cloned successfully | `ed13f5ad1da404cb40f82447651f9abf6acf861a` | `LICENSE.md` |
| `sfdx-lwc-jest` | https://github.com/salesforce/sfdx-lwc-jest | Cloned successfully | `e1129959f5fe05cbf9b740b15921769832bfd1c6` | `LICENSE` |
| `prettier-plugin-apex` | https://github.com/dangmai/prettier-plugin-apex | Cloned successfully | `2e96e4ea9ccd8924a011834ee45faf0b8f3f2d02` | `LICENSE.md` |
| `eslint-plugin-lwc` | https://github.com/salesforce/eslint-plugin-lwc | Cloned successfully | `b6e85754cceaf0d2c77ca9338130a9c3068e3391` | `LICENSE` |
| `eslint-config-lwc` | https://github.com/salesforce/eslint-config-lwc | Cloned successfully | `ab18fed204df83c6f93fa9f5f9300f0880be9969` | `LICENSE` |
| `eslint-plugin-lwc-mobile` | https://github.com/salesforce/eslint-plugin-lwc-mobile | Cloned successfully | `2403991038f216929ecaa00cc8dd8624d77f7c9a` | `LICENSE.txt` |
| `eslint-plugin-lwc-graph-analyzer` | https://github.com/salesforce/eslint-plugin-lwc-graph-analyzer | Cloned successfully | `75c5fd905635d29b0555668e8dd72aca6d6fbb26` | `LICENSE.txt` |
| `salesforcedx-vscode` | https://github.com/forcedotcom/salesforcedx-vscode | Cloned successfully | `0837748fe70db9e20434cc27e058bf73052742bc` | `LICENSE.txt` |
| `sfdx-scan-pull-request` | https://github.com/mitchspano/sfdx-scan-pull-request | Cloned successfully | `62b9c9f5bc601c106d19064df83b1e9871ef2ecf` | `LICENSE` |

Clone note: repositories were cloned for analysis only using shallow clones. PowerShell surfaced some Git clone progress text as command error records, but every repository was verified by checking its local Git HEAD and license file.

## Detailed Inventory

| Repo | Main purpose | Relevant folders/files to inspect later | Reference only | Optional clone | Dev dependency | GitHub Action | Direct config inspiration |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `code-analyzer` | Salesforce Code Analyzer CLI/tooling for static analysis and rules orchestration. | `README.md`, `package.json`, `eslint.config.mjs`, `src/`, `messages/`, `pmd-appexchange/`, `.github/workflows/`, `test/`, `smoke-tests/` | Yes | Yes | Conditional | Conditional | Yes, for analyzer workflow ideas only |
| `lwc-recipes` | Salesforce sample app with practical Lightning Web Component patterns. | `README.md`, `sfdx-project.json`, `force-app/main/default/lwc/`, `force-app/main/default/aura/`, `force-app/main/default/classes/`, `jest.config.js`, `eslint.config.js`, `code-analyzer.yml`, `.github/workflows/` | Yes | Yes | No | No | Yes, for public-safe pattern documentation |
| `apex-recipes` | Salesforce sample app with practical Apex patterns and tests. | `README.md`, `sfdx-project.json`, `force-app/main/default/classes/`, `force-app/main/default/triggers/`, `ruleset.xml`, `config/project-scratch-def.json`, `.github/workflows/` | Yes | Yes | No | No | Yes, for Apex guidance and example categories |
| `sfdx-lwc-jest` | Official Jest test tooling for Lightning Web Components. | `README.md`, `package.json`, `config.js`, `src/`, `src/lightning-stubs/`, `bin/sfdx-lwc-jest`, `.github/workflows/unit.yml` | Yes | Yes | Yes, when a real Salesforce DX project needs LWC tests | No | Yes, for Jest setup guidance |
| `prettier-plugin-apex` | Prettier plugin and parser/formatter support for Apex. | `README.md`, `CHANGELOG.md`, `package.json`, `packages/`, `packages/apex-ast-serializer/`, `.prettierrc`, `.github/workflows/` | Yes | Yes | Yes, when a real project chooses Apex formatting | No | Yes, for formatting guidance |
| `eslint-plugin-lwc` | ESLint plugin with rules for Lightning Web Components. | `README.md`, `package.json`, `docs/rules/`, `docs/processors/`, `lib/`, `eslint.config.js`, `test/` | Yes | Yes | Yes, when a real project uses ESLint for LWC | No | Yes, for LWC lint-rule mapping |
| `eslint-config-lwc` | Shareable ESLint configs for LWC projects. | `README.md`, `package.json`, `base.js`, `recommended.js`, `extended.js`, `ssr.js`, `i18n.js`, `lib/`, `test/` | Yes | Yes | Yes, when a real project adopts the config | No | Yes, for lint configuration examples |
| `eslint-plugin-lwc-mobile` | ESLint rules for mobile/offline Salesforce LWC constraints. | `README.md`, `package.json`, `src/docs/`, `src/rules/`, `src/configs/`, `eslint.config.mjs`, `.github/workflows/` | Yes | Yes | Conditional, for projects targeting Salesforce mobile/offline constraints | No | Yes, for mobile checklist/rule ideas |
| `eslint-plugin-lwc-graph-analyzer` | Graph-style static analysis for LWC component composition and supported patterns. | `README.md`, `package.json`, `lib/docs/`, `lib/configs/`, `lib/lwc-bundle.js`, `lib/processor.js`, `test/` | Yes | Yes | Conditional | No | Yes, for LWC composition and static-analysis concepts |
| `salesforcedx-vscode` | Salesforce VS Code extensions monorepo and developer tooling reference. | `README.md`, `package.json`, `packages/`, `docs/`, `config/`, `test-workspaces/`, `scripts/`, `eslint.config.mjs`, `.github/workflows/` | Yes | Yes | No | No | Limited; use concepts only, not extension source |
| `sfdx-scan-pull-request` | GitHub Action for running Salesforce scanner/static analysis on pull requests. | `README.md`, `action.yml`, `src/`, `dist/`, `.github/workflows/`, `.github/workflows/pmd-ruleset.xml`, `tests/` | Yes | Yes | No | Yes | Yes, for action workflow concepts with attribution |

## Safe Use Classification

| Use type | Meaning | Guidance |
| --- | --- | --- |
| Reference only | Read docs/source to understand public tooling behavior and patterns. | Safe for analysis with attribution. Do not copy source text or code into this repo. |
| Optional clone | A user may clone the external repo separately if they want to inspect or run it. | Safe if documented as optional and external. Preserve upstream URL and license. |
| Dev dependency | A real Salesforce DX project may install the package through its package manager. | Only recommend after checking the package's current docs, license, and compatibility with that real project. |
| GitHub Action | A real project may call the external action in its own workflow. | Only use with a pinned version/commit and with clear attribution. Do not vendor action code into this repo. |
| Direct config inspiration | Config shape can inform guidance, but exact configs should not be copied blindly. | Use as conceptual inspiration. Recreate minimal configs suited to this repo or a real project, with attribution if materially based on upstream docs. |

## Later Inspection Priorities

1. Static analysis setup:
   - `code-analyzer`
   - `sfdx-scan-pull-request`
   - `lwc-recipes/code-analyzer.yml`
   - `apex-recipes/ruleset.xml`

2. LWC quality and testing:
   - `eslint-plugin-lwc/docs/rules/`
   - `eslint-config-lwc/recommended.js`
   - `sfdx-lwc-jest/README.md`
   - `lwc-recipes/force-app/main/default/lwc/`

3. Mobile/offline LWC constraints:
   - `eslint-plugin-lwc-mobile/src/docs/`
   - `eslint-plugin-lwc-mobile/src/rules/`

4. Apex examples and formatting:
   - `apex-recipes/force-app/main/default/classes/`
   - `apex-recipes/force-app/main/default/triggers/`
   - `prettier-plugin-apex/README.md`
   - `prettier-plugin-apex/packages/`

5. Salesforce DX developer tooling:
   - `salesforcedx-vscode/packages/`
   - `salesforcedx-vscode/docs/`
   - `salesforcedx-vscode/test-workspaces/`

## Clone Failures

No clone failures were recorded.

## Attribution And License Notes

- Keep upstream GitHub URLs with any future references.
- Preserve the license identity for each repo when documenting ideas derived from it.
- Do not copy external source files into this repo without an explicit license review and owner approval.
- Prefer paraphrased, public-safe documentation of lessons rather than copied implementation text.
- If future docs recommend a package or GitHub Action, link to the upstream repo and advise users to check the current upstream license and version.

## Main Repo Impact

- External repositories were cloned into the temporary analysis folder only.
- No external source files were vendored into the main repo.
- Main repo changes for this task are limited to this report file.
- No commit or push was performed.
