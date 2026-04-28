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
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/before-lwc.md
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EDITING_LWC.md
   - SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_PATTERN_USAGE_RULES.md
   - SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_LWC_RECIPES_MAP.md when a public pattern reference is useful
   - TOOLS/LWC_JEST.md
   - TOOLS/ESLINT_LWC.md
   - TOOLS/LWC_MOBILE_LINT.md
   - QUALITY_GATES/LWC_LINT_RULES.md
   - QUALITY_GATES/TESTING_GATE.md
7. Read relevant MEMORY/ and HISTORY/ entries before changing files.

Issue:
[PASTE LWC ISSUE, ERROR, OR USER STORY HERE]

Inspection requirements:

- Inspect real files under force-app/main/default before editing.
- Inspect the real LWC bundle under force-app/main/default/lwc/.
- Inspect the component HTML, JavaScript, CSS, and js-meta.xml.
- Inspect imported Apex controller methods and DTOs.
- Inspect parent and child components.
- Inspect related FlexiPages, quick actions, object restrictions, permissions, and form-factor settings when the component appears on a page or action.
- Inspect tests if present.
- Verify every object API name, field API name, Apex method name, component name, permission, and metadata name before editing.
- If using LWC Recipes as a reference, use it for pattern shape only. Do not copy recipe code blindly or invent recipe object, field, Apex, event, message channel, or component names.

Fix rules:

- Identify the root cause before editing.
- Make the smallest safe fix.
- Keep LWC templates declarative; move expressions into JavaScript getters.
- Use getters for computed template state and avoid inline JavaScript expressions in HTML templates.
- Preserve public @api contracts unless callers are inspected and updated.
- Preserve Salesforce mobile behavior when relevant.
- Avoid unrelated styling rewrites.
- Avoid private data, credentials, usernames, org IDs, customer names, private URLs, local machine paths, raw debug logs with private data, and secrets.

Validation:

- Run available LWC Jest, LWC ESLint, and mobile lint checks if configured.
- Prefer existing package scripts such as npm run test:unit, npm run lint:lwc, npm run lint, and npm run lint:mobile.
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
