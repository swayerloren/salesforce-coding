# LWC Wire, Imperative Apex, And Cache Rules

Use this when an LWC reads records, saves data, refreshes a page, navigates, or shows completion state.

## Decision Matrix

| Need | Prefer | Why |
| --- | --- | --- |
| Read one record or object metadata | LDS or UI API wire adapter | Standard security, cache, errors, and refresh behavior. |
| Edit a simple record form | `lightning-record-edit-form` | Standard validation, field errors, LDS cache updates, and less custom Apex. |
| Read aggregate or shaped server data | `@AuraEnabled(cacheable=true)` wired Apex | Good for read-only DTOs that need Apex shaping. |
| Save, delete, call out, or run a click-driven action | Imperative Apex | Mutations and one-shot commands should not be wired. |
| Coordinate several data sources | Explicit orchestration in JavaScript | Avoid hidden refresh order and stale UI. |

Do not choose Apex only because it feels more direct. Use Apex when the UI needs server-side policy, multiple objects, aggregate logic, external integration, or a DTO that LDS cannot provide.

## Wire Rules

- Wire adapters are reactive data sources, not command buttons.
- Keep wire config values defined. An undefined reactive parameter can block invocation.
- Treat wired data as read-only. Copy before mutating for local UI state.
- Store the full wired result object when `refreshApex` may be needed.
- Handle all four states: not ready, loading, data, and error.
- Avoid chaining side effects directly inside wire handlers. If a wire result should trigger another action, guard against duplicate execution.
- Do not use a wired Apex method unless the Apex method is safe for `cacheable=true`.

## Imperative Apex Rules

- Use imperative Apex for mutations, non-cacheable reads, external callouts, and explicit user actions.
- Disable the initiating control while the operation is running.
- Await the server result before showing a success toast.
- Refresh every affected data source after DML: wired Apex, LDS records, parent components, related lists, and page-level refresh where applicable.
- Reduce errors into a user-safe message, but keep full technical details in logs or developer output.
- Do not assume a successful promise means every async side effect, generated file, rollup, or related record update is complete.

## Record Form Rules

Use `lightning-record-edit-form` when the UI edits fields on one record and can rely on standard Salesforce validation.

Check:

- object API name and record ID are known;
- fields exist and are readable/updateable for the running user;
- required fields are present or intentionally handled;
- `onsuccess` refreshes related UI;
- `onerror` surfaces field-level messages;
- mobile layout fits without relying on hover or desktop-only density.

Use a custom form only when the component needs cross-object orchestration, conditional field sets that standard form components cannot express, external data, or server-side save policy.

## Navigation And Toast Rules

- Use `NavigationMixin` with a PageReference instead of hand-built Lightning URLs.
- Use record, object, named page, and web page types only after verifying the target is supported for the runtime.
- Do not put private data, tokens, raw record payloads, or sensitive state into URL state parameters.
- Use `ShowToastEvent` for success, warning, and recoverable error feedback in Lightning Experience and supported mobile contexts.
- A toast is user feedback, not proof that sibling components, related lists, generated artifacts, or mobile preview state refreshed.

## Refresh Map

| Changed data | Refresh mechanism |
| --- | --- |
| Wired Apex result | Stored wire result plus `refreshApex`. |
| LDS record consumers | `notifyRecordUpdateAvailable` for affected record IDs. |
| Parent component state | Bubble a custom event with a clear contract. |
| Page-level participants | `RefreshEvent` where supported. |
| File upload or generated document | Refresh file list, parent record state, and any async status indicator after completion. |

## Failure Patterns

- Wiring a mutation method and then fighting stale cache.
- Calling imperative Apex and refreshing only the current component while related lists stay stale.
- Showing success before server completion.
- Reusing a stale wired result after reactive parameters changed.
- Hardcoding `/lightning/r/...` URLs that fail in mobile, Experience Cloud, console, or namespaced contexts.
- Treating `lightning-record-edit-form` as proof that every required cross-object rule is satisfied.
