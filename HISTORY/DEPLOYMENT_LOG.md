# Deployment Log

## Purpose

`DEPLOYMENT_LOG.md` tracks validation and deployment attempts in chronological order.

Use it for Salesforce CLI validation commands, deploy commands, org aliases, test levels, tests run, results, and failure notes.

Do not include deploy IDs, credentials, tokens, org IDs, or private data.

## When Codex Should Update It

Update this file whenever Codex runs or analyzes:

- `sf project deploy validate`,
- `sf project deploy start --dry-run`,
- `sf project deploy start`,
- metadata validation commands,
- deployment failure output,
- deployment-related preflight checks.

## Entry Template

```markdown
## YYYY-MM-DD - <Deployment Or Validation Name>

- Date:
- Validation/deployment command:
- Org alias:
- Test level:
- Tests run:
- Result:
- Failure notes:
- Follow-up:
```

## Example Entry

```markdown
## 2026-04-27 - Example Apex Dry Run

- Date: 2026-04-27
- Validation/deployment command: `sf project deploy start --dry-run --source-dir force-app/main/default/classes/ExampleService.cls --source-dir force-app/main/default/classes/ExampleServiceTest.cls --test-level RunSpecifiedTests --tests ExampleServiceTest --target-org dev`
- Org alias: `dev`
- Test level: `RunSpecifiedTests`
- Tests run: `ExampleServiceTest`
- Result: Passed.
- Failure notes: None.
- Follow-up: Run the matching real deploy only after user approval.
```

