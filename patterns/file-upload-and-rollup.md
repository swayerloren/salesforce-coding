# File Upload and Rollup Pattern

Salesforce Files work through `ContentVersion`, `ContentDocument`, and `ContentDocumentLink`. Treat file behavior as a small data model, not as a single upload event.

## Recommended Data Flow

1. User uploads a file from LWC or standard file upload.
2. Salesforce creates `ContentVersion`.
3. Salesforce associates the document through `ContentDocumentLink`.
4. Server code queries latest versions and linked parent records.
5. Parent file counts, summaries, or preview lists are recalculated.
6. LWC refreshes the file list after the transaction finishes.

## Rollup Service Shape

```apex
public with sharing class FileRollupService {
    public static void recalculate(Set<Id> parentIds) {
        if (parentIds == null || parentIds.isEmpty()) {
            return;
        }

        Map<Id, Integer> countsByParentId = new Map<Id, Integer>();
        for (AggregateResult result : [
            SELECT LinkedEntityId parentId, COUNT(Id) fileCount
            FROM ContentDocumentLink
            WHERE LinkedEntityId IN :parentIds
            GROUP BY LinkedEntityId
        ]) {
            countsByParentId.put((Id) result.get('parentId'), (Integer) result.get('fileCount'));
        }

        List<Project__c> updates = new List<Project__c>();
        for (Id parentId : parentIds) {
            updates.add(new Project__c(
                Id = parentId,
                File_Count__c = countsByParentId.get(parentId) == null ? 0 : countsByParentId.get(parentId)
            ));
        }

        update updates;
    }
}
```

## Why Async Often Helps

File inserts can create row locks while Salesforce finalizes document records. If parent rollups are not required inside the same user transaction, enqueue an idempotent job and recalculate from the database state.

## LWC Refresh Rule

After upload, refresh the source of the displayed file list. Do not assume the standard upload component updates every custom list automatically.

```js
async handleUploadFinished() {
  await refreshApex(this.wiredFilesResult);
  this.dispatchEvent(new CustomEvent('fileschanged', { bubbles: true, composed: true }));
}
```

## Pitfalls

- Querying `ContentVersion` when the UI needs `ContentDocumentId`.
- Showing stale file counts because parent rollups were not recomputed.
- Treating desktop preview behavior as proof that mobile preview will work.
- Updating the same parent multiple times in one transaction.

