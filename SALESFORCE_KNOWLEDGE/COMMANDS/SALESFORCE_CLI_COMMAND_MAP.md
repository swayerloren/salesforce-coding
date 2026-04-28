# Salesforce CLI Command Map

Use these command patterns only after locating the real Salesforce DX project and confirming `force-app/main/default`.

Official anchors:

- Salesforce CLI command reference for `sf project deploy`, `sf project retrieve`, and `sf apex`.
- Salesforce Code Analyzer CLI docs for `sf code-analyzer`.
- Metadata API docs for package manifests and destructive changes.

## Command Verification Rule

Before running a Salesforce CLI command that changes an org or writes source files, verify the installed help:

```powershell
sf project deploy start --help
sf project deploy validate --help
sf project retrieve start --help
sf apex run test --help
sf code-analyzer run --help
```

Local CLI versions can differ from official docs. If help output conflicts with this map, use the installed help and record the difference.

## Safe Inspection And Validation

| Command pattern | Use | Notes |
| --- | --- | --- |
| `sf project deploy start --dry-run --source-dir force-app/main/default/classes/MyClass.cls --target-org <alias>` | Sandbox or development dry run for narrow source. | Does not save changes. Add test flags when Apex or org policy requires tests. |
| `sf project deploy start --dry-run --manifest manifest/package.xml --target-org <alias>` | Sandbox or development dry run for a reviewed manifest. | Inspect manifest first. Do not mix with `--source-dir` or `--metadata`. |
| `sf project deploy validate --source-dir force-app/main/default --target-org <alias> --test-level RunLocalTests` | Production-style validation that returns a deploy job ID. | Requires Apex tests. Intended for production-style validation and quick deploy flow. |
| `sf project deploy report --job-id <deploy-job-id> --target-org <alias> --wait 30` | Poll or inspect deploy/validation status. | Use job IDs from async deploy, validation, quick deploy, or timeout output. |
| `sf project deploy quick --job-id <validated-job-id> --target-org <alias>` | Quick deploy a successful validation. | Requires an already successful validation job. Do not use as first validation evidence. |
| `sf apex run test --target-org <alias> --test-level RunSpecifiedTests --tests MyClassTest --result-format human --wait 30` | Focused Apex tests outside a deployment. | Use `--class-names`, `--suite-names`, or `--tests` deliberately; do not mix incompatible selectors. |
| `sf project retrieve start --manifest manifest/package.xml --target-org <alias>` | Retrieve reviewed metadata into source format. | Inspect output before committing. Avoid broad package retrieve noise. |
| `sf code-analyzer run --target force-app/main/default --view table` | Static analysis. | Verify `sf code-analyzer run --help`; missing analyzer is a skipped gate, not a pass. |

## Deploy, Validate, And Quick Deploy

`sf project deploy start --dry-run` is a dry run for a deployment shape. It is often the right local or sandbox validation command.

`sf project deploy validate` creates a validated deployment job for later quick deploy. It requires tests and is intended for production-style validation. A successful validation job is not a real deploy until `sf project deploy quick` succeeds.

Record the exact evidence:

- command;
- target org alias category, not private username;
- source, metadata, or manifest scope;
- test level and named tests;
- deploy or validation job ID category when available;
- status: dry-run pass, validation pass, quick deploy pass, real deploy pass, fail, or skipped.

## Test Level Guidance

| Test level | Use | Caution |
| --- | --- | --- |
| `NoTestRun` | Development org metadata deploys when allowed. | Not valid for many production deployments. Do not assume it is available. |
| `RunSpecifiedTests` | Narrow Apex or deployment validation with focused tests. | Deployed classes/triggers need per-class or per-trigger coverage from the selected tests. |
| `RunLocalTests` | Production default for Apex-containing deployments and broader validation. | Excludes managed package tests but can surface unrelated org issues. |
| `RunAllTestsInOrg` | Highest confidence or org policy requirement. | Includes managed package tests and can be slow/noisy. |

## Retrieve Rules

- Prefer a manifest or specific metadata members for retrieve work.
- Do not use package-name retrieves as development source without owner review; treat retrieved package metadata as reference only.
- Do not commit broad retrieve output without reviewing every changed file.
- Use metadata type names, not UI labels.
- Retrieve failures can be command-shape, metadata-name, permission, or org-access failures. Do not assume the org is broken.

## Destructive Deployment Commands

Destructive commands require explicit user approval and the [Destructive Deployment Safety](../TOPICS/deployment/destructive-deployment-safety.md) runbook.

Current CLI command families support destructive manifests with deploy start or validate:

```powershell
sf project deploy start --target-org <alias> --dry-run --manifest manifest/package.xml --post-destructive-changes manifest/destructiveChangesPost.xml --test-level RunSpecifiedTests --tests MyDeletionSafetyTest
```

```powershell
sf project deploy validate --target-org <alias> --manifest manifest/package.xml --post-destructive-changes manifest/destructiveChangesPost.xml --test-level RunLocalTests
```

Use `--pre-destructive-changes` only when deletion must happen before deployment. Use `--post-destructive-changes` for the usual safer deletion-after-deploy shape. Do not use `--purge-on-delete` unless the owner explicitly accepts the recovery risk.

## Code Analyzer Commands

Use current Code Analyzer v5 command families:

```powershell
sf code-analyzer rules --rule-selector Recommended --workspace . --target force-app/main/default --view table
sf code-analyzer run --rule-selector Recommended --workspace . --target force-app/main/default --view table
```

Use `--severity-threshold` only when the project or CI policy defines what should fail the command. Write output files outside deployable Salesforce metadata folders.

## Setup Or Mutating Commands That Require Approval

| Command pattern | Why approval is required |
| --- | --- |
| `sf org create scratch ...` | Creates an org. |
| `sf project deploy start` without `--dry-run` | Mutates org metadata. |
| `sf project deploy quick` | Mutates org metadata using a prior validation job. |
| `sf project retrieve start` | Writes source files locally and can overwrite source. |
| `sf org assign permset ...` | Changes user access in an org. |
| `sf data tree import ...` | Inserts data. |
| `sf apex run --file <file>` | Executes Apex in an org. |

## Failure-Hiding Flags

Avoid these unless the user explicitly approves and the risk is documented:

- `--ignore-errors`
- `--ignore-warnings`
- `--ignore-conflicts`
- `--purge-on-delete`

Never use failure-hiding flags to claim success. If a deployment succeeds only because warnings or errors were ignored, report it as a risk state, not a clean pass.

## Codex Checklist

- [ ] Project root confirmed.
- [ ] Installed CLI help checked for the command family.
- [ ] Org alias supplied by user or locally verified without publishing private usernames.
- [ ] Command does not include helper repo folders.
- [ ] Source, metadata, or manifest scope is narrow and inspected.
- [ ] Test level and named tests are justified.
- [ ] Dry run or validation ran before real deploy when possible.
- [ ] Code Analyzer ran or skipped with reason.
- [ ] Command result recorded in History with evidence category.
