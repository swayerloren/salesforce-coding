# Apex Test Patterns

Good Salesforce tests prove behavior without relying on private org data. They also make deployments predictable because the tests create the records, metadata assumptions, and edge cases they need.

## Test Data Factory

Use factories to centralize required fields, not to hide test intent.

```apex
@IsTest
public class TestDataFactory {
    public static Account account() {
        return new Account(Name = 'Test Account');
    }

    public static Project__c project(Id accountId) {
        return new Project__c(
            Name = 'Test Project',
            Account__c = accountId,
            Status__c = 'New'
        );
    }
}
```

## Service Test

```apex
@IsTest
private class ProjectServiceTest {
    @IsTest
    static void marksProjectComplete() {
        Account account = TestDataFactory.account();
        insert account;

        Project__c project = TestDataFactory.project(account.Id);
        insert project;

        Test.startTest();
        ProjectService.markComplete(new Set<Id>{ project.Id });
        Test.stopTest();

        Project__c saved = [
            SELECT Status__c
            FROM Project__c
            WHERE Id = :project.Id
        ];
        System.assertEquals('Complete', saved.Status__c);
    }
}
```

## Batch Test Rule

In tests, a batch can only execute once. Build data and scope size so the test creates one execute chunk.

```apex
Test.startTest();
Database.executeBatch(new ProjectBatch(), 200);
Test.stopTest();
```

## Required Assertions

- Assert changed field values.
- Assert created related records.
- Assert no duplicate records when idempotency matters.
- Assert error messages for user-facing controller methods.
- Assert security behavior when code enforces CRUD/FLS.

## Avoid

- `SeeAllData=true` except for rare platform-specific cases.
- Tests that only execute code for coverage.
- Tests that query records by private names.
- Tests that assume one record type exists by label.
- Tests that do not flush async work.

