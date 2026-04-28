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

## Mobile

- Permission prompts can change focus and visibility state.
- `getUserMedia()` does not prove preview paint.
- Popup/new-tab behavior can differ from desktop.
- Touch, blur, and click event order can differ from desktop.
