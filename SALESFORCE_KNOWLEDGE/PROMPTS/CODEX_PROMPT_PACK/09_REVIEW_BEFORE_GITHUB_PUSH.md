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
   - PUBLIC_REPO_REVIEW_CHECKLIST.md
   - SECURITY.md
7. Read relevant MEMORY/ and HISTORY/ entries.

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
