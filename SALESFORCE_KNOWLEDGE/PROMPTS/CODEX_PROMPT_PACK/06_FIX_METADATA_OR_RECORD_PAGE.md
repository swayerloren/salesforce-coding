# 06 Fix Metadata Or Record Page

Use this prompt for objects, fields, validation rules, layouts, FlexiPages, Lightning record pages, quick actions, tabs, applications, permissions, record types, compact layouts, custom metadata, custom permissions, static resources, email templates, reports, dashboards, and page visibility problems.

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
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_PLATFORM_LIMITATIONS.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_DEPLOYMENT_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md
   - SALESFORCE_KNOWLEDGE/TOPICS/metadata/
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/metadata-deploy.md
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/before-record-page-ui-change.md
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EDITING_METADATA.md
   - SALESFORCE_KNOWLEDGE/COMMANDS/SALESFORCE_CLI_COMMAND_MAP.md
   - SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/METADATA_QUALITY_STRATEGY.md
   - SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/FIX_METADATA_FLOW.md
   - QUALITY_GATES/RELEASE_GATE.md
   - QUALITY_GATES/CODE_ANALYZER_RULES.md
7. Read relevant MEMORY/ and HISTORY/ entries before changing files.

Global behavior controls:

- Inspect current real project files before editing. Do not infer behavior from prompts, docs, examples, or external repos alone.
- Do not guess or invent object API names, field API names, metadata names, Apex names, component names, permission names, record type IDs, org IDs, or local paths.
- Do not create placeholder deployable metadata unless the user explicitly asks for a scaffold and the target project path is confirmed.
- Do not edit unrelated files, reformat broad areas, or refactor beyond the root cause.
- Use external repo intelligence as learning only. Do not copy external source, sample metadata, config, data, workflow files, or sample names into the user project.
- Check command maps, parameter maps, quality strategies, and validation flows before choosing validation commands.
- No success without evidence: tests, lint, Code Analyzer, deploys, retrieves, and runtime checks only pass when the exact command or check actually ran and passed. Otherwise report FAIL, SKIPPED, or static review only.

Issue:
[PASTE METADATA OR RECORD PAGE ISSUE HERE]

Inspection requirements:

- Inspect real files under force-app/main/default before editing.
- Inspect the real Salesforce DX project structure and sfdx-project.json package directories.
- Inspect related objects, fields, validation rules, layouts, FlexiPages, quick actions, tabs, applications, permission sets, profiles if present, record types, compact layouts, custom metadata, custom permissions, static resources, email, reports, dashboards, and component metadata related to the issue.
- Inspect object-scoped metadata under objects/<Object>/ before changing fields, validation rules, compact layouts, record types, or object configuration.
- Inspect LWC/Aura js-meta.xml or design metadata when a component appears on a page.
- Search Apex, LWC, Aura, Visualforce, Flow, and metadata references before renaming or removing anything.
- Verify object API names, field API names, metadata names, permission names, profile names, record type names or IDs, layout names, FlexiPage names, quick action names, tab names, app names, and component names in source.
- For record-page behavior, inspect activation, assignment, permissions, form factor, and page/layout/action chain.

Fix rules:

- Identify the root cause before editing.
- Make the smallest safe fix.
- Preserve Salesforce DX metadata structure.
- Do not invent object, field, layout, FlexiPage, quick action, permission, profile, record type, tab, app, report, dashboard, static resource, or package names.
- Do not assume a component appears on a page just because it deploys.
- Treat layouts, FlexiPages, app pages, profiles, permission metadata, record types, reports, dashboards, static resources, and package manifests as high-blast-radius changes.
- Prefer permission sets over profile churn when the project pattern allows it.
- Do not blindly edit profiles.
- Do not guess visibility rules or activation paths.
- Avoid unrelated metadata formatting, broad retrieve noise, and wide deploy payloads.
- Keep package.xml manifests narrow and inspect them before deploy validation.
- Avoid private data, credentials, usernames, org IDs, customer names, private URLs, local machine paths, raw debug logs with private data, screenshots, exports, and secrets.

Validation:

- Run static XML/source inspection.
- Run the local Salesforce project validator if available.
- Use the metadata validation flow before choosing Code Analyzer or deploy dry-run commands.
- Run Salesforce Code Analyzer if available.
- Run a narrow deploy dry run if possible.
- Run focused Apex tests if Apex behavior or coverage is affected.
- If validation cannot run, explain why.

After meaningful work:

- Update MEMORY/ and HISTORY/.
- Update MEMORY/ with reusable metadata lessons or verified project patterns.
- Update HISTORY/ with files inspected, files changed, validation, and result.

Final response must include root cause, fix summary, files changed, validation commands/results, metadata activation or assignment checks performed, assumptions and limits, and complete updated files when code changes.
Return complete updated files when code changes.
```
