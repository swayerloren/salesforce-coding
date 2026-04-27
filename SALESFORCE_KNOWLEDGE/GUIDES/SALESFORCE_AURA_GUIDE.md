# Salesforce Aura Guide

Aura still matters in many Salesforce orgs, especially for custom Lightning record page templates and older quick-action/modal flows.

## When Aura Is Still The Right Surface

Aura may be present because:

- a custom record-home template defines FlexiPage regions,
- an older quick action uses an Aura wrapper around LWC or Visualforce,
- a template controls lazy rendering, tab persistence, or App Builder behavior,
- legacy components still own working UI contracts.

Do not remove Aura simply because LWC is newer.

## Aura Record Template Guardrails

Custom record templates define region API contracts. Component placement depends on region names.

Before editing a template:

- list every design region;
- find all FlexiPages using the template;
- inspect runtime behavior versus App Builder behavior;
- confirm which regions render lazily;
- confirm tab default and persistence behavior;
- confirm mobile and desktop variants.

Changing a region name can orphan components in FlexiPage metadata.

## Lazy Rendering

Many custom tab templates render only the active tab at runtime and render all regions in App Builder.

Preserve this distinction when changing templates:

- runtime lazy rendering improves load behavior;
- App Builder all-region rendering keeps admins able to place components;
- mixing the two can make components disappear in Builder or over-render in production.

## Common Aura Failures

- Region names changed without updating FlexiPage metadata.
- Template CSS breaks standard record page spacing.
- Page uses a custom template on desktop but a different mobile page.
- Runtime code assumes `window.location` shape inside App Builder.
- `NoTestRun` deploy attempted for Aura-only production changes.

## Migration Rule

Only migrate Aura to LWC when you can preserve region contracts, page assignment, action behavior, App Builder editing, mobile behavior, accessibility, and existing data/event contracts.

