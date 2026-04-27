# Salesforce Knowledge Base

This folder is the Salesforce knowledge base for the Codex-ready Salesforce coding engine.

Codex must read the relevant parts of this folder before editing Apex, LWC, Aura, Visualforce, metadata, tests, deployment files, Salesforce Files, or mobile behavior.

Start with [INDEX.md](INDEX.md).

## What Lives Here

| Folder | Purpose |
| --- | --- |
| [GUIDES/](GUIDES/) | Broad Salesforce platform guidance. |
| [TOPICS/](TOPICS/) | Focused notes by task area. |
| [PATTERNS/](PATTERNS/) | Good patterns and anti-patterns. |
| [PROMPTS/](PROMPTS/) | Reusable Codex prompts. |
| [CHECKLISTS/](CHECKLISTS/) | Preflight and review checklists. |
| [EXAMPLES/](EXAMPLES/) | Public-safe Apex, LWC, and metadata examples. |
| [REFERENCE/](REFERENCE/) | Glossary, CLI reference, lesson catalog, and project discovery templates. |
| [DOCS/](DOCS/) | Documentation governance, engineering principles, and public-safety policy. |

## How Codex Should Use This Folder

1. Read [INDEX.md](INDEX.md).
2. Choose the task-specific guides and topic folders.
3. Inspect the real Salesforce DX project under `force-app/main/default`.
4. Verify object, field, metadata, permission, profile, record type, component, and Apex names in real project metadata.
5. Apply the smallest safe fix.
6. Update Memory and History after meaningful work.

## Useful Support Docs

| Document | Use |
| --- | --- |
| [DOCS/documentation-governance.md](DOCS/documentation-governance.md) | Documentation precedence, conflict handling, and placement rules. |
| [DOCS/public-sanitization-policy.md](DOCS/public-sanitization-policy.md) | Public-safe documentation and release safety. |
| [REFERENCE/project-discovery-template.md](REFERENCE/project-discovery-template.md) | Template for mapping an unfamiliar real Salesforce DX project. |
| [CHECKLISTS/project-discovery.md](CHECKLISTS/project-discovery.md) | Checklist for broad project discovery. |

## Boundary

The files here are guidance and public-safe examples. They are not automatically the user's live Salesforce source. Codex must locate the real `force-app/main/default` folder before editing deployable metadata.
