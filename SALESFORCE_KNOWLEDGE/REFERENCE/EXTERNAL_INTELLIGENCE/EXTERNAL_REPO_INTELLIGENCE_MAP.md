# External Repo Intelligence Map

This map records how public external repositories inform this repo without becoming dependencies.

## Source Map

| External repo | Upstream URL | What Codex should learn | Safe integration |
| --- | --- | --- | --- |
| Salesforce Code Analyzer | https://github.com/forcedotcom/code-analyzer | Rule selection, workspace/target separation, severity thresholds, SARIF/JSON outputs, static analysis triage. | Tool docs, command maps, parameter maps, quality gates, workflow drafts. |
| LWC Recipes | https://github.com/trailheadapps/lwc-recipes | LWC pattern categories: wire, imperative Apex, forms, navigation, toast, events, composition, GraphQL, static resources, Jest. | Reference map, prompt rules, checklist rules. |
| Apex Recipes | https://github.com/trailheadapps/apex-recipes | Apex pattern categories: SOQL, DML, services, async, triggers, callouts, files, security, custom metadata, testing. | Reference map, quality strategy, prompt rules. |
| Salesforce LWC Jest | https://github.com/salesforce/sfdx-lwc-jest | LWC Jest scripts, coverage, debug mode, mocks, wire testing, project-specific config. | LWC test command map, validation flow. |
| Prettier Apex | https://github.com/dangmai/prettier-plugin-apex | Check-first Apex formatting, debug-check, scoped formatter use. | Apex validation and formatting strategy. |
| ESLint Plugin LWC | https://github.com/salesforce/eslint-plugin-lwc | LWC decorator, wire, DOM, async, event listener, template safety, and SSR rules. | LWC lint quality strategy and checklist. |
| ESLint Config LWC | https://github.com/salesforce/eslint-config-lwc | Base, recommended, extended, i18n, SSR, and TypeScript-aware config selection. | Config decision guidance, not copied config. |
| ESLint Plugin LWC Mobile | https://github.com/salesforce/eslint-plugin-lwc-mobile | Mobile/offline LWC lint rules, GraphQL limits, Apex import review. | Mobile quality strategy and optional gate. |
| LWC Graph Analyzer | https://github.com/salesforce/eslint-plugin-lwc-graph-analyzer | Static analyzability, wire dependency graph, offline/data priming constraints. | Advanced mobile/offline checklist. |
| Salesforce VS Code Extensions | https://github.com/forcedotcom/salesforcedx-vscode | Local Salesforce developer workflow, language services, layered quality checks, link/safety checks. | Workflow guidance and automation ideas. |
| SFDX Scan Pull Request | https://github.com/mitchspano/sfdx-scan-pull-request | Pull request scan reporting, severity thresholds, changed-file scope, check-run/comment modes. | PR quality strategy; verify current tooling before use. |

## Integration Decision Table

| Need | Use this repo layer | External source role |
| --- | --- | --- |
| Find a command | `SALESFORCE_KNOWLEDGE/COMMANDS/` | Verify command shape against upstream or installed help. |
| Understand options | `SALESFORCE_KNOWLEDGE/PARAMETERS/` | Confirm current names and behavior before execution. |
| Plan validation | `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/` | Use external tooling concepts as inputs. |
| Improve quality | `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/` | Apply distilled best practices. |
| See attribution | `VENDOR_REFERENCES/` | Link to upstream repo and license notes. |

## Do Not Copy

- Source files.
- Rule implementations.
- Tests and fixtures.
- Workflow YAML copied verbatim.
- Sample app metadata.
- Data import plans.
- Generated artifacts.
- Package internals.

## Codex Checklist

- [ ] I used the external repo as a reference only.
- [ ] I inspected real project metadata before applying the idea.
- [ ] I verified all names in source.
- [ ] I documented skipped tools honestly.
- [ ] I preserved upstream attribution by URL.
