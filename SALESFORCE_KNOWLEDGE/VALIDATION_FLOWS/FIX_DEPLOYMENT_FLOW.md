# Fix Deployment Flow

## Sequence

1. Read startup docs.
2. Locate real Salesforce DX project.
3. Read deployment guide, testing guide, metadata guide, deployment quality strategy, release gate, deployment topics, and command maps.
4. Inspect exact error output and command.
5. Inspect deploy scope: source-dir, manifest, metadata selector, destructive manifest, changed files, org alias category, and tests.
6. Identify root cause.
7. Verify installed CLI help for the command family before rerunning.
8. Make smallest safe fix.
9. Re-run focused test, dry-run deploy, production validation, or status report as appropriate.
10. Run Code Analyzer for changed scope when available.
11. Update deployment/test logs and History.

## Deployment Triage Table

| Failure type | Inspect first |
| --- | --- |
| Missing metadata | Referenced object, field, layout, action, permission, component, manifest. |
| Test failure | Failing test, production code, test data, permissions, mocks. |
| Coverage | Changed classes, test selection, deploy-bound coverage. |
| Permission/profile | Permission set/profile metadata and referenced targets. |
| Record page | FlexiPage activation, layout/action chain, component metadata. |
| CLI command shape | Installed help, command family, flags, path quoting, manifest/source-dir exclusivity. |
| Destructive change | Exact destructive manifest, dependency references, pre/post delete timing, rollback plan. |
| Async or timeout | Deploy/test job ID and report command result. |
| Code Analyzer | Installed plugin, workspace, target, rule selector, findings related to changed files. |

## Codex Rule

Do not hide real deploy failures with ignore flags. Fix confirmed root cause or explain the blocker.

Do not claim success without evidence. Static review, local lint/analyzer pass, dry-run pass, production validation pass, quick deploy pass, test pass, and real deploy pass are different outcomes and must be reported separately.

## Minimum Final Report

- Original command or failure category.
- Root cause.
- Files changed.
- Command help verification or skipped reason.
- Validation command and result category.
- Test level and selected tests, if any.
- Code Analyzer result or skipped reason.
- Destructive manifest and rollback note, if relevant.
- Remaining risk or runtime validation still needed.
