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
3. Validate first with `--dry-run`.
4. Use `RunSpecifiedTests` for Apex changes when possible.
5. Deploy the same payload that passed validation.
6. Re-check the affected UI or automation path in the target org.

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

