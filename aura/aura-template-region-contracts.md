# Aura Template and Region Contracts

Aura is still common in template-driven Lightning pages and older component shells. Problems usually come from misunderstanding what the parent template owns versus what child LWCs own.

## Practical Rules

- Use Aura for page shell behavior only when the org already depends on Aura templates.
- Keep business logic in Apex services or LWCs, not in Aura controllers.
- Document the region names expected by a Lightning app page template.
- Confirm the FlexiPage uses the intended template before debugging child components.
- Do not assume a component is mounted just because it exists in source.

## Region Debugging

When a component is missing from the page:

1. Confirm the FlexiPage is assigned to the app/profile/form factor.
2. Confirm the template exposes the region used by the component.
3. Confirm the component target includes the page type.
4. Confirm visibility filters are not hiding the component.
5. Confirm the page activation is for the same object and app being tested.

## Aura to LWC Boundary

Use custom events or public `@api` properties for controlled communication. Avoid reaching into child component internals.

```js
// LWC child
this.dispatchEvent(new CustomEvent('refreshrequested', {
  bubbles: true,
  composed: true
}));
```

```xml
<!-- Aura shell -->
<c:childLwc onrefreshrequested="{!c.handleRefreshRequested}" />
```

## Anti-Patterns

- Hiding page activation problems inside child component changes.
- Duplicating business rules in Aura and Apex.
- Renaming template regions without reviewing every assigned FlexiPage.
- Shipping a custom template when a standard record page layout would solve the need.

