# 03 Fix Apex

Use this prompt for Apex classes, triggers, trigger handlers, services, controllers, invocable methods, queueables, batches, schedulers, callouts, or sharing/access bugs.

## Copy-Paste Prompt

```text
Fix this Salesforce Apex issue.

Required startup:

1. Read START_HERE.md.
2. Read INSTRUCTIONS/.
3. Locate the real Salesforce DX project. Do not assume this helper repo is the Salesforce project.
4. Confirm the real force-app/main/default folder before editing anything.
5. Read SALESFORCE_KNOWLEDGE/INDEX.md.
6. Read these task-specific docs before editing:
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_ARCHITECTURE_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_TESTING_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_DEPLOYMENT_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md
   - SALESFORCE_KNOWLEDGE/TOPICS/apex/
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/before-apex.md
7. Read relevant MEMORY/ and HISTORY/ entries before changing files.

Issue:
[PASTE APEX ISSUE, ERROR, STACK TRACE, OR USER STORY HERE]

Inspection requirements:

- Inspect real files under force-app/main/default before editing.
- Inspect real Apex files under force-app/main/default/classes/ and force-app/main/default/triggers/.
- Inspect the target class or trigger and its .cls-meta.xml or .trigger-meta.xml file.
- Inspect callers, trigger paths, services, controllers, async jobs, invocable usage, tests, and referenced metadata.
- Search before changing public method signatures.
- Verify object API names, field API names, relationship names, custom metadata names, Apex method names, and test class names in source.
- Identify required dependencies versus optional dynamic integrations.

Fix rules:

- Identify the root cause before editing.
- Make the smallest safe fix.
- Keep triggers thin and preserve before/after sequencing.
- Bulkify all paths.
- Avoid SOQL/DML in loops.
- Do not hide required business behavior behind optional dynamic dispatch.
- Preserve sharing/access behavior unless the root cause requires changing it.
- Avoid unrelated formatting or refactors.
- Avoid private data, credentials, usernames, org IDs, customer names, private URLs, local machine paths, raw debug logs with private data, and secrets.

Validation:

- Run focused Apex tests if possible.
- Run a narrow deploy dry run when appropriate.
- If validation cannot run, explain why and report static inspection performed.

After meaningful work:

- Update MEMORY/ and HISTORY/.
- Update MEMORY/ with reusable Apex lessons, failure prevention rules, or verified project patterns.
- Update HISTORY/ with files inspected, files changed, validation, and result.

Final response must include root cause, fix summary, files changed, validation commands/results, assumptions and limits, and complete updated files when code changes.
Return complete updated files when code changes.
```
