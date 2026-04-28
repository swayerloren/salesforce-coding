# Pre-Release Flow

Use this flow before pushing, publishing, or creating release documentation.

## Sequence

1. Review changed files.
2. Run public safety scan.
3. Run Markdown link/path check for changed docs.
4. Confirm no external repos, `.git` folders, `node_modules`, or vendor clone trees are committed.
5. Confirm `FORCE_APP_DIRECTORY/` contains only placeholders unless intentionally reviewed.
6. Run local quality check in allow-missing-project mode if no real project exists.
7. If Salesforce source changed, run or document skipped Salesforce validation: Code Analyzer, focused tests, deploy dry run, or production validation as applicable.
8. Review destructive manifests, package manifests, high-risk metadata, and rollback notes.
9. Run `git diff --check`.
10. Update Memory and History.
11. Prepare implementation/release report.

## Public Safety Checks

- [ ] No credentials, tokens, private keys, session IDs, or auth headers.
- [ ] No org IDs, deploy IDs, test run IDs, or real record IDs.
- [ ] No local-only paths.
- [ ] No temporary folder references in public docs.
- [ ] No private customer data.
- [ ] No copied external source.
- [ ] No raw deploy logs, debug logs, test output with IDs, or org usernames pasted into public docs.

## Evidence Checks

- [ ] Markdown link check result recorded.
- [ ] Public safety scan result recorded.
- [ ] Script parse checks recorded when scripts changed.
- [ ] Code Analyzer result or skipped reason recorded when Salesforce source changed.
- [ ] Deploy/test validation result or skipped reason recorded when Salesforce source changed.
- [ ] `git diff --check` result recorded or no-git limitation stated.

## Ready Criteria

The repo is ready to commit only when validation passes or remaining issues are clearly listed with exact files and owner review needs.
