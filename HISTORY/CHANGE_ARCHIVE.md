# Change Archive

## Purpose

`CHANGE_ARCHIVE.md` summarizes larger completed changes after they are finished.

Use this file for completed repo restructures, major feature work, large Salesforce fixes, broad documentation updates, or multi-file changes that future readers may need to understand at a high level.

This is history, not current operating instruction.

## When Codex Should Update It

Update this file when:

- a larger change spans multiple files or folders,
- a restructure is completed,
- a major Salesforce feature/fix is completed,
- a substantial documentation wave is completed,
- a set of related smaller changes should be summarized together.

Do not use this for every small edit. Use `HISTORY/CODEX_RUN_LOG.md` for normal task logs.

## Entry Template

```markdown
## YYYY-MM-DD - <Completed Change Name>

- Date:
- Summary:
- Scope:
- Key files or folders:
- Validation:
- Outcome:
- Follow-up:
```

## Example Entry

```markdown
## 2026-04-27 - Salesforce Knowledge Restructure

- Date: 2026-04-27
- Summary: Moved Salesforce guides, topics, prompts, patterns, examples, references, and support docs under `SALESFORCE_KNOWLEDGE/`.
- Scope: Repository documentation structure only.
- Key files or folders: `SALESFORCE_KNOWLEDGE/GUIDES/`, `SALESFORCE_KNOWLEDGE/TOPICS/`, `SALESFORCE_KNOWLEDGE/INDEX.md`, `README.md`
- Validation: Confirmed moved paths exist and old root knowledge paths were cleared.
- Outcome: Root now stays focused on setup, instructions, contribution, release, and public safety.
- Follow-up: Continue updating internal links if deeper docs are moved again.
```

## 2026-04-27 - Memory And History System

- Date: 2026-04-27
- Summary: Added specialized memory files for reusable knowledge and specialized history files for chronological Codex records.
- Scope: Repository operating system documentation only.
- Key files or folders: `MEMORY/`, `HISTORY/`, `INSTRUCTIONS/MEMORY_AND_HISTORY_RULES.md`
- Validation: Confirmed required files exist, required sections are present, and examples remain generic/public-safe.
- Outcome: Future Codex sessions have clear places to record fix patterns, failure prevention rules, decisions, org patterns, run logs, deployments, tests, and larger changes.
- Follow-up: Populate project-specific org patterns only after verifying names in a real Salesforce DX project.

## 2026-04-27 - Public-Safe Temporary Reference Extraction

- Date: 2026-04-27
- Summary: Extracted generic documentation governance and project discovery patterns from temporary reference material into permanent public-safe repo docs.
- Scope: Knowledge base, instructions, workspace summary, and memory/history records.
- Key files or folders: `SALESFORCE_KNOWLEDGE/DOCS/documentation-governance.md`, `SALESFORCE_KNOWLEDGE/REFERENCE/project-discovery-template.md`, `SALESFORCE_KNOWLEDGE/CHECKLISTS/project-discovery.md`, `WORKSPACE/TEMP_REFERENCE_EXTRACTION_SUMMARY.md`
- Validation: Searched final public docs for local temporary-folder references and source-specific provider names; verified updated knowledge index links.
- Outcome: The repo preserves useful generic guidance and remains safe if the temporary reference folder is deleted.
- Follow-up: Use the project discovery template only after locating and inspecting a real Salesforce DX project.

## 2026-04-27 - GitHub Wiki Draft Source

- Date: 2026-04-27
- Summary: Added `WIKI_DRAFTS/` with source Markdown pages for the future GitHub Wiki.
- Scope: Public documentation draft source only.
- Key files or folders: `WIKI_DRAFTS/`
- Validation: Confirmed all requested pages exist, checked draft links, and searched for local paths, temporary-folder references, and private-data patterns.
- Outcome: The repo owner has wiki-ready draft pages describing installation, Codex workflow, Salesforce task guides, prompt library, memory/history, folder map, and safety rules.
- Follow-up: Copy these drafts into the GitHub Wiki when ready.

## 2026-04-27 - Codex Prompt Pack

