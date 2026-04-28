# Salesforce File Handling Guide

## Focused Topic

Use [ContentDocument Lifecycle](../TOPICS/files/contentdocument-lifecycle.md) for the full object lifecycle, security, refresh, and test checklist.

Use [Photo Capture, Annotation, Viewer, And Generated File Patterns](../TOPICS/files/photo-capture-annotation-viewer.md) for camera, annotation, viewer, generated report, and PDF file flows.

Use [Mobile Camera And File Handoff](../TOPICS/mobile/mobile-camera-and-file-handoff.md) and [Experience Cloud Portal Access And Files](../TOPICS/experience-cloud/portal-access-and-files.md) when files cross mobile, external, portal, or public surfaces.

## Salesforce Files Model

Salesforce Files usually involve:

- `ContentVersion`: file version and custom fields on a version;
- `ContentDocument`: logical file;
- `ContentDocumentLink`: link between a document and a record;
- `ContentDistribution`: public distribution URL when configured.

Do not treat a file as a single row.

Every file feature must identify which object owns each concern:

- binary and version fields,
- logical document state,
- parent record link,
- public distribution or generated handoff,
- authorization check.

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

If upload, annotation, generated PDF, or type-change behavior runs async, expose an explicit processing state and refresh after completion. A successful upload event does not prove that rollups, generated artifacts, or derived fields are current.

## Row Locks

Broad test runs and file-heavy test classes can hit `UNABLE_TO_LOCK_ROW` around `ContentVersion` or related records. Stabilize file-heavy tests with careful data isolation and `isParallel=false` only where needed.

## Preview and Download

File preview/download behavior can differ across desktop Lightning, Salesforce mobile, Experience Cloud, guest/public user, external storage provider, and ContentDistribution versus direct file URL.

For public or portal surfaces, keep authorization and token validation on the server.

For mobile, treat upload success, preview success, and download success as separate outcomes. Blob URLs, popup tabs, and hardcoded Lightning file URLs can fail in mobile containers or portal routing.

Prefer a platform-supported preview/navigation path when it works. When a durable external handoff is required, validate the server-side access model, expiration, revocation, CSP, CORS, named credentials, and trusted sites.

## Photos, Annotation, Reports, And PDFs

For photo or generated-file workflows:

- preserve the original artifact unless the product requirement explicitly replaces a version;
- decide whether annotation creates a new file, a new version, or a related derived artifact;
- query latest versions when derived status lives on `ContentVersion`;
- expose processing state when upload, annotation, report generation, or PDF generation runs async;
- refresh file lists and parent rollups only after the durable artifact exists;
- test blank, large, unsupported, and mobile preview cases.

Generated PDFs should be attached as Salesforce Files when users need later preview, audit, sharing, or mobile access. Do not treat a browser-opened PDF as equivalent to a durable file.

## Access And Public Safety

Do not trust client-provided file IDs or public URLs by themselves. Server-side code should verify the running user can access the parent record and the requested file link or distribution artifact.

Never publish private file names, generated document contents, raw debug logs, or screenshots as reusable examples. Rewrite the lesson as a generic lifecycle or authorization rule.

## File Validation Checklist

- [ ] `ContentVersion`, `ContentDocument`, and `ContentDocumentLink` responsibilities are identified.
- [ ] Latest-version behavior is explicit.
- [ ] Delete, relink, retype, and new-version behavior is handled.
- [ ] Parent record refresh is explicit.
- [ ] Portal/public/mobile behavior is validated or listed as not validated.
- [ ] Preview/download is validated separately from upload.
- [ ] Photo, annotation, or generated PDF output has an explicit latest-version and refresh plan.
- [ ] Tests create file data and assert durable results.
