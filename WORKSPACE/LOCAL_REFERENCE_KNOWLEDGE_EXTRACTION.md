# Local Reference Knowledge Extraction

## Executive Summary

This extraction pass read 206 unique local Markdown and text reference documents surfaced by the inventory. The pass did not copy private source text, private object names, records, credentials, local source paths, emails, phone numbers, org-specific identifiers, runtime authentication markers, private URLs, or project-specific business details.

The current repo already has a strong public-safe Salesforce knowledge base for Apex, LWC, metadata, deployment, testing, Files, mobile, Visualforce, and public repo hygiene. The local references still reveal several high-value areas that should be expanded before publication:

- Communication automation needs a dedicated Chatter, activity, and email pattern page.
- File/photo/mobile guidance should separate upload, preview, capture, annotation, generated document handoff, cleanup, and refresh behavior.
- Debugging guidance should include more explicit debug-log and runtime proof workflows.
- Deployment guidance should add destructive deployment and deletion safety as a first-class topic.
- Compound address guidance should become a dedicated topic with LWC, Apex, metadata, and validation rules.
- Codex behavior should require stronger evidence when editing metadata wiring, quick actions, FlexiPages, file flows, mobile overlays, and async Apex.

Public-safe extraction value is high because the repeated lessons are generic Salesforce platform behavior, not private business logic.

## High-Value Lessons By Topic

### Apex Patterns

- Keep trigger entry points thin and move behavior into handlers, services, selectors, and queueable or batch classes only when the transaction shape requires it.
- Treat every Apex path as bulk-capable unless the caller and signature prove otherwise.
- Query every field and relationship that mapper or DTO code dereferences; missing relationship fields are a common root cause of null behavior and test failures.
- Recompute derived state from source-of-truth records when related rows can be deleted, relinked, retyped, versioned, or imported out of sequence.
- Prefer explicit idempotency fields or keys for external submissions, generated documents, file processing, email replies, and async retries.
- Use direct calls for required behavior. Dynamic class lookup or `System.Callable` should be reserved for optional extension points with visible diagnostics.
- Make sharing posture intentional. UI-facing and external-facing Apex should have clear sharing, CRUD, and FLS review notes.
- Keep callout, DML, and async boundaries visible in code and tests; do not hide callout bypasses inside broad test shortcuts.

### Apex Triggers

- Trigger handlers should receive enough context to distinguish before-save mutation, after-save side effects, delete, undelete, and changed-field behavior.
- Recursion guards should be narrow to the operation and record set, not global flags that skip valid later work.
- Related-record synchronization should define the winning source when both sides change.
- Before triggers are better for same-record field normalization; after triggers are better for child records, files, Chatter, async work, and cross-object DML.
- Trigger code that reacts to files or related records should tolerate missing links, delayed link creation, version changes, and delete/relink events.
- Duplicate prevention cannot be UI-only; Apex, validation, unique fields, or durable keys must enforce important invariants.

### Apex Tests

- Tests should assert behavior, not just execute code for coverage.
- Use factories for required object graphs, but keep factory output minimal and explicit for each scenario.
- Test blank optional fields, missing configuration, failed callouts, duplicate/retry cases, and unchanged-record cases.
- File-heavy tests require isolation because Salesforce Files can create row locks or side effects through `ContentVersion` and `ContentDocumentLink`.
- Use `Test.startTest()` and `Test.stopTest()` around async work and verify durable results after the async boundary.
- Do not depend on existing users, profiles, permission sets, record types, org data, or private IDs.
- Selected tests must cover changed Apex branches enough for deploy-bound coverage, not only happy-path execution.

### LWC Patterns

