# LWC Lint Rules

## Purpose

This quality gate tells Codex when and how to use LWC linting after changes to Lightning Web Components.

LWC linting is optional in this helper repo, but strongly recommended in real Salesforce DX projects that contain `force-app/main/default/lwc`.

## Read First

- [../TOOLS/ESLINT_LWC.md](../TOOLS/ESLINT_LWC.md)
- [../TOOLS/LWC_MOBILE_LINT.md](../TOOLS/LWC_MOBILE_LINT.md)
- [examples/eslint-config-lwc-example.md](examples/eslint-config-lwc-example.md)
- [examples/package-json-lwc-quality-scripts.md](examples/package-json-lwc-quality-scripts.md)

## Gate Trigger

Run or recommend this gate after changes to:

- LWC JavaScript
- LWC HTML
- LWC CSS where class usage or layout behavior changed
- LWC metadata files
- Apex controller changes that affect LWC behavior
- Mobile or offline LWC behavior
- Parent or child component contracts

## Minimum LWC Lint Checklist

| Check | Required Codex Behavior |
| --- | --- |
| Real project located | Confirm `force-app/main/default` before linting. |
| LWC folder exists | Confirm `force-app/main/default/lwc` before applying LWC-specific guidance. |
| `package.json` exists | Inspect scripts and dependencies; do not create it automatically. |
| Lint script exists | Prefer existing `lint:lwc`, then `lint`, then documented project-specific scripts. |
| ESLint dependency exists | Detect `eslint`, `@salesforce/eslint-config-lwc`, `@lwc/eslint-plugin-lwc`, or related packages. |
| Mobile lint exists | Detect `@salesforce/eslint-plugin-lwc-mobile` or project mobile lint scripts when mobile is in scope. |
| Graph analyzer exists | Treat `@salesforce/eslint-plugin-lwc-graph-analyzer` as advanced and optional. |

## Recommended Commands

Use whichever command already exists in the real project.

```bash
npm run lint:lwc
npm run lint
npm run lint:mobile
```

If no script exists, recommend setup instead of changing the project without approval.

## Strict Rules

- Codex must not claim lint passed unless a lint command actually ran and exited successfully.
- Codex must not disable lint rules merely to produce a green result.
- Codex must keep LWC template logic in JavaScript getters.
- Codex must avoid inline JavaScript expressions in LWC HTML.
- Codex must verify object, field, Apex, event, and component names in the real project.
- Codex must not invent metadata from LWC Recipes or other external sample repos.
- Codex must document skipped lint checks in `HISTORY/CODEX_RUN_LOG.md` or `HISTORY/TEST_RESULTS_LOG.md`.

## Result Language

| Status | Use When |
| --- | --- |
| `PASS` | Lint ran and exited successfully. |
| `FAIL` | Lint ran and reported errors or exited non-zero. |
| `SKIPPED` | Lint could not run because setup is absent or task scope does not include LWC. |
| `MISSING` | Required local tool such as Node/npm is unavailable. |

## Advanced Mobile And Graph Checks

Use mobile lint or graph analyzer when the task involves:

- Salesforce mobile app behavior
- Offline readiness
- GraphQL wire adapters
- Lightning Data Service wire dependencies
- Data priming
- Template dependencies that must be statically analyzable

Do not require these tools for every LWC task. If they are missing, Codex should perform static source inspection and clearly state that mobile/graph linting was skipped.
