# GitHub Update Plan

Date: 2026-04-27

## Git Status

`git status` was inspected in this working folder.

Result:

```text
fatal: not a git repository (or any of the parent directories): .git
```

There is no `.git` directory in the current repo folder, so this plan is based on the current filesystem, workspace reports, and history records rather than git's tracked diff.

No `git push` command was run.

## 1. Files Added

Because git metadata is not available, this list reflects files created during the repo engine setup and polishing work.

### Root And Workspace

| Path | Purpose |
| --- | --- |
| `START_HERE.md` | First-read guide for Codex and users. |
| `WORKSPACE/README.md` | Workspace folder purpose. |
| `WORKSPACE/REPO_AUDIT_BEFORE_RESTRUCTURE.md` | Pre-restructure audit. |
| `WORKSPACE/TEMP_REFERENCE_EXTRACTION_SUMMARY.md` | Summary of public-safe extraction from temporary reference material. |
| `WORKSPACE/LINK_AND_PATH_REVIEW.md` | Link/path consistency review. |
| `WORKSPACE/PUBLIC_RELEASE_REVIEW.md` | Public GitHub safety review. |
| `WORKSPACE/FINAL_POLISH_SUMMARY.md` | Final documentation polish summary. |
| `WORKSPACE/GITHUB_UPDATE_PLAN.md` | This update plan. |

### Instructions

| Path |
| --- |
| `INSTRUCTIONS/README.md` |
| `INSTRUCTIONS/CODEX_RULES.md` |
| `INSTRUCTIONS/DEVELOPMENT_WORKFLOW.md` |
| `INSTRUCTIONS/SALESFORCE_PROJECT_PLACEMENT.md` |
| `INSTRUCTIONS/MEMORY_AND_HISTORY_RULES.md` |
| `INSTRUCTIONS/OUTPUT_FORMAT_RULES.md` |
| `INSTRUCTIONS/REPO_MAP.md` |

### Real Project Placeholder Area

| Path |
| --- |
| `FORCE_APP_DIRECTORY/README.md` |
| `FORCE_APP_DIRECTORY/PLACE_SALESFORCE_PROJECT_HERE.md` |
| `FORCE_APP_DIRECTORY/.gitkeep` |

### Memory

| Path |
| --- |
| `MEMORY/README.md` |
| `MEMORY/PROJECT_MEMORY.md` |
| `MEMORY/FIX_HISTORY.md` |
| `MEMORY/FAILURE_HISTORY.md` |
| `MEMORY/DECISION_LOG.md` |
| `MEMORY/PROJECT_NOTES.md` |
| `MEMORY/KNOWN_ORG_PATTERNS.md` |

### History

| Path |
| --- |
| `HISTORY/README.md` |
| `HISTORY/TASK_HISTORY.md` |
| `HISTORY/CODEX_RUN_LOG.md` |
| `HISTORY/DEPLOYMENT_LOG.md` |
| `HISTORY/TEST_RESULTS_LOG.md` |
| `HISTORY/CHANGE_ARCHIVE.md` |

### Archive

| Path |
| --- |
| `ARCHIVE/README.md` |
| `ARCHIVE/OLD_FIXES/README.md` |

### Salesforce Knowledge Additions

