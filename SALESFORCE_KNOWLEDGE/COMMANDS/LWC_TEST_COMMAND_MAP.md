# LWC Test Command Map

Use this map for Lightning Web Component validation.

## Command Patterns

| Command | Use | Verification |
| --- | --- | --- |
| `npm run test:unit` | Preferred LWC Jest test script. | Confirm script exists. |
| `npm run test:unit:coverage` | LWC coverage evidence. | Confirm script exists. |
| `sfdx-lwc-jest` | Direct LWC Jest run. | Verify package installed. |
| `sfdx-lwc-jest --coverage` | Direct coverage run. | Verify package installed. |
| `sfdx-lwc-jest --debug` | Debug tests. | Not a normal validation gate. |
| `sfdx-lwc-jest -- --json` | Machine-readable Jest output. | Verify command compatibility. |

## LWC Test Targets

| Change | Test focus |
| --- | --- |
| Wire adapter | Data, error, reactive parameters. |
| Imperative Apex | Success, rejection, loading, toast/error. |
| Form | Submit, success, error, field payload. |
| Navigation | Page reference intent. |
| Events | Event name, detail, bubbling/composed flags. |
| Refresh | Refresh function called and state updated. |

## Codex Rules

- Do not claim Jest passed unless a command ran and passed.
- Do not update snapshots without explicit reason.
- Do not copy external stubs or package internals.
- Report `SKIPPED` when Node, npm, package scripts, or dependencies are missing.
