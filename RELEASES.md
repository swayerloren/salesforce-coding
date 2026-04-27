# Releases

## Release Strategy

This repository uses semantic versioning for public documentation and workspace-engine releases.

| Version type | Use for |
| --- | --- |
| Patch | Typo fixes, broken links, small clarifications, and public-safety corrections. |
| Minor | New guides, examples, prompts, checklists, workspace features, or non-breaking structure improvements. |
| Major | Incompatible repository layout changes that make normal usage patterns obsolete. |

## Latest Release

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

## Previous Releases

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
