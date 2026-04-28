# 07 Fix Salesforce Files

Use this prompt for Salesforce Files, ContentVersion, ContentDocument, ContentDocumentLink, uploads, previews, downloads, generated PDFs, file rollups, file sharing, and file-trigger behavior.

## Copy-Paste Prompt

```text
Fix this Salesforce Files issue.

Required startup:

1. Read START_HERE.md.
2. Read INSTRUCTIONS/.
3. Locate the real Salesforce DX project. Do not assume this helper repo is the Salesforce project.
4. Confirm the real force-app/main/default folder before editing anything.
5. Read SALESFORCE_KNOWLEDGE/INDEX.md.
6. Read these task-specific docs before editing:
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_FILE_HANDLING_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_TESTING_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md
   - SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/before-apex.md
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/before-lwc.md
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EDITING_APEX.md
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EDITING_LWC.md
7. Read relevant MEMORY/ and HISTORY/ entries before changing files.

Issue:
[PASTE FILE ISSUE, ERROR, OR USER STORY HERE]

Inspection requirements:

- Inspect real files under force-app/main/default before editing.
- Inspect Apex involving ContentVersion, ContentDocument, ContentDocumentLink, generated PDFs, file sharing, file rollups, or file-trigger handlers.
- Inspect LWC/Aura/Visualforce surfaces that upload, preview, download, refresh, or display files.
- Inspect related tests and callout/storage mocks if any external file provider is involved.
- Verify object API names, field API names, Apex method names, component names, metadata names, and permissions in source.
- Check latest-version logic, sharing scope, parent record links, and async side effects.

Fix rules:

- Identify the root cause before editing.
- Make the smallest safe fix.
- Preserve file ownership, sharing, and access behavior unless the task explicitly changes it.
- Do not assume ContentVersion and ContentDocumentLink fire in a simple order.
- Avoid broad changes to file triggers or generated PDF behavior without focused validation.
- Avoid private data, credentials, usernames, org IDs, customer names, private URLs, local machine paths, raw debug logs with private data, and secrets.

Validation:

- Run focused Apex tests if possible.
- Run LWC/static checks if UI changed.
- Run a narrow deploy dry run when appropriate.
- If validation cannot run, explain why and report static inspection performed.

After meaningful work:

- Update MEMORY/ and HISTORY/.
- Update MEMORY/ with reusable Salesforce Files lessons or verified project patterns.
- Update HISTORY/ with files inspected, files changed, validation, and result.

Final response must include root cause, fix summary, files changed, validation commands/results, assumptions and limits, and complete updated files when code changes.
Return complete updated files when code changes.
```
