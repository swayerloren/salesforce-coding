# Codex Start Prompt

Use these prompts when starting a new Codex session.

## Standard Start Prompt

```text
Read START_HERE.md first.

Then read INSTRUCTIONS/ and FORCE_APP_DIRECTORY/README.md.

Locate my real Salesforce DX project and confirm the real force-app/main/default folder before editing.

Before changing Salesforce files, read SALESFORCE_KNOWLEDGE/INDEX.md and the relevant Salesforce guides for this task.

Inspect existing source files before editing. Do not guess object API names, field API names, metadata names, permission names, record type IDs, Apex method names, or component names.

Make the smallest safe change, validate if possible, then update MEMORY/ and HISTORY/ after meaningful work.
```

## Apex Fix Prompt

```text
Fix this Apex issue. First locate the real force-app/main/default folder. Read the Apex, testing, common failures, and deployment guidance. Inspect the target class, callers, trigger paths, related tests, and metadata references before editing. Identify the root cause, make the smallest safe fix, run focused validation if possible, then update MEMORY/ and HISTORY/.
```

## LWC Fix Prompt

```text
Fix this LWC issue. Locate the real Salesforce DX project first. Read the LWC, record page, mobile, metadata, and common failures guidance. Inspect the full LWC bundle, its js-meta.xml file, parent components, Apex controller, permissions, and page placement before editing. Validate with lint, tests, or deploy dry run if possible, then update MEMORY/ and HISTORY/.
```

## Deployment Debug Prompt

```text
Debug this Salesforce deployment failure. Read the deployment, testing, metadata, and common failures guidance. Inspect the exact changed metadata and failure output. Do not broaden the deploy scope unless evidence requires it. Identify the root cause, make a narrow fix if needed, run a dry-run validation if possible, and record the result in HISTORY/.
```

## Review-Only Prompt

```text
Review these Salesforce changes without editing. Read the relevant instructions and Salesforce knowledge docs. Inspect the changed files and related source. Report risks, missing tests, deployment concerns, and assumptions with file references.
```

## Customization Checklist

- [ ] Add the exact user task.
- [ ] Add the error message or failing command.
- [ ] Add the relevant file path if known.
- [ ] State whether Codex may edit files.
- [ ] State whether Codex may run tests or deploy validation.

