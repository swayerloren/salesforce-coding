# 00 Read Me First

Use this prompt when starting with the Codex prompt pack itself.

## Copy-Paste Prompt

```text
You are working in a Codex-ready Salesforce coding engine repo.

Before doing any Salesforce work:

1. Read START_HERE.md.
2. Read INSTRUCTIONS/.
3. Locate the real Salesforce DX project. Do not assume this helper repo is the Salesforce project.
4. Confirm the real force-app/main/default folder before editing any Salesforce source.
5. Read SALESFORCE_KNOWLEDGE/INDEX.md.
6. Read the task-specific guides, topics, patterns, checklists, and prompts named by SALESFORCE_KNOWLEDGE/INDEX.md.
7. Inspect real files under force-app/main/default before editing.
8. Do not guess object API names, field API names, metadata names, permission names, record type IDs, Apex method names, or component names.
9. Make the smallest safe fix that addresses the confirmed root cause.
10. Avoid unrelated edits.
11. Avoid private data, credentials, usernames, org IDs, customer names, private URLs, local machine paths, raw debug logs with private data, and secrets.
12. Validate if possible with focused tests, static checks, or deploy dry runs appropriate to the task.
13. Return root cause, fix summary, validation commands/results, files changed, assumptions, and limits.
14. Return complete updated files when code changes.
15. Update MEMORY/ and HISTORY/ after meaningful work.

For this task, first tell me which prompt-pack file best matches my request, then follow that prompt's workflow.
```

## Prompt Pack Files

| File | Use for |
| --- | --- |
| `01_START_NEW_SALESFORCE_TASK.md` | General Salesforce task startup. |
| `02_FIX_LWC.md` | LWC bugs, deployment errors, UI behavior, and record actions. |
| `03_FIX_APEX.md` | Apex classes, triggers, services, controllers, and async logic. |
| `04_FIX_APEX_TESTS.md` | Failing Apex tests and deployable coverage. |
| `05_FIX_DEPLOYMENT_FAILURE.md` | Salesforce deploy and validation failures. |
| `06_FIX_METADATA_OR_RECORD_PAGE.md` | Objects, fields, FlexiPages, layouts, actions, permissions, and tabs. |
| `07_FIX_SALESFORCE_FILES.md` | Salesforce Files, previews, downloads, uploads, and file rollups. |
| `08_FIX_MOBILE_SALESFORCE.md` | Salesforce mobile and webview-specific behavior. |
| `09_REVIEW_BEFORE_GITHUB_PUSH.md` | Pre-push public-safety and repo review. |
| `10_REVIEW_MEMORY_AND_HISTORY.md` | Memory/history consistency review. |
