# Repo Map

This is the clean map for the Codex-ready Salesforce coding engine.

## Root Structure

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

## Folder Purpose

| Path | Purpose |
| --- | --- |
| `README.md` | GitHub landing page and quick setup guide. |
| `START_HERE.md` | First file Codex must read. |
| `INSTRUCTIONS/` | Required operating rules and workflow. |
| `FORCE_APP_DIRECTORY/` | Placeholder or pointer for the real Salesforce DX project. |
| `SALESFORCE_KNOWLEDGE/` | Salesforce knowledge base. |
| `MEMORY/` | Durable lessons and stable facts. |
| `HISTORY/` | Chronological records of meaningful work. |
| `WORKSPACE/` | Current audits, plans, and working notes. |
| `WIKI_DRAFTS/` | Public-safe GitHub Wiki source drafts. |
| `ARCHIVE/` | Superseded public-safe material. |

## Instruction Files

```text
INSTRUCTIONS/
|-- README.md
|-- CODEX_RULES.md
|-- DEVELOPMENT_WORKFLOW.md
|-- SALESFORCE_PROJECT_PLACEMENT.md
|-- MEMORY_AND_HISTORY_RULES.md
|-- OUTPUT_FORMAT_RULES.md
`-- REPO_MAP.md
```

| File | Purpose |
| --- | --- |
| `CODEX_RULES.md` | Non-negotiable Codex task rules. |
| `DEVELOPMENT_WORKFLOW.md` | Intake-to-result workflow. |
| `SALESFORCE_PROJECT_PLACEMENT.md` | Real project placement and external path rules. |
| `MEMORY_AND_HISTORY_RULES.md` | What gets recorded after meaningful work. |
| `OUTPUT_FORMAT_RULES.md` | Required final answer content. |
| `REPO_MAP.md` | This structure map. |

## Salesforce Knowledge Base

```text
SALESFORCE_KNOWLEDGE/
|-- README.md
|-- INDEX.md
|-- GUIDES/
|-- TOPICS/
|   |-- apex/
|   |-- aura/
|   |-- deployment/
|   |-- lwc/
|   |-- metadata/
|   |-- mobile/
|   |-- testing/
|   |-- troubleshooting/
|   `-- visualforce/
|-- PATTERNS/
|   |-- good_patterns/
|   `-- anti_patterns/
|-- PROMPTS/
|   `-- CODEX_PROMPT_PACK/
|-- CHECKLISTS/
|   `-- CODEX_ENGINE_CHECKLISTS/
|-- EXAMPLES/
|-- REFERENCE/
`-- DOCS/
```

| Path | Contents |
| --- | --- |
| `GUIDES/` | Broad guidance by Salesforce platform area. |
| `TOPICS/` | Focused technical notes by task area. |
| `PATTERNS/good_patterns/` | Reusable implementation patterns. |
| `PATTERNS/anti_patterns/` | Known patterns to avoid. |
| `PROMPTS/` | Reusable Codex prompts. |
| `CHECKLISTS/` | Preflight and review checklists. |
| `EXAMPLES/` | Public-safe Apex, LWC, and metadata examples. |
| `REFERENCE/` | Glossary, CLI reference, and discovery templates. |
| `DOCS/` | Governance, engineering principles, and public-safety policy. |

## Real Salesforce DX Project

The expected real project metadata path is:

```text
force-app/main/default/
```

Recommended placement:

```text
FORCE_APP_DIRECTORY/my-project/force-app/main/default/
```

Alternative placement:

```text
FORCE_APP_DIRECTORY/force-app/main/default/
```

External projects may be documented in `FORCE_APP_DIRECTORY/README.md`.

## Codex Navigation Flow

```mermaid
flowchart TD
  A[START_HERE.md] --> B[INSTRUCTIONS/]
  B --> C[FORCE_APP_DIRECTORY/]
  C --> D{Real force-app/main/default found?}
  D -- No --> E[Ask user for project path]
  D -- Yes --> F[SALESFORCE_KNOWLEDGE/INDEX.md]
  F --> G[Task-specific knowledge]
  G --> H[Inspect real project metadata]
  H --> I[Make smallest safe fix]
  I --> J[Validate if possible]
  J --> K[Update Memory and History]
  K --> L[Report result]
```
