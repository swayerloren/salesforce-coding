# Prompt: Create Deployable Test Classes

Use this prompt when Apex needs tests that support production deployment.

```text
You are writing Salesforce Apex tests in an SFDX repo.

Goal:
Create focused tests that prove behavior and can run in deployment validation.

Before coding:
- Inspect target Apex, triggers, validation rules, required fields, record types, and existing test factories.
- Identify whether async, file objects, sharing, or permission behavior is involved.
- Identify the minimum selected test classes needed for deployment.

Rules:
- Do not use `SeeAllData=true` unless the platform feature truly requires it.
- Create all test data inside the test.
- Use factories for required fields, but keep test intent readable.
- Cover success, invalid input, empty input, and bulk paths where relevant.
- Use one batch execute scope in batch tests.
- Use `Test.startTest()` and `Test.stopTest()` for async behavior.
- Assert behavior, not only coverage.

Output:
List test classes added or changed, scenarios covered, selected deployment tests, and any remaining coverage risk.
```

