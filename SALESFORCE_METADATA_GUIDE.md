# Salesforce Metadata Guide

## Source Structure

In SFDX source format, common deployable metadata lives under:

```text
force-app/main/default/
  aura/
  classes/
  customMetadata/
  externalCredentials/
  flexipages/
  globalValueSets/
  layouts/
  lwc/
  namedCredentials/
  objects/
  pages/
  permissionsets/
  quickActions/
  tabs/
  triggers/
```

Never assume a behavior is code-only. Page placement, action visibility, object overrides, and permissions often live in metadata.

## FlexiPage Assignment

Strong evidence for active record page assignment can come from object metadata action overrides:

```xml
<actionOverrides>
  <actionName>View</actionName>
  <type>Flexipage</type>
  <content>My_Record_Page</content>
  <formFactor>Large</formFactor>
</actionOverrides>
```

Large and Small form factors can point to different pages.

## Dynamic Forms vs Page Layouts

Do not collapse field rendering into one model.

Salesforce record pages can use:

- Dynamic Forms field sections in FlexiPage metadata,
- standard `force:detailPanel` or `force:recordDetailPanelMobile`,
- page layouts for fields, buttons, and related lists,
- custom LWCs for selected fields.

Desktop might use Dynamic Forms while mobile still uses a page-layout detail panel.

## Quick Actions

Action visibility can depend on:

- quick action metadata,
- layout platform action list,
- Highlights Panel action names,
- Dynamic Actions rules,
- page activation,
- form factor,
- profile/permission access,
- `numVisibleActions` overflow behavior.

If an action is not visible, check all of those before debugging the LWC.

## Custom Tabs

A custom tab can point directly to:

- a FlexiPage app page,
- an LWC component,
- a Visualforce page,
- an object home,
- a standard Salesforce destination.

App navigation can omit a tab even if the tab metadata exists.

## Custom Metadata

Custom Metadata is excellent for deployable defaults but not for secrets. Use it for labels, object names, action config, feature flags, and provider choices. Do not store credentials or tokens in public examples.

