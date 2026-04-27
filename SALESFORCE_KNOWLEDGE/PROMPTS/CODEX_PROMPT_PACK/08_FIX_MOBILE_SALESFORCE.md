# 08 Fix Mobile Salesforce

Use this prompt for Salesforce mobile app behavior, mobile webview problems, responsive LWC issues, quick actions on mobile, file previews/downloads on mobile, and mobile record-page visibility.

## Copy-Paste Prompt

```text
Fix this Salesforce mobile issue.

Required startup:

1. Read START_HERE.md.
2. Read INSTRUCTIONS/.
3. Locate the real Salesforce DX project. Do not assume this helper repo is the Salesforce project.
4. Confirm the real force-app/main/default folder before editing anything.
5. Read SALESFORCE_KNOWLEDGE/INDEX.md.
6. Read these task-specific docs before editing:
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_MOBILE_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_RECORD_PAGE_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md
   - SALESFORCE_KNOWLEDGE/TOPICS/mobile/
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/mobile-compatibility.md
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/before-lwc.md
7. Read relevant MEMORY/ and HISTORY/ entries before changing files.

Issue:
[PASTE MOBILE ISSUE, DEVICE CONTEXT, ERROR, OR USER STORY HERE]

Inspection requirements:

- Inspect real files under force-app/main/default before editing.
- Inspect the full LWC bundle, js-meta.xml form-factor support, parent components, CSS, Apex controllers, and related metadata.
- Inspect FlexiPages, actions, visibility rules, page activation, object restrictions, and permissions.
- Inspect file preview/download behavior if the issue involves Salesforce Files.
- Verify object API names, field API names, metadata names, component names, Apex method names, permissions, and record page targets in source.

Fix rules:

- Identify the root cause before editing.
- Make the smallest safe fix.
- Preserve desktop behavior while fixing mobile unless the task says otherwise.
- Avoid UI that relies on hover-only behavior.
- Keep tap targets, scroll containers, modal sizing, and overflow safe for mobile webviews.
- Do not assume a component is mobile-visible just because it exists in source.
- Avoid private data, credentials, usernames, org IDs, customer names, private URLs, local machine paths, raw debug logs with private data, and secrets.

Validation:

- Run available LWC/Jest/lint checks if configured.
- Inspect mobile form-factor metadata and page placement.
- Run focused Apex tests or deploy dry run if server or metadata behavior changed.
- If mobile runtime cannot be manually tested, state that and report static checks performed.

After meaningful work:

- Update MEMORY/ and HISTORY/.
- Update MEMORY/ with reusable mobile Salesforce lessons or verified project patterns.
- Update HISTORY/ with files inspected, files changed, validation, and result.

Final response must include root cause, fix summary, files changed, validation commands/results, assumptions and limits, and complete updated files when code changes.
Return complete updated files when code changes.
```
