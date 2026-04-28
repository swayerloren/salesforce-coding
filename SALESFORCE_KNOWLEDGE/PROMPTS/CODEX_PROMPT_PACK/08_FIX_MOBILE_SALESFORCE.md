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
   - SALESFORCE_KNOWLEDGE/TOPICS/mobile/mobile-camera-and-file-handoff.md
   - SALESFORCE_KNOWLEDGE/TOPICS/metadata/quick-action-visibility-matrix.md
   - SALESFORCE_KNOWLEDGE/TOPICS/files/photo-capture-annotation-viewer.md when files, photos, annotation, reports, or PDFs are in scope
   - SALESFORCE_KNOWLEDGE/TOPICS/lwc/wire-imperative-cache-rules.md when data refresh or Apex calls are in scope
   - SALESFORCE_KNOWLEDGE/TOPICS/communication/chatter-email-activity-patterns.md when Chatter, activity, mentions, or posting is in scope
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/mobile-compatibility.md
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/before-lwc.md
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EDITING_LWC.md
   - TOOLS/LWC_MOBILE_LINT.md
   - TOOLS/LWC_JEST.md
   - TOOLS/ESLINT_LWC.md
   - QUALITY_GATES/LWC_LINT_RULES.md
   - QUALITY_GATES/TESTING_GATE.md
   - SALESFORCE_KNOWLEDGE/COMMANDS/LWC_TEST_COMMAND_MAP.md
   - SALESFORCE_KNOWLEDGE/COMMANDS/NPM_SCRIPT_COMMAND_MAP.md
   - SALESFORCE_KNOWLEDGE/COMMANDS/SALESFORCE_CLI_COMMAND_MAP.md
   - SALESFORCE_KNOWLEDGE/PARAMETERS/
   - SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/LWC_QUALITY_STRATEGY.md
   - SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/MOBILE_QUALITY_STRATEGY.md
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
[PASTE MOBILE ISSUE, DEVICE CONTEXT, ERROR, OR USER STORY HERE]

Inspection requirements:

- Inspect real files under force-app/main/default before editing.
- Inspect the full LWC bundle, js-meta.xml form-factor support, parent components, CSS, Apex controllers, and related metadata.
- Inspect FlexiPages, actions, layout actions, Dynamic Actions, visibility rules, page activation, object restrictions, and permissions.
- Inspect file upload, preview, download, latest-version behavior, generated PDF, photo capture, annotation, and viewer behavior if the issue involves Salesforce Files.
- Inspect Chatter-like action UX, attachment progress, mention insertion, and duplicate-submit handling when relevant.
- Verify object API names, field API names, metadata names, component names, Apex method names, permissions, and record page targets in source.

Fix rules:

- Identify the root cause before editing.
- Make the smallest safe fix.
- Preserve desktop behavior while fixing mobile unless the task says otherwise.
- Avoid UI that relies on hover-only behavior.
- Keep tap targets, scroll containers, modal sizing, and overflow safe for mobile webviews.
- Do not assume a component is mobile-visible just because it exists in source.
- Do not assume an action is in the mobile action bar because an action metadata file exists.
- Avoid blob URL, popup tab, or hardcoded Lightning URL handoffs unless validated for Salesforce mobile.
- Treat camera permission, preview paint, capture, upload, generated file, and cleanup as separate states.
- Guard Chatter-like mobile actions against blur-before-click, duplicate submit, and attachment upload race conditions.
- Treat mobile behavior as a required review area, not an optional final comment.
- Use getters for computed template state and avoid inline JavaScript expressions in LWC HTML templates.
- Avoid private data, credentials, usernames, org IDs, customer names, private URLs, local machine paths, raw debug logs with private data, and secrets.

Validation:

- Run available LWC Jest, LWC ESLint, LWC mobile lint, or graph analyzer checks if configured.
- Prefer existing package scripts such as npm run test:unit, npm run lint:lwc, npm run lint, and npm run lint:mobile.
- Do not claim Jest, ESLint, mobile lint, or graph analyzer passed unless the command actually ran and passed.
- If mobile lint or graph analyzer is missing, report it as skipped and inspect mobile metadata manually.
- Inspect mobile form-factor metadata and page placement.
- Run focused Apex tests or deploy dry run if server or metadata behavior changed.
- If mobile runtime cannot be manually tested, state that and report static checks performed.

After meaningful work:

- Update MEMORY/ and HISTORY/.
- Update MEMORY/ with reusable mobile Salesforce lessons or verified project patterns.
- Update HISTORY/ with files inspected, files changed, validation, and result.

Final response must include root cause, fix summary, files changed, mobile behavior review, LWC Jest/ESLint/mobile lint results or skipped reasons, validation commands/results, assumptions and limits, and complete updated files when code changes.
Return complete updated files when code changes.
```
