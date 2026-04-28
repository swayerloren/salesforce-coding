# Fix Deployment Flow

## Sequence

1. Read startup docs.
2. Locate real Salesforce DX project.
3. Read deployment guide, testing guide, metadata guide, deployment quality strategy, and command maps.
4. Inspect exact error output and command.
5. Inspect deploy scope: source-dir, manifest, changed files, org alias, and tests.
6. Identify root cause.
7. Make smallest safe fix.
8. Re-run focused test or dry-run deploy if possible.
9. Run Code Analyzer for changed scope when available.
10. Update deployment/test logs and History.

## Deployment Triage Table

| Failure type | Inspect first |
| --- | --- |
| Missing metadata | Referenced object, field, layout, action, permission, component, manifest. |
| Test failure | Failing test, production code, test data, permissions, mocks. |
| Coverage | Changed classes, test selection, deploy-bound coverage. |
| Permission/profile | Permission set/profile metadata and referenced targets. |
| Record page | FlexiPage activation, layout/action chain, component metadata. |

## Codex Rule

Do not hide real deploy failures with ignore flags. Fix confirmed root cause or explain the blocker.
