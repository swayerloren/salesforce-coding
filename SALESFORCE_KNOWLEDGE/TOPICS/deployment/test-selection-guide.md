# Test Selection Guide

Salesforce deployments fail less often when test selection is intentional. Pick the narrowest test set that proves the changed behavior while still satisfying org coverage rules.

## Selection Strategy

| Change type | Recommended tests |
| --- | --- |
| Apex service or controller | Direct service/controller tests plus trigger tests if data flow changed |
| Trigger change | Trigger handler tests covering insert, update, delete, undelete as applicable |
| LWC-only change | No Apex tests unless Apex metadata is deployed with it |
| Apex used by LWC | Controller tests with realistic user-facing inputs |
| Field validation or required-field change | Tests that create affected records through the same required-field path |
| Async, batch, queueable | Tests using `Test.startTest()` and `Test.stopTest()` |
| File automation | Tests that insert `ContentVersion` and verify links or rollups |

## Avoid These Mistakes

- Selecting only a new test class that does not cover existing changed Apex.
- Running all tests for every small deployment and hiding the actual failure in unrelated noise.
- Deploying Apex with `NoTestRun` to production.
- Assuming sandbox coverage is the same as production coverage.
- Forgetting tests for helper classes invoked by triggers.

## Practical Commands

```bash
sf project deploy start --source-dir force-app/main/default/classes --test-level RunSpecifiedTests --tests ProjectServiceTest --target-org myOrg
```

```bash
sf apex run test --tests ProjectServiceTest --result-format human --target-org myOrg
```

## Review Checklist

- The selected tests create their own data.
- Tests do not depend on org records, queues, users, or record types by name unless queried defensively.
- Async work is flushed inside `Test.stopTest()`.
- Batch tests use one execute scope.
- Assertions prove behavior, not only line coverage.
- Required fields and validation rules are represented in test data factories.

