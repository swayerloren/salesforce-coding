# Start Here

This repo is a Codex-ready Salesforce coding engine.

It is designed to be downloaded, opened in VS Code, paired with a real Salesforce DX project, and used to help Codex fix, debug, structure, and improve real project metadata under `force-app/main/default`.

## First Principles

| Rule | Meaning |
| --- | --- |
| This repo is the engine | It provides instructions, Salesforce knowledge, prompts, checklists, Memory, and History. |
| The Salesforce DX project is separate | The user must place or reference the real project before Codex edits Salesforce source. |
| `force-app/main/default` is the target | Codex must locate and confirm the real metadata folder before editing. |
| Source beats notes | Codex must inspect real project metadata before making changes. |
| Public-safe by default | Do not add credentials, private org data, local-only paths, or private logs. |

## Required Codex Reading Order

Codex must follow this order:

1. Read this file.
2. Read [INSTRUCTIONS/](INSTRUCTIONS/README.md).
3. Locate the real Salesforce DX project through [FORCE_APP_DIRECTORY/](FORCE_APP_DIRECTORY/README.md) or a user-provided external path.
4. Confirm the real `force-app/main/default` folder.
5. Read [SALESFORCE_KNOWLEDGE/INDEX.md](SALESFORCE_KNOWLEDGE/INDEX.md).
6. Read task-specific Salesforce knowledge before editing Apex, LWC, Aura, Visualforce, metadata, tests, deployment files, Salesforce Files, or mobile behavior.
7. Inspect the real project files.
8. Make the smallest safe fix.
9. Validate if possible.
10. Update [MEMORY/](MEMORY/README.md) and [HISTORY/](HISTORY/README.md) after meaningful work.

## Real Project Metadata

The expected Salesforce metadata path is:

```text
force-app/main/default/
```

Supported placement examples:

```text
FORCE_APP_DIRECTORY/my-salesforce-project/force-app/main/default/
FORCE_APP_DIRECTORY/force-app/main/default/
```

Users may also keep the Salesforce DX project outside this repo and document the path in [FORCE_APP_DIRECTORY/README.md](FORCE_APP_DIRECTORY/README.md).

## Do Not Edit The Wrong Files

Codex must not treat these as the user's live Salesforce source:

- `SALESFORCE_KNOWLEDGE/EXAMPLES/`
- guide files,
- prompt files,
- checklist files,
- workspace notes,
- wiki drafts.

Only edit real project metadata after confirming the actual `force-app/main/default` path.

## Quick Start Prompt

```text
Read START_HERE.md and INSTRUCTIONS/. Locate my real Salesforce DX project, confirm force-app/main/default, read SALESFORCE_KNOWLEDGE/INDEX.md and the task-specific guides, inspect the real files before editing, make the smallest safe fix, validate if possible, then update Memory and History.
```

## Common Task Prompts

| Task | Prompt |
| --- | --- |
| Apex | `Fix this Apex issue. First read START_HERE.md and INSTRUCTIONS/, locate the real Salesforce DX project, confirm force-app/main/default, read the Apex and testing knowledge, inspect the target Apex, callers, tests, and related metadata, then make the smallest safe fix.` |
| LWC | `Fix this LWC issue. First read START_HERE.md and INSTRUCTIONS/, locate the real Salesforce DX project, confirm force-app/main/default, read the LWC, record page, and mobile knowledge, inspect the full LWC bundle and related Apex or metadata, then make the smallest safe fix.` |
| Deployment or tests | `Debug this deployment or test failure. First read START_HERE.md and INSTRUCTIONS/, locate the real Salesforce DX project, confirm force-app/main/default, read the deployment, testing, and common failure knowledge, inspect the failing files and error output, then fix only the confirmed root cause.` |
