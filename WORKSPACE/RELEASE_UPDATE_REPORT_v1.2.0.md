# Release Update Report v1.2.0

## Purpose

This report records the release-documentation update for the Salesforce tooling references and Codex quality gates integration.

## Version Chosen

| Version | Decision |
| --- | --- |
| `v1.2.0` | Selected |
| `v1.1.1` | Not selected |

`v1.2.0` is the correct release level because the update adds significant backward-compatible workspace features: `TOOLS/`, `QUALITY_GATES/`, `AUTOMATION/`, `VENDOR_REFERENCES/`, GitHub workflow drafts, external reference maps, and stronger Codex validation behavior.

This is not a patch-only update because it is more than a small documentation correction.

## Files Updated

| File | Change |
| --- | --- |
| `RELEASE_NOTES_v1.2.0.md` | Added full release notes for the tooling/reference/quality gate integration. |
| `RELEASES.md` | Marked `v1.2.0` as latest and moved `v1.1.0` under previous releases. |
| `CHANGELOG.md` | Added the `v1.2.0` changelog section at the top. |
| `README.md` | Updated the latest release notes link to `RELEASE_NOTES_v1.2.0.md`. |
| `INSTRUCTIONS/REPO_MAP.md` | Added `RELEASE_NOTES_v1.2.0.md` to the root documentation map. |
| `MEMORY/PROJECT_MEMORY.md` | Added durable context for the `v1.2.0` release. |
| `HISTORY/CODEX_RUN_LOG.md` | Added a chronological entry for the release documentation update. |
| `HISTORY/CHANGE_ARCHIVE.md` | Added a larger-change summary for the release documentation update. |

## Outdated References Fixed

| Area | Result |
| --- | --- |
| Release index | `v1.2.0` is now listed as latest. |
| Changelog | `v1.2.0` is now the top release section. |
| README release link | Now points to `RELEASE_NOTES_v1.2.0.md`. |
| Repo map | Now includes `RELEASE_NOTES_v1.2.0.md`. |

## Validation Results

| Check | Result |
| --- | --- |
| Markdown local link/path check | Passed across 194 Markdown files after this report was added. |
| Local quality check | Passed in allow-missing-project mode. |
| Public safety scan | Passed for credential, private-key, session, org ID-shaped, temporary-folder, and local-only path patterns. |
| External repo vendoring check | Passed. No external repo clone directories were found in the main repo tree. |
| Ignore check | Passed. `VENDOR_REFERENCES/_external/`, `temp/`, and `*.local.md` are ignored. |
| `FORCE_APP_DIRECTORY/` check | Passed. It contains only placeholder and instruction files. |
| Whitespace check | Passed with `git diff --check`. |

## Known Notes

- No GitHub Release page was created.
- The owner still needs to create or update the `v1.2.0` GitHub Release manually after this documentation commit is pushed.
- GitHub Actions should be watched after the push to confirm remote runner behavior.
- No real Salesforce DX project is included by default, so project-specific quality gates remain skipped until a real project is placed or referenced.

## Ready To Commit And Push

Ready, if the final post-report Markdown link check and public-safety checks still pass.
