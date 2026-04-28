# Changelog

All notable changes to this project are documented here.

This project follows semantic versioning for documentation releases:

- Patch versions, such as `v1.0.1`, are for typo fixes, broken links, clarifications, and small corrections.
- Minor versions, such as `v1.3.0`, are for new guide sections, examples, prompts, checklists, tooling guides, quality gates, automation, external intelligence maps, or other backward-compatible workspace features.
- Major versions, such as `v2.0.0`, are reserved for major reorganizations or incompatible changes to the repo structure.

## v1.3.0 - 2026-04-28

External Salesforce tooling intelligence release.

Commit: `c15aa299ee8312a46813e2fa8e1811c2014b027f`

Added:

- `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/` with original strategy maps distilled from public Salesforce tooling and reference repos.
- `SALESFORCE_KNOWLEDGE/COMMANDS/` with Salesforce CLI, npm script, LWC test, Apex validation, and GitHub Action command maps.
- `SALESFORCE_KNOWLEDGE/PARAMETERS/` with Code Analyzer, LWC Jest, ESLint LWC, Prettier Apex, and local automation option maps.
- `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/` with Apex, LWC, metadata, mobile, deployment, and pull request quality strategies.
- `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/` with ordered flows for Apex, LWC, metadata, deployment, and pre-release work.
- Workspace strategy and implementation reports for the external intelligence integration.

Changed:

- Updated `README.md`, `START_HERE.md`, and `SALESFORCE_KNOWLEDGE/INDEX.md` to route Codex through the new intelligence layers.
- Updated `TOOLS/`, `QUALITY_GATES/`, `AUTOMATION/`, and `VENDOR_REFERENCES/` routing docs.
- Updated `INSTRUCTIONS/` so Codex uses command maps, parameter maps, quality strategies, and validation flows before selecting validation steps.
- Updated Codex prompt pack files for Apex, LWC, Apex tests, deployment failures, metadata, and GitHub push review.
- Updated Codex checklist pack files so skipped gates, missing tools, and validation evidence are explicit.
- Updated Memory and History with the external intelligence integration behavior.

Validation:

- Markdown local link checks passed across 219 Markdown files for the implementation commit.
- Public-safety scans for credentials, tokens, session patterns, Salesforce org ID-shaped values, local-only paths, and temporary-folder references passed.
- No external repo trees, copied source files, `.git` folders, or `node_modules` were added.
- No credentials, tokens, local-only paths, or Salesforce org IDs were copied into public docs.
- `git diff --check` passed.

## v1.2.0 - 2026-04-28

Salesforce tooling references and Codex quality gates release.

Commit: `3f321c1f7316eb35ecb44dee6c17f49999b68308`

Added:

- `TOOLS/` for optional Salesforce Code Analyzer, LWC Jest, LWC ESLint, mobile lint, Prettier Apex, install, registry, and external reference guidance.
- `QUALITY_GATES/` for Code Analyzer, LWC lint, Apex formatting, testing, release, and public-safety validation expectations.
- `QUALITY_GATES/examples/` with inactive example config drafts for LWC quality scripts, ESLint, Jest, Prettier Apex, and Apex test commands.
- `AUTOMATION/` with PowerShell and Bash scripts for Salesforce DX project discovery and local quality checks.
- `.github/workflows/` drafts for Markdown link checking, public-safety scanning, and Salesforce Code Analyzer.
- `VENDOR_REFERENCES/` for optional local external repo clone scripts, source maps, license notes, and no-vendoring rules.
- External Apex Recipes and LWC Recipes reference maps under `SALESFORCE_KNOWLEDGE/REFERENCE/`.
- Focused metadata topic guidance under `SALESFORCE_KNOWLEDGE/TOPICS/metadata/README.md`.
- Workspace audit and external repo analysis reports for the tooling integration.

Changed:

- Updated `README.md` and `START_HERE.md` to route users and Codex through tooling, quality gates, automation, and vendor reference guidance.
- Updated `INSTRUCTIONS/` so Codex checks available quality gates after Salesforce source changes.
- Updated `SALESFORCE_KNOWLEDGE/INDEX.md` to map Apex, LWC, mobile, metadata, deployment, and testing tasks to the new tools and gates.
- Strengthened Apex, LWC, metadata, mobile, record-page, and testing guides with validation expectations.
- Updated Codex prompt pack files so Codex does not claim tests, linting, formatting, or static analysis passed unless commands actually ran and passed.
- Updated Codex engine checklists for Apex, metadata, and GitHub push safety.
- Updated wiki drafts to describe tooling, quality gates, automation, and optional vendor references.
- Updated Memory and History with the new tooling and validation behavior.

Validation:

- Markdown local link/path checks passed.
- Local quality check passed in allow-missing-project mode.
- Public-safety scans for credentials, private keys, session patterns, Salesforce org ID-shaped values, local-only paths, and temporary-folder references passed.
- No external repo clone directories were copied into the main repo.
- `VENDOR_REFERENCES/_external/`, `temp/`, and `*.local.md` are ignored.
- `FORCE_APP_DIRECTORY/` contains only placeholder and instruction files.
- `git diff --check` passed.

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
