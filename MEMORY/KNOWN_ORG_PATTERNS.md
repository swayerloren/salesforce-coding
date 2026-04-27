# Known Org Patterns

## Purpose

`KNOWN_ORG_PATTERNS.md` stores verified, reusable Salesforce project patterns for the user's real org or project.

This file may include object API names, field API names, common folder paths, and project-specific Salesforce patterns after Codex verifies them in the real Salesforce DX source.

Do not put private credentials or secrets here.

## When Codex Should Update It

Update this file when:

- Codex verifies an object API name in the real project,
- Codex verifies a field API name in metadata or source,
- a common project path is confirmed,
- a recurring Apex/LWC/metadata pattern is confirmed,
- a permission, profile, record type, or custom metadata naming pattern is verified and safe to record.

Do not add guessed names. Only record verified names.

Do not include:

- credentials,
- tokens,
- client secrets,
- private keys,
- authorization headers,
- sensitive URLs,
- real customer data,
- raw org exports.

## Entry Template

```markdown
## YYYY-MM-DD - <Pattern Area>

- Date:
- Pattern type:
- Verified names or paths:
- Source of verification:
- Usage notes:
- Do not confuse with:
```

## Example Entry

```markdown
## 2026-04-27 - Example Object Pattern

- Date: 2026-04-27
- Pattern type: Object and field naming
- Verified names or paths: `Project__c`, `Status__c`, `force-app/main/default/objects/Project__c/fields/Status__c.field-meta.xml`
- Source of verification: Local Salesforce DX metadata in the real project.
- Usage notes: Use the metadata field API name in Apex and LWC imports; do not use the field label.
- Do not confuse with: Example files under `SALESFORCE_KNOWLEDGE/EXAMPLES/`, which are not the user's live org metadata.
```