| Path | Purpose |
| --- | --- |
| `SALESFORCE_KNOWLEDGE/README.md` | Knowledge base entry point. |
| `SALESFORCE_KNOWLEDGE/INDEX.md` | Master knowledge map. |
| `SALESFORCE_KNOWLEDGE/GUIDES/README.md` | Guide folder index. |
| `SALESFORCE_KNOWLEDGE/TOPICS/README.md` | Topic folder index. |
| `SALESFORCE_KNOWLEDGE/PATTERNS/README.md` | Patterns folder index. |
| `SALESFORCE_KNOWLEDGE/PROMPTS/README.md` | Prompt folder index. |
| `SALESFORCE_KNOWLEDGE/CHECKLISTS/README.md` | Checklist folder index. |
| `SALESFORCE_KNOWLEDGE/EXAMPLES/README.md` | Examples folder index. |
| `SALESFORCE_KNOWLEDGE/REFERENCE/README.md` | Reference folder index. |
| `SALESFORCE_KNOWLEDGE/DOCS/README.md` | Docs folder index. |
| `SALESFORCE_KNOWLEDGE/DOCS/documentation-governance.md` | Documentation precedence and placement rules. |
| `SALESFORCE_KNOWLEDGE/DOCS/engineering-principles.md` | Engineering principles. |
| `SALESFORCE_KNOWLEDGE/DOCS/public-sanitization-policy.md` | Public-safe publishing policy. |
| `SALESFORCE_KNOWLEDGE/REFERENCE/project-discovery-template.md` | Project discovery template. |
| `SALESFORCE_KNOWLEDGE/REFERENCE/sanitized-lessons-catalog.md` | Public-safe lessons catalog. |
| `SALESFORCE_KNOWLEDGE/REFERENCE/salesforce-cli-command-reference.md` | Salesforce CLI command reference. |
| `SALESFORCE_KNOWLEDGE/CHECKLISTS/project-discovery.md` | Project discovery checklist. |

### Codex Prompt Pack

| Path |
| --- |
| `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/00_READ_ME_FIRST.md` |
| `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/01_START_NEW_SALESFORCE_TASK.md` |
| `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/02_FIX_LWC.md` |
| `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/03_FIX_APEX.md` |
| `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/04_FIX_APEX_TESTS.md` |
| `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/05_FIX_DEPLOYMENT_FAILURE.md` |
| `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/06_FIX_METADATA_OR_RECORD_PAGE.md` |
| `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/07_FIX_SALESFORCE_FILES.md` |
| `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/08_FIX_MOBILE_SALESFORCE.md` |
| `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/09_REVIEW_BEFORE_GITHUB_PUSH.md` |
| `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/10_REVIEW_MEMORY_AND_HISTORY.md` |

### Codex Engine Checklist Pack

| Path |
| --- |
| `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/README.md` |
| `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EVERY_CODEX_TASK.md` |
| `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EDITING_APEX.md` |
| `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EDITING_LWC.md` |
| `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EDITING_METADATA.md` |
| `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_DEPLOYMENT.md` |
| `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_GITHUB_PUSH.md` |
| `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/PUBLIC_REPO_SAFETY_CHECK.md` |

### Wiki Drafts

| Path |
| --- |
| `WIKI_DRAFTS/Home.md` |
| `WIKI_DRAFTS/Installation-Guide.md` |
| `WIKI_DRAFTS/How-Codex-Should-Use-This-Repo.md` |
| `WIKI_DRAFTS/Recommended-Project-Structure.md` |
| `WIKI_DRAFTS/Codex-Start-Prompt.md` |
| `WIKI_DRAFTS/Apex-Fixing-Guide.md` |
| `WIKI_DRAFTS/LWC-Fixing-Guide.md` |
| `WIKI_DRAFTS/Aura-and-Visualforce-Guide.md` |
| `WIKI_DRAFTS/Metadata-and-Record-Page-Guide.md` |
| `WIKI_DRAFTS/Testing-and-Deployment-Guide.md` |
| `WIKI_DRAFTS/Common-Failures-Codex-Must-Check.md` |
| `WIKI_DRAFTS/Memory-and-History-System.md` |
| `WIKI_DRAFTS/Folder-Map.md` |
| `WIKI_DRAFTS/Prompt-Library.md` |
| `WIKI_DRAFTS/Contributing-and-Safety-Rules.md` |

## 2. Files Moved

The repo was reorganized into the final Codex-ready Salesforce coding engine structure.

### Root Guide Files Moved

These root guide files were moved into `SALESFORCE_KNOWLEDGE/GUIDES/`:

