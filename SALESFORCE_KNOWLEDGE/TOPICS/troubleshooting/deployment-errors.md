# Deployment Errors

## `NoTestRun` Rejected In Production

Symptom:

```text
INVALID_OPERATION: testLevel of NoTestRun cannot be used in production organizations
```

Fix:

- rerun with `RunSpecifiedTests` for narrow deploys,
- use stable tests tied to the changed subsystem,
- use `RunLocalTests` only when broad validation is appropriate.

## Selected-Class Coverage Failure

Symptom:

- tests pass,
- deploy fails because a touched Apex class is below coverage.

Fix:

- add tests for validation, missing input, save failure, and branch paths;
- reduce unnecessary branch surface if a dispatcher/helper is too large for its purpose;
- rerun the same narrow dry run.

## Wrong Metadata Type

Symptom:

- retrieve or deploy fails immediately for a known metadata component.

Fix:

- verify CLI metadata type names. Visualforce pages use `ApexPage`.

## Unrelated Test Failure

Symptom:

- changed package compiles,
- selected unrelated legacy test fails with SOQL limit or file lock.

Fix:

- remove unrelated unstable tests from narrow hotfix deploy,
- open a separate task for the unstable subsystem.

