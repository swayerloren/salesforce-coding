# Fix Apex Flow

## Sequence

1. Read required startup docs.
2. Locate real Salesforce DX project.
3. Read Apex guide, testing guide, Apex quality strategy, command maps, and parameter maps.
4. Inspect target Apex, metadata pair, callers, triggers, tests, and referenced metadata.
5. Classify security posture: sharing, CRUD/FLS, user mode, system mode, and business authorization.
6. Check bulk and governor-limit risk: SOQL, DML, CPU, heap, callouts, async enqueue, and file/PDF payloads.
7. For triggers, inspect order of execution, Flow callers, recursion, delete/undelete, and changed-field behavior.
8. For communication or Files behavior, inspect idempotency, latest-version or link state, and sanitized logging.
9. Identify root cause.
10. Make smallest safe fix.
11. Run focused Apex tests if possible.
12. Run Salesforce Code Analyzer if available.
13. Run Apex formatting check if configured and relevant.
14. Record Memory and History.

## Validation Decision Table

| Evidence | Status |
| --- | --- |
| Focused tests pass | `PASS` for focused tests. |
| Code Analyzer passes | `PASS` for static analysis. |
| Tool missing | `SKIPPED` with reason. |
| Command fails | `FAIL` with summary and next step. |
| No org alias | Deploy/test commands `SKIPPED`; static review still required. |

## Required Classification

Before the final report, classify the change:

- entry point: trigger, controller, service, async, invocable, callout, file, communication, or test-only,
- data mode: user-visible, system-owned, or mixed,
- security checks: sharing, CRUD/FLS, user mode, `stripInaccessible`, describe checks, or not applicable,
- limit risk: low, medium, high, or not assessed,
- validation: command evidence or skipped reason.

## Minimum Final Report

- Root cause.
- Files changed.
- Tests run or skipped.
- Code Analyzer run or skipped.
- Formatting check run or skipped.
- Limits.
- Security posture and validation limits.
