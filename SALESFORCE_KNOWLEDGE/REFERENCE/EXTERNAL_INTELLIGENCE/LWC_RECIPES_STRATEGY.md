# LWC Recipes Strategy

Source reference: https://github.com/trailheadapps/lwc-recipes

Use LWC Recipes as a pattern catalog for Lightning Web Component behavior. Do not copy components, sample Apex, sample objects, message channels, data files, or metadata into a user's project.

## What Codex Should Learn

| Area | Pattern intelligence | Codex action |
| --- | --- | --- |
| Wire adapters | Wire data has loading, data, and error states. | Inspect current wire usage and test both data and error paths. |
| Imperative Apex | Imperative calls need explicit loading, error, refresh, and DTO handling. | Verify Apex method names and return shapes in source. |
| Navigation | `NavigationMixin` behavior depends on page reference type and context. | Inspect page/action/record context before changing navigation. |
| Toasts | Toasts should communicate user-visible results without hiding errors. | Preserve meaningful error handling. |
| Forms | `lightning-record-edit-form` and LDS patterns depend on object/field metadata and permissions. | Verify fields and permissions before editing forms. |
| Composition/events | Parent-child contracts matter. | Inspect child APIs, event names, bubbling/composed flags, and parent listeners. |
| Static resources | Libraries and assets have metadata and load timing implications. | Inspect static resource names and load error handling. |
| Jest | Tests should mock wire, Apex, navigation, events, and error states. | Use project Jest conventions if present. |

## LWC Inspection Checklist

- [ ] `.html`, `.js`, `.css`, and `.js-meta.xml` inspected.
- [ ] Related Apex controller and DTO shape inspected.
- [ ] Parent/child components inspected.
- [ ] FlexiPage, quick action, target config, form factor, and permissions inspected when page behavior is involved.
- [ ] Tests inspected if present.
- [ ] LWC Recipes used only for pattern shape.

## Pattern Decision Table

| User issue | Pattern family to review |
| --- | --- |
| Data does not refresh | Wire refresh, imperative Apex refresh, LDS notification, parent state flow. |
| Button/action fails | Event handling, quick action metadata, Apex controller, toast/error handling. |
| Form field missing | Object/field metadata, permissions, layout/page, form component usage. |
| Navigation wrong | Page reference type, record/object/list context, mobile form factor. |
| Mobile layout broken | CSS overflow, modal sizing, form factor, mobile/offline lint. |

## Validation Pairing

| Change | Pair with |
| --- | --- |
| LWC JavaScript | LWC ESLint and LWC Jest if available. |
| LWC HTML | LWC ESLint/static template review and Jest where behavior changed. |
| Apex-backed LWC | Focused Apex tests plus LWC Jest. |
| Record page behavior | Metadata/FlexiPage/action/permission inspection and deploy dry run if possible. |
