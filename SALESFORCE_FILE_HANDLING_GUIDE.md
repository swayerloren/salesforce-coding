# Salesforce File Handling Guide

## Salesforce Files Model

Salesforce Files usually involve:

- `ContentVersion`: file version and custom fields on a version;
- `ContentDocument`: logical file;
- `ContentDocumentLink`: link between a document and a record;
- `ContentDistribution`: public distribution URL when configured.

Do not treat a file as a single row.

## Latest Version Matters

If file type, title, or processing status lives on `ContentVersion`, most rollups should use latest versions:

```soql
SELECT Id, ContentDocumentId, Type__c, IsLatest
FROM ContentVersion
WHERE ContentDocumentId IN :docIds AND IsLatest = true
```

## Rollup Pattern

For parent file-state rollups:

1. Gather parent IDs from `ContentDocumentLink`.
2. Query linked document IDs.
3. Query latest versions.
4. Recompute full state from current links and latest values.
5. Update parent checkbox/summary fields.
6. Run inline in async context if queueable limits would otherwise skip critical recompute.

Recompute is safer than delta-only logic when files can be deleted, retyped, relinked, or versioned.

## Upload UI Refresh

For a custom related-files LWC:

- use a stored wire result for related files,
- call `refreshApex` after upload, type edit, or delete,
- call `notifyRecordUpdateAvailable` for the parent record,
- register a `lightning/refresh` handler if the component participates in record-page refresh.

Avoid relying on fixed delay timers or cacheable imperative Apex without an explicit refresh path.

## Row Locks

Broad test runs and file-heavy test classes can hit `UNABLE_TO_LOCK_ROW` around `ContentVersion` or related records. Stabilize file-heavy tests with careful data isolation and `isParallel=false` only where needed.

## Preview and Download

File preview/download behavior can differ across desktop Lightning, Salesforce mobile, Experience Cloud, guest/public user, external storage provider, and ContentDistribution versus direct file URL.

For public or portal surfaces, keep authorization and token validation on the server.

