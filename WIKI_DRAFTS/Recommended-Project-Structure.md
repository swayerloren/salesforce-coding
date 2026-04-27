# Recommended Project Structure

This page shows how to combine the helper repo with a real Salesforce DX project.

## Recommended Layout

```text
salesforce-coding/
  START_HERE.md
  INSTRUCTIONS/
  FORCE_APP_DIRECTORY/
    my-salesforce-project/
      sfdx-project.json
      force-app/
        main/
          default/
            classes/
            triggers/
            lwc/
            aura/
            pages/
            objects/
            flexipages/
            layouts/
            permissionsets/
  SALESFORCE_KNOWLEDGE/
  MEMORY/
  HISTORY/
  WORKSPACE/
```

## Direct Placement Option

```text
FORCE_APP_DIRECTORY/
  sfdx-project.json
  force-app/
    main/
      default/
```

## External Reference Option

If the Salesforce DX project remains elsewhere, keep the helper repo clean and document the external location in `FORCE_APP_DIRECTORY/README.md`.

```text
Actual Salesforce Project Path:
[PASTE PATH HERE]
```

## What Codex Searches For

Codex must find:

```text
force-app/main/default/
```

Common target paths after a real project is available:

```text
force-app/main/default/classes/
force-app/main/default/triggers/
force-app/main/default/lwc/
force-app/main/default/aura/
force-app/main/default/pages/
force-app/main/default/objects/
force-app/main/default/flexipages/
force-app/main/default/layouts/
force-app/main/default/permissionsets/
```

## Good Structure

| Good | Why |
| --- | --- |
| Keep helper docs at repo root and under `SALESFORCE_KNOWLEDGE/`. | Codex can read guidance without confusing it with deployable metadata. |
| Keep real metadata under the real Salesforce DX project. | Deploy and test commands stay scoped to Salesforce source. |
| Keep memory/history in helper folders. | Future Codex sessions can reuse lessons without changing Salesforce metadata. |
| Keep secrets outside the repo. | Public-safety and credential safety remain intact. |

## Avoid

- Creating a placeholder `force-app/main/default` tree.
- Mixing docs into deployable Salesforce metadata.
- Copying private org data into public knowledge docs.
- Asking Codex to deploy this helper repo.
