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

## Coverage Strategy

- Add branch coverage for validation and error paths in new deploy-bound classes.
- Prefer focused subsystem tests over broad unrelated tests for narrow production deploys.
- Query org-wide coverage separately from package deploy coverage.
- Do not chase high org-wide coverage through risky broad refactors in a hotfix.

