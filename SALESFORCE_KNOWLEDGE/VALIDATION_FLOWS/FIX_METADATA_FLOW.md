# Fix Metadata Flow

## Sequence

1. Read startup docs.
2. Locate real Salesforce DX project.
3. Read metadata guide, record page guide, metadata quality strategy, command maps, and deployment strategy.
4. Inspect `sfdx-project.json` and package directories.
5. Inspect target metadata and related metadata family.
6. Verify API names and activation/assignment chain.
7. For access changes, review permission sets before profiles and check object, field, class, tab, app, custom permission, and record type access.
8. For package or deletion work, verify official metadata type names and keep manifests narrow.
9. For destructive changes, use the destructive deployment safety runbook and require explicit approval before real deletion.
10. Make smallest safe metadata fix.
11. Run local project validator if practical.
12. Run Code Analyzer when applicable and available.
13. Run narrow deploy dry run when possible.
14. Record Memory and History.

## Metadata Families To Inspect

- `objects/`
- `fields/`
- `validationRules/`
- `recordTypes/`
- `compactLayouts/`
- `layouts/`
- `flexipages/`
- `quickActions/`
- `permissionsets/`
- `profiles/`
- `tabs/`
- `applications/`
- `customMetadata/`
- `staticresources/`
- `reports/`
- `dashboards/`
- `email/`
- `package.xml`
- destructive manifests when explicitly requested

## Minimum Final Report

- Root cause.
- Metadata files changed.
- Activation/assignment/permission checks.
- Validator/deploy dry-run result or skipped reason.
- Package/destructive manifest review when relevant.
- Confirmation that success claims are based on actual validation evidence.
