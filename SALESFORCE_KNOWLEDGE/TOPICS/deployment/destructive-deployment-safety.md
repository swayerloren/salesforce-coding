# Destructive Deployment Safety

Use this before deleting Salesforce metadata through a manifest, CLI deployment, Metadata API deployment, or cleanup package.

Official anchors:

- Metadata API Developer Guide: Deleting Files from an Organization
- Metadata API Developer Guide: Sample `package.xml` Manifests
- Salesforce CLI Command Reference: project deploy commands

## Core Rule

Destructive changes are not ordinary feature deploys. Keep them separate, narrow, reviewed, and validated before any real deletion.

Do not combine deletion with unrelated feature metadata.

## Required Preflight

Before drafting a destructive manifest, record:

- exact metadata type and full name,
- source file path if present,
- why deletion is needed,
- references from Apex, LWC, Flow, layouts, FlexiPages, actions, permission sets, profiles, reports, dashboards, email templates, and static resources,
- replacement path or owner approval that no replacement is needed,
- validation command,
- rollback or restore plan,
- whether the target is sandbox, scratch org, staging, or production.

## Manifest Safety

Keep the ordinary `package.xml` and destructive manifest roles distinct. The package manifest describes deployment context. The destructive manifest describes deletion targets.

Safety rules:

- no wildcard destructive members,
- no generated broad profile/layout/FlexiPage payloads,
- no private report/dashboard/email cleanup without owner review,
- no deletion of metadata only because a retrieve omitted it,
- no destructive deploy from stale local source.

Use `destructiveChangesPost.xml` for the usual delete-after-deploy flow. Use `destructiveChangesPre.xml` only when a dependency requires deletion before replacement metadata can deploy.

Do not use `--purge-on-delete` unless the owner explicitly accepts that the deletion has a reduced recovery path.

## Validation Sequence

1. Inspect current source and references.
2. Build the smallest destructive manifest possible.
3. Run a validation-only deploy or dry run using the installed CLI shape.
4. Review failures as dependency evidence.
5. Record command, target org alias, manifest path, test level, result, and rollback note.
6. Run the real destructive deployment only after explicit approval.

Example validation shape, after verifying installed help:

```powershell
sf project deploy start --target-org <alias> --dry-run --manifest manifest/package.xml --post-destructive-changes manifest/destructiveChangesPost.xml --test-level RunSpecifiedTests --tests MyDeletionSafetyTest
```

For production-style validation and later quick deploy:

```powershell
sf project deploy validate --target-org <alias> --manifest manifest/package.xml --post-destructive-changes manifest/destructiveChangesPost.xml --test-level RunLocalTests
```

The validation job is not a real deletion. A real deletion requires a later deploy or quick deploy, owner approval, and recorded evidence.

## Production Cautions

Production deletion may require tests depending on deployment shape and org policy. Do not assume `NoTestRun` is available. When Apex or metadata dependencies are involved, use selected tests or local tests according to the deployment policy and official CLI behavior.

## Anti-Patterns

- Deleting metadata as part of an unrelated feature deploy.
- Using `*` members in a destructive manifest.
- Trusting UI names instead of metadata full names.
- Assuming a missing local file means the org metadata should be deleted.
- Running a real destructive command before validation-only review.
- Omitting rollback notes because the deletion "looks small".
- Treating `--ignore-warnings` as a clean pass.
- Using `--purge-on-delete` by default.