```text
SALESFORCE_APEX_GUIDE.md
SALESFORCE_ARCHITECTURE_GUIDE.md
SALESFORCE_AURA_GUIDE.md
SALESFORCE_COMMON_FAILURES_AND_FIXES.md
SALESFORCE_COPY_PASTE_SAFE_PATTERNS.md
SALESFORCE_DEBUGGING_GUIDE.md
SALESFORCE_DEPLOYMENT_GUIDE.md
SALESFORCE_DO_AND_DONT.md
SALESFORCE_FILE_HANDLING_GUIDE.md
SALESFORCE_LWC_GUIDE.md
SALESFORCE_METADATA_GUIDE.md
SALESFORCE_MOBILE_GUIDE.md
SALESFORCE_PLATFORM_LIMITATIONS.md
SALESFORCE_RECORD_PAGE_GUIDE.md
SALESFORCE_TESTING_GUIDE.md
SALESFORCE_VISUALFORCE_GUIDE.md
```

### Topic Folders Moved

These folders were moved into `SALESFORCE_KNOWLEDGE/TOPICS/`:

```text
apex/
aura/
lwc/
metadata/
deployment/
testing/
troubleshooting/
mobile/
visualforce/
```

### Knowledge Asset Folders Moved

| Old path | New path |
| --- | --- |
| `patterns/` | `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/` |
| `anti_patterns/` | `SALESFORCE_KNOWLEDGE/PATTERNS/anti_patterns/` |
| `prompts/` | `SALESFORCE_KNOWLEDGE/PROMPTS/` |
| `checklists/` | `SALESFORCE_KNOWLEDGE/CHECKLISTS/` |
| `examples/` | `SALESFORCE_KNOWLEDGE/EXAMPLES/` |
| `reference/` | `SALESFORCE_KNOWLEDGE/REFERENCE/` |
| `docs/` | `SALESFORCE_KNOWLEDGE/DOCS/` |
| `INDEX.md` | `SALESFORCE_KNOWLEDGE/INDEX.md` |

## 3. Files Changed

The main changed files are grouped by purpose.

### Public Entry Points

| Path | Change |
| --- | --- |
| `README.md` | Rewritten as a professional GitHub landing page for the Codex-ready Salesforce coding engine. |
| `START_HERE.md` | Rewritten as the first-read guide for Codex and users. |
| `PUBLIC_REPO_REVIEW_CHECKLIST.md` | Kept as public-safety support. |
| `RELEASE_NOTES_v1.0.0.md` | Updated during link/path consistency work. |

### Instruction System

| Path |
| --- |
| `INSTRUCTIONS/README.md` |
| `INSTRUCTIONS/CODEX_RULES.md` |
| `INSTRUCTIONS/DEVELOPMENT_WORKFLOW.md` |
| `INSTRUCTIONS/SALESFORCE_PROJECT_PLACEMENT.md` |
| `INSTRUCTIONS/MEMORY_AND_HISTORY_RULES.md` |
| `INSTRUCTIONS/OUTPUT_FORMAT_RULES.md` |
| `INSTRUCTIONS/REPO_MAP.md` |

### Project Placement

| Path |
| --- |
| `FORCE_APP_DIRECTORY/README.md` |
| `FORCE_APP_DIRECTORY/PLACE_SALESFORCE_PROJECT_HERE.md` |

### Salesforce Knowledge Base

| Path |
| --- |
| `SALESFORCE_KNOWLEDGE/README.md` |
| `SALESFORCE_KNOWLEDGE/INDEX.md` |
| `SALESFORCE_KNOWLEDGE/PROMPTS/README.md` |
| `SALESFORCE_KNOWLEDGE/CHECKLISTS/README.md` |
| `SALESFORCE_KNOWLEDGE/DOCS/README.md` |
| `SALESFORCE_KNOWLEDGE/REFERENCE/README.md` |
| `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/*` |
| `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/*` |

### Memory And History

| Path |
| --- |
| `MEMORY/README.md` |
| `MEMORY/PROJECT_MEMORY.md` |
| `MEMORY/DECISION_LOG.md` |
| `HISTORY/README.md` |
| `HISTORY/TASK_HISTORY.md` |
| `HISTORY/CODEX_RUN_LOG.md` |
| `HISTORY/CHANGE_ARCHIVE.md` |

### Wiki Drafts

| Path |
| --- |
| `WIKI_DRAFTS/Home.md` |
| `WIKI_DRAFTS/Common-Failures-Codex-Must-Check.md` |
| `WIKI_DRAFTS/Contributing-and-Safety-Rules.md` |
| `WIKI_DRAFTS/How-Codex-Should-Use-This-Repo.md` |
| `WIKI_DRAFTS/Installation-Guide.md` |
| `WIKI_DRAFTS/Recommended-Project-Structure.md` |

