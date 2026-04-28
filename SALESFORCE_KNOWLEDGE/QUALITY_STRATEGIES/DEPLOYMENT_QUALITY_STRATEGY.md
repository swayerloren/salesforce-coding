# Deployment Quality Strategy

Deployment quality is about narrow scope, known dependencies, deliberate tests, and evidence.

## Deployment Priorities

| Priority | Requirement |
| --- | --- |
| Scope | Deploy only required metadata. |
| Dependencies | Include required related metadata, not broad retrieve noise. |
| Tests | Select test level deliberately. |
| Safety | Avoid destructive or failure-hiding flags unless explicitly requested. |
| Evidence | Prefer dry-run before real deploy. |

## Test Level Guidance

| Scenario | Likely test level |
| --- | --- |
| Narrow Apex change | `RunSpecifiedTests` with focused tests. |
| Metadata-only UI change | Dry run with no Apex tests only if org policy permits. |
| Shared Apex/framework change | Broader related tests or `RunLocalTests`. |
| Production release | Follow org policy and owner approval. |

Verify command flags with installed Salesforce CLI.

## Codex Checklist

- [ ] Deploy scope excludes helper repo folders.
- [ ] Manifest or source-dir is inspected.
- [ ] Required tests identified.
- [ ] Code Analyzer considered for changed source.
- [ ] Dry-run result recorded in History.
