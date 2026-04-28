# Photo Capture, Annotation, Viewer, And Generated File Patterns

Use this for Salesforce features that capture photos, annotate images, preview files, generate PDFs or reports, and attach output to records.

## Lifecycle Model

Photo and generated-document flows should have explicit stages:

1. Open a visible shell or action surface.
2. Request camera, file picker, or generation input only after the surface is ready.
3. Show preview or progress state.
4. Create or transform the artifact.
5. Upload a `ContentVersion` or create a durable external artifact.
6. Link the resulting `ContentDocument` to the parent record when needed.
7. Refresh file lists, parent rollups, and status fields.
8. Clean up media tracks, object URLs, overlays, listeners, and temporary state.

Do not treat capture, upload, link creation, preview, rollup, and generated output as one invisible step.

## Salesforce Files Rules

- Store original photos and generated artifacts as Salesforce Files when record access and auditability matter.
- Preserve originals when creating annotated or derived artifacts unless the product requirement explicitly replaces a version.
- Query latest `ContentVersion` records when status, title, classification, or file type lives on the version.
- Verify parent record access and file link access on the server before returning file details.
- Do not trust client-provided `ContentDocumentId`, `ContentVersionId`, public URL, or parent ID by itself.
- Refresh both file-specific UI and parent record UI after upload, delete, relink, retype, or new-version actions.

See [ContentDocument Lifecycle](contentdocument-lifecycle.md) for the core object model.

## Camera And Annotation Rules

- Camera permission success does not prove the preview is visible or the first frame painted.
- Open the overlay before camera acquisition and recover cleanly after permission prompts.
- Stop media tracks and clear preview elements on close and component disconnect.
- Keep annotation canvas dimensions aligned to the displayed image dimensions.
- Track whether annotations are destructive edits, new file versions, or new linked files.
- Use a processing state for image conversion, upload, server processing, and post-upload refresh.

## Viewer Rules

- Resolve whether the viewer should show the latest version, a selected historical version, or a generated derivative.
- Prefer platform-supported preview/navigation where available.
- For custom viewers, handle unsupported file types, missing previews, mobile download behavior, and external user access.
- Do not assume a desktop preview URL works in Salesforce mobile or Experience Cloud.
- Keep file names and generated document labels public-safe in reusable docs and examples.

## Report And PDF Generation Rules

- Use Visualforce PDF when server-rendered printable output is the stable contract.
- Use client-side generation only when fidelity or interactivity requires browser rendering.
- Avoid sending large base64 payloads through Apex when a smaller, durable handoff is possible.
- If generation runs async, show an explicit status and refresh only after the durable artifact exists.
- Attach generated output as a file when users need later preview, download, audit, sharing, or mobile access.

## Failure Patterns

- Upload succeeds but file list stays stale because no wire refresh ran.
- Annotation saves a derived image but the parent rollup still reads the previous latest version.
- Mobile preview opens a blank tab because the feature relied on a blob URL or popup behavior.
- A generated PDF is created before all async photo processing finishes.
- Viewer trusts a file ID without checking that the running user can access the parent record and link.
- Cleanup runs only on happy path, leaving camera tracks, scroll lock, or overlay state active.
