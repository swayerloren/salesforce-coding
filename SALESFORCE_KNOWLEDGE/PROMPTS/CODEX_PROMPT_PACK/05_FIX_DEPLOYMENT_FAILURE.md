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
7. Read relevant MEMORY/ and HISTORY/ entries before changing files.

Failure:
[PASTE DEPLOY COMMAND, VALIDATION COMMAND, ERROR OUTPUT, OR FAILURE SUMMARY HERE]

Inspection requirements:

- Inspect real files under force-app/main/default before editing.
- Inspect exact changed metadata under the real force-app/main/default.
- Inspect the deployment command and source-dir or manifest scope.
- Inspect related Apex tests and coverage requirements.
- Inspect object, field, action, FlexiPage, layout, permission, tab, named credential, external credential, and dependency metadata when referenced by the error.
- Verify all metadata names in source before editing.

Fix rules:

- Identify the root cause before editing.
- Make the smallest safe fix.
- Keep deploy scope narrow.
- Do not include documentation folders, memory, history, workspace notes, wiki drafts, or this helper repo in a deploy.
- Do not use destructive flags unless the user explicitly requests that and the risk is understood.
- Do not hide real failures with ignore flags.
- Avoid unrelated metadata churn.
- Avoid private data, credentials, usernames, org IDs, customer names, private URLs, local machine paths, raw debug logs with private data, and secrets.

Validation:

- Re-run focused tests or deploy dry run if possible.
- Use RunSpecifiedTests for narrow deploys when appropriate.
- Use RunLocalTests only when the change scope or org policy requires broader validation.
- If validation cannot run, explain why and report static inspection performed.

After meaningful work:

- Update MEMORY/ and HISTORY/.
- Update MEMORY/ with reusable deployment lessons or failure prevention rules.
- Update HISTORY/DEPLOYMENT_LOG.md and HISTORY/TEST_RESULTS_LOG.md when commands are run.
- Update HISTORY/CODEX_RUN_LOG.md or HISTORY/TASK_HISTORY.md with the task result.

Final response must include root cause, fix summary, files changed, validation commands/results, assumptions and limits, and complete updated files when code changes.
Return complete updated files when code changes.
```
