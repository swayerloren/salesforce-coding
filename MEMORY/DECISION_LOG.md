# Decision Log

## Purpose

`DECISION_LOG.md` records durable architecture and workflow decisions.

Use it when the team chooses one approach over another and future Codex sessions need to understand why.

## When Codex Should Update It

Update this file when:

- an architecture direction is chosen,
- a metadata organization rule is established,
- a testing or deployment strategy changes,
- a convention is adopted for Apex, LWC, Aura, Visualforce, or metadata,
- alternatives were considered and rejected.

Do not use this file for ordinary run logs or temporary task notes.

## Entry Template

```markdown
## YYYY-MM-DD - <Decision Title>

- Date:
- Decision:
- Why decision was made:
- Alternatives considered:
- Future impact:
- Related files or areas:
```

## Example Entry

```markdown
## 2026-04-27 - Keep Salesforce Knowledge Separate From Live Source

- Date: 2026-04-27
- Decision: Keep reusable guidance under `SALESFORCE_KNOWLEDGE/` and real Salesforce DX source under `FORCE_APP_DIRECTORY/`.
- Why decision was made: Codex needs guidance and examples without confusing them for deployable customer metadata.
- Alternatives considered: Put guidance directly beside `force-app/`; keep everything at repository root.
- Future impact: Codex must locate the real `force-app/main/default` before source edits and must not treat examples as production metadata.
- Related files or areas: `START_HERE.md`, `INSTRUCTIONS/`, `FORCE_APP_DIRECTORY/`, `SALESFORCE_KNOWLEDGE/`
```

## 2026-04-27 - Separate Reusable Memory From Chronological History

- Date: 2026-04-27
- Decision: Use `MEMORY/` for reusable knowledge and `HISTORY/` for chronological records of Codex work.
- Why decision was made: Future Codex sessions need stable lessons without sorting through run logs, while users still need a factual record of commands, changes, and outcomes.
- Alternatives considered: Keep all notes in one task history file; record only final answers in chat; use `WORKSPACE/` for both temporary and durable notes.
- Future impact: Codex must write reusable lessons to specialized memory files and write task/deploy/test/change chronology to specialized history files.
- Related files or areas: `MEMORY/`, `HISTORY/`, `INSTRUCTIONS/MEMORY_AND_HISTORY_RULES.md`

## 2026-04-27 - Generalize Temporary Reference Content Into Public-Safe Knowledge

- Date: 2026-04-27
- Decision: Extract only generic, public-safe governance and discovery patterns from temporary reference material, then store them in the permanent knowledge base.
- Why decision was made: The final repo must remain safe after the temporary material is deleted and must not expose private org-specific implementation details.
- Alternatives considered: Copy temporary docs directly; leave useful ideas only in a workspace audit; ignore the temporary material entirely.
- Future impact: Codex should route documentation precedence rules to `SALESFORCE_KNOWLEDGE/DOCS/documentation-governance.md` and broad discovery work to `SALESFORCE_KNOWLEDGE/REFERENCE/project-discovery-template.md`.
- Related files or areas: `SALESFORCE_KNOWLEDGE/DOCS/documentation-governance.md`, `SALESFORCE_KNOWLEDGE/REFERENCE/project-discovery-template.md`, `SALESFORCE_KNOWLEDGE/CHECKLISTS/project-discovery.md`, `WORKSPACE/TEMP_REFERENCE_EXTRACTION_SUMMARY.md`