- Start every LWC change by reading the component metadata file: targets, target configs, form factors, and public properties drive runtime behavior.
- Use LDS/UI API for focused record reads and edits; use Apex for multi-object aggregation, external authorization, DTO shaping, token validation, or server-owned policy.
- Move template expressions into JavaScript getters. Templates should not contain inline conditions, optional-chain expressions, method calls, or ternaries.
- Store wire results and refresh them explicitly after save, upload, delete, type change, or generated-document completion.
- Use platform navigation and record update notification APIs instead of hardcoded Lightning URLs or fixed delay timers.
- Expose loading, empty, warning, success, and error states; silent empty UI hides metadata or permission bugs.
- Dynamic field components should validate object and field metadata, field-level access, updateability, and type-specific display/edit behavior before rendering controls.

### Mobile LWC Patterns

- Salesforce mobile is a distinct runtime, not just a smaller viewport.
- Mobile overlays need clear ownership for host, visible shell, scroll lock, focus, close cleanup, and `disconnectedCallback` cleanup.
- Camera acquisition does not prove the UI is visible. Components need runtime proof for mount, visible shell, preview paint, first frame, capture, save, and cleanup.
- Permission prompts can interrupt render and focus timing; camera and file flows should wait for visible UI recovery before assuming readiness.
- Pointer or mousedown selection handling is safer than blur-dependent click handling for mobile mention menus and pickers.
- Blob URLs, popup tabs, and large in-memory payloads can be unreliable in mobile containers; durable server or external URLs are often safer for final handoff.
- Mobile verification must cover quick action placement, Small form factor support, record page assignment, action overflow, file preview/download, and modal behavior.

### Visualforce/PDF Patterns

- Visualforce PDF pages are output contracts. Preserve working layout behavior unless the task explicitly asks for redesign.
- Tables, inline styles, explicit widths, conservative fonts, and simple page breaks can be correct for PDF stability.
- `escape=false` should be treated as a risk surface. Verify trust and sanitization before rendering rich content.
- Conditional rows must preserve valid table structure.
- Launcher pages and PDF generation flows should be tested in the same Lightning action or mobile context where users open them.
- Generated PDFs should handle long text, blank optional fields, missing images/resources, pagination, and special characters.
- PDF generation should not move large binary work into Apex heap-heavy paths without a clear limit strategy.

### Salesforce Files/Photo/Document Patterns

- Model files as `ContentVersion`, `ContentDocument`, and `ContentDocumentLink`; do not treat a file as one row.
- Latest-version logic matters for file type, title, processing state, and rollups.
- File lists and rollups should recompute from current links and latest versions when deletes, relinks, retypes, or new versions are possible.
- Upload completion should refresh the custom list, notify the parent record, and avoid fixed wait timers.
- Public or portal file access must be authorized server-side; do not trust client-provided document IDs or public URLs.
- Photo capture flows need explicit stages for camera open, preview, capture, annotation, upload, link, refresh, and cleanup.
- Annotation and viewer flows should preserve original file state unless the user explicitly creates a new version or derived artifact.
- Large generated documents need a durable handoff strategy for mobile and portal use.

### Chatter/Activity/Email Patterns

- Chatter automation should separate body text, mention ranges, target record, actor context, and fallback behavior.
- Mention insertion in mobile editors must preserve caret position and exact range offsets sent to Apex.
- Automated posts should be idempotent where repeated owner/status changes or retries are possible.
- Activity and email automation should use durable linkage fields, threading identifiers, or normalized external identifiers rather than display text.
- Inbound email or reply ingestion should log parse failures without exposing private message bodies.
- Email templates and generated links should be tested for missing merge data, inactive users, permissions, and environment-specific base URL behavior.
- Chatter, email, and activity work needs permission checks for record access, guest/external users, and integration/service users.

### Compound Address Logic

- In Apex, write compound address leaf fields instead of the root compound field.
- If setting state/province code values, also provide the corresponding country code when required by state and country picklist behavior.
- Structured address fields should be the source of truth; parsed text addresses should be fallback only.
- LWC forms should load and save leaf fields and surface validation errors per leaf field.
- Address validation should distinguish formatting, required-field, geocode, and cross-field consistency failures.
- Address-derived actions such as maps, directions, or street view should tolerate partial addresses and should not hardcode external URLs.

