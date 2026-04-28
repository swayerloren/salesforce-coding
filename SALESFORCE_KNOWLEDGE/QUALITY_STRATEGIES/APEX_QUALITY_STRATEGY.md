# Apex Quality Strategy

Codex should treat Apex quality as a combination of source inspection, platform constraints, tests, static analysis, and optional formatting.

## Quality Priorities

| Priority | Requirement |
| --- | --- |
| Correctness | Root cause is identified and the smallest safe fix is made. |
| Bulk safety | No SOQL/DML in loops; trigger and collection paths handle multiple records. |
| Security | Sharing, CRUD/FLS, user-mode, system-mode, named credential, and data exposure behavior are deliberate. |
| Maintainability | Existing service/selector/controller/trigger patterns are preserved. |
| Tests | Tests create data, assert behavior, and cover success/error/edge paths. |
| Evidence | Focused tests and Code Analyzer run when available. |

## Gate Decision Table

| Apex change | Required review | Validation |
| --- | --- | --- |
| Trigger | Handler pattern, context, recursion, order of execution, Flow interaction, bulk behavior. | Trigger tests and Code Analyzer if available. |
| Controller | UI/API contract, DTO shape, sharing, CRUD/FLS, user/system mode. | Focused tests and LWC/Aura caller inspection. |
| Async | Enqueue path, transaction boundary, side effects, idempotency. | Tests with start/stop test and durable result assertions. |
| Callout | Named credentials, mocks, failure handling. | Callout mock tests. |
| Files | `ContentVersion`, `ContentDocument`, `ContentDocumentLink`, latest-version behavior. | File tests and parent-state assertions. |
| Communication | Actor, target, body/template source, idempotency, sanitized logging. | Tests for duplicate prevention and failure paths. |
| Test-only | Production contract and data setup. | Re-run focused failing test. |

## Codex Checklist

- [ ] Existing Apex patterns inspected.
- [ ] Object/field names verified.
- [ ] No hard-coded IDs added.
- [ ] Null and empty states handled.
- [ ] Required fields and validation rules checked for test data.
- [ ] Sharing, CRUD/FLS, and user/system mode reviewed separately.
- [ ] Trigger order of execution and Flow callers checked when relevant.
- [ ] Governor-limit risk identified for SOQL, DML, CPU, heap, async, and callouts.
- [ ] Test data created in tests or verified factory.
- [ ] Tests assert behavior, not only coverage.
- [ ] Files or communication side effects have idempotency checks when relevant.
- [ ] Code Analyzer run or skipped with reason.
- [ ] Formatting check run only if configured or requested.
