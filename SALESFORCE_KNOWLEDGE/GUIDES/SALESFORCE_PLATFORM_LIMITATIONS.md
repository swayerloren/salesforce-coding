# Salesforce Platform Limitations

## Deploy And Tests

- Production orgs reject `NoTestRun` in many deploy contexts.
- `RunSpecifiedTests` can still enforce coverage for deployed Apex classes.
- A broad test run can fail because of unrelated legacy tests.
- Apex tests can execute only one batch execution scope per method.
- Wide metadata payloads can fail because of unrelated dependencies, stale profiles, or org-specific assignments.

## Apex

- Apex is not Java. Do not assume every Java-like method or operator exists.
- Queueable/future/batch contexts restrict what async work can be enqueued.
- Callouts after DML require transaction design or test bypasses.
- Dynamic SOQL must be describe-validated.
- Salesforce governor limits require bulk-safe collection patterns.
- Sharing keywords do not enforce CRUD/FLS by themselves.
- User-mode operations, `stripInaccessible`, `WITH SECURITY_ENFORCED`, describe checks, and LDS/UI API solve different security problems.
- Exact numeric governor limits are release-sensitive. Link to official docs or verify current values before adding them to task-specific docs.

## Governor-Limit Risk Model

Do not treat governor limits as a generic warning at the end of an Apex task. Tie the limit risk to the implementation:

| Area | Limit risk to inspect |
| --- | --- |
| Trigger | Records per transaction, SOQL/DML count, duplicate DML rows, recursion, async enqueue count. |
| Service class | Query row volume, CPU-heavy loops, map size, callout/DML ordering. |
| Async Apex | Chain depth, batch scope size, retry duplication, per-scope query/DML volume. |
| Files/PDFs | Heap, blob size, row locks, version queries, generated document handoff. |
| Tests | Batch execute scope count, test data volume, file row locks, callout mocks. |
| Dynamic SOQL | Injection risk, unbounded filters, unselective queries, missing field allowlists. |

When a limit matters, document the mitigation and validation evidence. Do not copy long official limit tables into this repo.

## LWC

- Templates do not support arbitrary JavaScript expressions.
- Modal child props can arrive after `connectedCallback`; reactive sync may be required.
- Base component styling hooks differ across SLDS versions.
- Browser globals can behave differently in Lightning, mobile, and community runtimes.

## Metadata

- Active page assignment can differ by form factor, app, profile, record type, and object override.
- Dynamic Forms, page layouts, compact layouts, Highlights Panel actions, and custom field LWCs can coexist on one page.
- Quick actions can exist in metadata but be hidden by placement, overflow, permissions, or Dynamic Actions visibility.
- A component can deploy successfully and still not appear on any active page.
- Profiles are high-blast-radius metadata and can contain broad unrelated org state.
- Permission sets are safer for targeted access changes when the project uses them.
- Record types can affect page assignment, layout assignment, picklist values, automation, and permissions.
- `package.xml` manifests must stay narrow for metadata work; wildcard profile/layout/FlexiPage deployments are risky.
- Destructive deployments need a separate manifest, dependency review, validation-only run, rollback note, and explicit approval.
- Permission sets are usually safer than profiles for targeted access, but Apex class access, tabs, apps, custom permissions, and external-user context still need review.

## Metadata Folder Structure

- Object-scoped metadata belongs under `objects/<Object>/`.
- Fields belong under `objects/<Object>/fields/`.
- Validation rules belong under `objects/<Object>/validationRules/`.
- Record types belong under `objects/<Object>/recordTypes/`.
- Compact layouts belong under `objects/<Object>/compactLayouts/`.
- Layouts, FlexiPages, quick actions, tabs, applications, permission sets, profiles, custom metadata, custom permissions, static resources, email, reports, and dashboards each have distinct source-format folders.

Do not fix metadata by creating plausible folders or names. Inspect the real project first.

## Files

- Salesforce Files are multi-object and versioned.
- File-heavy tests can cause row locks.
- Large file/PDF payloads can exceed remoting or Apex heap limits.
- Mobile blob URLs are not equivalent to durable file URLs.
- Latest file state often lives on `ContentVersion`, while record access often depends on `ContentDocumentLink`.
- Public or portal access must be authorized server-side; a file ID or distribution URL is not enough proof.

## Mobile

- Permission prompts can change focus and visibility state.
- `getUserMedia()` does not prove preview paint.
- Popup/new-tab behavior can differ from desktop.
- Touch, blur, and click event order can differ from desktop.
