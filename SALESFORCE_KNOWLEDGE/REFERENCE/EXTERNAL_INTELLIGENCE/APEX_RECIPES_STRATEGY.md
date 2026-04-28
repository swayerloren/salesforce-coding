# Apex Recipes Strategy

Source reference: https://github.com/trailheadapps/apex-recipes

Use Apex Recipes as a public pattern catalog for Apex design. Do not copy recipe classes, triggers, sample metadata, test data, or permission names into a user's project.

## What Codex Should Learn

| Area | Pattern intelligence | Codex action |
| --- | --- | --- |
| SOQL and DML | Query and mutation examples should be bulk-safe and injection-aware. | Inspect existing selectors/services and avoid SOQL/DML in loops. |
| Services | Service methods should express business behavior without mixing UI and persistence concerns unnecessarily. | Preserve the user's service/controller boundary. |
| Async Apex | Queueable, batch, scheduled, and future work need testable boundaries and `Test.startTest()` / `Test.stopTest()`. | Inspect async callers and side effects before editing. |
| Triggers | Trigger handlers should keep triggers thin and preserve before/after sequencing. | Identify existing trigger framework before changes. |
| Security | Sharing, CRUD/FLS, strip-inaccessible, and named credential patterns are first-class concerns. | Make access intent explicit and validate against project conventions. |
| Testing | Tests need their own data, callout mocks, async flushing, and real assertions. | Do not weaken assertions to force green tests. |
| Files | ContentDocument, ContentVersion, and ContentDocumentLink behavior needs careful sharing and latest-version handling. | Read file guide and inspect file-related tests. |

## Before Applying A Pattern

- [ ] Real `force-app/main/default` is confirmed.
- [ ] Target Apex, metadata pair, tests, and callers are inspected.
- [ ] Object and field names are verified locally.
- [ ] Existing service, selector, trigger, DTO, and test-factory conventions are identified.
- [ ] Recipe names are not imported into the user's source.

## Good Uses

- Learning how to structure a bulk-safe method.
- Learning when to isolate callouts, async work, or trigger handlers.
- Learning what categories of tests to write.
- Learning what security concerns to check.

## Unsafe Uses

- Copying a recipe class directly.
- Copying sample objects, fields, permission sets, custom metadata, or data setup.
- Assuming a recipe pattern fits without checking org metadata.
- Adding broad abstractions just because a recipe uses one.

## Validation Pairing

| Change | Pair with |
| --- | --- |
| Apex production code | Focused Apex tests, Salesforce Code Analyzer, static review. |
| Trigger behavior | Trigger tests, bulk tests, recursion/ordering review. |
| Callout behavior | Callout mocks, named credential metadata inspection. |
| Async behavior | Async-focused tests with start/stop test. |
| File behavior | File tests, permissions and sharing review. |
