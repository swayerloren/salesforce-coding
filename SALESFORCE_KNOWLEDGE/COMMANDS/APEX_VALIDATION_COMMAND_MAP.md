# Apex Validation Command Map

Use this map after Apex class, trigger, controller, service, async, or test changes.

## Validation Commands

| Command pattern | Use | Notes |
| --- | --- | --- |
| `sf apex test run --tests <TestClass> --target-org <alias> --result-format human --wait 10` | Focused Apex test run. | Verify flags with installed CLI. |
| `sf project deploy start --dry-run --source-dir force-app/main/default/classes --target-org <alias>` | Class deploy dry run. | Scope should match changed files. |
| `sf code-analyzer run --target force-app/main/default --view table` | Static analysis. | Verify installed Code Analyzer. |
| `sf code-analyzer rules --rule-selector Recommended --target force-app/main/default --view table` | Rule preview. | Use official Code Analyzer v5 docs and installed help. |
| `npm run prettier:check` | Formatting check if project defines it. | Does not modify files. |
| `npx prettier --plugin=prettier-plugin-apex --check "force-app/main/default/**/*.{cls,trigger}"` | Direct Apex formatting check. | Verify dependencies and quote handling by shell. |

## Validation Selection

| Change type | Minimum useful evidence |
| --- | --- |
| Production Apex | Focused tests plus static review; Code Analyzer if available. |
| Trigger | Bulk test, recursion/order review, trigger handler tests. |
| Security-sensitive Apex | Focused tests plus review of sharing, CRUD/FLS, user mode, system mode, DTO filtering, and caller context. |
| Callout | Mocked callout tests and named credential inspection. |
| Async | Tests with start/stop test, side-effect assertions, and idempotency checks. |
| Files | File lifecycle tests for version, document, link, latest version, and parent state. |
| Communication | Tests for missing config, duplicate prevention, actor/target context, and sanitized failure logging. |
| Test-only | Re-run failing and related tests. |

## Do Not

- Do not use broad deploys when a narrow dry run proves the change.
- Do not run format writes unless requested.
- Do not claim Apex tests passed without command evidence.
- Do not claim deployment or Code Analyzer success unless the exact command ran and passed.
