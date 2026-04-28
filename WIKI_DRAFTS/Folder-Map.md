# Folder Map

This page maps the repo folders and how Codex should use them.

## Root Structure

```text
.
|-- START_HERE.md
|-- README.md
|-- INSTRUCTIONS/
|-- FORCE_APP_DIRECTORY/
|-- SALESFORCE_KNOWLEDGE/
|-- TOOLS/
|-- QUALITY_GATES/
|-- AUTOMATION/
|-- VENDOR_REFERENCES/
|-- .github/
|   `-- workflows/
|-- MEMORY/
|-- HISTORY/
|-- WORKSPACE/
|-- ARCHIVE/
|-- WIKI_DRAFTS/
|-- LICENSE
|-- SECURITY.md
|-- CONTRIBUTING.md
|-- PUBLIC_REPO_REVIEW_CHECKLIST.md
`-- SOURCE_MAPPING.md
```

## Folder Responsibilities

| Folder | Purpose |
| --- | --- |
| `INSTRUCTIONS/` | Mandatory Codex operating rules. |
| `FORCE_APP_DIRECTORY/` | Placeholder where users place or reference the real Salesforce DX project. |
| `SALESFORCE_KNOWLEDGE/` | Salesforce guides, topics, patterns, prompts, checklists, examples, references, and docs. |
| `TOOLS/` | Optional tooling guides for static analysis, LWC Jest, LWC lint, mobile lint, Apex formatting, and external references. |
| `QUALITY_GATES/` | Validation gates Codex should run or recommend after Salesforce source changes. |
| `AUTOMATION/` | Public-safe local scripts for project discovery, quality checks, and safety scans. |
| `VENDOR_REFERENCES/` | Optional external repo clone scripts, attribution notes, and no-vendoring rules. |
| `.github/workflows/` | Public-safe GitHub Actions for Markdown links, public safety, and Salesforce Code Analyzer. |
| `MEMORY/` | Reusable knowledge for future Codex sessions. |
| `HISTORY/` | Chronological logs of tasks, tests, deploys, and larger changes. |
| `WORKSPACE/` | Active audits, plans, summaries, and working notes. |
| `ARCHIVE/` | Old fixes and archived materials. |
| `WIKI_DRAFTS/` | Source drafts for GitHub Wiki pages. |

## Salesforce Knowledge Structure

```text
SALESFORCE_KNOWLEDGE/
|-- INDEX.md
|-- GUIDES/
|-- TOPICS/
|-- PATTERNS/
|   |-- good_patterns/
|   `-- anti_patterns/
|-- PROMPTS/
|-- CHECKLISTS/
|-- EXAMPLES/
|-- REFERENCE/
`-- DOCS/
```

## What Should Stay Out Of Deploys

Never deploy these helper folders to Salesforce:

- `INSTRUCTIONS/`
- `SALESFORCE_KNOWLEDGE/`
- `TOOLS/`
- `QUALITY_GATES/`
- `AUTOMATION/`
- `VENDOR_REFERENCES/`
- `.github/`
- `MEMORY/`
- `HISTORY/`
- `WORKSPACE/`
- `ARCHIVE/`
- `WIKI_DRAFTS/`

Only deploy validated metadata from the real Salesforce DX project under `force-app/main/default`.
