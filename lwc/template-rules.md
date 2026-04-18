# LWC Template Rules

Lightning Web Components templates are intentionally limited. Many deploy-time failures come from writing JavaScript-like expressions in HTML.

## What Fails

These patterns commonly fail template compilation:

```html
<template if:true={items.length}>
```

```html
<lightning-button disabled={isSaving || !recordId}></lightning-button>
```

```html
<div class={active ? 'selected' : ''}></div>
```

```html
<template for:each={records.filter(r => r.visible)} for:item="record">
```

## Use Getters Instead

```js
get hasItems() {
  return Array.isArray(this.items) && this.items.length > 0;
}

get isSaveDisabled() {
  return this.isSaving || !this.recordId;
}

get rowClass() {
  return this.active ? 'selected' : '';
}

get visibleRecords() {
  return (this.records || []).filter((record) => record.visible);
}
```

```html
<template if:true={hasItems}>
  <lightning-button disabled={isSaveDisabled}></lightning-button>
</template>
```

## Rules That Keep Bundles Deployable

- Keep templates declarative.
- Do calculations in JavaScript getters.
- Use stable booleans for `if:true` and `if:false`.
- Do not call functions from templates.
- Do not use bracket notation in templates.
- Keep loop keys stable and unique.
- Do not mutate arrays in place when the UI depends on reactivity.

## Common Getter Pattern

```js
get normalizedRows() {
  return (this.rows || []).map((row) => ({
    ...row,
    key: row.Id || row.tempKey,
    displayName: row.Name || 'Untitled',
    canEdit: !this.readOnly && row.Id
  }));
}
```

