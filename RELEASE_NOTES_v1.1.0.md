# Codex-Ready Salesforce Workspace Engine v1.1.0

Release date: 2026-04-27

Commit: `f973f5bbe555f0ec5bb0e9ebe0365000b82ba9ac`

## Summary

`v1.1.0` reorganizes the repo into a Codex-ready Salesforce workspace engine.

The repo is now structured for users who download it, open it in VS Code with Codex, place or reference a real Salesforce DX project, and have Codex read instructions and the Salesforce knowledge base before editing real project metadata under `force-app/main/default`.

This is a minor release because it is a major documentation/workspace improvement without a packaged API, runtime package, or Salesforce metadata API contract. Users who linked directly to old root-level knowledge paths should update those links using the migration notes below.

## What Changed

- Added a clear first-read flow through `START_HERE.md`.
- Added a full Codex instruction system under `INSTRUCTIONS/`.
- Added `FORCE_APP_DIRECTORY/` as the placeholder or pointer location for a real Salesforce DX project.
- Reorganized Salesforce knowledge assets under `SALESFORCE_KNOWLEDGE/`.
- Added `MEMORY/` for reusable lessons and stable facts.
- Added `HISTORY/` for chronological task, deployment, test, and change records.
- Added `WORKSPACE/` for audits, release checks, and working reports.
- Added `WIKI_DRAFTS/` with public-safe GitHub Wiki source pages.
- Added `ARCHIVE/` for superseded public-safe material.
- Added a stronger Codex prompt pack and strict checklist pack.
- Updated public-safety and push-readiness reports.

## New Root Structure

