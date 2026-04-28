# Metadata-Safe Deployment Structure

## Narrow Change Package

For a small LWC/controller fix, deploy only:

```text
force-app/main/default/lwc/myComponent
force-app/main/default/classes/MyComponentController.cls
force-app/main/default/classes/MyComponentControllerTest.cls
```

Avoid bundling:

- unrelated FlexiPages,
- layouts,
- profiles,
- broad object metadata,
- app pages,
- documentation.

## When Metadata Must Be Included

Include metadata only when behavior requires it:

- quick action to expose an LWC action,
- FlexiPage to place a component,
- object field to support code,
- permission set for class/field access,
- CMDT record for runtime settings.

## Review Before Deploy

- `git diff` or local file diff for touched paths.
- Confirm no generated metadata churn.
- Confirm tests cover changed Apex.
- Confirm form-factor impact for record pages.
- Confirm package does not include private docs.

## Destructive Changes

Deletion belongs in a separate reviewed package. Before any destructive deployment:

- list exact metadata type and full name,
- inspect references and dependencies,
- keep destructive manifests narrow,
- run validation-only first,
- document rollback,
- get explicit approval before real deletion.

Do not use wildcard destructive members and do not delete metadata only because it is absent from a local retrieve.

## Evidence Before Success Claims

For metadata work, report the strongest evidence actually obtained:

- static source review,
- local project validator,
- Code Analyzer,
- deploy dry run,
- focused Apex tests,
- real deploy.

Do not describe static review as deployment validation.
