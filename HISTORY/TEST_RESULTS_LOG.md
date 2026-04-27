# Test Results Log

## Purpose

`TEST_RESULTS_LOG.md` tracks Salesforce test runs and relevant results.

Use it for test class names, commands, pass/fail results, coverage notes, and failure reasons.

This file is chronological history. Reusable testing lessons should also be summarized in `MEMORY/FAILURE_HISTORY.md` or `MEMORY/FIX_HISTORY.md` when appropriate.

## When Codex Should Update It

Update this file when:

- Apex tests are run,
- test failures are investigated,
- coverage results affect deployment strategy,
- a test command cannot run and that limitation matters,
- a specific test class becomes important for future validation.

## Entry Template

```markdown
## YYYY-MM-DD - <Test Run Name>

- Date:
- Test class:
- Command:
- Pass/fail result:
- Coverage notes:
- Failure reason:
- Follow-up:
```

## Example Entry

```markdown
## 2026-04-27 - Example Service Test

- Date: 2026-04-27
- Test class: `ExampleServiceTest`
- Command: `sf apex run test --tests ExampleServiceTest --target-org dev --result-format human --wait 30`
- Pass/fail result: Passed.
- Coverage notes: Focused test covered the changed service path; org-wide coverage was not checked.
- Failure reason: None.
- Follow-up: Use the same test class for narrow deploy validation when changing `ExampleService`.
```