```text
.
|-- README.md
|-- START_HERE.md
|-- INSTRUCTIONS/
|-- FORCE_APP_DIRECTORY/
|-- SALESFORCE_KNOWLEDGE/
|-- MEMORY/
|-- HISTORY/
|-- WORKSPACE/
|-- WIKI_DRAFTS/
|-- ARCHIVE/
|-- LICENSE
|-- SECURITY.md
|-- CONTRIBUTING.md
|-- CONTRIBUTING_GUIDELINES.md
|-- CODE_OF_CONDUCT.md
|-- CHANGELOG.md
|-- RELEASES.md
|-- RELEASE_NOTES_v1.0.0.md
|-- RELEASE_NOTES_v1.1.0.md
|-- PUBLIC_REPO_REVIEW_CHECKLIST.md
|-- SOURCE_MAPPING.md
|-- .gitattributes
`-- .gitignore
```

## Moved Salesforce Knowledge Assets

Salesforce-specific knowledge now lives under `SALESFORCE_KNOWLEDGE/`.

| Old root location | New location |
| --- | --- |
| `INDEX.md` | `SALESFORCE_KNOWLEDGE/INDEX.md` |
| `SALESFORCE_*.md` guide files | `SALESFORCE_KNOWLEDGE/GUIDES/` |
| `apex/` | `SALESFORCE_KNOWLEDGE/TOPICS/apex/` |
| `aura/` | `SALESFORCE_KNOWLEDGE/TOPICS/aura/` |
| `deployment/` | `SALESFORCE_KNOWLEDGE/TOPICS/deployment/` |
| `lwc/` | `SALESFORCE_KNOWLEDGE/TOPICS/lwc/` |
| `metadata/` | `SALESFORCE_KNOWLEDGE/TOPICS/metadata/` |
| `mobile/` | `SALESFORCE_KNOWLEDGE/TOPICS/mobile/` |
| `testing/` | `SALESFORCE_KNOWLEDGE/TOPICS/testing/` |
| `troubleshooting/` | `SALESFORCE_KNOWLEDGE/TOPICS/troubleshooting/` |
| `visualforce/` | `SALESFORCE_KNOWLEDGE/TOPICS/visualforce/` |
| `patterns/` | `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/` |
| `anti_patterns/` | `SALESFORCE_KNOWLEDGE/PATTERNS/anti_patterns/` |
| `prompts/` | `SALESFORCE_KNOWLEDGE/PROMPTS/` |
| `checklists/` | `SALESFORCE_KNOWLEDGE/CHECKLISTS/` |
| `examples/` | `SALESFORCE_KNOWLEDGE/EXAMPLES/` |
| `reference/` | `SALESFORCE_KNOWLEDGE/REFERENCE/` |
| `docs/` | `SALESFORCE_KNOWLEDGE/DOCS/` |

## New Codex Instruction System

`INSTRUCTIONS/` now contains:

| File | Purpose |
| --- | --- |
| `CODEX_RULES.md` | Non-negotiable rules before every task. |
| `DEVELOPMENT_WORKFLOW.md` | Intake-to-result workflow for Salesforce work. |
| `SALESFORCE_PROJECT_PLACEMENT.md` | Where users place or reference the real Salesforce DX project. |
| `MEMORY_AND_HISTORY_RULES.md` | How Codex records reusable lessons and task history. |
| `OUTPUT_FORMAT_RULES.md` | Required final response format. |
| `REPO_MAP.md` | Clean map of the repo structure. |

Codex must read `START_HERE.md`, then `INSTRUCTIONS/`, then locate the real `force-app/main/default` folder before editing Salesforce source.

## New `FORCE_APP_DIRECTORY/` Placement Workflow

`FORCE_APP_DIRECTORY/` is now the explicit place where users can:

1. Copy a real Salesforce DX project into the repo, or
2. Document an external Salesforce DX project path in `FORCE_APP_DIRECTORY/README.md`.

Codex must locate and confirm:

```text
force-app/main/default/
```

before editing real project metadata.

`FORCE_APP_DIRECTORY/` contains only placeholder and instruction files by default.

## New Memory And History Systems

`MEMORY/` stores reusable knowledge Codex should remember:

- stable repo facts,
- reusable fix patterns,
- failure prevention rules,
- decisions,
- verified project patterns.

`HISTORY/` stores chronological records:

- Codex run logs,
- deployment logs,
- test results,
- task history,
- larger change archive entries.

Both systems are public-safe templates and records. They must not contain credentials, private org data, private logs, or local-only paths.

## New `WIKI_DRAFTS/`

`WIKI_DRAFTS/` contains source Markdown pages the repo owner can copy into the GitHub Wiki.

The drafts cover:

- installation,
- Codex startup workflow,
- recommended project structure,
- task-specific guides for Apex, LWC, Aura, Visualforce, metadata, testing, deployment, and common failures,
- Memory and History,
- folder map,
- prompt library,
- contributing and safety rules.

## New Prompt Pack

The new prompt pack lives at:

```text
SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/
```

It includes copy-ready prompts for:

- starting a new Salesforce task,
- fixing LWC,
- fixing Apex,
- fixing Apex tests,
- fixing deployment failures,
- fixing metadata or record pages,
- fixing Salesforce Files behavior,
- fixing mobile Salesforce issues,
- reviewing before a GitHub push,
- reviewing Memory and History.

## New Checklist Pack

The new checklist pack lives at:

```text
SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/
```

It includes strict checklists for:

- every Codex task,
- Apex edits,
- LWC edits,
- metadata edits,
- deployment,
- GitHub push readiness,
- public repository safety.

## Public Safety Checks

This release was reviewed for:

- credentials,
- API tokens,
- session IDs,
- Salesforce org IDs,
- private customer data,
- private emails,
- local-only paths,
- temporary folder references,
- private screenshots,
- private deploy logs,
- accidental real Salesforce metadata in `FORCE_APP_DIRECTORY/`.

No blocking public-safety issues were found.

## Upgrade Notes From v1.0.0

If you used v1.0.0, update old root-level documentation links to the new `SALESFORCE_KNOWLEDGE/` paths.

Common updates:

```text
SALESFORCE_APEX_GUIDE.md
```

becomes:

```text
SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md
```

```text
lwc/template-rules.md
```

becomes:

```text
SALESFORCE_KNOWLEDGE/TOPICS/lwc/template-rules.md
```

```text
prompts/fix-lwc-safely.md
```

becomes:

```text
SALESFORCE_KNOWLEDGE/PROMPTS/fix-lwc-safely.md
```

Start new sessions by reading:

1. `START_HERE.md`
2. `INSTRUCTIONS/`
3. `FORCE_APP_DIRECTORY/README.md`
4. `SALESFORCE_KNOWLEDGE/INDEX.md`

## Migration Notes

The old root knowledge layout has been removed from root.

Old root folders such as `apex/`, `lwc/`, `metadata/`, `deployment/`, `testing/`, `troubleshooting/`, `prompts/`, and `checklists/` are now nested under `SALESFORCE_KNOWLEDGE/`.

Old root `SALESFORCE_*.md` guide files are now under:

```text
SALESFORCE_KNOWLEDGE/GUIDES/
```

Use `SALESFORCE_KNOWLEDGE/INDEX.md` as the master map.

## Validation Performed

Validation completed before release documentation update:

- Mirrored the finished source into the real GitHub clone while preserving `.git`.
- Verified old root-level Salesforce knowledge files and folders were deleted.
- Verified moved assets exist under `SALESFORCE_KNOWLEDGE/`.
- Verified `FORCE_APP_DIRECTORY/` contains only placeholder and instruction files.
- Ran Markdown link checks.
- Ran temporary-folder reference scans.
- Ran credential-like assignment scans.
- Ran Salesforce ID-shaped value scans.
- Confirmed commit `f973f5bbe555f0ec5bb0e9ebe0365000b82ba9ac` was pushed to `origin/main`.

## Known Notes / Owner Review

- Create or update the GitHub Release page for `v1.1.0` manually if GitHub Releases does not automatically use this Markdown file.
- Confirm the GitHub Release tag points to commit `f973f5bbe555f0ec5bb0e9ebe0365000b82ba9ac`.
- Confirm GitHub renders Mermaid diagrams in README, instruction docs, and wiki drafts.
- Run GitHub secret scanning after release publication.
