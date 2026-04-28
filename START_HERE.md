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
| Quality gates provide evidence | Codex should run available validation tools after code changes. |
| Public-safe by default | Do not add credentials, private org data, local-only paths, or private logs. |

## Required Codex Reading Order

Codex must follow this order:

1. Read this file.
2. Read [INSTRUCTIONS/](INSTRUCTIONS/README.md).
3. Locate the real Salesforce DX project through [FORCE_APP_DIRECTORY/](FORCE_APP_DIRECTORY/README.md) or a user-provided external path.
4. Confirm the real `force-app/main/default` folder.
5. Read [SALESFORCE_KNOWLEDGE/INDEX.md](SALESFORCE_KNOWLEDGE/INDEX.md).
6. Read task-specific Salesforce knowledge before editing Apex, LWC, Aura, Visualforce, metadata, tests, deployment files, Salesforce Files, or mobile behavior.
7. Read relevant [command maps](SALESFORCE_KNOWLEDGE/COMMANDS/README.md), [parameter maps](SALESFORCE_KNOWLEDGE/PARAMETERS/README.md), [quality strategies](SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/README.md), and [validation flows](SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/README.md).
8. Check [TOOLS/](TOOLS/README.md), [QUALITY_GATES/](QUALITY_GATES/README.md), and [AUTOMATION/](AUTOMATION/README.md) for available validation tools and local wrappers.
9. Optionally read [VENDOR_REFERENCES/](VENDOR_REFERENCES/README.md) and inspect local clones under `VENDOR_REFERENCES/_external/` if the user has cloned them.
10. Inspect the real project files.
11. Make the smallest safe fix.
12. Run available quality gates or clearly state validation limits.
13. Update [MEMORY/](MEMORY/README.md) and [HISTORY/](HISTORY/README.md) after meaningful work.

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
- tooling and quality-gate docs,
- command, parameter, quality strategy, and validation-flow docs,
- automation helper scripts,
- vendor reference docs,
- optional external clones under `VENDOR_REFERENCES/_external/`,
- workspace notes,
- wiki drafts.

Only edit real project metadata after confirming the actual `force-app/main/default` path.

## Quick Start Prompt

```text
Read START_HERE.md and INSTRUCTIONS/. Locate my real Salesforce DX project, confirm force-app/main/default, read SALESFORCE_KNOWLEDGE/INDEX.md, task-specific guides, command maps, parameter maps, quality strategies, and validation flows, check TOOLS/, QUALITY_GATES/, and AUTOMATION/ for available validation, inspect the real files before editing, make the smallest safe fix, run available quality gates if possible, then update Memory and History.
```

## Optional Vendor References

Users may clone public external Salesforce references locally with [VENDOR_REFERENCES/clone-reference-repos.ps1](VENDOR_REFERENCES/clone-reference-repos.ps1) or [VENDOR_REFERENCES/clone-reference-repos.sh](VENDOR_REFERENCES/clone-reference-repos.sh).

Those clones live under `VENDOR_REFERENCES/_external/`, are ignored by git, and are not required. Codex may inspect them for pattern context, but must not vendor them, copy code blindly, or treat sample metadata as facts about the user's org.

## Common Task Prompts

| Task | Prompt |
| --- | --- |
| Apex | `Fix this Apex issue. First read START_HERE.md and INSTRUCTIONS/, locate the real Salesforce DX project, confirm force-app/main/default, read the Apex and testing knowledge, inspect the target Apex, callers, tests, and related metadata, then make the smallest safe fix.` |
| LWC | `Fix this LWC issue. First read START_HERE.md and INSTRUCTIONS/, locate the real Salesforce DX project, confirm force-app/main/default, read the LWC, record page, and mobile knowledge, inspect the full LWC bundle and related Apex or metadata, then make the smallest safe fix.` |
| Deployment or tests | `Debug this deployment or test failure. First read START_HERE.md and INSTRUCTIONS/, locate the real Salesforce DX project, confirm force-app/main/default, read the deployment, testing, and common failure knowledge, inspect the failing files and error output, then fix only the confirmed root cause.` |
