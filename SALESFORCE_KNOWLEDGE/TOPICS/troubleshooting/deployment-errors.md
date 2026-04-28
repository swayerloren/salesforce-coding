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

## Dry Run Confused With Production Validation

Symptom:

- `sf project deploy start --dry-run` passed,
- later quick deploy is not available or no validation job exists.

Fix:

- use dry run for ordinary validation evidence;
- use `sf project deploy validate` when the release process needs a production validation job and later quick deploy;
- use `sf project deploy report --job-id <id>` before claiming async validation status.

## Failure-Hiding Flag Masked Risk

Symptom:

- deployment appears successful only after `--ignore-errors`, `--ignore-warnings`, or `--ignore-conflicts`.

Fix:

- treat the result as a risk state, not a clean pass;
- inspect the warning or error;
- remove the flag unless the owner explicitly accepts the behavior.

## Destructive Manifest Error

Symptom:

- destructive deploy fails, warns, or deletes the wrong target.

Fix:

- inspect exact metadata type and full name;
- separate ordinary `package.xml` from destructive manifests;
- prefer post-destructive changes unless pre-delete is required;
- validate before real deletion;
- document rollback or restore path.

## Unrelated Test Failure

Symptom:

- changed package compiles,
- selected unrelated legacy test fails with SOQL limit or file lock.

Fix:

- remove unrelated unstable tests from narrow hotfix deploy,
- open a separate task for the unstable subsystem.

## Code Analyzer Not Actually Run

Symptom:

- final report says static analysis passed,
- command was missing, skipped, or only help output was checked.

Fix:

- report `SKIPPED` with the exact reason;
- run `sf code-analyzer run` from the real project root when available;
- do not claim analyzer success without a successful command result.
