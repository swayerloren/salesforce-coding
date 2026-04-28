# Deployment Quality Strategy

Deployment quality is about narrow scope, known dependencies, deliberate tests, and evidence.

## Deployment Priorities

| Priority | Requirement |
| --- | --- |
| Scope | Deploy only required metadata. |
| Dependencies | Include required related metadata, not broad retrieve noise. |
| Tests | Select test level deliberately. |
| Safety | Avoid destructive or failure-hiding flags unless explicitly requested. |
| Evidence | Prefer dry-run or production validation before real deploy, and record exact result category. |
| Analyzer | Run Code Analyzer for changed Salesforce source when available. |
| Recovery | Define rollback or restore plan for release and destructive changes. |

## Test Level Guidance

| Scenario | Likely test level |
| --- | --- |
| Narrow Apex change | `RunSpecifiedTests` with focused tests. |
| Metadata-only UI change | Dry run with no Apex tests only if org policy permits. |
| Shared Apex/framework change | Broader related tests or `RunLocalTests`. |
| Production release | Follow org policy and owner approval. |

Verify command flags with installed Salesforce CLI.

## Command Choice

| Need | Preferred command family |
| --- | --- |
| Sandbox/development dry run | `sf project deploy start --dry-run ...` |
| Production validation for quick deploy | `sf project deploy validate ...` |
| Poll async deploy or validation | `sf project deploy report --job-id <id> ...` |
| Deploy a successful validation | `sf project deploy quick --job-id <id> ...` |
| Focused Apex tests outside deployment | `sf apex run test ...` |
| Static source analysis | `sf code-analyzer run ...` |

Do not claim success from a command family that was not run. A dry run is not a quick deploy validation, and a validation job is not a real deploy.

## High-Risk Flags

Require explicit approval and a recorded reason before using:

- `--ignore-errors`
- `--ignore-warnings`
- `--ignore-conflicts`
- `--purge-on-delete`

If these flags are used, report the result as a risk state with context. Do not describe it as a clean deployment.

## Codex Checklist

- [ ] Deploy scope excludes helper repo folders.
- [ ] Manifest or source-dir is inspected.
- [ ] Required tests identified.
- [ ] Installed CLI help checked for deploy, retrieve, test, or analyzer command.
- [ ] Code Analyzer considered for changed source.
- [ ] Dry-run, validation, report, quick deploy, or real deploy result recorded in History with exact category.
- [ ] Rollback/recovery note exists for destructive or release-risk changes.
