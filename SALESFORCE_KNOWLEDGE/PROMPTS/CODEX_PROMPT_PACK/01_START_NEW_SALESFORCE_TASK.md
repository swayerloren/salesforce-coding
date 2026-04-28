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
7. Read TOOLS/SALESFORCE_CODE_ANALYZER.md and QUALITY_GATES/CODE_ANALYZER_RULES.md if the task may change Salesforce source.
8. Read TOOLS/LWC_JEST.md, TOOLS/ESLINT_LWC.md, TOOLS/LWC_MOBILE_LINT.md, QUALITY_GATES/LWC_LINT_RULES.md, and QUALITY_GATES/TESTING_GATE.md if the task may change LWC or Salesforce mobile behavior.
9. Read SALESFORCE_KNOWLEDGE/COMMANDS/, SALESFORCE_KNOWLEDGE/PARAMETERS/, SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/, and SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/ for the task type.
10. Read relevant MEMORY/ and HISTORY/ entries before changing files.

Global behavior controls:

- Inspect current real project files before editing. Do not infer behavior from prompts, docs, examples, or external repos alone.
- Do not guess or invent object API names, field API names, metadata names, Apex names, component names, permission names, record type IDs, org IDs, or local paths.
- Do not create placeholder deployable metadata unless the user explicitly asks for a scaffold and the target project path is confirmed.
- Do not edit unrelated files, reformat broad areas, or refactor beyond the root cause.
- Use external repo intelligence as learning only. Do not copy external source, sample metadata, config, data, workflow files, or sample names into the user project.
- Check command maps, parameter maps, quality strategies, and validation flows before choosing validation commands.
- No success without evidence: tests, lint, Code Analyzer, deploys, retrieves, and runtime checks only pass when the exact command or check actually ran and passed. Otherwise report FAIL, SKIPPED, or static review only.

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
- After Salesforce code or metadata changes, run Salesforce Code Analyzer if available, or recommend it and state exactly why it was skipped.
- Do not claim static analysis passed unless Salesforce Code Analyzer actually ran and passed.
- After LWC changes, run or recommend available LWC lint and Jest checks.
- Do not claim LWC Jest or ESLint passed unless the command actually ran and passed.
- Use the command maps and parameter maps before choosing exact validation commands.
- Use the validation flows to sequence checks and record skipped gates honestly.
- For Salesforce mobile work, treat mobile behavior as a required review area.
- Keep LWC template logic in JavaScript getters and avoid inline JavaScript expressions in HTML templates.
- If validation cannot run, say why.
- Return complete updated files when code changes.
- Update MEMORY/ and HISTORY/ after meaningful work.

Final response must include:

- Root cause.
- Fix summary.
- Files changed.
- Validation commands/results.
- Salesforce Code Analyzer result: pass, warnings/findings, error, or skipped with reason.
- LWC Jest/ESLint/mobile lint result when LWC is in scope: pass, fail, or skipped with reason.
- Assumptions and limits.
- Complete updated files when code changes, or clear file references if files are too large.
```
