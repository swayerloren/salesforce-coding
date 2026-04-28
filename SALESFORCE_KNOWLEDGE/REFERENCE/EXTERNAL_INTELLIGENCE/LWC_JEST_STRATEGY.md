# LWC Jest Strategy

Source reference: https://github.com/salesforce/sfdx-lwc-jest

LWC Jest is the main local unit test strategy for Lightning Web Components when a real Salesforce DX project has Node, npm, package scripts, and Jest dependencies configured.

## What Codex Should Do

1. Inspect the real project `package.json`.
2. Prefer existing scripts such as `npm run test:unit`.
3. Inspect existing Jest config and mocks before changing tests.
4. Add or update tests only after understanding current project conventions.
5. Report exact pass, fail, or skipped status.

## Common Test Areas

| LWC behavior | Test focus |
| --- | --- |
| Wire adapters | Data state, error state, reactive parameter changes. |
| Imperative Apex | Success, rejection, loading state, toast/error handling. |
| Events | Event name, detail payload, bubbling/composed behavior. |
| Navigation | Page reference intent and call behavior. |
| Forms | Submit, success, error, field data, validation state. |
| Refresh | Refresh call path and UI state after mutation. |

## Command Rules

| Command | Use |
| --- | --- |
| `npm run test:unit` | Preferred if project defines it. |
| `sfdx-lwc-jest` | Direct command when installed and no script exists. |
| `sfdx-lwc-jest --coverage` | Coverage check when useful and configured. |
| `sfdx-lwc-jest --debug` | Debugging only; not a default validation gate. |
| `sfdx-lwc-jest -- --json` | Machine-readable output when needed. |

All direct commands should be verified against the installed package.

## Do Not

- Do not rewrite Jest config without inspecting project config.
- Do not update snapshots just to make tests pass.
- Do not claim Jest passed unless the command actually ran and passed.
- Do not copy upstream stubs or internals into this repo.
