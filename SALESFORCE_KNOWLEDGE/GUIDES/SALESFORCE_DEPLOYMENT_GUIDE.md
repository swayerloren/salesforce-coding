# Salesforce Deployment Guide

## Focused Topic

Use [Destructive Deployment Safety](../TOPICS/deployment/destructive-deployment-safety.md) before any metadata deletion.

Use [Narrow Deploy Runbook](../TOPICS/deployment/narrow-deploy-runbook.md), [Test Selection Guide](../TOPICS/deployment/test-selection-guide.md), and [Salesforce CLI Command Map](../COMMANDS/SALESFORCE_CLI_COMMAND_MAP.md) before choosing deploy, retrieve, validation, quick deploy, or test commands.

## Production Deployment Rules

- Deploy the smallest metadata set that satisfies the change.
- Run a dry-run validation first.
- If validation succeeds and the task requires deployment, run the matching real deploy.
- Do not bundle unrelated metadata.
- Do not deploy documentation folders.
- Treat layouts, FlexiPages, app pages, profiles, and permission metadata as high-blast-radius changes.
- Verify installed `sf` command help before mutating or destructive commands.
- Record the exact command, target org alias, source or manifest scope, test level, and result before claiming success.

## Validate, Dry Run, Deploy, And Quick Deploy

Do not collapse different command outcomes into one word like "validated."

| Command family | What it proves | What it does not prove |
| --- | --- | --- |
| `sf project deploy start --dry-run` | Salesforce accepted the deploy shape without saving changes. | It is not a real deploy and may use sandbox defaults. |
| `sf project deploy validate` | Production-style validation ran tests and returned a validation job. | It did not commit metadata to the org. |
| `sf project deploy report` | A deploy, validation, or quick deploy status was checked. | It does not start a new validation by itself. |
| `sf project deploy quick` | A previously successful validation job was deployed. | It is not a substitute for the prior validation evidence. |
| `sf project deploy start` without `--dry-run` | Metadata was deployed when the command succeeds. | It does not prove runtime behavior unless tests or manual checks covered it. |

Use `project deploy validate` for production quick-deploy workflows. For sandbox or development validation with production-like tests, `project deploy start --dry-run --test-level ...` is often clearer.

## Production Test Levels

Production orgs reject `NoTestRun` for many deploys, including LWC-only or Aura-only changes in some environments.

Safer default for narrow deploys:

```powershell
sf project deploy start --target-org <alias> --dry-run --source-dir force-app/main/default/lwc/myComponent --test-level RunSpecifiedTests --tests MyStableTest
```

Then run the same command without `--dry-run`.

Use `RunLocalTests` only when the risk requires broad validation and the org's local tests are stable enough to use as a gate.

With `RunSpecifiedTests`, selected tests must cover each deployed class and trigger sufficiently. A passing test run can still fail deployment coverage if the selected tests do not cover every Apex member in the deployment payload.

## Validation Evidence

Codex must distinguish these outcomes:

| Outcome | Meaning |
| --- | --- |
| Static review | Files were inspected, but no org validation ran. |
| Local tool pass | A local linter/analyzer/formatter passed, but deploy behavior is still unproven. |
| Dry-run pass | Salesforce accepted the deployment shape without committing it. |
| Test pass | Specified Apex tests ran and passed. |
| Production validation pass | `sf project deploy validate` completed and produced a usable validation job. |
| Quick deploy pass | A prior successful validation job was deployed. |
| Real deploy pass | Mutating deploy completed successfully. |

Do not collapse these into "validated." State what actually ran.

## No Success Without Evidence

Codex must not say a deployment, validation, test run, retrieve, debug check, or analyzer gate succeeded unless it has one of:

- command output with a zero exit status and a non-sensitive summary;
- a deploy or validation status report showing success;
- a test result summary showing pass/fail counts;
- a Code Analyzer result status;
- an explicit runtime check result from the user or target environment.

If only static review happened, say "static review only." If a command could not run, say `SKIPPED` with the reason.

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

## Destructive Changes

Destructive deployments require explicit approval and a separate review. Before any real deletion:

- verify metadata type and full name,
- inspect dependencies and references,
- keep the destructive manifest narrow,
- run validation-only first,
- document rollback or restore path,
- keep deletion separate from unrelated feature deploys.

Never use wildcard destructive members. Never delete metadata only because local source is missing it.

Prefer `destructiveChangesPost.xml` for deletion after the deployment unless a dependency requires pre-delete behavior. Use `destructiveChangesPre.xml` only when the deletion must happen before the replacement metadata deploys.

Do not use `--purge-on-delete` unless the owner explicitly accepts the reduced recovery path.

## Package And Manifest Safety

`package.xml` should describe the metadata being deployed or retrieved. Destructive manifests should describe deletion targets. Keep the roles separate.

Rules:

- avoid wide wildcards for high-risk metadata;
- inspect profile, layout, FlexiPage, report, dashboard, email, and static resource entries before deploy;
- include dependent metadata only when the target org needs it;
- keep manifests out of deployable source folders unless the project convention requires otherwise;
- match API version to project policy and target org support;
- verify metadata type names against official docs or installed CLI errors before changing source.

## Retrieve Patterns

Retrieve is not harmless because it writes local source.

Before retrieve:

- confirm target org alias;
- prefer manifest or specific `--metadata` entries;
- avoid broad retrieves into a source-controlled package directory unless every output file will be reviewed;
- avoid package-name retrieves as development source;
- record whether the retrieve is reference-only or intended source.

After retrieve, inspect every changed file before keeping it.

## CLI and File Pitfalls

- Confirm exact `sf data` subcommands in the installed CLI before scripting bulk operations.
- For CSV import from PowerShell, prefer UTF-8 without BOM.
- Create Apex probe files before running `sf apex run --file`.
- Quote SOQL and Windows paths carefully.
- If Node or PowerShell wrappers call `sf`, validate command execution on Windows separately from Unix examples.
- For package and destructive manifests, verify file names, placement, and flags against official docs and installed CLI help before execution.
