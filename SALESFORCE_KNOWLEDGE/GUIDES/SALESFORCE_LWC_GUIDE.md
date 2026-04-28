# Salesforce LWC Guide

## Start With Metadata

Before editing an LWC, open its `.js-meta.xml`.

Check:

- targets: record page, app page, home page, tab, quick action, community;
- target object restrictions;
- form factors;
- public `@api` properties;
- whether it is a direct placement or a child of a host component.

Do not assume a component is desktop-only or internal-only.

## Use Apex vs LDS Intentionally

Use LDS and UI API when reading or editing a focused record, saving simple field updates, using object metadata, or relying on standard validation.

Use Apex when the UI needs multiple objects, server-side security or token validation, aggregate state, DTO shaping, callouts, external storage, or complex permission checks.

## Template Rules

LWC templates do not support arbitrary JavaScript expressions.

Avoid:

```html
<template if:true={items.length > 0}></template>
<div class={isActive ? 'active' : 'idle'}></div>
<span>{record.fields.Name.value || 'Missing'}</span>
```

Use getters:

```js
get hasItems() {
  return Array.isArray(this.items) && this.items.length > 0;
}

get stateClass() {
  return this.isActive ? 'active' : 'idle';
}

get displayName() {
  return this.record?.fields?.Name?.value || 'Missing';
}
```

Codex must move computed state into JavaScript getters before binding it in HTML. Do not use inline ternaries, logical OR expressions, chained property expressions, array length checks, or method calls directly in the template.

## Refresh Patterns

For wired Apex, store the wire result object and call `refreshApex(this.wiredResult)`. Do not rely on fixed delay timers.

For record updates, use `notifyRecordUpdateAvailable([{ recordId }])` after imperative Apex changes. Use `RefreshEvent` or `lightning/refresh` handlers where record-page components should participate in platform refresh.

## Navigation

Use `NavigationMixin`, not hardcoded Lightning URLs, for record view/edit/clone, object home, named pages, and supported web page navigation.

## Toasts and Errors

Every user action should have a clear loading, success, and error state.

Patterns that work:

- disable submit buttons while saving,
- show server error messages after reducing Aura/Apex errors,
- keep full technical detail in logs, not the toast,
- show warnings for admin misconfiguration instead of silent empty UI.

## Mobile and Overlay Rules

- Avoid unsupported DOM mounting such as `document.createElement('c-my-component')`.
- Use `LightningModal` for modal-hosted workflows when possible.
- Decide who owns overlay host, visible shell, scroll lock, and cleanup.
- Use explicit viewport sizing for fullscreen media or viewer shells.
- Do not rely on implicit `height: 100%` ancestor chains.
- Use `pointerdown` or guarded early press events when mobile blur can close menus before selection.

## LWC Quality Gates

After LWC changes, Codex should run or recommend local LWC checks when the real Salesforce DX project supports them.

| Gate | Preferred Command | Rule |
| --- | --- | --- |
| LWC Jest | `npm run test:unit` | Do not claim Jest passed unless it actually ran and passed. |
| LWC ESLint | `npm run lint:lwc` or `npm run lint` | Do not disable LWC rules to hide findings. |
| Mobile lint | `npm run lint:mobile` | Required review area for Salesforce mobile work when configured. |

If `package.json`, Node/npm, Jest, lint scripts, or mobile lint setup is missing, report the gate as skipped with the exact reason. Do not create Node tooling or project config without user approval.

## Dark Mode

Use SLDS global hooks for custom surfaces:

```css
:host {
  --card-bg: var(--slds-g-color-surface-container-1, var(--lwc-colorBackgroundAlt, #ffffff));
  --card-fg: var(--slds-g-color-on-surface-1, #181818);
  --card-border: var(--slds-g-color-border-1, #d8dde6);
}
```

Avoid using OS `prefers-color-scheme` as the source of truth for Salesforce theme. A Salesforce user can choose Light, Dark, or System independently.
