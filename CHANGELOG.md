# Changelog

All notable changes to this project are documented here.

This project follows semantic versioning for documentation releases:

- Patch versions, such as `v1.0.1`, are for typo fixes, broken links, clarifications, and small corrections.
- Minor versions, such as `v1.1.0`, are for new guide sections, new examples, new prompts, or new checklists.
- Major versions, such as `v2.0.0`, are reserved for major reorganizations or incompatible changes to the repo structure.

## v1.1.0 - 2026-04-27

Codex-ready Salesforce workspace engine release.

Commit: `f973f5bbe555f0ec5bb0e9ebe0365000b82ba9ac`

Added:

- `START_HERE.md` as the first-read entry point for users and Codex.
- `INSTRUCTIONS/` with Codex rules, development workflow, project placement, Memory/History rules, output rules, and repo map.
- `FORCE_APP_DIRECTORY/` as the placeholder or pointer location for a real Salesforce DX project.
- `MEMORY/` and `HISTORY/` systems for reusable lessons and chronological work records.
- `WORKSPACE/` reports for audits, release checks, GitHub update planning, and push readiness.
- `WIKI_DRAFTS/` source pages for a future GitHub Wiki.
- `ARCHIVE/` for superseded public-safe material.
- Codex prompt pack under `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/`.
- Codex engine checklist pack under `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/`.

Changed:

- Reorganized Salesforce knowledge assets under `SALESFORCE_KNOWLEDGE/`.
- Moved root `SALESFORCE_*.md` guide files into `SALESFORCE_KNOWLEDGE/GUIDES/`.
- Moved old root topic folders into `SALESFORCE_KNOWLEDGE/TOPICS/`.
- Moved old root patterns, prompts, checklists, examples, references, and docs into matching `SALESFORCE_KNOWLEDGE/` subfolders.
- Updated root README and start guide to explain the Codex-ready Salesforce coding engine workflow.
- Updated public-safety and release-readiness documentation.

Removed:

- Old root-level Salesforce knowledge files and folders that were moved under `SALESFORCE_KNOWLEDGE/`.

Validation:

- Markdown links passed.
- Temporary-folder reference scans passed.
- Credential-like assignment scans passed.
- Salesforce ID-shaped scans passed.
- `FORCE_APP_DIRECTORY/` was confirmed to contain only placeholder and instruction files.

## v1.0.0 - 2026-04-18

Initial public foundation release.

Included:

- Salesforce architecture, Apex, LWC, Aura, Visualforce, metadata, record page, mobile, file handling, testing, debugging, deployment, and platform limitation guides.
- Common failures and fixes distilled from real Salesforce implementation and debug experience.
- Public-safe Apex, LWC, and metadata examples.
- Reusable Codex and AI-agent prompt library.
- Production, deployment, LWC, Apex, test, metadata, mobile, and record-page checklists.
- Source mapping and public repo review checklist documenting sanitization decisions.
