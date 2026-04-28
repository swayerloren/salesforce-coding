# Narrow Deploy Runbook

Use narrow deployments when fixing production issues, iterating on metadata, or validating a small change set. Salesforce deployment errors are easier to diagnose when the payload contains only the files required for the behavior under test.

## Goals

- Deploy the smallest coherent unit.
- Run only the tests needed to prove the change.
- Avoid unrelated metadata churn.
- Keep validation and deployment commands reproducible.

## Recommended Flow

1. Identify every metadata member touched by the change.
2. Include parent dependencies only when Salesforce requires them.
3. Verify installed Salesforce CLI help for the command family.
4. Validate first with `--dry-run` for ordinary narrow validation, or `project deploy validate` for production quick-deploy flow.
5. Use `RunSpecifiedTests` for Apex changes when possible.
6. Deploy the same payload that passed validation.
7. Re-check the affected UI or automation path in the target org.

## File Selection Rules

Include:

- The LWC bundle directory when any LWC file changes.
- Apex classes, triggers, and matching tests.
- Custom fields used by new code.
- Quick actions, FlexiPages, object overrides, or tabs when UI activation changes.
- Permission sets when access is part of the change.

Avoid:

- Full object files when only a field changed, unless the project uses source tracking conventions that require them.
- Profile metadata unless the change explicitly depends on profile access.
- Record pages unrelated to the target experience.
- Formatting-only changes in generated XML.

## Validate

```bash
sf project deploy start --dry-run --source-dir force-app/main/default/classes/ProjectService.cls --source-dir force-app/main/default/classes/ProjectServiceTest.cls --test-level RunSpecifiedTests --tests ProjectServiceTest --target-org myOrg
```

For production-style validation that returns a quick-deploy job:

```bash
sf project deploy validate --source-dir force-app/main/default/classes/ProjectService.cls --source-dir force-app/main/default/classes/ProjectServiceTest.cls --test-level RunSpecifiedTests --tests ProjectServiceTest --target-org myOrg --wait 30
```

## Deploy

```bash
sf project deploy start --source-dir force-app/main/default/classes/ProjectService.cls --source-dir force-app/main/default/classes/ProjectServiceTest.cls --test-level RunSpecifiedTests --tests ProjectServiceTest --target-org myOrg
```

## When to Widen the Payload

Widen only when the validation error proves the payload is incomplete. Common examples:

- Apex references a field not present in the target org.
- A Lightning page references an action or component missing from the payload.
- A permission set references a field, class, or tab that is not included.
- A test depends on metadata shape that was changed in a separate file.

## Deployment Notes

- `NoTestRun` is not valid for production Apex deployments.
- `RunSpecifiedTests` requires each named test class to be deployable and selectable.
- A class with no tests can still break a deployment if selected tests do not cover changed Apex enough.
- For UI-only metadata, validate without tests only when no Apex is being deployed and org policy permits it.
- A validation job is not a deployment until a matching quick deploy or real deploy succeeds.
- If a command times out or runs async, use `sf project deploy report --job-id <id>` before claiming success or failure.
