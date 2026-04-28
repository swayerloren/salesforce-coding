# Releases

## Release Strategy

This repository uses semantic versioning for public documentation and workspace-engine releases.

| Version type | Use for |
| --- | --- |
| Patch | Typo fixes, broken links, small clarifications, and public-safety corrections. |
| Minor | New guides, examples, prompts, checklists, workspace features, or non-breaking structure improvements. |
| Major | Incompatible repository layout changes that make normal usage patterns obsolete. |

## Latest Release

### v1.3.0

Release title: Salesforce Coding v1.3.0 - External Salesforce Tooling Intelligence

Release date: 2026-04-28

Commit: `c15aa299ee8312a46813e2fa8e1811c2014b027f`

Release notes: [RELEASE_NOTES_v1.3.0.md](RELEASE_NOTES_v1.3.0.md)

Release purpose:

- Integrate external Salesforce tooling and reference repo intelligence without copying or vendoring external source.
- Add `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/` strategy maps.
- Add `SALESFORCE_KNOWLEDGE/COMMANDS/` command maps.
- Add `SALESFORCE_KNOWLEDGE/PARAMETERS/` parameter maps.
- Add `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/` task-specific quality strategies.
- Add `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/` ordered Codex validation flows.
- Strengthen Codex prompt pack, checklist pack, tool routing, quality gate routing, automation routing, and vendor-reference guidance.

Expected source archive names if published from a GitHub tag:

- `salesforce-coding-v1.3.0.zip`
- `salesforce-coding-v1.3.0.tar.gz`

How to use the release ZIP:

1. Download the ZIP from the release assets or GitHub source archive.
2. Extract it.
3. Open the extracted folder in VS Code with Codex.
4. Place or reference the real Salesforce DX project through `FORCE_APP_DIRECTORY/`.
5. Tell Codex to read `START_HERE.md` before any Salesforce task.
6. Codex should then read instructions, the Salesforce knowledge index, task-specific prompts/checklists, command maps, parameter maps, quality strategies, validation flows, tools, and quality gates before editing.

## Previous Releases

### v1.2.0

Release title: Salesforce Tooling References And Codex Quality Gates

Release date: 2026-04-28

Commit: `3f321c1f7316eb35ecb44dee6c17f49999b68308`

Release notes: [RELEASE_NOTES_v1.2.0.md](RELEASE_NOTES_v1.2.0.md)

Release purpose:

- Add `TOOLS/` as the optional tooling guide layer.
- Add `QUALITY_GATES/` as the Codex validation and evidence layer.
- Add `AUTOMATION/` local validation and project-discovery scripts.
- Add `VENDOR_REFERENCES/` optional local clone guidance and no-vendoring rules.
- Add public-safe `.github/workflows/` drafts for Markdown links, public-safety scanning, and Salesforce Code Analyzer.
- Strengthen Codex prompt, checklist, wiki, and Salesforce knowledge routing around validation after code changes.

Expected source archive names if published from a GitHub tag:

- `salesforce-coding-v1.2.0.zip`
- `salesforce-coding-v1.2.0.tar.gz`

### v1.1.0

Release title: Codex-Ready Salesforce Workspace Engine

Release date: 2026-04-27

Commit: `f973f5bbe555f0ec5bb0e9ebe0365000b82ba9ac`

Release notes: [RELEASE_NOTES_v1.1.0.md](RELEASE_NOTES_v1.1.0.md)

Release purpose:

- Reorganize the repo into a Codex-ready Salesforce workspace engine.
- Add `START_HERE.md`, `INSTRUCTIONS/`, `FORCE_APP_DIRECTORY/`, `MEMORY/`, `HISTORY/`, `WORKSPACE/`, `WIKI_DRAFTS/`, and `ARCHIVE/`.
- Move Salesforce guides, topics, patterns, prompts, checklists, examples, references, and docs under `SALESFORCE_KNOWLEDGE/`.
- Make it clear how users provide a real Salesforce DX project and how Codex should operate before editing `force-app/main/default`.

Expected source archive names if published from a GitHub tag:

- `salesforce-coding-v1.1.0.zip`
- `salesforce-coding-v1.1.0.tar.gz`

### v1.0.0

Release title: Salesforce Coding v1.0.0

Release notes: [RELEASE_NOTES_v1.0.0.md](RELEASE_NOTES_v1.0.0.md)

Release purpose:

- Publish the initial public Salesforce coding knowledge base.
- Provide reusable guidance for Codex and human Salesforce developers.
- Make LWC, Apex, metadata, deployment, testing, debugging, files, mobile, Aura, Visualforce, and record-page lessons easy to find.
- Provide downloadable archives for offline use.

Release assets:

- `salesforce-coding-v1.0.0.zip`
- `salesforce-coding-v1.0.0.tar.gz`
