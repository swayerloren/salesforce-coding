# 06 Fix Metadata Or Record Page

Use this prompt for objects, fields, layouts, FlexiPages, Lightning record pages, quick actions, tabs, permissions, record types, custom metadata, and page visibility problems.

## Copy-Paste Prompt

```text
Fix this Salesforce metadata or record page issue.

Required startup:

1. Read START_HERE.md.
2. Read INSTRUCTIONS/.
3. Locate the real Salesforce DX project. Do not assume this helper repo is the Salesforce project.
4. Confirm the real force-app/main/default folder before editing anything.
5. Read SALESFORCE_KNOWLEDGE/INDEX.md.
6. Read these task-specific docs before editing:
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_RECORD_PAGE_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_DEPLOYMENT_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md
   - SALESFORCE_KNOWLEDGE/TOPICS/metadata/
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/metadata-deploy.md
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/before-record-page-ui-change.md
7. Read relevant MEMORY/ and HISTORY/ entries before changing files.

Issue:
[PASTE METADATA OR RECORD PAGE ISSUE HERE]

Inspection requirements:

- Inspect real files under force-app/main/default before editing.
- Inspect real metadata under force-app/main/default.
- Inspect objects, fields, layouts, FlexiPages, quick actions, tabs, permission sets, profiles if present, record types, and component metadata related to the issue.
- Inspect LWC/Aura js-meta.xml or design metadata when a component appears on a page.
- Search Apex, LWC, Aura, Visualforce, Flow, and metadata references before renaming or removing anything.
- Verify object API names, field API names, metadata names, permission names, profile names, record type names or IDs, and component names in source.

Fix rules:

- Identify the root cause before editing.
- Make the smallest safe fix.
- Preserve Salesforce DX metadata structure.
- Treat layouts, FlexiPages, app pages, profiles, and permission metadata as high-blast-radius changes.
- Prefer permission sets over profile churn when the project pattern allows it.
- Do not guess visibility rules or activation paths.
- Avoid unrelated metadata formatting or broad retrieve noise.
- Avoid private data, credentials, usernames, org IDs, customer names, private URLs, local machine paths, raw debug logs with private data, and secrets.

Validation:

- Run static XML/source inspection.
- Run a narrow deploy dry run if possible.
- Run focused Apex tests if Apex behavior or coverage is affected.
- If validation cannot run, explain why.

After meaningful work:

- Update MEMORY/ and HISTORY/.
- Update MEMORY/ with reusable metadata lessons or verified project patterns.
- Update HISTORY/ with files inspected, files changed, validation, and result.

Final response must include root cause, fix summary, files changed, validation commands/results, assumptions and limits, and complete updated files when code changes.
Return complete updated files when code changes.
```
