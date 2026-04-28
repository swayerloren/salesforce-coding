# Salesforce Record Page Guide

## Core Rule

A Lightning component deployment does not prove user visibility. Record-page behavior depends on page activation, component placement, app/profile/record type assignment, form factor, layout configuration, actions, and permissions.

Codex must inspect the full activation chain before editing record-page metadata.

## Record Page Investigation Order

1. Identify object API name, app, profile or permission context, record type, and form factor.
2. Inspect object `View`, `Edit`, and `New` action overrides.
3. Inspect the active FlexiPage metadata for the relevant form factor.
4. Inspect custom Aura templates if the FlexiPage uses one.
5. Inspect page layouts and layout assignment by record type/profile.
6. Inspect compact layout assignment and Highlights Panel behavior.
7. Inspect quick actions, platform action list, Dynamic Actions, and overflow behavior.
8. Inspect component `.js-meta.xml` targets and supported form factors.
9. Inspect permissions, Apex class access, object permissions, field permissions, and custom permissions.
10. Reproduce or reason separately for desktop and mobile when both are supported.

## Activation Chain

| Layer | What To Inspect |
| --- | --- |
| Component metadata | `lwc/<component>/<component>.js-meta.xml` targets, target configs, and form factors. |
| FlexiPage placement | `flexipages/*.flexipage-meta.xml` component instances, regions, visibility filters, Dynamic Forms, Dynamic Actions. |
| Object override | `objects/<Object>/<Object>.object-meta.xml` action overrides for View/Edit/New and form factor. |
| App/profile/record type activation | Page activation metadata and assignments where represented in source. |
| Layout assignment | `layouts/*.layout-meta.xml`, record type assignment, related lists, buttons, and action lists. |
| Permissions | `permissionsets/`, profiles if required, Apex class access, object/field permissions, custom permissions. |
| App navigation | `applications/` and `tabs/` when page access depends on app nav. |

## Standard vs Custom Components

Use standard components when they already satisfy the need:

- Highlights Panel,
- Path,
- Activities,
- Chatter,
- Related List,
- Dynamic Related List,
- Record Detail,
- Dynamic Forms.

Use custom LWC when:

- data comes from multiple objects,
- the UX is not possible with standard components,
- server authorization or token checks are required,
- a workflow needs custom state, modals, or guided actions.

## FlexiPage And Aura Templates

Custom Aura templates often define a layout engine through named regions. Preserve region names, attributes, and lazy rendering behavior. A FlexiPage component placement can break if the template region contract changes.

Before changing a FlexiPage:

- inspect the template and region names,
- check desktop and mobile form factors,
- keep component instance IDs and visibility filters stable where possible,
- avoid broad reserialization churn.

## Dynamic Forms And Page Layouts

Dynamic Forms, standard record detail panels, and page layouts can coexist.

Check whether fields and buttons come from:

- Dynamic Forms field sections in FlexiPage metadata,
- `force:detailPanel`,
- `force:recordDetailPanelMobile`,
- page layout field sections,
- custom LWC rendering.

Desktop and mobile may not use the same field-rendering system.

## Action Visibility

Actions can be configured but not visible because:

- action is not on the layout or Highlights Panel action list,
- action is hidden by Dynamic Actions visibility,
- action is in overflow due to `numVisibleActions`,
- page assignment differs by app, profile, record type, or form factor,
- user lacks Apex class access,
- user lacks object, field, or custom permission access,
- object override points to another page,
- mobile page is different from desktop page.

For quick-action bugs, inspect the quick action metadata, target component, layout placement, page activation, and permissions together.

## Mobile Record Pages

Mobile record pages often use different field rendering and component ordering. A desktop fix can miss mobile if:

- Small form factor uses another FlexiPage,
- mobile uses `force:recordDetailPanelMobile`,
- custom component does not support Small form factor,
- action appears only in overflow or not in native actions,
- mobile webview behavior changes modal, file, or navigation behavior.

## Related Lists

Standard related lists, Dynamic Related Lists, and Apex-backed custom lists are different systems.

Do not assume:

- adding a related list updates a custom LWC,
- deleting a file refreshes a standard related list automatically,
- a Dynamic Related List has the same behavior as a page-layout related list,
- a custom component receives record updates without explicit refresh logic.

## Codex Record Page Rules

- Do not edit only the component when the root cause is assignment, activation, or permission metadata.
- Do not edit profiles blindly to make an action visible.
- Do not deploy broad FlexiPage/layout/profile payloads.
- Use narrow source edits and narrow deploy validation where possible.
- State when runtime activation cannot be fully verified locally.
