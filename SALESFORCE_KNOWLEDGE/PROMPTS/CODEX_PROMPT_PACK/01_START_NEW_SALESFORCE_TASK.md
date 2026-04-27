# 01 Start New Salesforce Task

Use this prompt for a general Salesforce coding, debugging, review, or documentation task.

## Copy-Paste Prompt

```text
Start a new Salesforce task in this Codex-ready Salesforce coding engine repo.

Required startup:

1. Read START_HERE.md.
2. Read INSTRUCTIONS/.
3. Locate the real Salesforce DX project. Do not assume this helper repo is the Salesforce project.
4. Confirm the real force-app/main/default folder before editing anything.
5. Read SALESFORCE_KNOWLEDGE/INDEX.md.
6. Read the task-specific Salesforce guides, topics, patterns, prompts, and checklists for this request.
7. Read relevant MEMORY/ and HISTORY/ entries before changing files.

Task:
[PASTE TASK HERE]

Working rules:

- Inspect real files under force-app/main/default before editing.
- Verify object API names, field API names, metadata names, permission names, record type IDs, Apex method names, and component names in the real project.
- Identify the root cause before changing files.
- Make the smallest safe fix.
- Do not edit unrelated files.
- Preserve Salesforce DX structure.
- Avoid private data, credentials, usernames, org IDs, customer names, private URLs, local machine paths, raw debug logs with private data, and secrets.
- Do not create placeholder deployable Salesforce metadata.
- Validate if possible with focused tests, lint/static checks, source inspection, or deploy dry runs.
- If validation cannot run, say why.
- Return complete updated files when code changes.
- Update MEMORY/ and HISTORY/ after meaningful work.

Final response must include:

- Root cause.
- Fix summary.
- Files changed.
- Validation commands/results.
- Assumptions and limits.
- Complete updated files when code changes, or clear file references if files are too large.
```
