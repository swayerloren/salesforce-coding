# 04 Fix Apex Tests

Use this prompt for failing Apex tests, missing coverage, stale assertions, test data failures, callout mock failures, async test failures, or deployment-blocking test issues.

## Copy-Paste Prompt

```text
Fix this Salesforce Apex test issue.

Required startup:

1. Read START_HERE.md.
2. Read INSTRUCTIONS/.
3. Locate the real Salesforce DX project. Do not assume this helper repo is the Salesforce project.
4. Confirm the real force-app/main/default folder before editing anything.
5. Read SALESFORCE_KNOWLEDGE/INDEX.md.
6. Read these task-specific docs before editing:
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_TESTING_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_DEPLOYMENT_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md
   - SALESFORCE_KNOWLEDGE/TOPICS/testing/
   - SALESFORCE_KNOWLEDGE/TOPICS/apex/
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/before-tests.md
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EDITING_APEX.md
   - SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_PATTERN_USAGE_RULES.md
   - SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_APEX_RECIPES_MAP.md when a public pattern reference is useful
   - SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/APEX_RECIPES_STRATEGY.md
   - SALESFORCE_KNOWLEDGE/COMMANDS/APEX_VALIDATION_COMMAND_MAP.md
   - SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/APEX_QUALITY_STRATEGY.md
   - SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/FIX_APEX_FLOW.md
   - TOOLS/SALESFORCE_CODE_ANALYZER.md
   - TOOLS/PRETTIER_APEX.md
   - QUALITY_GATES/CODE_ANALYZER_RULES.md
   - QUALITY_GATES/APEX_FORMATTING.md
   - QUALITY_GATES/examples/apex-test-command-examples.md
7. Read relevant MEMORY/ and HISTORY/ entries before changing files.

Failure:
[PASTE TEST FAILURE, CLASS NAME, COMMAND OUTPUT, OR COVERAGE ERROR HERE]

Inspection requirements:

- Inspect real files under force-app/main/default before editing.
- Inspect the failing test class under force-app/main/default/classes/.
- Inspect the production class, trigger, service, controller, or metadata the test covers.
- Inspect test data factories or shared setup helpers.
- Inspect callout mocks, async behavior, file-related test setup, and permissions if relevant.
- Verify object API names, field API names, Apex method names, test class names, and metadata names in source.
- Determine whether the test is stale or production behavior is wrong.
- If using Apex Recipes as a reference, use it for pattern shape only. Do not copy recipe code blindly or invent recipe object, field, custom metadata, trigger, permission, or class names.

Fix rules:

- Identify the root cause before editing.
- Make the smallest safe fix.
- Test the current production contract, not a stale assumption.
- Do not weaken assertions just to make tests pass.
- Add real assertions that prove behavior.
- Create required test data in the test or verified project factory.
- Do not use hard-coded Salesforce IDs, record type IDs, profile IDs, permission set IDs, queue IDs, usernames, or org-specific names.
- Keep production Apex bulk-safe if a production fix is needed.
- Avoid SOQL/DML in loops in production and test helpers.
- Keep null-safe checks for optional setup, relationships, maps, and query results.
- Preserve sharing/security intent and do not remove CRUD/FLS checks to make tests pass.
- Do not add SeeAllData=true unless there is no reasonable alternative and the risk is stated.
- Use callout mocks for callout paths.
- Use Test.startTest() and Test.stopTest() for async behavior.
- Avoid unrelated coverage padding.
- Avoid private data, credentials, usernames, org IDs, customer names, private URLs, local machine paths, raw debug logs with private data, and secrets.

Validation:

- Re-run the focused failing test if possible.
- Run related tests if the production fix affects shared behavior.
- Use the Apex validation command map before choosing test, Code Analyzer, deploy dry-run, or formatting commands.
- Run Salesforce Code Analyzer after production Apex changes if available, and do not claim it passed unless it actually ran and passed.
- Run or recommend optional Apex formatting checks when configured; do not run formatting writes unless requested.
- Run a narrow deploy dry run if the issue blocks deployment and an org alias is available.
- If validation cannot run, explain why and report static inspection performed.

After meaningful work:

- Update MEMORY/ and HISTORY/.
- Update MEMORY/ with reusable test lessons, failure prevention rules, or verified project patterns.
- Update HISTORY/ with test commands, results, files inspected, files changed, and outcome.

Final response must include root cause, fix summary, files changed, validation commands/results, Salesforce Code Analyzer result if production Apex changed, Apex formatting result or skipped reason, assumptions and limits, and complete updated files when code changes.
Return complete updated files when code changes.
```
