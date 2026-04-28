# Pre-Release Flow

Use this flow before pushing, publishing, or creating release documentation.

## Sequence

1. Review changed files.
2. Run public safety scan.
3. Run Markdown link/path check for changed docs.
4. Confirm no external repos, `.git` folders, `node_modules`, or vendor clone trees are committed.
5. Confirm `FORCE_APP_DIRECTORY/` contains only placeholders unless intentionally reviewed.
6. Run local quality check in allow-missing-project mode if no real project exists.
7. Run `git diff --check`.
8. Update Memory and History.
9. Prepare implementation/release report.

## Public Safety Checks

- [ ] No credentials, tokens, private keys, session IDs, or auth headers.
- [ ] No org IDs, deploy IDs, test run IDs, or real record IDs.
- [ ] No local-only paths.
- [ ] No temporary folder references in public docs.
- [ ] No private customer data.
- [ ] No copied external source.

## Ready Criteria

The repo is ready to commit only when validation passes or remaining issues are clearly listed with exact files and owner review needs.
