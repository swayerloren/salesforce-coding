# Salesforce Platform Limitations

## Deploy and Tests

- Production orgs reject `NoTestRun` in many deploy contexts.
- `RunSpecifiedTests` can still enforce coverage for deployed Apex classes.
- A broad test run can fail because of unrelated legacy tests.
- Apex tests can execute only one batch execution scope per method.

## Apex

- Apex is not Java. Do not assume every Java-like method or operator exists.
- Queueable/future/batch contexts restrict what async work can be enqueued.
- Callouts after DML require transaction design or test bypasses.
- Dynamic SOQL must be describe-validated.

## LWC

- Templates do not support arbitrary JavaScript expressions.
- Modal child props can arrive after `connectedCallback`; reactive sync may be required.
- Base component styling hooks differ across SLDS versions.
- Browser globals can behave differently in Lightning, mobile, and community runtimes.

## Metadata

- Active page assignment can differ by form factor, app, profile, and object override.
- Dynamic Forms, page layouts, and custom field LWCs can coexist on one page.
- Quick actions can exist in metadata but be hidden by placement, overflow, permissions, or dynamic visibility.

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

