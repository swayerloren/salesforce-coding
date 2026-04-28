# Dynamic Record Field LWC Rules

Dynamic field components are useful when admins configure which fields appear at runtime. They are also easy to make unsafe if the component trusts field names without metadata checks.

## Required Contract

Before rendering or saving a dynamic field, establish:

- object API name;
- record ID when editing an existing record;
- field API names from a trusted source;
- field metadata and data type;
- readable, createable, and updateable access;
- requiredness and compound-field behavior;
- save path and refresh path.

Do not render or save a field just because a client-side config lists it.

## Metadata And Security Rules

- Resolve field metadata through UI API, LDS metadata, or server-side describe logic.
- Drop inaccessible fields from the UI or show an admin-safe configuration warning.
- Never send field names from the browser straight into dynamic SOQL or DML without allowlisting against metadata.
- Treat encrypted, address, geolocation, lookup, picklist, multipicklist, rich text, file, and formula fields as type-specific cases.
- Do not expose hidden field names, private labels, debug payloads, or raw exception details to end users.

## Rendering Rules

| Field type | LWC handling |
| --- | --- |
| Text, number, date, checkbox | Standard input components when metadata allows edit. |
| Picklist | Use valid values for the record type when available. |
| Lookup | Prefer standard record form fields or a vetted lookup component. |
| Address | Treat compound and component fields deliberately. |
| Formula, rollup, audit fields | Display-only unless metadata proves edit support. |
| Rich text | Render carefully and avoid trusting arbitrary HTML. |

Dynamic components still must follow normal LWC template rules. Compute field visibility, labels, classes, and error state in JavaScript getters or prebuilt view models, not inline template expressions.

## Save Rules

- Build a field-value map only from verified field metadata.
- Validate required fields before save when the UI can detect missing input.
- Let Salesforce validation rules and field-level errors surface back to the matching input.
- Use LDS update APIs for focused record updates when possible.
- Use Apex only when the save needs cross-object logic, transaction control, external integration, or server-side policy.
- Refresh LDS, wired Apex, parent components, and page state after a successful save.

## Admin Configuration Failures

Show an admin-facing warning when:

- no configured fields are valid;
- a configured field no longer exists;
- a field exists but is not readable or updateable;
- the component is placed on the wrong object;
- record type specific picklist values cannot be loaded;
- a compound field is configured in a way that cannot be edited safely.

Warnings should be generic and public-safe. Do not print local paths, raw metadata dumps, org IDs, or private object data.

## Test And Review Checklist

- [ ] Valid field renders with the expected label and value.
- [ ] Inaccessible field is excluded or shown as a safe admin warning.
- [ ] Missing field does not crash the component.
- [ ] Required field errors display at the field or form level.
- [ ] Compound address fields are handled intentionally.
- [ ] Save refreshes every affected UI surface.
- [ ] Mobile layout stays usable with long labels and validation messages.
