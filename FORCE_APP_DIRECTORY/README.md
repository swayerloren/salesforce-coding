# Force App Directory

This folder is where users can place or reference their real Salesforce DX project.

The repo does not include user Salesforce metadata by default. It provides Codex instructions, the Salesforce knowledge base, public-safe examples, Memory, History, and workspace reports.

## Required Metadata Path

Codex must locate this path before editing Salesforce source:

```text
force-app/main/default/
```

Do not treat this folder as a Salesforce DX project until real project metadata exists here or an external project path is documented.

## User Options

| Option | How it works |
| --- | --- |
| Copy project here | Place the Salesforce DX project inside `FORCE_APP_DIRECTORY/`. |
| Reference external project | Keep the Salesforce DX project elsewhere and document the path below. |

## New User Setup

After downloading and extracting the release ZIP:

1. Open the extracted helper repo in VS Code.
2. Decide whether the real Salesforce DX project will be copied here or kept outside the helper repo.
3. If copied here, confirm the real project includes `sfdx-project.json` and `force-app/main/default`.
4. If kept outside, record the project pointer in the external path section below.
5. Ask Codex to read `START_HERE.md` before any Salesforce task.

Codex should inspect this folder only to locate the real project. It must not create fake deployable metadata or treat this placeholder folder as live Salesforce source.

## Recommended Placement

```text
FORCE_APP_DIRECTORY/my-salesforce-project/force-app/main/default/
```

Common real project metadata paths after placement:

```text
FORCE_APP_DIRECTORY/my-salesforce-project/force-app/main/default/classes/
FORCE_APP_DIRECTORY/my-salesforce-project/force-app/main/default/lwc/
FORCE_APP_DIRECTORY/my-salesforce-project/force-app/main/default/objects/
```

These are path examples only. Codex must inspect the actual Salesforce DX project before editing.

## External Project Path

If the real Salesforce DX project lives outside this repo, document it here:

```text
Actual Salesforce Project Path:
[PASTE PATH HERE]
```

Optional details:

```text
Actual force-app/main/default Path:
[PASTE PATH HERE]

Target Org Alias:
[PASTE ALIAS HERE]
```

## Safety Rules

- [ ] Do not place placeholder deployable Apex, LWC, object, layout, or metadata files in this folder.
- [ ] Do not create a placeholder `force-app/main/default` tree.
- [ ] Do not commit credentials, auth files, tokens, private keys, local Salesforce CLI state, retrieved private data, generated deploy artifacts, or raw debug logs.
- [ ] Do not commit real project metadata unless the repo owner intentionally wants that metadata public.
- [ ] Keep this folder public-safe before pushing to GitHub.

## Codex Confirmation Checklist

Before editing Salesforce source, Codex must be able to answer:

- [ ] Which Salesforce DX project is the target?
- [ ] Where is the real `force-app/main/default` folder?
- [ ] Which files under that folder are relevant to the task?
- [ ] Which command maps, parameter maps, quality strategies, and validation flows apply?
- [ ] Which validation can run locally, and which checks must be skipped or run in a real org?
