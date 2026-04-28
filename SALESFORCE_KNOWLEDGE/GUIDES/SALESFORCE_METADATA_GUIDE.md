# Salesforce Metadata Guide

## High-Risk Topic Links

- [Destructive Deployment Safety](../TOPICS/deployment/destructive-deployment-safety.md)
- [Sharing, CRUD/FLS, And User Mode Matrix](../TOPICS/security/sharing-crud-fls-user-mode-matrix.md)
- [Trigger Order Of Execution](../TOPICS/apex/trigger-order-of-execution.md)

## Core Rule

Codex must inspect existing metadata before editing. Do not invent object API names, field API names, layout names, FlexiPage names, quick action names, permission set names, profile names, record type names, or app/tab names.

Metadata changes are often higher blast radius than code changes because visibility, assignment, activation, and permissions are spread across several files.

Official Metadata API support varies by metadata type and release. Before adding retrieve, deploy, package, or destructive-deploy claims, verify the current metadata type in official docs or the metadata coverage report.

## Salesforce DX Source Structure

Most deployable metadata should live under the real project path:

```text
force-app/main/default/
  applications/
  aura/
  classes/
  customMetadata/
  customPermissions/
  dashboards/
  email/
  flexipages/
  layouts/
  lwc/
  objects/
  pages/
  permissionsets/
  profiles/
  quickActions/
  reports/
  staticresources/
  tabs/
  triggers/
```

Common object-scoped metadata lives below each object folder:

```text
force-app/main/default/objects/Account/
  Account.object-meta.xml
  compactLayouts/
  fields/
  listViews/
  recordTypes/
  validationRules/
  webLinks/
```

Codex must preserve this structure. Do not create deployable metadata outside `force-app/main/default` unless the project already has a valid package directory in `sfdx-project.json`.

## Metadata Family Map

| Metadata | Expected path | Codex checks |
| --- | --- | --- |
| Objects | `objects/<Object>/<Object>.object-meta.xml` | Verify object exists before referencing fields, layouts, actions, or permissions. |
| Fields | `objects/<Object>/fields/<Field>.field-meta.xml` | Verify field API name, type, relationship name, and FLS dependencies. |
| Validation rules | `objects/<Object>/validationRules/*.validationRule-meta.xml` | Check formulas, active state, field dependencies, and deployment impact. |
| Record types | `objects/<Object>/recordTypes/*.recordType-meta.xml` | Check page/layout assignment, picklist values, permissions, and hard-coded references. |
| Compact layouts | `objects/<Object>/compactLayouts/*.compactLayout-meta.xml` | Check Highlights Panel behavior and mobile compact display. |
| Layouts | `layouts/*.layout-meta.xml` | Check field placement, related lists, buttons, quick actions, and record type assignment. |
| FlexiPages | `flexipages/*.flexipage-meta.xml` | Check component placement, Dynamic Forms, Dynamic Actions, form factor, and activation chain. |
| Quick actions | `quickActions/*.quickAction-meta.xml` or object-scoped action metadata | Check action type, target object, target component, layout placement, and permissions. |
| Permission sets | `permissionsets/*.permissionset-meta.xml` | Prefer targeted access changes here when project conventions allow. |
| Profiles | `profiles/*.profile-meta.xml` | High-risk. Do not edit blindly or retrieve/deploy broad profile churn. |
| Tabs | `tabs/*.tab-meta.xml` | Check app navigation and object/component target. |
| Applications | `applications/*.app-meta.xml` | Check navigation items, utility items, and app-level page visibility. |
| Custom metadata | `customMetadata/*.md-meta.xml` | Good for deployable config, never for secrets. |
| Custom permissions | `customPermissions/*.customPermission-meta.xml` | Check permission set/profile assignment and Apex/LWC references. |
| Static resources | `staticresources/*` plus metadata XML | Check bundle contents, file type, cache control, and public-safety risk. |
| Email | `email/**` | Check folders, templates, letterheads, merge fields, and references. |
| Reports | `reports/**` | Check folder structure, object/report type dependencies, and private data risk. |
| Dashboards | `dashboards/**` | Check report dependencies, running user risk, and folder structure. |

