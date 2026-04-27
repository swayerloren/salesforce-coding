# Salesforce Apex Guide

## Trigger Standards

- Keep triggers thin.
- Pass `Trigger.operationType`, `Trigger.new`, `Trigger.oldMap`, and affected IDs into a handler.
- Split before-save and after-save logic deliberately.
- Treat trigger execution order as behavior. Do not reorder calls without root cause.
- Assume records can be changed by UI, Flow, Apex, import, API, email service, and integrations.

## Bulk Safety

Every Apex path should handle many records:

- collect IDs in sets,
- query once per object shape,
- use maps for lookup,
- perform DML outside loops,
- dedupe related-record updates before DML,
- use partial DML when a helper update must not break the main operation,
- avoid enqueueing one async job per record.

## SOQL Safety

- Query exactly the fields a mapper dereferences.
- Keep relationship fields in the same query when DTO mapping needs them.
- Validate dynamic field names against describe metadata before query construction.
- Validate operator compatibility. `LIKE`, range, `IN`, and equality are not interchangeable across field types.
- Avoid filtering on brittle user names or profile names when IDs, permissions, or metadata settings are safer.

## Dynamic SOQL Pattern

Use dynamic SOQL only when metadata or user configuration requires it. The minimum safe pattern is:

1. Describe the object.
2. Confirm every requested field exists.
3. Confirm field type supports the requested operator.
4. Bind values instead of string-concatenating user input.
5. Keep limit and order fields allowlisted.

## DML and Cross-Object Updates

When syncing related records:

- define which object wins if both sides changed,
- avoid overwriting populated values with blanks unless explicitly required,
- handle insert, update, delete, and undelete if derived state depends on related rows,
- recompute from source-of-truth data rather than applying only deltas when deletes or retagging are possible,
- de-duplicate update rows by Id before DML.

## Compound Address Fields

Do not write directly to the root compound field in Apex. Write leaf fields:

```text
Address__Street__s
Address__City__s
Address__StateCode__s
Address__PostalCode__s
Address__CountryCode__s
```

Rules:

- Treat structured leaf fields as source of truth.
- Parse legacy text only as fallback when structured fields are blank.
- If setting state code, ensure country code is populated.
- For UI API/LWC, load and save leaf fields, not only the root compound field.

## Async Rules

- Avoid enqueueing Queueables from already async contexts unless the helper explicitly handles it.
- In tests, remember only one `executeBatch` execution is allowed per test method.
- Use callout mocks for every callout path.
- Make retry behavior explicit in fields or logs.
- Use idempotency keys for external messages, uploads, email replies, and analyzer runs.

## Optional Dependencies

If using `System.Callable` or dynamic class lookup:

- document the interface contract,
- log or expose when an optional dependency is missing if admins need to know,
- keep required behavior on direct calls,
- test both dependency-present and dependency-absent paths when possible.

## Production-Safe Apex Checklist

- Does it run in bulk?
- Are all relationship fields queried before use?
- Is every DML list deduped?
- Are optional blanks handled safely?
- Are required failures thrown clearly?
- Are callouts mocked in tests?
- Are tests aligned to current business contract, not stale assumptions?
- Is FLS/sharing considered for exposed controllers?