### Workspace Reports

| Path |
| --- |
| `WORKSPACE/TEMP_REFERENCE_EXTRACTION_SUMMARY.md` |
| `WORKSPACE/LINK_AND_PATH_REVIEW.md` |
| `WORKSPACE/PUBLIC_RELEASE_REVIEW.md` |
| `WORKSPACE/FINAL_POLISH_SUMMARY.md` |

## 4. Files Deleted

No useful content was intentionally deleted.

If this repo is later compared against an earlier git-tracked state, git may show deletions for old root-level guide files and old root-level knowledge folders. Those should be treated as moves into `SALESFORCE_KNOWLEDGE/`, not content loss.

## 5. Suggested Commit Message

```text
Reorganize repo into Codex-ready Salesforce workspace engine
```

Alternative:

```text
Reorganize repo into Codex-ready Salesforce coding engine
```

## 6. Suggested Release Note Text

```markdown
## Codex-Ready Salesforce Workspace Engine

This release reorganizes the repository into a Codex-ready Salesforce coding engine for use with real Salesforce DX projects.

Highlights:

- Adds `START_HERE.md` as the first-read guide for Codex and users.
- Adds `INSTRUCTIONS/` with Codex rules, workflow, project placement, output, Memory, History, and repo map guidance.
- Adds `FORCE_APP_DIRECTORY/` as the placeholder or pointer location for the user's real Salesforce DX project.
- Reorganizes Salesforce guides, topics, patterns, prompts, checklists, examples, references, and docs under `SALESFORCE_KNOWLEDGE/`.
- Adds a Codex prompt pack and strict Codex engine checklist pack.
- Adds `MEMORY/` and `HISTORY/` systems for reusable lessons and chronological task records.
- Adds `WIKI_DRAFTS/` source pages for a future GitHub Wiki.
- Adds public-safety, link/path, final polish, and GitHub update review reports under `WORKSPACE/`.

Codex must locate the real `force-app/main/default` folder before editing Salesforce metadata. This repo does not include private Salesforce metadata, credentials, org IDs, private logs, or customer data by default.
```

## 7. Manual Checks Before Pushing

- [ ] Confirm the final GitHub repository owner/name used in README badge and release links.
- [ ] Decide whether `WORKSPACE/` audit and planning reports should be included in the public release.
- [ ] If this folder should be a git repo, initialize or restore `.git` before committing.
- [ ] Run `git status --short` after git metadata is available.
- [ ] Review the git diff for unexpected deletes after git metadata is available.
- [ ] Confirm `FORCE_APP_DIRECTORY/` contains only placeholder/instruction files unless real metadata is intentionally public.
- [ ] Re-run public-safety scans after any real Salesforce DX project is added.
- [ ] Confirm no credentials, tokens, org IDs, deploy IDs, private emails, private screenshots, private logs, or local-only paths are present.
- [ ] Confirm Markdown links still pass after any final edits.
- [ ] Confirm GitHub renders Mermaid diagrams in README, instruction docs, and wiki drafts.
- [ ] Run GitHub secret scanning after push or before making the repository public.
- [ ] Copy selected `WIKI_DRAFTS/` pages into the GitHub Wiki only after final owner review.

## 8. Temporary Folder Extraction Status

Temporary reference content was fully reviewed for useful generic public-safe ideas.

Useful ideas were extracted into permanent repo docs, including:

- documentation governance,
- project discovery guidance,
- public-safe extraction rules,
- prompt/checklist improvements,
- Memory and History operating behavior.

Private or source-specific material was not copied.

The repo is safe if the temporary reference folder is deleted.

## 9. Temporary Folder Dependency Confirmation

Final docs do not depend on the temporary local reference folder used during preparation.

No final public doc should link to, depend on, or mention that temporary local folder by name or path.

That folder may be deleted before GitHub push without breaking repo documentation.

## Push Status

No push was performed.

Wait for explicit owner approval before running any git push command.
