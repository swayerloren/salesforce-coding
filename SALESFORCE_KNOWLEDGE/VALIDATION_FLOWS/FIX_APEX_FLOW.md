# Fix Apex Flow

## Sequence

1. Read required startup docs.
2. Locate real Salesforce DX project.
3. Read Apex guide, testing guide, Apex quality strategy, command maps, and parameter maps.
4. Inspect target Apex, metadata pair, callers, triggers, tests, and referenced metadata.
5. Identify root cause.
6. Make smallest safe fix.
7. Run focused Apex tests if possible.
8. Run Salesforce Code Analyzer if available.
9. Run Apex formatting check if configured and relevant.
10. Record Memory and History.

## Validation Decision Table

| Evidence | Status |
| --- | --- |
| Focused tests pass | `PASS` for focused tests. |
| Code Analyzer passes | `PASS` for static analysis. |
| Tool missing | `SKIPPED` with reason. |
| Command fails | `FAIL` with summary and next step. |
| No org alias | Deploy/test commands `SKIPPED`; static review still required. |

## Minimum Final Report

- Root cause.
- Files changed.
- Tests run or skipped.
- Code Analyzer run or skipped.
- Formatting check run or skipped.
- Limits.
