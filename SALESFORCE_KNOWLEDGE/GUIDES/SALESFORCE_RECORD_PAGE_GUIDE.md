# Salesforce Record Page Guide

## Record Page Investigation Order

1. Identify object API name and form factor.
2. Inspect object `View` action overrides.
3. Inspect active FlexiPage metadata.
4. Inspect custom Aura template if used.
5. Inspect page layout and compact layout.
6. Inspect quick actions and Highlights Panel action list.
7. Inspect component `.js-meta.xml` targets.
8. Inspect permissions and FLS.
9. Reproduce in desktop and mobile if both are supported.

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

## FlexiPage and Aura Templates

Custom Aura templates often define a layout engine through named regions. Preserve region names and lazy rendering behavior. A FlexiPage component placement can break if the template region contract changes.

## Action Visibility

Actions can be configured but not visible because:

- action is in overflow,
- page assignment differs by app/profile/form factor,
- user lacks Apex class access,
- user lacks object or field permission,
- Dynamic Actions hide it,
- object override points to another page,
- mobile page is different from desktop page.

## Mobile Record Pages

Mobile record pages often use different field rendering and component ordering. A desktop fix can miss mobile if:

- Small form factor uses another FlexiPage,
- mobile uses `force:recordDetailPanelMobile`,
- custom component does not support Small form factor,
- action appears only in overflow or not in native actions.

## Related Lists

Standard related lists, Dynamic Related Lists, and Apex-backed custom lists are different systems.

Do not assume:

- adding a related list updates a custom LWC,
- deleting a file refreshes a standard related list automatically,
- a Dynamic Related List has the same behavior as a page-layout related list.

