# Async and DML Patterns

Salesforce code should assume bulk data, automation, sharing rules, validation rules, and row locks. Keep synchronous transactions small and move expensive follow-up work to async jobs when it is safe.

## Choose Async Deliberately

| Shape | Use when | Watch for |
| --- | --- | --- |
| Queueable | Bounded post-commit work, callouts, chained orchestration. | Enqueue limits, duplicate retries, chaining assumptions. |
| Batch | Large data volumes that can be scoped independently. | One execute scope in a test method, scope size, partial failures. |
| Scheduled Apex | Time-based recurring work. | Operational ownership, schedule cleanup, test isolation. |
| Future | Legacy/simple async paths where project conventions already use it. | Limited parameters, harder orchestration, migration pressure. |
| Synchronous | Required same-transaction validation or mutation. | CPU, DML, SOQL, and callout-after-DML limits. |

Exact limits are release-sensitive. Verify current official docs before adding numeric claims.

## Chunked DML

```apex
public static void updateInChunks(List<SObject> recordsToUpdate) {
    if (recordsToUpdate == null || recordsToUpdate.isEmpty()) {
        return;
    }

    List<SObject> chunk = new List<SObject>();
    for (SObject row : recordsToUpdate) {
        chunk.add(row);
        if (chunk.size() == 200) {
            update chunk;
            chunk.clear();
        }
    }

    if (!chunk.isEmpty()) {
        update chunk;
    }
}
```

## Dedupe Before DML

```apex
Map<Id, Project__c> updatesById = new Map<Id, Project__c>();
for (Project__c project : proposedUpdates) {
    if (project.Id != null) {
        updatesById.put(project.Id, project);
    }
}
update updatesById.values();
```

## Queueable Pattern

```apex
public with sharing class ProjectRollupQueueable implements Queueable {
    private final Set<Id> projectIds;

    public ProjectRollupQueueable(Set<Id> projectIds) {
        this.projectIds = projectIds == null ? new Set<Id>() : new Set<Id>(projectIds);
    }

    public void execute(QueueableContext context) {
        if (projectIds.isEmpty()) {
            return;
        }
        ProjectRollupService.recalculate(projectIds);
    }
}
```

## File-Heavy Work

File operations can collide on `ContentVersion`, `ContentDocument`, and parent record locks. For file rollups or derived artifacts:

- Collect parent ids in the trigger.
- Enqueue one recalculation job per coherent parent set.
- Query latest `ContentVersion` records inside the async job.
- Dedupe parent updates.
- Treat row lock errors as retriable when the operation is idempotent.

## Idempotency

Async work that sends messages, creates files, posts to Chatter, logs activities, or calls external systems needs a durable duplicate-prevention strategy. Use a source record, external identifier, status field, or processing log that survives retries.

Do not enqueue one job per trigger record when one job can process the coherent parent set.
