# Salesforce Deployment Guide

## Production Deployment Rules

- Deploy the smallest metadata set that satisfies the change.
- Run a dry-run validation first.
- If validation succeeds and the task requires deployment, run the matching real deploy.
- Do not bundle unrelated metadata.
- Do not deploy documentation folders.
- Treat layouts, FlexiPages, app pages, profiles, and permission metadata as high-blast-radius changes.

## Production Test Levels

Production orgs reject `NoTestRun` for many deploys, including LWC-only or Aura-only changes in some environments.

Safer default for narrow deploys:

```powershell
sf project deploy start --target-org <alias> --dry-run --source-dir force-app/main/default/lwc/myComponent --test-level RunSpecifiedTests --tests MyStableTest
```

Then run the same command without `--dry-run`.

Use `RunLocalTests` only when the risk requires broad validation and the org's local tests are stable enough to use as a gate.

## Selected-Class Coverage

When using `RunSpecifiedTests`, Salesforce can still reject a deploy if touched Apex classes do not meet coverage requirements. A happy-path test may pass but still leave the class under 75 percent.

Plan negative-path and branch coverage before deploy.

## Metadata Type Names

Salesforce CLI metadata names are not always the UI names.

Example:

- Visualforce pages use metadata type `ApexPage`, not `VisualforcePage`.

When retrieve/deploy fails immediately, verify the metadata type name before assuming the org is broken.

## Narrow Test Selection

If unrelated legacy tests are known unstable, do not include them in a hotfix deploy unless the change actually touches that subsystem.

Good test selection:

- changed controller test,
- changed service test,
- trigger path test for affected object,
- integration mock test for affected callout,
- UI controller test for affected LWC.

Bad test selection:

- broad unrelated coverage classes added only to raise confidence,
- unstable file-heavy tests added to a non-file hotfix,
- old tests with known SOQL-limit issues added to an unrelated deploy.

## CLI and File Pitfalls

- Confirm exact `sf data` subcommands in the installed CLI before scripting bulk operations.
- For CSV import from PowerShell, prefer UTF-8 without BOM.
- Create Apex probe files before running `sf apex run --file`.
- Quote SOQL and Windows paths carefully.
- If Node or PowerShell wrappers call `sf`, validate command execution on Windows separately from Unix examples.

