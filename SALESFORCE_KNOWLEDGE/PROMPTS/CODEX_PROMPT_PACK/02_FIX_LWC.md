# 02 Fix LWC

Use this prompt for Lightning Web Component bugs, deployment errors, styling issues, record actions, data refresh, Apex-backed UI, or page visibility problems.

## Copy-Paste Prompt

```text
Fix this Salesforce LWC issue.

Required startup:

1. Read START_HERE.md.
2. Read INSTRUCTIONS/.
3. Locate the real Salesforce DX project. Do not assume this helper repo is the Salesforce project.
4. Confirm the real force-app/main/default folder before editing anything.
5. Read SALESFORCE_KNOWLEDGE/INDEX.md.
6. Read these task-specific docs before editing:
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_RECORD_PAGE_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_MOBILE_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md
   - SALESFORCE_KNOWLEDGE/TOPICS/lwc/
   - SALESFORCE_KNOWLEDGE/TOPICS/lwc/wire-imperative-cache-rules.md
   - SALESFORCE_KNOWLEDGE/TOPICS/lwc/dynamic-record-fields.md
   - SALESFORCE_KNOWLEDGE/TOPICS/lwc/navigation-toast-refresh.md
   - SALESFORCE_KNOWLEDGE/TOPICS/mobile/mobile-camera-and-file-handoff.md when mobile, files, camera, quick actions, or generated documents are in scope
   - SALESFORCE_KNOWLEDGE/TOPICS/metadata/quick-action-visibility-matrix.md when record actions or mobile action visibility are in scope
   - SALESFORCE_KNOWLEDGE/TOPICS/files/photo-capture-annotation-viewer.md when files, photos, annotation, viewer, reports, or PDFs are in scope
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/before-lwc.md
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EDITING_LWC.md
   - SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_PATTERN_USAGE_RULES.md
   - SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_LWC_RECIPES_MAP.md when a public pattern reference is useful
   - SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/LWC_RECIPES_STRATEGY.md
   - SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/LWC_JEST_STRATEGY.md
   - SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/LWC_ESLINT_STRATEGY.md
   - SALESFORCE_KNOWLEDGE/COMMANDS/LWC_TEST_COMMAND_MAP.md
   - SALESFORCE_KNOWLEDGE/PARAMETERS/LWC_JEST_PARAMETERS.md
   - SALESFORCE_KNOWLEDGE/PARAMETERS/ESLINT_LWC_PARAMETERS.md
   - SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/LWC_QUALITY_STRATEGY.md
   - SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/FIX_LWC_FLOW.md
   - TOOLS/LWC_JEST.md
   - TOOLS/ESLINT_LWC.md
   - TOOLS/LWC_MOBILE_LINT.md
   - QUALITY_GATES/LWC_LINT_RULES.md
   - QUALITY_GATES/TESTING_GATE.md
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
[PASTE LWC ISSUE, ERROR, OR USER STORY HERE]

Inspection requirements:

- Inspect real files under force-app/main/default before editing.
- Inspect the real LWC bundle under force-app/main/default/lwc/.
- Inspect the component HTML, JavaScript, CSS, and js-meta.xml.
- Inspect imported Apex controller methods and DTOs.
- Inspect wire adapters, imperative Apex calls, cached data, refresh paths, loading states, and reduced error handling.
- Inspect parent and child components.
- Inspect related FlexiPages, quick actions, object restrictions, permissions, and form-factor settings when the component appears on a page or action.
- Inspect `lightning-record-edit-form`, custom form save logic, dynamic field metadata, and compound-field handling when forms are involved.
- Inspect NavigationMixin usage, ShowToastEvent timing, and URL state safety when navigation or user feedback is involved.
- Inspect Salesforce Files, preview/download, generated PDF, photo, annotation, or Chatter-like mobile action flows when in scope.
- Inspect tests if present.
- Verify every object API name, field API name, Apex method name, component name, permission, and metadata name before editing.
- If using LWC Recipes as a reference, use it for pattern shape only. Do not copy recipe code blindly or invent recipe object, field, Apex, event, message channel, or component names.

Fix rules:

- Identify the root cause before editing.
- Make the smallest safe fix.
- Keep LWC templates declarative; move expressions into JavaScript getters.
- Use getters for computed template state and avoid inline JavaScript expressions in HTML templates.
- Use LDS/UI API or `lightning-record-edit-form` for focused record forms unless Apex is needed for policy, multi-object logic, external integration, or generated artifacts.
- Use wired Apex only for cacheable read paths; use imperative Apex for mutations and explicit user commands.
- Await imperative Apex before success toasts, and refresh LDS, wired Apex, parent components, page participants, file lists, and generated-artifact state as needed.
- Use NavigationMixin PageReferences instead of hardcoded Lightning URLs.
- Use ShowToastEvent for supported success, warning, and error feedback, but do not treat a toast as a refresh mechanism.
- Preserve public @api contracts unless callers are inspected and updated.
- Preserve Salesforce mobile behavior when relevant.
- Avoid unrelated styling rewrites.
- Avoid private data, credentials, usernames, org IDs, customer names, private URLs, local machine paths, raw debug logs with private data, and secrets.

Validation:

- Run available LWC Jest, LWC ESLint, and mobile lint checks if configured.
- Prefer existing package scripts such as npm run test:unit, npm run lint:lwc, npm run lint, and npm run lint:mobile.
- Use the LWC command map and parameter maps before choosing direct Jest or ESLint commands.
- Do not claim Jest, ESLint, or mobile lint passed unless the command actually ran and passed.
- If package.json, Node/npm, test scripts, or lint scripts are missing, report the validation as skipped with the exact reason.
- Run focused Apex tests if Apex controller behavior changed.
- Run a narrow deploy dry run if possible.
- If validation cannot run, explain why and report static inspection performed.

After meaningful work:

- Update MEMORY/ and HISTORY/.
- Update MEMORY/ with reusable LWC lessons or verified project patterns.
- Update HISTORY/ with files inspected, files changed, validation, and result.

Final response must include root cause, fix summary, files changed, LWC Jest/ESLint/mobile lint results or skipped reasons, validation commands/results, assumptions and limits, and complete updated files when code changes.
Return complete updated files when code changes.
```
