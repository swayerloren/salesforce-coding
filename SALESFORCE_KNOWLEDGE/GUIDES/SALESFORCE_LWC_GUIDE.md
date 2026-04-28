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

Focused topics:

- [Wire, Imperative Apex, And Cache Rules](../TOPICS/lwc/wire-imperative-cache-rules.md)
- [Dynamic Record Field LWC Rules](../TOPICS/lwc/dynamic-record-fields.md)
- [Navigation, Toast, and Refresh Patterns](../TOPICS/lwc/navigation-toast-refresh.md)
- [Mobile Camera And File Handoff](../TOPICS/mobile/mobile-camera-and-file-handoff.md)
- [Quick Action Visibility Matrix](../TOPICS/metadata/quick-action-visibility-matrix.md)

## Use Apex vs LDS Intentionally

Use LDS and UI API when reading or editing a focused record, saving simple field updates, using object metadata, or relying on standard validation.

Use Apex when the UI needs multiple objects, server-side security or token validation, aggregate state, DTO shaping, callouts, external storage, or complex permission checks.

Use this default decision order:

| Need | Default choice |
| --- | --- |
| Edit one record with standard validation | `lightning-record-edit-form` or LDS record APIs. |
| Read standard record data or metadata | LDS or UI API wire adapter. |
| Read shaped, aggregate, or multi-object server data | Wired Apex with `cacheable=true` when read-only. |
| Save, delete, call out, generate files, or run an explicit user command | Imperative Apex. |

For wired Apex, store the wire result if a later `refreshApex` is required. For imperative Apex, await the operation before showing success and refresh every affected surface.

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

Dynamic field components should build a safe view model in JavaScript. Do not bind raw field metadata or unverified field paths directly into template expressions.

## Form Rules

Use `lightning-record-edit-form` for focused record editing when standard Salesforce validation, field-level errors, and LDS refresh behavior are acceptable.

Before choosing a custom form, verify that the feature truly needs cross-object save logic, external data, generated files, conditional field policy, or custom server authorization.

For dynamic field forms:

- verify every object and field API name against metadata;
- check readable/createable/updateable access;
- handle required, picklist, lookup, formula, rich text, address, and compound fields intentionally;
- show safe admin warnings for invalid configuration;
- refresh LDS, wired Apex, parent components, and page state after save.

## Refresh Patterns

For wired Apex, store the wire result object and call `refreshApex(this.wiredResult)`. Do not rely on fixed delay timers.

For record updates, use `notifyRecordUpdateAvailable([{ recordId }])` after imperative Apex changes. Use `RefreshEvent` or `lightning/refresh` handlers where record-page components should participate in platform refresh.

## Navigation

Use `NavigationMixin`, not hardcoded Lightning URLs, for record view/edit/clone, object home, named pages, file navigation, and supported web page navigation.

Use PageReference objects and verify the target type works for the intended runtime: Lightning Experience, console, Salesforce mobile, Experience Cloud, or embedded action modal. Do not place private data, tokens, or raw payloads into URL state.

## Toasts and Errors

Every user action should have a clear loading, success, and error state.

Patterns that work:

- disable submit buttons while saving,
- use `ShowToastEvent` for completion and recoverable failures in supported Lightning contexts,
- show success only after the operation that matters actually completed,
- show server error messages after reducing Aura/Apex errors,
- keep full technical detail in logs, not the toast,
- show warnings for admin misconfiguration instead of silent empty UI.

A toast is not a refresh strategy. After save, upload, file generation, or Chatter post, refresh the specific wire, LDS record, parent component, file list, or page participant that changed.

## Mobile and Overlay Rules

- Avoid unsupported DOM mounting such as `document.createElement('c-my-component')`.
- Use `LightningModal` for modal-hosted workflows when possible.
- Decide who owns overlay host, visible shell, scroll lock, and cleanup.
- Use explicit viewport sizing for fullscreen media or viewer shells.
- Do not rely on implicit `height: 100%` ancestor chains.
- Use `pointerdown` or guarded early press events when mobile blur can close menus before selection.
- Inspect quick action visibility from component metadata through action metadata, layouts, Dynamic Actions, FlexiPage activation, permissions, and form factor.
- Treat camera, file preview, generated PDF, and Chatter-like action flows as mobile-specific validation paths.

## Files, Photos, And PDFs

When an LWC uploads, previews, annotates, generates, or downloads files, read [Photo Capture, Annotation, Viewer, And Generated File Patterns](../TOPICS/files/photo-capture-annotation-viewer.md).

Rules:

- identify whether the UI is working with `ContentVersion`, `ContentDocument`, `ContentDocumentLink`, or a distribution/external URL;
- handle latest-version behavior explicitly;
- do not rely on blob URLs or popup tabs for Salesforce mobile handoff;
- refresh parent records and file lists after upload, delete, relink, new version, annotation, or generated PDF creation;
- verify server-side file and parent access before returning file details to the browser.

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
