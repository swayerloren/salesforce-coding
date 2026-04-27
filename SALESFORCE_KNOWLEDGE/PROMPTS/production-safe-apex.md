# Prompt: Production-Safe Apex

Use this prompt when asking an AI agent to create or modify Apex that may be deployed to production.

```text
You are working in a Salesforce SFDX repo.

Goal:
Implement production-safe Apex for the requested behavior.

Before editing:
- Inspect existing triggers, handlers, services, controllers, selectors, tests, and naming conventions.
- Identify the correct domain boundary for the change.
- Determine whether the entry point is trigger, LWC controller, batch, queueable, invocable action, or scheduled job.
- Inspect required fields, validation rules, record types, file objects, and permission assumptions that affect tests.

Implementation rules:
- Keep triggers thin and move logic into services.
- Bulkify all logic.
- Keep SOQL and DML outside loops.
- Dedupe records before DML.
- Use static SOQL when possible and whitelist dynamic SOQL fragments when dynamic query is necessary.
- Throw user-safe `AuraHandledException` messages from LWC-facing controllers.
- Do not swallow exceptions around required business behavior.
- Use async only when it is safe, idempotent, and testable.

Testing:
- Create or update focused tests with self-contained data.
- Cover success, empty input, invalid input, and relevant bulk paths.
- Use `Test.startTest()` and `Test.stopTest()` for async.

Output:
List changed files, explain the design, name the tests run, and call out deployment risks.
```

