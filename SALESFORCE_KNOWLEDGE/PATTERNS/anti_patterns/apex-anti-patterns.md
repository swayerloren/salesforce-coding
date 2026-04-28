# Apex Anti-Patterns

These patterns repeatedly create deployment failures, production bugs, or hard-to-debug behavior.

## Optional Dynamic Calls For Required Behavior

Do not hide required business logic behind optional dynamic dispatch that can silently no-op.

Prefer direct static calls for core behavior. Use dynamic seams only for optional extensions, and log or surface when an expected implementation is missing.

## SOQL Or DML Inside Loops

This fails under bulk data and makes trigger behavior unpredictable.

Bad:

```apex
for (Project__c project : Trigger.new) {
    update new Account(Id = project.Account__c, Description = 'Updated');
}
```

Better:

```apex
Map<Id, Account> accountsById = new Map<Id, Account>();
for (Project__c project : Trigger.new) {
    if (project.Account__c != null) {
        accountsById.put(project.Account__c, new Account(Id = project.Account__c));
    }
}
update accountsById.values();
```

## Live Org Data In Tests

Tests that query existing records fail across sandboxes, scratch orgs, and production. Create data inside tests and query metadata defensively only when needed.

## Unbounded Dynamic SOQL

Never concatenate object names, field names, or filters directly from user input. Whitelist structural fragments and bind values.

## Swallowed Exceptions

Do not catch and ignore exceptions around required operations. If a user-facing controller catches an exception, convert it to a safe error message and keep enough diagnostics for logs.

## Trigger Logic That Assumes UI Edits

Records can change through API, Flow, imports, integrations, tests, async jobs, and packages. Trigger code must handle bulk, nulls, partial data, and non-UI paths.

## Global Recursion Flags

A single static Boolean can suppress legitimate work later in the same transaction. Prefer guards scoped by operation and record IDs, or make recompute logic idempotent.

## Security By Sharing Keyword Only

`with sharing` is not a complete CRUD/FLS strategy. Exposed Apex needs a separate decision for record sharing, object access, field access, user-mode or system-mode behavior, and DTO filtering.

## Treating Files As One Row

Salesforce Files use `ContentVersion`, `ContentDocument`, and `ContentDocumentLink`. Code that updates rollups from one upload event without recomputing current links often becomes stale after delete, relink, retype, or new-version behavior.

## Duplicate Communication Side Effects

Automated email, Chatter, activity, notification, or generated-document work without idempotency can duplicate user-visible output on retries or repeated owner/status changes.
