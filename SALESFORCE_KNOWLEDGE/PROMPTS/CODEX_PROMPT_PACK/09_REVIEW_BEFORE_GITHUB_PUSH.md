# 09 Review Before GitHub Push

Use this prompt before pushing the helper repo or a Salesforce project branch to GitHub.

## Copy-Paste Prompt

```text
Review this repo before a GitHub push.

Required startup:

1. Read START_HERE.md.
2. Read INSTRUCTIONS/.
3. Locate the real Salesforce DX project if one is present or referenced. Do not assume this helper repo is the Salesforce project.
4. Confirm whether a real force-app/main/default folder exists before reviewing Salesforce source.
5. Read SALESFORCE_KNOWLEDGE/INDEX.md.
6. Read these task-specific docs before reviewing:
   - SALESFORCE_KNOWLEDGE/DOCS/public-sanitization-policy.md
   - SALESFORCE_KNOWLEDGE/DOCS/documentation-governance.md
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/production-safety.md
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/before-deployment.md
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_GITHUB_PUSH.md
   - SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/PUBLIC_REPO_SAFETY_CHECK.md
   - SALESFORCE_KNOWLEDGE/COMMANDS/GITHUB_ACTION_COMMAND_MAP.md
   - SALESFORCE_KNOWLEDGE/PARAMETERS/LOCAL_AUTOMATION_PARAMETERS.md
   - SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/PULL_REQUEST_QUALITY_STRATEGY.md
   - SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/PRE_RELEASE_FLOW.md
   - PUBLIC_REPO_REVIEW_CHECKLIST.md
   - SECURITY.md
7. Read relevant MEMORY/ and HISTORY/ entries.

Global behavior controls:

- Inspect current real project files before making Salesforce source claims. Do not infer behavior from prompts, docs, examples, or external repos alone.
- Do not guess or invent object API names, field API names, metadata names, Apex names, component names, permission names, record type IDs, org IDs, or local paths.
- Do not create placeholder deployable metadata unless the user explicitly asks for a scaffold and the target project path is confirmed.
- Do not edit unrelated files, reformat broad areas, or refactor beyond the approved review finding.
- Use external repo intelligence as learning only. Do not copy external source, sample metadata, config, data, workflow files, or sample names into this repo or a Salesforce project.
- Check command maps, parameter maps, quality strategies, and validation flows before choosing validation commands.
- No success without evidence: tests, lint, Code Analyzer, deploys, retrieves, GitHub checks, and runtime checks only pass when the exact command or check actually ran and passed. Otherwise report FAIL, SKIPPED, or static review only.

Review scope:
[PASTE BRANCH, FILE LIST, OR REVIEW SCOPE HERE]

Review requirements:

- Inspect real files under force-app/main/default before commenting on Salesforce source.
- Inspect docs, examples, prompts, wiki drafts, memory, history, workspace notes, and archive notes for public-safety risk.
- Avoid private data and credentials.
- Check for private data, credentials, usernames, org IDs, customer names, private URLs, local machine paths, raw debug logs with private data, and secrets.
- Check for placeholder deployable Salesforce metadata under FORCE_APP_DIRECTORY/.
- Check that public docs do not depend on local-only paths or temporary folders.
- Check that Salesforce deployment guidance excludes helper folders such as INSTRUCTIONS/, SALESFORCE_KNOWLEDGE/, MEMORY/, HISTORY/, WORKSPACE/, ARCHIVE/, and WIKI_DRAFTS/.
- Check that Codex instructions still require locating the real force-app/main/default before editing.
- Check obvious Markdown links for files changed in this task.

Review output:

- Findings first, ordered by severity.
- Include file references.
- Separate blockers from warnings.
- Include open questions or assumptions.
- Include a brief summary only after findings.

Do not edit files unless I explicitly ask you to fix the review findings.

If you do make meaningful fixes after I approve them, make the smallest safe fix, return complete updated files when code changes, and update MEMORY/ and HISTORY/.
```