### Metadata/Page Layout/FlexiPage/Quick Action Patterns

- A component that deploys is not necessarily visible. Visibility depends on target config, FlexiPage placement, activation, layout actions, Dynamic Actions, app/profile/record type assignment, form factor, permissions, and Apex access.
- Quick action bugs require checking the quick action metadata, target component, object override, Highlights Panel, layout action list, Dynamic Actions, action overflow, and permissions together.
- Dynamic Forms and page layouts can coexist; desktop and mobile may use different field-rendering systems.
- Prefer permission sets over profile edits when targeted access changes are possible.
- Avoid broad profile, FlexiPage, layout, report, dashboard, and static resource churn.
- Treat reports, dashboards, email templates, and static resources as private-data risk areas before publishing or deploying.

### Deployment/CLI/Destructive Deployment Patterns

- Validate the smallest deployable set before real deployment.
- Keep manifests narrow and inspect generated manifests before deploy.
- Use explicit test strategy; production may require tests even when the visible change is UI or metadata.
- Selected tests must include affected Apex and relevant branches, not just stable unrelated coverage classes.
- Destructive deployments need separate review: identify exact metadata names, dependencies, replacement path, rollback path, and validation command.
- Do not combine destructive changes with unrelated feature changes.
- On Windows, quote paths and SOQL carefully, verify installed `sf` command shape, and avoid assuming Unix examples run unchanged.

### Debugging/Failure Patterns

- Capture symptom, entry point, metadata wiring, permission context, runtime path, fix, validation, and lesson.
- Separate failure layers: click/tap, component mount, data load, permission, Apex call, async work, file link, preview, and cleanup can each fail independently.
- Add temporary visible instrumentation when mobile or webview logs are insufficient.
- A CLI probe failure is not automatically a platform failure; command shape, permissions, quoting, and API behavior can all be the root cause.
- Debug logs should be treated as evidence to summarize, not content to publish.
- Avoid weakening tests that are correctly exposing a changed contract or regression.

### Public Safety And Repo Hygiene Patterns

- Private references are evidence for lessons, not text to copy.
- Every extracted lesson should be rewritten with generic object names, neutral actors, placeholder IDs, and no private URLs or local paths.
- Do not publish raw debug logs, screenshots, generated HTML, CSV/XLSX data, email bodies, Chatter post bodies, or copied external source code.
- Repo knowledge updates should be drafted in `WORKSPACE/` first when sourced from private references.
- Run privacy scans before moving private-derived lessons into public repo folders.

## Repeated Failure Patterns

| Pattern | Public-safe root cause | Public-safe fix direction |
| --- | --- | --- |
| UI component deploys but users cannot see it | Metadata activation, form factor, quick action, layout, Dynamic Actions, or permissions are incomplete | Inspect the full record-page activation chain before changing code |
| Mobile camera opens but preview is blank | Camera permission succeeded but component shell or media preview did not render | Add visible stages and gate readiness on rendered preview |
| Mobile overlay closes but page remains stuck | Scroll, focus, touch, or media cleanup was delayed or skipped | Release interaction state synchronously in close and disconnect paths |
| File list or rollup is stale | Cacheable data or derived state was not refreshed after upload/delete/retype/version | Store wire result, refresh explicitly, and recompute from current file links |
| PDF works on desktop but fails in mobile handoff | Blob, popup, or large payload behavior differs in mobile container | Use a durable handoff URL and validate in target runtime |
| Chatter mention posts incorrectly | Text and mention offsets diverged after mobile selection or textarea edits | Commit exact body text and ranges together |
| Email/reply automation duplicates records | No durable idempotency key or reply threading strategy | Normalize durable identifiers and enforce duplicate prevention server-side |
| Compound address save fails | Root field or incomplete leaf-code combination was written | Save structured leaf fields and required country/state code combinations |
| Destructive deploy removes the wrong thing | Metadata names or dependencies were not verified narrowly | Separate destructive manifest, validate first, and document rollback |
| Tests pass but deploy coverage fails | Selected tests did not cover touched Apex branches | Add branch/error tests tied to changed classes |
| Debugging stalls on CLI output | Terminal probe is treated as authoritative without checking runtime context | Verify command shape, permissions, source metadata, and runtime evidence |
| Public repo leak risk | Raw local notes, logs, screenshots, IDs, or URLs are copied into docs | Rewrite lessons and run sensitivity scans before publication |

