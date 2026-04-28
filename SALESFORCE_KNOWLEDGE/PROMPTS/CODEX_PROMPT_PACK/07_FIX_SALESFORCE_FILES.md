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
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_MOBILE_GUIDE.md when mobile preview/download or camera capture is in scope
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_VISUALFORCE_GUIDE.md when generated PDFs are in scope
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_TESTING_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md
   - SALESFORCE_KNOWLEDGE/TOPICS/files/contentdocument-lifecycle.md
   - SALESFORCE_KNOWLEDGE/TOPICS/files/photo-capture-annotation-viewer.md
   - SALESFORCE_KNOWLEDGE/TOPICS/mobile/mobile-camera-and-file-handoff.md when mobile behavior is in scope
   - SALESFORCE_KNOWLEDGE/TOPICS/experience-cloud/portal-access-and-files.md when external, portal, public, or guest access is in scope
   - SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/before-apex.md
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/before-lwc.md
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EDITING_APEX.md
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EDITING_LWC.md
   - SALESFORCE_KNOWLEDGE/COMMANDS/APEX_VALIDATION_COMMAND_MAP.md
   - SALESFORCE_KNOWLEDGE/COMMANDS/LWC_TEST_COMMAND_MAP.md
   - SALESFORCE_KNOWLEDGE/COMMANDS/SALESFORCE_CLI_COMMAND_MAP.md
   - SALESFORCE_KNOWLEDGE/PARAMETERS/
   - SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/APEX_QUALITY_STRATEGY.md
   - SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/LWC_QUALITY_STRATEGY.md
   - SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/FIX_APEX_FLOW.md
   - SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/FIX_LWC_FLOW.md
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
[PASTE FILE ISSUE, ERROR, OR USER STORY HERE]

Inspection requirements:

- Inspect real files under force-app/main/default before editing.
- Inspect Apex involving ContentVersion, ContentDocument, ContentDocumentLink, generated PDFs, file sharing, file rollups, or file-trigger handlers.
- Inspect LWC/Aura/Visualforce surfaces that upload, preview, download, refresh, or display files.
- Inspect photo capture, annotation, viewer, generated report, PDF, and mobile handoff flows when present.
- Inspect related tests and callout/storage mocks if any external file provider is involved.
- Verify object API names, field API names, Apex method names, component names, metadata names, and permissions in source.
- Check latest-version logic, sharing scope, parent record links, async side effects, preview/download behavior, and parent refresh paths.

Fix rules:

- Identify the root cause before editing.
- Make the smallest safe fix.
- Preserve file ownership, sharing, and access behavior unless the task explicitly changes it.
- Do not assume ContentVersion and ContentDocumentLink fire in a simple order.
- Do not assume upload success means preview, rollup, generated artifacts, or latest-version state are current.
- Preserve originals when annotation or derived-file behavior is not explicitly designed to replace them.
- Validate server-side access before returning file IDs, file details, distribution URLs, or external handoff URLs.
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
