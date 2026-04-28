# Installation Guide

Use this guide to set up the Salesforce Codex Engine around a real Salesforce DX project.

## Requirements

| Tool | Required | Purpose |
| --- | --- | --- |
| VS Code | Yes | Main workspace for the repo and Codex. |
| Codex | Yes | Reads the repo instructions and performs coding tasks. |
| Git | Recommended | Clones and updates the helper repo. |
| Salesforce CLI | Recommended | Runs tests, retrieves metadata, validates deployments, and deploys changes. |
| Real Salesforce DX project | Yes for code work | Provides the actual `force-app/main/default` source Codex will edit. |

## Download Release ZIP

Recommended setup:

1. Open the GitHub Releases page for this repo.
2. Download the latest source ZIP.
3. Extract the ZIP to a normal working folder.
4. Open the extracted folder in VS Code.
5. Make sure `START_HERE.md` is visible at the repo root.

After opening the folder, start Codex with: `Read START_HERE.md first.`

## Clone Option

Clone the repo:

```bash
git clone <repo-url>
cd salesforce-coding
code .
```

Use Git when you want to track repo updates through commits instead of downloading release ZIP files.

## Add Your Salesforce DX Project

Recommended layout:

```text
FORCE_APP_DIRECTORY/
  my-salesforce-project/
    sfdx-project.json
    force-app/
      main/
        default/
          classes/
          lwc/
          objects/
```

You can also place the project directly under `FORCE_APP_DIRECTORY/`:

```text
FORCE_APP_DIRECTORY/
  sfdx-project.json
  force-app/
    main/
      default/
```

## External Project Option

If your Salesforce DX project stays outside this helper repo, document the external project path in `FORCE_APP_DIRECTORY/README.md`.

Use this template:

```text
Actual Salesforce Project Path:
[PASTE PATH HERE]
```

Do not put credentials, auth state, access tokens, or private org details in this file.

## First Codex Run

After the repo and real Salesforce DX project are available, Codex should:

1. Read `START_HERE.md`.
2. Read `INSTRUCTIONS/`.
3. Confirm the real `force-app/main/default`.
4. Read `SALESFORCE_KNOWLEDGE/INDEX.md`.
5. Read task-specific guides, prompts, checklists, command maps, parameter maps, quality strategies, and validation flows.
6. Inspect current project files before editing.
7. Make narrow fixes only.
8. Run or recommend validation and state skipped gates.
9. Update Memory and History after meaningful work.

## Verification Checklist

- [ ] Repo opens in VS Code.
- [ ] `START_HERE.md` is visible at the root.
- [ ] `INSTRUCTIONS/` exists.
- [ ] `SALESFORCE_KNOWLEDGE/INDEX.md` exists.
- [ ] `FORCE_APP_DIRECTORY/README.md` explains where the real project is.
- [ ] The real project contains `force-app/main/default`.
- [ ] No placeholder deployable Salesforce metadata was created just to satisfy the folder shape.

## What Not To Do

- Do not deploy this helper repo as a Salesforce project.
- Do not put private keys, auth files, org IDs, or customer data in the helper repo.
- Do not ask Codex to edit Salesforce files until it has found the real `force-app/main/default`.