- Date: 2026-04-27
- Summary: Added a dedicated copy-paste prompt pack for common Salesforce Codex tasks.
- Scope: Salesforce knowledge prompt library and supporting memory/history records.
- Key files or folders: `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/`, `SALESFORCE_KNOWLEDGE/PROMPTS/README.md`, `SALESFORCE_KNOWLEDGE/INDEX.md`
- Validation: Confirmed all requested prompt files exist, required workflow wording is present, links resolve, and unsafe local/private references are absent.
- Outcome: Users can start Codex with task-specific prompts that reinforce project location, knowledge reading, source inspection, narrow fixes, validation, output expectations, privacy, and memory/history updates.
- Follow-up: Keep the prompt pack in sync when required Codex operating rules change.

## 2026-04-27 - Codex Engine Checklist Pack

- Date: 2026-04-27
- Summary: Added strict checklist gates for Codex tasks, Salesforce edits, deployment, GitHub push readiness, and public repo safety.
- Scope: Salesforce knowledge checklist library and supporting memory/history records.
- Key files or folders: `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/`, `SALESFORCE_KNOWLEDGE/CHECKLISTS/README.md`, `SALESFORCE_KNOWLEDGE/INDEX.md`
- Validation: Confirmed requested checklist files exist, required content is present, links resolve, and unsafe local/private references are absent.
- Outcome: Codex and repo maintainers have stricter preflight gates for safe Salesforce work and public publishing.
- Follow-up: Keep checklist gates aligned with future instruction changes and public-safety policy updates.

## 2026-04-27 - Link And Path Consistency Pass

- Date: 2026-04-27
- Summary: Updated stale public documentation references after the Salesforce knowledge restructure and documented the link/path review.
- Scope: Release notes, wiki draft, workspace review report, and memory/history records.
- Key files or folders: `RELEASE_NOTES_v1.0.0.md`, `WIKI_DRAFTS/Common-Failures-Codex-Must-Check.md`, `WORKSPACE/LINK_AND_PATH_REVIEW.md`
- Validation: Scanned repo-local Markdown/config text files, checked Markdown links, and searched for temporary/local path references.
- Outcome: Public-facing docs point to the current `SALESFORCE_KNOWLEDGE/` structure; historical old-path mentions remain only as audit context.
- Follow-up: Rerun link checks after future file moves.

## 2026-04-27 - Public GitHub Release Safety Review

- Date: 2026-04-27
- Summary: Completed a strict public-release safety review and documented findings in `WORKSPACE/PUBLIC_RELEASE_REVIEW.md`.
- Scope: Full repo safety and documentation accuracy review.
- Key files or folders: `WORKSPACE/PUBLIC_RELEASE_REVIEW.md`, `README.md`, `START_HERE.md`, `INSTRUCTIONS/`, `SALESFORCE_KNOWLEDGE/`, `WIKI_DRAFTS/`, `FORCE_APP_DIRECTORY/`, `MEMORY/`, `HISTORY/`
- Validation: Scanned for credentials, tokens, session IDs, Salesforce IDs, private emails, local paths, temporary-folder references, private screenshots, private logs, export files, and accidental real metadata in `FORCE_APP_DIRECTORY/`; Markdown links passed.
- Outcome: No blocking unsafe public-release content was found.
- Follow-up: Owner should confirm final README badge/release repository URLs and decide whether `WORKSPACE/` audit reports should be published.

## 2026-04-27 - Final Documentation Polish

- Date: 2026-04-27
- Summary: Polished the main public-facing docs for GitHub readability, consistent terminology, and clearer Codex operation.
- Scope: Root README, start guide, instruction docs, project placement docs, Salesforce knowledge entry points, Memory/History readmes, wiki drafts, prompt/checklist wording, and workspace summary.
- Key files or folders: `README.md`, `START_HERE.md`, `INSTRUCTIONS/`, `FORCE_APP_DIRECTORY/`, `SALESFORCE_KNOWLEDGE/README.md`, `SALESFORCE_KNOWLEDGE/INDEX.md`, `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/`, `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/`, `MEMORY/`, `HISTORY/`, `WIKI_DRAFTS/`, `WORKSPACE/FINAL_POLISH_SUMMARY.md`
- Validation: Markdown links passed; local-only and temporary-folder reference scan passed for final public docs; avoid-list terminology was checked.
- Outcome: The repo now presents more clearly as a Codex-ready Salesforce coding engine for real Salesforce DX projects.
- Follow-up: Confirm final GitHub repo badge URLs and Mermaid rendering before push.
