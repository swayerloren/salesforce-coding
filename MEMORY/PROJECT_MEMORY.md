# Project Memory

## Repo Structure

- This repo is a Codex-ready Salesforce coding engine, not automatically the user's Salesforce DX project.
- Salesforce knowledge lives under `SALESFORCE_KNOWLEDGE/`.
- The user's real Salesforce DX project should live under `FORCE_APP_DIRECTORY/` or be externally referenced there.
- Codex must locate a real `force-app/main/default` folder before editing Salesforce source.
- `FORCE_APP_DIRECTORY/` is placeholder-only until the user adds or references a real Salesforce DX project; do not create placeholder deployable Apex, LWC, object, layout, or metadata files there.
- Root `README.md` now presents the repo as a Codex-ready Salesforce coding engine/helper, with setup flow, project placement, knowledge map, memory/history behavior, and safety rules.
- `SALESFORCE_KNOWLEDGE/INDEX.md` is the master Salesforce knowledge map and includes the task-specific reading map Codex should use before Salesforce edits.

## Codex Operating Rules

- Codex must read `START_HERE.md` and `INSTRUCTIONS/` before task work.
- Codex must inspect existing files before editing.
- Codex must not guess Salesforce object, field, metadata, permission, profile, record type, Apex method, or component names.
- Codex must make the smallest safe change and avoid unrelated edits.
- Meaningful work should update `MEMORY/PROJECT_MEMORY.md` and `HISTORY/TASK_HISTORY.md`.
- Specialized memory files now exist for reusable fix patterns, failure prevention rules, architecture decisions, stable project notes, and verified org patterns.
- Specialized history files now exist for Codex run logs, deployment logs, test result logs, and larger completed change archives.
- Documentation governance now lives at `SALESFORCE_KNOWLEDGE/DOCS/documentation-governance.md`; it defines source authority, documentation precedence, conflict handling, duplicate handling, and update placement.
- Project discovery support now lives at `SALESFORCE_KNOWLEDGE/REFERENCE/project-discovery-template.md` and `SALESFORCE_KNOWLEDGE/CHECKLISTS/project-discovery.md`; use it before broad or unfamiliar Salesforce DX project work.
- Public docs must not depend on temporary reference folders. Useful lessons from temporary material should be generalized into public-safe rules, templates, checklists, memory, or history.
- `WIKI_DRAFTS/` stores Markdown source drafts that the repo owner can copy into the GitHub Wiki. These pages explain the same operating model as the repo: users provide a real Salesforce DX project, Codex locates `force-app/main/default`, reads `INSTRUCTIONS/` and `SALESFORCE_KNOWLEDGE/`, then makes narrow validated changes.
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/` stores complete copy-paste-ready Codex prompts for common Salesforce task types. Every prompt reinforces the required workflow: read `START_HERE.md`, read `INSTRUCTIONS/`, locate the real project, read `SALESFORCE_KNOWLEDGE/INDEX.md`, inspect real `force-app/main/default` files, make the smallest safe fix, avoid private data, return complete updated files when code changes, and update `MEMORY/` and `HISTORY/`.
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/` stores strict preflight checklists for Codex tasks, Apex edits, LWC edits, metadata edits, deployment, GitHub push readiness, and public repo safety.
- Path/link consistency review on 2026-04-27 updated stale release-note and wiki guide references to the `SALESFORCE_KNOWLEDGE/` structure. Historical old-path references remain only in workspace audit context or as valid relative links inside `SALESFORCE_KNOWLEDGE/`.
- Public release safety review on 2026-04-27 found no blocking credentials, tokens, org IDs, private data, local-only path dependencies, temporary-folder dependencies, screenshots, private logs, or accidental real Salesforce metadata in `FORCE_APP_DIRECTORY/`. Owner should still confirm the final README badge/release repository URL and whether `WORKSPACE/` audit reports should be published.
- Final polish pass on 2026-04-27 standardized public docs around the terms Codex-ready Salesforce coding engine, Salesforce DX project, `force-app/main/default`, Salesforce knowledge base, Memory, History, real project metadata, and public-safe.
- GitHub update planning on 2026-04-27 found this working folder is not currently a git repository. `WORKSPACE/GITHUB_UPDATE_PLAN.md` records suggested commit/release text, moved/added/changed file groups, manual checks, and confirms no push was performed.
- New-user usability review on 2026-04-27 found the repo understandable for a brand-new user. Prompt visibility was improved by adding common-task prompt tables to `README.md` and `START_HERE.md`, prompt shortcuts to `SALESFORCE_KNOWLEDGE/INDEX.md`, and common starting points to `WIKI_DRAFTS/Home.md`.
- Final push readiness verification on 2026-04-27 passed and is recorded in `WORKSPACE/PUSH_READY_REPORT.md`. The report marks the repo `READY TO PUSH`, with remaining manual checks for final GitHub URL, workspace publishing intent, Mermaid rendering, and GitHub secret scanning.
