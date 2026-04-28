# Tooling Integration Consistency Review

Date: 2026-04-28

## Scope

Reviewed the repo after adding tooling, quality gates, automation, GitHub workflows, and optional vendor reference documentation.

## Files Reviewed

| Area | Files or folders reviewed |
| --- | --- |
| Root onboarding | `README.md`, `START_HERE.md` |
| Codex instructions | `INSTRUCTIONS/` |
| Salesforce knowledge routing | `SALESFORCE_KNOWLEDGE/INDEX.md` |
| Prompt pack | `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/` |
| Checklists | `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/` |
| Tooling docs | `TOOLS/` |
| Quality gates | `QUALITY_GATES/` |
| Local automation | `AUTOMATION/` |
| Vendor references | `VENDOR_REFERENCES/` |
| GitHub workflows | `.github/workflows/` |
| Memory and History | `MEMORY/`, `HISTORY/` |
| Wiki drafts | `WIKI_DRAFTS/` |

## Issues Found

| Issue | Risk |
| --- | --- |
| Local public-safety scans did not exclude optional vendor clones under `VENDOR_REFERENCES/_external/`. | Users who clone external references locally could get noisy safety failures from third-party source that is not part of this repo. |
| Automation source included the exact old temporary reference folder name as a scan literal. | Even defensive scan strings can leave confusing temporary-folder references in public source. |
| GitHub Markdown and public-safety workflows did not explicitly skip local-only `_external/` and `temp/` folders. | Future workflow changes or local workflow testing could scan non-repo reference content. |
| `SALESFORCE_KNOWLEDGE/INDEX.md` did not fully route Apex, deployment, and testing tasks to the new Code Analyzer, Apex formatting, and testing gates. | Codex could miss the new validation layer for common task types. |
| Several prompt-pack files referenced legacy checklist files but not the stricter `CODEX_ENGINE_CHECKLISTS/` equivalents. | Codex prompts could under-emphasize the strict engine preflight gates. |
| Wiki draft pages still described the pre-tooling structure and referenced older checklist paths. | New users reading the wiki could miss tooling, quality gates, automation, and vendor reference guidance. |
| `START_HERE.md` linked visible text as if `VENDOR_REFERENCES/_external/` were a committed folder. | The optional ignored clone folder could look like required repo content. |
| `README.md` had minor list punctuation inconsistency in public-safe repository rules. | Polish issue only. |
| An older workspace safety review contained literal generic user-profile path examples. | Conservative scans could flag the examples even though they were not private paths. |

## Issues Fixed

| Fix | Files changed |
| --- | --- |
| Excluded `VENDOR_REFERENCES/_external/`, `temp/`, and dependency folders from local safety scans. | `AUTOMATION/local-quality-check.ps1`, `AUTOMATION/local-quality-check.sh` |
| Removed the exact temporary reference folder name from automation source by avoiding a plain literal. | `AUTOMATION/local-quality-check.ps1`, `AUTOMATION/local-quality-check.sh` |
| Updated GitHub workflow scan skip rules for `_external/` and `temp/`. | `.github/workflows/markdown-link-check.yml`, `.github/workflows/public-safety-check.yml`, `.github/workflows/README.md` |
| Added Code Analyzer, Prettier Apex, Code Analyzer gate, Apex formatting gate, release gate, and testing gate routing where relevant. | `SALESFORCE_KNOWLEDGE/INDEX.md` |
| Added strict Codex engine checklist references to LWC, Apex, Apex tests, deployment, Salesforce Files, mobile, and GitHub push prompts. | `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/02_FIX_LWC.md`, `03_FIX_APEX.md`, `04_FIX_APEX_TESTS.md`, `05_FIX_DEPLOYMENT_FAILURE.md`, `07_FIX_SALESFORCE_FILES.md`, `08_FIX_MOBILE_SALESFORCE.md`, `09_REVIEW_BEFORE_GITHUB_PUSH.md` |
| Updated wiki drafts to include tooling, quality gates, automation, vendor references, and current strict checklist paths. | `WIKI_DRAFTS/Home.md`, `How-Codex-Should-Use-This-Repo.md`, `Apex-Fixing-Guide.md`, `LWC-Fixing-Guide.md`, `Metadata-and-Record-Page-Guide.md`, `Testing-and-Deployment-Guide.md`, `Folder-Map.md`, `Recommended-Project-Structure.md`, `Prompt-Library.md`, `Contributing-and-Safety-Rules.md` |
| Clarified optional vendor reference wording. | `START_HERE.md` |
| Fixed public-safe rules punctuation. | `README.md` |
| Reworded generic local-path examples to avoid literal path patterns in workspace notes. | `WORKSPACE/PUBLIC_RELEASE_REVIEW.md` |
| Recorded the consistency pass in Memory and History. | `MEMORY/PROJECT_MEMORY.md`, `HISTORY/CODEX_RUN_LOG.md`, `HISTORY/CHANGE_ARCHIVE.md` |

## Validation Results

| Check | Result | Notes |
| --- | --- | --- |
| PowerShell script parse | PASS | `AUTOMATION/local-quality-check.ps1` parsed successfully. |
| Bash script syntax | PASS | `AUTOMATION/local-quality-check.sh` passed `bash -n`. |
| Local quality check | PASS | Ran in allow-missing-project mode. No real Salesforce DX project exists in this helper repo, so project-level gates were skipped by design. |
| Markdown local links | PASS | Checked 192 Markdown files; local Markdown links resolve. |
| Inline Markdown code paths | PASS | Public-doc `.md` paths in code spans resolve. |
| Exact temporary reference folder scan | PASS | No exact old temporary folder reference found. |
| Local-only user path scan | PASS | No local-only user paths found in public docs/scripts. |
| Credential/private-key/session scan | PASS | No obvious credential, private-key, or session patterns found outside detector files. |
| Salesforce org ID-shaped values | PASS | No org ID-shaped values found. |
| Ignore rules | PASS | `git check-ignore` confirms `VENDOR_REFERENCES/_external/`, `temp/`, and `*.local.md`. |
| Diff whitespace check | PASS | `git diff --check` passed with only the existing `.gitignore` CRLF normalization warning. |

## Public Safety Result

PASS.

No credentials, API tokens, session IDs, private keys, Salesforce org ID-shaped values, exact temporary reference folder references, or local-only user paths were found in the reviewed public documentation and scripts.

## Link Check Result

PASS.

Repository-local Markdown links resolve. Public-doc inline `.md` path references also resolve.

## Remaining Manual Review Items

- Run the GitHub Actions remotely after committing to confirm runner behavior.
- Test `AUTOMATION/` scripts against a real Salesforce DX project under `FORCE_APP_DIRECTORY/` or a documented external path.
- Decide whether all `WORKSPACE/` audit and analysis reports should be published with the next commit.
- Review the accumulated uncommitted changes from prior tooling and Salesforce knowledge tasks before staging.
- The `.gitignore` CRLF normalization warning is not a blocker, but the owner may normalize line endings if desired.

## Commit Readiness

READY TO COMMIT

The reviewed docs and scripts are consistent enough to commit after owner review of the full accumulated working tree. No push was performed.