## Salesforce-Specific Rules To Add

- Add a dedicated communication automation rule: Chatter, activity, and email work must define actor context, target record, permission model, idempotency, and observability.
- Add a file lifecycle rule: any file feature must identify whether it works with `ContentVersion`, `ContentDocument`, `ContentDocumentLink`, or a generated/distribution artifact.
- Add a photo/camera rule: camera work must prove visible preview, first-frame readiness, capture, upload/link, and cleanup in the target runtime.
- Add a generated document rule: PDF/file handoff must be validated separately for desktop Lightning, Salesforce mobile, and Experience Cloud when those surfaces are in scope.
- Add a compound address rule: Apex and LWC must save leaf fields and treat text parsing as fallback only.
- Add a destructive deployment rule: deletion metadata must be reviewed and validated separately from feature deploys.
- Add a debug-log rule: logs are summarized into symptom/root cause/fix; raw logs are never published.
- Add a quick action rule: action visibility bugs require checking quick action metadata, page layout, Dynamic Actions, Highlights Panel, activation, form factor, and permissions.

## Codex Behavior Rules To Add

- Before editing private-derived documentation, draft the sanitized lesson in `WORKSPACE/` and scan it before moving it into repo knowledge files.
- For local reference extraction, never paste private source text into public docs; write original summaries, rules, checklists, and pseudocode.
- For Salesforce mobile issues, require runtime proof beyond desktop reasoning.
- For file/photo issues, inspect the full file lifecycle instead of only the LWC or only Apex.
- For communication automation, inspect both data writes and visible side effects such as posts, emails, activities, notifications, and logs.
- For metadata changes, inspect activation, assignment, visibility, permission, and form factor before proposing a fix.
- For destructive deployment, require an explicit deletion target list, dependency review, validation command, and rollback note.
- When tests fail, classify the failure first: compile, coverage, assertion, data setup, permission, row lock, SOQL limit, async, or external callout.

## Existing Repo Files To Update

