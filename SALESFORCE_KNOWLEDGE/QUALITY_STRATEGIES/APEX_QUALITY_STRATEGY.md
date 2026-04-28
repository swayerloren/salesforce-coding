# Apex Quality Strategy

Codex should treat Apex quality as a combination of source inspection, platform constraints, tests, static analysis, and optional formatting.

## Quality Priorities

| Priority | Requirement |
| --- | --- |
| Correctness | Root cause is identified and the smallest safe fix is made. |
| Bulk safety | No SOQL/DML in loops; trigger and collection paths handle multiple records. |
| Security | Sharing, CRUD/FLS, user-mode, named credential, and data exposure behavior are deliberate. |
| Maintainability | Existing service/selector/controller/trigger patterns are preserved. |
| Tests | Tests create data, assert behavior, and cover success/error/edge paths. |
| Evidence | Focused tests and Code Analyzer run when available. |

## Gate Decision Table

| Apex change | Required review | Validation |
| --- | --- | --- |
| Trigger | Handler pattern, context, recursion, bulk behavior. | Trigger tests and Code Analyzer if available. |
| Controller | UI/API contract, DTO shape, security. | Focused tests and LWC/Aura caller inspection. |
| Async | Enqueue path, transaction boundary, side effects. | Tests with start/stop test. |
| Callout | Named credentials, mocks, failure handling. | Callout mock tests. |
| Test-only | Production contract and data setup. | Re-run focused failing test. |

## Codex Checklist

- [ ] Existing Apex patterns inspected.
- [ ] Object/field names verified.
- [ ] No hard-coded IDs added.
- [ ] Null and empty states handled.
- [ ] Test data created in tests or verified factory.
- [ ] Code Analyzer run or skipped with reason.
- [ ] Formatting check run only if configured or requested.
