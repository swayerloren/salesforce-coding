# Salesforce Apex Guide

## High-Risk Topic Links

- [Sharing, CRUD/FLS, And User Mode Matrix](../TOPICS/security/sharing-crud-fls-user-mode-matrix.md)
- [Trigger Order Of Execution](../TOPICS/apex/trigger-order-of-execution.md)
- [ContentDocument Lifecycle](../TOPICS/files/contentdocument-lifecycle.md)
- [Compound Address Fields](../TOPICS/addresses/compound-address-fields.md)
- [Chatter, Email, And Activity Automation](../TOPICS/communication/chatter-email-activity-patterns.md)

## Apex Structure

Keep entry points small and push behavior into explicit layers:

| Layer | Use for | Avoid |
| --- | --- | --- |
| Trigger | Collect context and delegate. | Business logic, queries, and DML spread across trigger branches. |
| Controller | UI contract, DTO shaping, and request validation. | Hidden data-access policy or broad system-mode leaks. |
| Service | Transaction-level business behavior. | Direct references to UI-only assumptions. |
| Selector/query helper | Reusable field-complete queries. | Querying fields a mapper does not need or omitting fields it dereferences. |
| Async worker | Post-commit, large-volume, callout, retry, or generated-artifact work. | One job per record or hidden retry duplication. |

Required behavior should use direct calls. Dynamic class lookup or `System.Callable` belongs only at optional extension points with visible diagnostics and tests for dependency-present and dependency-absent paths.

## Trigger Standards

- Keep triggers thin.
- Pass `Trigger.operationType`, `Trigger.new`, `Trigger.oldMap`, and affected IDs into a handler.
- Split before-save and after-save logic deliberately.
- Treat trigger execution order as behavior. Do not reorder calls without root cause.
- Assume records can be changed by UI, Flow, Apex, import, API, email service, and integrations.
- Inspect validation rules, duplicate rules, record-triggered Flows, invocable Apex, file side effects, and communication side effects before changing trigger behavior.
- Use recursion guards that are scoped to operation and record IDs. Avoid global Boolean guards that skip legitimate later work.
- Test changed and unchanged fields, delete/undelete paths when derived state depends on related records, and bulk behavior.

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
- Tie query shape to limit risk. A query that is fine for one UI record can fail when called by a trigger, batch, Flow, or import.

## Dynamic SOQL Pattern

Use dynamic SOQL only when metadata or user configuration requires it. The minimum safe pattern is:

1. Describe the object.
2. Confirm every requested field exists.
3. Confirm field type supports the requested operator.
4. Bind values instead of string-concatenating user input.
5. Keep limit and order fields allowlisted.
6. Decide whether user-mode query behavior, `WITH SECURITY_ENFORCED`, describe checks, or `stripInaccessible` is required.

## DML and Cross-Object Updates

When syncing related records:

- define which object wins if both sides changed,
- avoid overwriting populated values with blanks unless explicitly required,
- handle insert, update, delete, and undelete if derived state depends on related rows,
- recompute from source-of-truth data rather than applying only deltas when deletes or retagging are possible,
- de-duplicate update rows by Id before DML.
- choose user-mode or system-mode DML deliberately and document why.
- use partial DML only when partial success is part of the contract and errors are surfaced or logged safely.

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

Sharing does not replace CRUD/FLS review. For exposed Apex, decide separately:

- record-sharing posture,
- object-level access,
- field-level access,
- user-mode versus system-mode operation,
- business authorization,
- DTO filtering and error behavior.

Prefer LDS/UI API for simple LWC record access and edits. When moving behavior into Apex, add explicit security checks because the platform-enforced UI API behavior no longer covers the whole path in the same way.

## Communication Automation

Email, Chatter, activity, and notification behavior are side effects with permissions and duplicate risks.

Before adding or changing communication automation:

- identify actor context, target record, audience, and permission model,
- separate message body/template source from mention ranges or merge data,
- define an idempotency key for retries and owner/status changes,
- log failures without message bodies, private URLs, file names, or raw debug content,
- test missing configuration, duplicate prevention, async completion, and denied access when practical.

Use [Before Communication Automation](../CHECKLISTS/before-communication-automation.md) for the detailed preflight.

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

Choose async shape by need:

| Need | Safer starting point |
| --- | --- |
| Post-commit work for a bounded record set | Queueable |
| Large data volume with independent scopes | Batch |
| Time-based recurring operation | Scheduled Apex |
| Simple callout from supported path | Queueable or future only when project conventions require it |
| Publish/subscribe decoupling | Platform event or event-driven architecture |

Exact limits and chaining behavior are version-sensitive. Link to official docs or verify current limits before adding numeric claims.

## Governor-Limit Review

Every Apex change should state its limit risk:

- SOQL query count and row volume,
- DML statement count and row volume,
- CPU-heavy loops and nested loops,
- heap use for Files, PDFs, DTO lists, and large strings,
- callout count and callout-after-DML ordering,
- async enqueue count,
- mixed DML and setup-object interactions.

Do not copy numeric limit tables into this repo. Link to official governor-limit docs when exact numbers matter.

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
