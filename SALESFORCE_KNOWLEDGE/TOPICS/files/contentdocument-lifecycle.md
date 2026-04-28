# ContentDocument Lifecycle

Use this when building or fixing upload, preview, file rollup, generated-document, photo, annotation, Experience Cloud, or mobile file behavior.

Related focused topics:

- [Photo Capture, Annotation, Viewer, And Generated File Patterns](photo-capture-annotation-viewer.md)
- [Mobile Camera And File Handoff](../mobile/mobile-camera-and-file-handoff.md)
- [Experience Cloud Portal Access And Files](../experience-cloud/portal-access-and-files.md)

Official anchors:

- Salesforce Object Reference: `ContentDocument`
- Salesforce Object Reference: `ContentVersion`
- Salesforce Object Reference: `ContentDocumentLink`

## Object Model

Salesforce Files are not one row.

| Object | Meaning | Common risk |
| --- | --- | --- |
| `ContentVersion` | A specific file version and version-level fields. | Querying an old version when the latest version matters. |
| `ContentDocument` | The logical file across versions. | Assuming document fields contain all version state. |
| `ContentDocumentLink` | The relationship between a document and a record or library. | Assuming access or parent rollups from one link only. |
| `ContentDistribution` | Optional public distribution artifact. | Treating a distribution URL as authorization. |

## Lifecycle Checks

For every file feature, identify:

- where the binary is created,
- which record receives the `ContentDocumentLink`,
- whether custom metadata lives on `ContentVersion` or another record,
- how latest version is selected,
- how delete, relink, retype, and new-version behavior is handled,
- how parent UI is refreshed,
- how external or portal access is authorized.

## Latest Version Rule

If title, type, processing state, generated-document state, or rollup input can change by version, query latest versions deliberately. Do not infer current state from a stale `ContentVersion` ID held by the client.

Rollups should usually:

1. gather parent record IDs,
2. query current document links,
3. query latest versions for linked documents,
4. recompute full parent state,
5. update only changed parent rows.

Recompute is safer than delta-only logic when files can be deleted, relinked, retyped, or versioned.

## Upload And Refresh

After upload, delete, type change, generated-document completion, or annotation save:

- refresh the custom file list,
- notify the parent record when relevant,
- avoid fixed wait timers as the only refresh mechanism,
- surface empty and error states,
- handle permission-denied errors distinctly from no-files states.

## Security

Never trust a client-provided file ID by itself. Server-side code should verify that the running user can access the parent record and that the file link or distribution is allowed for the requested surface.

For Experience Cloud, guest, or public access, add a separate authorization review. Public URLs and distribution links are handoff artifacts, not proof that the request is safe.

## Tests

File-heavy tests should:

- create their own `ContentVersion` records,
- query the resulting `ContentDocumentId`,
- link documents explicitly when the behavior depends on links,
- test missing links and no-file states,
- assert latest-version behavior,
- use `@IsTest(isParallel=false)` only when row locks make it necessary.

## Anti-Patterns

- Treating `ContentVersion`, `ContentDocument`, and `ContentDocumentLink` as interchangeable.
- Updating a parent rollup from one upload event without recomputing current links.
- Returning file IDs to the client without server-side access checks.
- Assuming desktop preview behavior matches Salesforce mobile or portal behavior.
- Logging private file names, document titles, or generated document contents in public docs.
