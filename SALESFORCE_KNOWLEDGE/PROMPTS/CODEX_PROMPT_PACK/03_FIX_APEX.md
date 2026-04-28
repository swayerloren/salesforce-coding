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
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EDITING_APEX.md
   - SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_PATTERN_USAGE_RULES.md
   - SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_APEX_RECIPES_MAP.md when a public pattern reference is useful
   - TOOLS/SALESFORCE_CODE_ANALYZER.md
   - TOOLS/PRETTIER_APEX.md
   - QUALITY_GATES/CODE_ANALYZER_RULES.md
   - QUALITY_GATES/APEX_FORMATTING.md
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
- If using Apex Recipes as a reference, use it for pattern shape only. Do not copy recipe code blindly or invent recipe object, field, custom metadata, trigger, permission, or class names.

Fix rules:

- Identify the root cause before editing.
- Make the smallest safe fix.
- Keep triggers thin and preserve before/after sequencing.
- Keep all Apex paths bulk-safe.
- Avoid SOQL/DML in loops.
- Do not hard-code Salesforce IDs, record type IDs, profile IDs, permission set IDs, queue IDs, or org-specific IDs.
- Add null-safe guards for optional relationships, missing map keys, empty query results, blank DTO fields, and missing custom metadata.
- Do not hide required business behavior behind optional dynamic dispatch.
- Preserve sharing/access behavior unless the root cause requires changing it.
- Make sharing/security intent explicit for changed classes.
- Review CRUD/FLS or user-mode expectations for UI-facing, external-facing, and invocable Apex.
- Ensure tests create their own data and include real assertions.
- Use Apex Recipes as a pattern reference only, not a direct copy source.
- Avoid unrelated formatting or refactors.
- Avoid private data, credentials, usernames, org IDs, customer names, private URLs, local machine paths, raw debug logs with private data, and secrets.

Validation:

- Run focused Apex tests if possible.
- Run Salesforce Code Analyzer if available, usually from the real project root with `sf code-analyzer run --target force-app/main/default --view table`.
- Do not claim static analysis passed unless Salesforce Code Analyzer actually ran and passed.
- If Salesforce Code Analyzer is missing, state it was skipped and why, then recommend `sf plugins install @salesforce/plugin-code-analyzer`.
- Run or recommend optional Apex formatting checks when configured, such as `npm run prettier:check`, `npm run prettier:apex:check`, or `npx prettier --plugin=prettier-plugin-apex --check "force-app/main/default/**/*.{cls,trigger}"`.
- Do not claim Apex formatting passed unless the formatter actually ran and passed.
- Do not run broad formatting writes unless the user requested formatting.
- Run a narrow deploy dry run when appropriate.
- If validation cannot run, explain why and report static inspection performed.

After meaningful work:

- Update MEMORY/ and HISTORY/.
- Update MEMORY/ with reusable Apex lessons, failure prevention rules, or verified project patterns.
- Update HISTORY/ with files inspected, files changed, validation, and result.

Final response must include root cause, fix summary, files changed, validation commands/results, Salesforce Code Analyzer result, Apex formatting result or skipped reason, assumptions and limits, and complete updated files when code changes.
Return complete updated files when code changes.
```
