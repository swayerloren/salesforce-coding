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
- never run SOQL or DML inside per-record loops,
- dedupe related-record updates before DML,
- use partial DML when a helper update must not break the main operation,
- avoid enqueueing one async job per record.

For trigger, batch, queueable, controller, invocable, and service code, Codex must inspect whether the entry point can receive many records. A method that currently receives one record may still be called from bulk automation later, so keep collection-safe patterns unless the signature and callers prove otherwise.

## SOQL Safety

- Query exactly the fields a mapper dereferences.
- Keep relationship fields in the same query when DTO mapping needs them.
- Validate dynamic field names against describe metadata before query construction.
- Validate operator compatibility. `LIKE`, range, `IN`, and equality are not interchangeable across field types.
- Use bind variables for untrusted values.
- Do not concatenate user input into SOQL.
- Avoid filtering on brittle user names or profile names when IDs, permissions, or metadata settings are safer.
- Do not hard-code record IDs, record type IDs, profile IDs, queue IDs, permission set IDs, or org-specific IDs.

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

## Null Safety

Assume optional data can be absent:

- relationship fields may be null unless explicitly queried and populated,
- aggregate and single-row queries can return no rows,
- maps can miss keys,
- DTO fields can be absent or blank,
- custom metadata can be missing in a sandbox or scratch org.

Use clear guard clauses and explicit error messages for required data. Do not swallow required failures into silent no-ops.

## Sharing And Security Intent

Every Apex class that touches records should have a clear sharing posture:

- use `with sharing` or `inherited sharing` when caller/user context should constrain records,
- use `without sharing` only when system-level access is intentional and documented,
- review CRUD/FLS for UI-facing Apex, external-facing Apex, invocable methods, and controller methods,
- prefer user-mode data operations when the project already uses them and the behavior matches the requirement,
- do not remove security checks to make tests pass.

When changing security behavior, inspect callers and tests first. Security changes can alter data visibility, deployment behavior, and user experience.

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
- Do not enqueue one async job per trigger record.
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
- Is there any SOQL or DML in a loop?
- Are there any hard-coded Salesforce IDs?
- Are all relationship fields queried before use?
- Is every DML list deduped?
- Are optional blanks handled safely?
- Are null, empty-list, and missing-map-key paths safe?
- Are required failures thrown clearly?
- Is sharing/security intent explicit?
- Are CRUD/FLS expectations respected for exposed Apex?
- Are callouts mocked in tests?
- Are tests aligned to current business contract, not stale assumptions?
- Did Salesforce Code Analyzer run, or was it explicitly skipped with a reason?
- Was Apex formatting checked only when configured or requested?
