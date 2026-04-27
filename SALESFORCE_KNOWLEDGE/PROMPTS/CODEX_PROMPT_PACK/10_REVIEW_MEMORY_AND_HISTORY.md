# 10 Review Memory And History

Use this prompt to audit or clean up memory/history records after meaningful work.

## Copy-Paste Prompt

```text
Review the MEMORY/ and HISTORY/ system for consistency and public safety.

Required startup:

1. Read START_HERE.md.
2. Read INSTRUCTIONS/.
3. Locate the real Salesforce DX project if one is present or referenced. Do not assume this helper repo is the Salesforce project.
4. Confirm the real force-app/main/default folder before inspecting or editing any Salesforce source.
5. Read SALESFORCE_KNOWLEDGE/INDEX.md.
6. Read these task-specific docs before editing:
   - INSTRUCTIONS/MEMORY_AND_HISTORY_RULES.md
   - INSTRUCTIONS/OUTPUT_FORMAT_RULES.md
   - SALESFORCE_KNOWLEDGE/DOCS/documentation-governance.md
   - SALESFORCE_KNOWLEDGE/DOCS/public-sanitization-policy.md
7. Read all relevant MEMORY/ and HISTORY/ files before proposing or making changes.

Review scope:
[PASTE MEMORY/HISTORY REVIEW SCOPE HERE]

Inspection requirements:

- Inspect MEMORY/ for reusable lessons, decisions, stable project notes, and verified patterns.
- Inspect HISTORY/ for chronological task, deployment, test, and change records.
- Confirm memory entries are not just run logs.
- Confirm history entries are not pretending to be canonical current architecture.
- Check for private data, credentials, usernames, org IDs, customer names, private URLs, local machine paths, raw debug logs with private data, and secrets.
- If a real Salesforce project is involved, inspect real files under force-app/main/default before recording verified project-specific patterns.

Fix rules:

- Identify the issue before editing.
- Make the smallest safe fix.
- Move or rewrite entries only when their destination is clear.
- Keep reusable lessons in MEMORY/.
- Keep chronological records in HISTORY/.
- Keep temporary analysis in WORKSPACE/.
- Do not delete useful history unless explicitly requested.
- Avoid private data and credentials.

Validation:

- Check headings and templates in edited memory/history files.
- Search edited files for private-data and local-path patterns.
- If Markdown links changed, check that they resolve.

After meaningful work:

- Update MEMORY/ and HISTORY/.

Final response must include root cause or reason for changes, fix summary, files changed, validation commands/results, assumptions and limits, and complete updated files when code changes.
Return complete updated files when code changes.
```
