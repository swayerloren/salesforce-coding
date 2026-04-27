# Release Update Report

## Purpose

This report records the release-documentation update for the Codex-ready Salesforce workspace engine restructure.

## Release Version Chosen

| Version | Decision |
| --- | --- |
| `v1.1.0` | Selected |
| `v2.0.0` | Not selected |

`v1.1.0` is the correct release level because this update is a significant repository structure and documentation improvement, but it does not introduce a packaged API, runtime behavior, or Salesforce metadata contract break. The old root-level knowledge layout moved under `SALESFORCE_KNOWLEDGE/`, so migration notes are included.

## Files Updated

| File | Change |
| --- | --- |
| `RELEASE_NOTES_v1.1.0.md` | Added complete release notes for the workspace-engine restructure. |
| `RELEASES.md` | Marked `v1.1.0` as latest and kept `v1.0.0` as the initial public knowledge-base release. |
| `CHANGELOG.md` | Added a new `v1.1.0` section at the top. |
| `README.md` | Added a link to the latest release notes. |
| `INSTRUCTIONS/REPO_MAP.md` | Added the new release-notes file to the root map. |
| `WORKSPACE/PUSH_READY_REPORT.md` | Updated release-file expectations and clarified that the restructure was later pushed. |
| `WORKSPACE/GITHUB_UPDATE_PLAN.md` | Added the selected release version and clarified the pushed restructure commit context. |
| `MEMORY/PROJECT_MEMORY.md` | Added reusable release-version and release-notes context. |
| `HISTORY/CODEX_RUN_LOG.md` | Added a chronological run entry for this release update. |
| `HISTORY/CHANGE_ARCHIVE.md` | Added a larger-change summary for the release documentation update. |

## Outdated References Fixed

| Area | Result |
| --- | --- |
| Release index | Replaced single-release framing with `v1.1.0` latest plus `v1.0.0` previous. |
| Changelog | Added `v1.1.0` above the existing `v1.0.0` notes. |
| README release link | Added `RELEASE_NOTES_v1.1.0.md` as the latest release notes. |
| Repo map | Added `RELEASE_NOTES_v1.1.0.md` to the expected root documentation files. |
| Workspace reports | Updated stale pre-push wording to distinguish original report context from the pushed restructure commit. |

## References Reviewed But Not Changed

| Reference Type | Why It Remains |
| --- | --- |
| Old root folders such as `apex/`, `lwc/`, `metadata/`, `deployment/`, `testing/`, `troubleshooting/`, `prompts/`, and `checklists/` | Valid in migration notes, historical workspace reports, or explicit moved-from/moved-to explanations. |
| `INDEX.md` and root `SALESFORCE_*.md` references | Valid where documenting migration from the old root layout to `SALESFORCE_KNOWLEDGE/`. |
| `force-app/main/default/lwc/` examples | Valid Salesforce DX metadata placement examples, not old repo knowledge paths. |
| Relative links inside `SALESFORCE_KNOWLEDGE/INDEX.md` | Valid because they resolve from inside the Salesforce knowledge base. |

## Validation Results

| Check | Result |
| --- | --- |
| Markdown link/path check | Passed. |
| Local-only path scan | Passed. |
| Temporary-folder reference scan | Passed. |
| Credential/API token/session pattern scan | Passed. |
| Salesforce ID-shaped value scan | Passed. |
| Private email scan | Passed; only generic placeholder examples were found. |
| Release docs accuracy review | Passed. |

## Ready To Commit And Push

The repo is ready to commit and push after this release-documentation update if the final `git status`, commit, and push commands complete successfully.

## Owner Follow-Up

- Create or update the GitHub Release page for `v1.1.0` manually if GitHub Releases does not automatically use these Markdown files.
- Confirm whether the GitHub Release tag should point at the documented restructure commit or the follow-up documentation commit.
