# 05 Fix Deployment Failure

Use this prompt for Salesforce deployment errors, validation failures, package coverage failures, metadata dependency failures, source tracking issues, or CLI command failures.

## Copy-Paste Prompt

```text
Fix this Salesforce deployment or validation failure.

Required startup:

1. Read START_HERE.md.
2. Read INSTRUCTIONS/.
3. Locate the real Salesforce DX project. Do not assume this helper repo is the Salesforce project.
4. Confirm the real force-app/main/default folder before editing anything.
5. Read SALESFORCE_KNOWLEDGE/INDEX.md.
6. Read these task-specific docs before editing:
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_DEPLOYMENT_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_TESTING_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md
   - SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md
   - SALESFORCE_KNOWLEDGE/TOPICS/deployment/
   - SALESFORCE_KNOWLEDGE/TOPICS/troubleshooting/
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/before-deployment.md
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/metadata-deploy.md
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_DEPLOYMENT.md
   - SALESFORCE_KNOWLEDGE/COMMANDS/SALESFORCE_CLI_COMMAND_MAP.md
   - SALESFORCE_KNOWLEDGE/REFERENCE/salesforce-cli-command-reference.md
   - SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/DEPLOYMENT_QUALITY_STRATEGY.md
   - SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/FIX_DEPLOYMENT_FLOW.md
   - TOOLS/SALESFORCE_CODE_ANALYZER.md
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

Failure:
[PASTE DEPLOY COMMAND, VALIDATION COMMAND, ERROR OUTPUT, OR FAILURE SUMMARY HERE]

Inspection requirements:

- Inspect real files under force-app/main/default before editing.
- Inspect exact changed metadata under the real force-app/main/default.
- Inspect the deployment command and source-dir or manifest scope.
- Inspect whether the command was dry run, production validation, deploy report, quick deploy, real deploy, retrieve, Apex test, or Code Analyzer.
- Inspect related Apex tests and coverage requirements.
- Inspect object, field, action, FlexiPage, layout, permission, tab, named credential, external credential, and dependency metadata when referenced by the error.
- Inspect package.xml, destructiveChangesPre.xml, destructiveChangesPost.xml, and rollback notes when destructive changes are involved.
- Verify all metadata names in source before editing.

Fix rules:

- Identify the root cause before editing.
- Make the smallest safe fix.
- Keep deploy scope narrow.
- Do not include documentation folders, memory, history, workspace notes, wiki drafts, or this helper repo in a deploy.
- Do not use destructive flags unless the user explicitly requests that and the risk is understood.
- Do not hide real failures with ignore flags.
- Do not claim success from static review, dry run, validation, analyzer output, or runtime checks unless that exact evidence exists.
- Use project deploy validate for production quick-deploy workflows; use deploy report before claiming async or timed-out command status.
- Avoid unrelated metadata churn.
- Avoid private data, credentials, usernames, org IDs, customer names, private URLs, local machine paths, raw debug logs with private data, and secrets.

Validation:

- Re-run focused tests or deploy dry run if possible.
- Run production validation when the task requires quick deploy or production release evidence.
- Run deploy report when a deploy, validation, or test command returns a job ID or times out.
- Use the Salesforce CLI command map before choosing exact deploy, test, or validation commands.
- Run Salesforce Code Analyzer if available for the changed deploy scope, usually from the real project root with `sf code-analyzer run --target force-app/main/default --view table`.
- Do not claim static analysis passed unless Salesforce Code Analyzer actually ran and passed.
- If Salesforce Code Analyzer is missing, state it was skipped and why, then recommend `sf plugins install @salesforce/plugin-code-analyzer`.
- Use RunSpecifiedTests for narrow deploys when appropriate.
- Use RunLocalTests only when the change scope or org policy requires broader validation.
- If validation cannot run, explain why and report static inspection performed.

After meaningful work:

- Update MEMORY/ and HISTORY/.
- Update MEMORY/ with reusable deployment lessons or failure prevention rules.
- Update HISTORY/DEPLOYMENT_LOG.md and HISTORY/TEST_RESULTS_LOG.md when commands are run.
- Update HISTORY/CODEX_RUN_LOG.md or HISTORY/TASK_HISTORY.md with the task result.

Final response must include root cause, fix summary, files changed, validation commands/results, Salesforce Code Analyzer result, assumptions and limits, and complete updated files when code changes.
Return complete updated files when code changes.
```
