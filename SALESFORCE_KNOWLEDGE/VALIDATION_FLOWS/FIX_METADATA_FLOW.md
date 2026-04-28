# Fix Metadata Flow

## Sequence

1. Read startup docs.
2. Locate real Salesforce DX project.
3. Read metadata guide, record page guide, metadata quality strategy, command maps, and deployment strategy.
4. Inspect `sfdx-project.json` and package directories.
5. Inspect target metadata and related metadata family.
6. Verify API names and activation/assignment chain.
7. Make smallest safe metadata fix.
8. Run local project validator if practical.
9. Run Code Analyzer when applicable and available.
10. Run narrow deploy dry run when possible.
11. Record Memory and History.

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

## Minimum Final Report

- Root cause.
- Metadata files changed.
- Activation/assignment/permission checks.
- Validator/deploy dry-run result or skipped reason.
