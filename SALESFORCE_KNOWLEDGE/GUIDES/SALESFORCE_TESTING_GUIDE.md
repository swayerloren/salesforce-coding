# Salesforce Testing Guide

## Test The Contract, Not A Guess

Many Salesforce test failures come from stale assumptions. When behavior changes intentionally, tests should assert the new contract:

- no unsafe advancement,
- retry date set,
- duplicate blocked,
- optional integration skipped safely,
- status unchanged,
- source-of-truth field wins,
- existing populated values preserved.

Do not keep old literals if current automation normalizes them before the assertion.

## Test Data

Good test data:

- creates only required records,
- uses factories for shared required fields,
- avoids real org state,
- avoids `SeeAllData=true` unless no reasonable alternative exists,
- uses stable unique values,
- includes both populated and blank optional fields.

Tests must create their own data unless the platform object cannot reasonably be created in a test context. Do not depend on customer records, sandbox data, usernames, profile names, org IDs, record type IDs, or existing metadata that was not verified in source.

## Assertions

Every meaningful test should assert behavior, not only execute code for coverage.

Good assertions check:

- records were inserted, updated, deleted, or left unchanged as intended,
- errors are thrown for invalid input,
- async work produced the expected durable result,
- callouts were mocked and interpreted correctly,
- sharing or permission behavior is enforced when relevant,
- no unintended records were changed.

Do not weaken assertions or replace them with broad `System.assert(true)` style checks just to make tests pass.

## Files In Tests

Salesforce Files tests can be fragile:

- `ContentVersion` inserts can create row locks in broad parallel test runs.
- `ContentDocumentLink` behavior is event-driven and may create unexpected side effects.
- Latest-version logic matters.

Use `@IsTest(isParallel=false)` only where file row locks make parallel execution unreliable. Do not use it as a blanket fix.

## Batch Tests

Inside one test method, Apex allows only one batch execution scope. If your test data creates two qualifying chunks and the batch size is one, the test can fail with:

```text
No more than one executeBatch can be called from within a test method
```

Fix by using a batch size large enough to process test records in one execute scope or splitting scenarios.

## Callouts

Every callout path needs a mock. For provider abstractions:

- mock successful response,
- mock auth failure,
- mock missing config,
- mock provider-specific strategy,
- avoid real external calls after DML.

If a real callout would be impossible in the test transaction shape, use a narrow `@TestVisible` bypass that preserves the production contract.

## Async

Use `Test.startTest()` and `Test.stopTest()` around async work. Also test paths that skip enqueueing inside existing async contexts if the production code has such guards.

## Security And Sharing Tests

When production Apex enforces sharing, CRUD/FLS, user mode, permission sets, or custom metadata switches, tests should include the relevant user or permission context when practical.

Use `System.runAs()` to prove user-context behavior when it matters. Keep test users generic and created in the test or factory. Do not use real usernames, profile IDs, permission set IDs, or org-specific IDs.

## Coverage Strategy

- Add branch coverage for validation and error paths in new deploy-bound classes.
- Prefer focused subsystem tests over broad unrelated tests for narrow production deploys.
- Query org-wide coverage separately from package deploy coverage.
- Do not chase high org-wide coverage through risky broad refactors in a hotfix.

## Validation Commands

Focused test command examples live in [../../QUALITY_GATES/examples/apex-test-command-examples.md](../../QUALITY_GATES/examples/apex-test-command-examples.md).

Codex must not claim Apex tests passed unless an Apex test command actually ran and passed.
