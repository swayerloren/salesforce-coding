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
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/PUBLIC_REPO_SAFETY_CHECK.md
   - SALESFORCE_KNOWLEDGE/PARAMETERS/LOCAL_AUTOMATION_PARAMETERS.md
7. Read all relevant MEMORY/ and HISTORY/ files before proposing or making changes.

Global behavior controls:

- Inspect current real project files before recording verified Salesforce project patterns. Do not infer behavior from prompts, docs, examples, or external repos alone.
- Do not guess or invent object API names, field API names, metadata names, Apex names, component names, permission names, record type IDs, org IDs, or local paths.
- Do not create placeholder deployable metadata unless the user explicitly asks for a scaffold and the target project path is confirmed.
- Do not edit unrelated files, reformat broad areas, or refactor memory/history structure beyond the root cause.
- Use external repo intelligence as learning only. Do not copy external source, sample metadata, config, data, workflow files, or sample names into memory or history.
- Check command maps, parameter maps, quality strategies, and validation flows before choosing validation commands.
- No success without evidence: tests, lint, Code Analyzer, deploys, retrieves, and runtime checks only pass when the exact command or check actually ran and passed. Otherwise report FAIL, SKIPPED, or static review only.

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
