# LWC Anti-Patterns

These patterns commonly compile, render, or refresh incorrectly in Salesforce.

## JavaScript Expressions In Templates

LWC templates do not support arbitrary expressions.

Bad:

```html
<lightning-button disabled={isSaving || !recordId}></lightning-button>
```

Better:

```js
get isSaveDisabled() {
  return this.isSaving || !this.recordId;
}
```

```html
<lightning-button disabled={isSaveDisabled}></lightning-button>
```

## Manual URL Construction

Avoid hand-building Lightning URLs for records, files, objects, or navigation. Use `NavigationMixin` unless a platform-supported page reference cannot express the target.

## Stale Data After Save

Do not assume a successful Apex call refreshes every UI surface. Refresh the actual data source, notify LDS consumers, or dispatch a parent refresh event.

## Desktop-Only Interactions

Hover-only menus, tiny close buttons, fixed panels without safe-area padding, and blob-only file preview often fail on mobile.

## Imperative DOM Manipulation

Directly mutating DOM outside LWC ownership is fragile. Use tracked state, template conditions, class getters, and supported Lightning base components.

## Hidden Metadata Problems

If the component is not visible, do not immediately edit JavaScript. Check `.js-meta.xml`, FlexiPage assignment, app/profile/form-factor activation, visibility filters, and action placement.