## Page Activation vs Layout Assignment

A record-page issue can involve both Lightning page activation and classic/page-layout assignment.

Check:

- object `actionOverrides` for `View`, `Edit`, `New`, and form factor,
- FlexiPage activation by app, profile, record type, and form factor,
- page layout assignment by profile and record type,
- compact layout assignment,
- Dynamic Forms field sections,
- Dynamic Actions visibility rules,
- app navigation and tab availability.

Do not assume a component appears to users just because the component deploys or exists in a FlexiPage.

## Dynamic Forms And Dynamic Actions

Dynamic Forms and Dynamic Actions can move behavior out of traditional page layouts.

Before editing fields, buttons, actions, or visibility:

- inspect the FlexiPage for field sections and visibility filters,
- inspect page layouts for fallback/mobile/detail-panel behavior,
- inspect compact layouts and Highlights Panel actions,
- check whether desktop and mobile use different form factors or page assignments,
- verify object, record type, app, and profile activation.

## Permission Sets vs Profiles

Prefer permission sets for targeted access changes when the project already follows that pattern.

Profiles are high-risk because retrieved profile XML often contains broad unrelated org state. Codex must not blindly edit or deploy profiles. If a profile change is required:

- inspect the existing profile file first,
- keep the change minimal,
- avoid reformatting the entire profile,
- document why a permission set is not enough,
- validate the deployment scope carefully.

Permission changes need a complete access review:

- object permissions,
- field permissions,
- Apex class access,
- tab and app visibility,
- custom permissions,
- record type access,
- external or portal user context when relevant.

Do not add broad profile changes to make a UI visible before checking component metadata, FlexiPage activation, layout placement, and Apex class access.

## Package Manifest Safety

For deployment or validation work, keep `package.xml` narrow.

Recommended manifest rules:

- include only changed metadata and required dependencies,
- avoid `*` members for high-blast-radius types such as `Profile`, `Layout`, `FlexiPage`, and `PermissionSet`,
- include object dependencies when deploying fields, validation rules, record types, or compact layouts,
- include Apex tests only as needed by deployment policy,
- inspect generated manifests before deploy or validate.

Do not deploy wide metadata payloads to "see what happens."

## Destructive Deployment Safety

Deletion metadata must be reviewed separately from feature metadata.

Before any destructive deployment:

- list exact metadata type and full name,
- inspect source and org references,
- check dependencies across Apex, LWC, Flow, layouts, FlexiPages, quick actions, permission sets, profiles, reports, dashboards, email templates, and static resources,
- keep the destructive manifest narrow,
- run validation-only first,
- document rollback or restore strategy,
- get explicit approval before real deletion.

Never use wildcard destructive members. Never delete metadata only because a retrieve did not return it.

## Validation Before Claiming Success

Codex can claim metadata success only with evidence:

- local source structure inspected,
- linked metadata dependencies checked,
- validation command run and passed, or skipped with a concrete reason,
- activation, assignment, form factor, and permissions reviewed when UI visibility is involved.

If no target org or real Salesforce DX project is available, say that only documentation/static review was completed.

## Static Resources, Email, Reports, And Dashboards

These folders can accidentally expose private data.

Before adding or editing them:

- inspect file contents,
- avoid screenshots, exports, customer names, private URLs, and credentials,
- verify folder metadata and dependencies,
- keep deployment scope narrow,
- document any owner review needed for public repos.

## Codex Metadata Rules

- Inspect existing metadata before editing.
- Verify every referenced API name in source.
- Do not invent objects, fields, record types, permissions, pages, tabs, apps, layouts, reports, dashboards, or actions.
- Do not assume a component appears on a page just because it deploys.
- Check activation, assignment, permissions, and form factor for record-page behavior.
- Preserve Salesforce DX source format.
- Avoid profile churn and broad metadata retrieves.
- Use Salesforce Code Analyzer and deployment validation when available and appropriate.
- Keep destructive changes separate from ordinary deploys.
- Verify official metadata type names before writing package or destructive manifests.