| File | Update needed |
| --- | --- |
| `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md` | Add trigger recursion, idempotency, communication automation, file-trigger side effects, and required-vs-optional dynamic dependency rules. |
| `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_TESTING_GUIDE.md` | Add communication automation tests, file/photo tests, permission tests, branch coverage for generated documents, and async retry assertions. |
| `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md` | Add dynamic record field checks, mobile mention menu behavior, photo/camera lifecycle checks, and stronger refresh rules. |
| `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_MOBILE_GUIDE.md` | Expand camera/photo, viewer, annotation, generated PDF handoff, action bar, blur/caret, and real-device verification guidance. |
| `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_FILE_HANDLING_GUIDE.md` | Expand ContentVersion lifecycle, portal/public access, file type rollups, preview/download behavior, annotation, generated documents, and refresh patterns. |
| `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_VISUALFORCE_GUIDE.md` | Add PDF launcher, mobile handoff, resource fallback, sanitization, long text, blank optional data, and output comparison checklist. |
| `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md` | Add destructive deployment warnings, report/dashboard/email/static resource private-data checks, and quick action visibility matrix. |
| `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_RECORD_PAGE_GUIDE.md` | Expand quick action and mobile action bar troubleshooting with Dynamic Actions, overflow, and permission checks. |
| `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_DEPLOYMENT_GUIDE.md` | Add destructive deployment workflow, deletion validation, rollback notes, and Windows CLI command hygiene. |
| `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_DEBUGGING_GUIDE.md` | Add debug-log triage, visible mobile instrumentation, CLI probe skepticism, and failure-layer templates. |
| `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md` | Add rows for Chatter mentions, email threading, PDF handoff, photo capture, destructive deploy, quick action overflow, and address leaf fields. |
| `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/file-upload-and-rollup.md` | Expand latest-version recompute and file state rollup rules. |
| `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/lookup-address-patterns.md` | Expand compound address leaf-field and partial-address rules. |
| `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/lwc-patterns.md` | Add dynamic field, modal cleanup, refresh, and mobile interaction patterns. |
| `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/metadata-safe-deployment-structure.md` | Add destructive deployment and high-risk metadata deletion review. |
| `SALESFORCE_KNOWLEDGE/PATTERNS/anti_patterns/apex-anti-patterns.md` | Add global recursion guards, UI-only duplicate prevention, dynamic optional calls for required behavior, and SOQL/filter hardcoding. |
| `SALESFORCE_KNOWLEDGE/PATTERNS/anti_patterns/lwc-anti-patterns.md` | Add unverified mobile camera readiness, fixed timer refresh, hardcoded URLs, and blur-dependent picker selection. |
| `SALESFORCE_KNOWLEDGE/PATTERNS/anti_patterns/metadata-anti-patterns.md` | Add broad destructive deploys, profile churn, and action visibility fixes made in the wrong layer. |
| `SALESFORCE_KNOWLEDGE/REFERENCE/sanitized-lessons-catalog.md` | Add extracted public-safe lessons as short canonical bullets. |
| `SALESFORCE_KNOWLEDGE/DOCS/public-sanitization-policy.md` | Add explicit skips for Chatter bodies, email bodies, debug logs, screenshots, generated documents, and file names. |
| `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/PUBLIC_REPO_SAFETY_CHECK.md` | Add local-reference extraction checks and private communication/file artifact checks. |
| `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/07_FIX_SALESFORCE_FILES.md` | Add file lifecycle, mobile preview, portal access, generated document, and refresh prompts. |
| `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/08_FIX_MOBILE_SALESFORCE.md` | Add camera/photo, action bar, blur/caret, overlay cleanup, and visible proof prompts. |
| `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/05_FIX_DEPLOYMENT_FAILURE.md` | Add destructive deploy and CLI command-shape checks. |

## New Knowledge Files To Create

| New file | Purpose |
| --- | --- |
| `SALESFORCE_KNOWLEDGE/TOPICS/communication/chatter-email-activity-patterns.md` | Dedicated Chatter, activity, email, mention, template, threading, actor, and idempotency guidance. |
| `SALESFORCE_KNOWLEDGE/TOPICS/files/contentdocument-lifecycle.md` | Focused ContentVersion, ContentDocument, ContentDocumentLink, latest version, deletion, relink, rollup, and security notes. |
| `SALESFORCE_KNOWLEDGE/TOPICS/files/photo-capture-annotation-viewer.md` | Public-safe photo capture, annotation, preview, upload, refresh, and cleanup patterns. |
| `SALESFORCE_KNOWLEDGE/TOPICS/mobile/mobile-camera-and-file-handoff.md` | Mobile camera, blob/PDF handoff, file preview, webview, and overlay runtime verification. |
| `SALESFORCE_KNOWLEDGE/TOPICS/addresses/compound-address-fields.md` | Leaf-field rules, LWC form rules, validation, geocode/map handling, and fallback parsing. |
| `SALESFORCE_KNOWLEDGE/TOPICS/deployment/destructive-deployment-safety.md` | Separate runbook for destructive changes, validation, dependencies, rollback, and review. |
| `SALESFORCE_KNOWLEDGE/TOPICS/troubleshooting/debug-log-triage.md` | Debug log setup, triage, summarization, and public-safety rules. |
| `SALESFORCE_KNOWLEDGE/TOPICS/metadata/quick-action-visibility-matrix.md` | Quick action visibility checklist across metadata, layout, FlexiPage, Dynamic Actions, form factor, and permissions. |
| `SALESFORCE_KNOWLEDGE/TOPICS/lwc/dynamic-record-fields.md` | Dynamic field component rules for metadata validation, permissions, type handling, and safe rendering. |
| `SALESFORCE_KNOWLEDGE/CHECKLISTS/before-communication-automation.md` | Preflight checklist for Chatter, activity, email, and notification automation. |
| `SALESFORCE_KNOWLEDGE/PROMPTS/fix-chatter-email-activity-safely.md` | Copy-ready Codex prompt for communication automation fixes. |

