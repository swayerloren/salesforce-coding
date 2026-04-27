# Documentation Governance

This guide explains how Codex should treat documentation, memory, history, and source files when they overlap.

## Purpose

Use this file when:

- documentation files disagree,
- a task changes architecture or behavior,
- a task creates new guidance for future work,
- historical notes mention a fix that may no longer match current source,
- Codex needs to decide where to record new knowledge.

## Core Rule

The real Salesforce DX project is the source of truth for live behavior.

Documentation explains, routes, and preserves lessons. It does not replace source inspection.

Before editing Salesforce source, Codex must verify current behavior in the real `force-app/main/default` tree.

## Documentation Precedence

When files overlap, use this precedence order.

| Priority | Location | Authority |
| ---: | --- | --- |
| 1 | Real Salesforce DX source under `force-app/main/default/` | Current implementation and deployable metadata. |
| 2 | User instructions in the current task | Current requested scope and constraints. |
| 3 | `START_HERE.md` and `INSTRUCTIONS/` | Required Codex workflow and safety rules. |
| 4 | `SALESFORCE_KNOWLEDGE/INDEX.md` | Routing map for task-specific knowledge. |
| 5 | `SALESFORCE_KNOWLEDGE/GUIDES/` and `SALESFORCE_KNOWLEDGE/TOPICS/` | Salesforce platform guidance and focused technical notes. |
| 6 | `SALESFORCE_KNOWLEDGE/PATTERNS/`, `CHECKLISTS/`, `PROMPTS/`, `REFERENCE/`, and `DOCS/` | Reusable support material. |
| 7 | `MEMORY/` | Durable lessons and verified project facts from prior meaningful work. |
| 8 | `HISTORY/` | Chronological record of actions, tests, deploys, and results. |
| 9 | `WORKSPACE/` and `ARCHIVE/` | Audits, temporary working notes, and old fixes. Context only unless the user says otherwise. |

## Conflict Rules

- If documentation conflicts with source, inspect source and trust source for live behavior.
- If memory conflicts with current source, treat memory as stale until reverified.
- If history describes a past failure, treat it as a clue, not proof of the current root cause.
- If a guide conflicts with task-specific instructions, follow the user request while preserving safety rules.
- If two public knowledge docs compete as the same source of truth, merge the strongest current content into one canonical location during a docs task.
- Do not let old fixes, archived notes, or workspace audits override current implementation.

## Where New Knowledge Belongs

| New information | Put it here |
| --- | --- |
| Durable lesson from a fix | `MEMORY/FIX_HISTORY.md` |
| Repeated failure pattern or prevention rule | `MEMORY/FAILURE_HISTORY.md` |
| Verified object, field, path, or org-specific project pattern | `MEMORY/KNOWN_ORG_PATTERNS.md` |
| Architecture decision and tradeoffs | `MEMORY/DECISION_LOG.md` |
| Chronological account of a Codex task | `HISTORY/CODEX_RUN_LOG.md` |
| Deployment command and result | `HISTORY/DEPLOYMENT_LOG.md` |
| Apex test command and result | `HISTORY/TEST_RESULTS_LOG.md` |
| Larger completed change summary | `HISTORY/CHANGE_ARCHIVE.md` |
| Temporary audit, extraction, or planning note | `WORKSPACE/` |
| Reusable Salesforce platform guidance | `SALESFORCE_KNOWLEDGE/GUIDES/` or `TOPICS/` |
| Reusable implementation pattern | `SALESFORCE_KNOWLEDGE/PATTERNS/` |
| Public-safe template or lookup reference | `SALESFORCE_KNOWLEDGE/REFERENCE/` |

## Canonical Doc Shape

When creating or improving a reusable doc, include:

- purpose,
- when to read it,
- evidence level,
- relevant source locations,
- execution path,
- dependencies,
- risks,
- validation approach,
- known limits,
- related docs.

Separate current behavior from historical notes.

## Duplicate Handling

When duplicate docs exist:

1. Identify the newest accurate content.
2. Preserve unique failure lessons in memory or history.
3. Preserve reusable patterns in the knowledge base.
4. Remove or archive the duplicate only when the user explicitly asks for cleanup.

For audit-only tasks, document duplication without changing files.

## Public Safety

Do not add public docs containing:

- credentials,
- tokens,
- private URLs,
- local machine paths,
- real customer names,
- user emails,
- org IDs,
- deploy IDs,
- raw debug logs with private data,
- screenshots or HTML exports from private orgs.

Generalize private implementation details into reusable Salesforce lessons.