## Do Not Publish / Private Details Skipped

The extraction intentionally skipped or generalized:

- Private business workflow names and operational terms.
- Customer, employee, user, vendor, and project names.
- Object, field, component, page, flow, report, dashboard, permission set, and profile names that appear private.
- Record IDs, org-specific identifiers, deployment IDs, package IDs, runtime authentication markers, and test run IDs.
- Emails, phone numbers, usernames, domains, and private URLs.
- Credentials, tokens, client secrets, named credential values, authorization headers, certificates, and keys.
- Raw debug logs, stack traces with private IDs, screenshots, HTML exports, CSV/XLSX data, and generated documents.
- Email bodies, Chatter post bodies, SMS/chat text, PDF customer-facing copy, and file names.
- External source code and long copied prose from public archives.
- Local filesystem paths outside the audit inventory itself.

## Priority Plan

### P0

1. Create communication automation coverage for Chatter, activity, email, mentions, actor context, idempotency, and logging.
2. Create destructive deployment safety guidance before any public prompt encourages metadata deletion.
3. Expand file/photo/mobile lifecycle guidance for ContentVersion, preview, capture, annotation, generated documents, portal access, and cleanup.
4. Add debug-log triage and public-safe log summarization rules.
5. Add dedicated compound address field rules for Apex, LWC, validation, and metadata.
6. Strengthen public-safety checks for private-derived docs, communication artifacts, files, logs, and screenshots.

### P1

1. Expand Apex trigger and test guidance for file side effects, idempotency, async retries, and communication automation.
2. Add quick action visibility matrix and mobile action bar troubleshooting.
3. Add dynamic record field LWC guidance for metadata validation, CRUD/FLS, type handling, and rendering.
4. Expand Visualforce/PDF guidance for launcher pages, mobile handoff, sanitization, resources, long text, and blank-field output.
5. Expand deployment and CLI guidance for Windows quoting, installed command verification, manifest review, and selected-test coverage.
6. Add repeated failure rows to the common failures guide and sanitized lessons catalog.
7. Update prompt pack entries for files, mobile, deployment, LWC, and Apex tests.
8. Add more targeted anti-patterns for UI-only duplicate prevention, broad profile edits, fixed refresh timers, and global recursion guards.

### P2

1. Add copy-paste-safe pseudocode snippets for idempotency keys, trigger handlers, file rollups, dynamic field describes, and Chatter mention payload assembly.
2. Add optional examples for generated-document lifecycle and ContentDocument latest-version rollups.
3. Add checklist entries for reports, dashboards, email templates, and static resources as public-data risk surfaces.
4. Add validation-flow notes for mobile runtime checks that cannot be proven locally.
5. Add prompt shortcuts for communication automation and destructive deployment.
6. Add stronger cross-links in `SALESFORCE_KNOWLEDGE/INDEX.md` once new topic files exist.
7. Add glossary terms for ContentDocument lifecycle, Dynamic Actions, actor context, idempotency key, and destructive changes.

### P3

1. Review public zip archives only for structure ideas and license-safe attribution notes.
2. Consider small public-safe example bundles after the guide and topic pages are updated.
3. Consider a future quality gate that scans docs for local paths, IDs, emails, tokens, and private URLs before release.
4. Consider a summary map from local-reference extraction topics to final public knowledge files after approved updates are made.
