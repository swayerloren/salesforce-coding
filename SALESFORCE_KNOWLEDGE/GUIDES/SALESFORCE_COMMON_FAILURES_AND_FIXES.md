# Salesforce Common Failures And Fixes

| Symptom | Likely Root Cause | Fix Pattern |
| --- | --- | --- |
| Production deploy rejects `NoTestRun` | Production org requires tests even for metadata-only changes | Use `RunSpecifiedTests` with stable affected tests or `RunLocalTests` when appropriate |
| `project deploy validate` seems to deploy nothing | Validation created a deploy job but did not commit metadata | Use `sf project deploy quick` only after a successful validation job and owner approval |
| Dry run passed but quick deploy unavailable | Dry run and production validation are different command flows | Use `sf project deploy validate` when a quick deploy job is required |
| All selected tests pass but deploy fails coverage | Touched Apex class under selected-class coverage threshold | Add branch and negative-path tests for touched classes |
| Deploy status unknown after timeout | CLI returned before completion | Use `sf project deploy report --job-id <id>` and record the result before claiming success or failure |
| Retrieve overwrote local source unexpectedly | Broad retrieve or conflict-ignore behavior wrote org state locally | Retrieve narrowly, avoid ignore-conflicts unless approved, and review every output file |
| `package.xml` deploy includes unrelated metadata | Manifest was generated too broadly or not inspected | Keep package manifests narrow and remove high-risk unrelated members |
| Destructive change validates with warnings only because warnings were ignored | Failure-hiding flag changed deploy success semantics | Treat as risk state, inspect warnings, and do not claim clean success |
| `UNABLE_TO_LOCK_ROW` on files in broad tests | Parallel tests contend on `ContentVersion` / file records | Isolate test data; mark specific file-heavy tests `isParallel=false` |
| `Too many SOQL queries: 101` in unrelated test | Broad test list includes unstable legacy subsystem | Narrow deploy tests to affected classes for hotfix; fix SOQL separately |
| LWC template compile error | Template uses JS expressions | Move logic to getters |
| LWC data stays stale after save | Imperative Apex changed data but only local state refreshed | Await save, refresh wired Apex, notify LDS records, and notify parent/page participants |
| Wired Apex mutation behaves inconsistently | A non-cacheable command was implemented as a wire | Use imperative Apex for mutations and reserve wired Apex for cacheable reads |
| Record form hides useful field errors | Custom form bypassed standard LDS form behavior without recreating field error handling | Use `lightning-record-edit-form` for focused record edits or map server errors to fields |
| Dynamic field LWC exposes or crashes on fields | Field config was trusted without metadata and access checks | Allowlist against metadata, CRUD/FLS, type support, and compound-field rules |
| Quick action configured but not visible | Page assignment, overflow, permissions, or layout/action mismatch | Check quick action metadata, Highlights Panel, layout actions, page activation, FLS, Apex access |
| Mobile action missing from action bar | Phone form factor, Dynamic Actions, layout action list, or permissions differ from desktop | Inspect component target, action metadata, layout, Dynamic Actions, activation, and permissions |
| Visualforce retrieve fails for page | Wrong metadata type | Use `ApexPage:<Name>` |
| Apex math/helper compile issue | Runtime does not support assumed method/operator form | Use plain arithmetic known to compile |
| Batch test says only one executeBatch allowed | Test data creates multiple batch execute scopes | Increase batch size or split test scenarios |
| Mobile viewer opens at top of page | Inline mount inside scrolled record subtree | Use supported modal host and explicit fullscreen shell |
| Mobile page freezes after overlay close | Scroll/touch cleanup left to delayed unmount | Release interaction state synchronously in close path |
| Camera privacy indicator active but blank UI | Camera acquired but component shell/preview did not paint | Prove mount and shell visibility; gate ready state on visible preview |
| Blob PDF works desktop but not mobile | Mobile webview cannot reliably hand off blob target | Use durable HTTPS PDF URL for final mobile handoff |
| PDF opens once but is not available later | Output was only launched in a tab and never stored as a durable file | Attach generated output as Salesforce File or intentional distribution artifact |
| File list stale after upload/delete | Cacheable data not explicitly refreshed | Store wire result and call `refreshApex`; notify parent record |
| File rollup wrong after new version | Code treated a file as one row or queried stale `ContentVersion` | Recompute from current `ContentDocumentLink` rows and latest versions |
| Portal user cannot open file | Internal-user sharing assumptions leaked into Experience Cloud | Verify parent record access, file link/distribution access, and site navigation separately |
| Compound address update fails | State leaf set without country leaf or root field updated directly | Write leaf fields and populate country code |
| Chatter mention posts wrong user or wrong text | Body text and mention ranges diverged, often after mobile selection changes | Commit exact body and mention ranges together; test mobile selection behavior |
| Email or activity automation duplicates records | Retry path lacks durable idempotency key or threading identifier | Store a source identifier and block duplicate side effects |
| Raw debug log cannot be published | Log contains record IDs, field values, user context, or message content | Summarize entry point, failing layer, category, root cause, and fix |
| Destructive deploy would remove wrong metadata | Metadata full names or dependencies were not reviewed narrowly | Use separate destructive manifest, validate-only first, and document rollback |
| Code Analyzer reported skipped but docs say pass | Missing tool or missing project target was treated as success | Report `SKIPPED` with reason; never claim static analysis passed without a passing analyzer run |
| Debug log points at the wrong layer | Raw log line was treated as root cause without deployment/runtime context | Summarize entry point, actor, failing layer, category, root cause, fix, and validation |
| Apex appears secure but leaks fields | Sharing keyword was treated as CRUD/FLS enforcement | Add user-mode, `stripInaccessible`, describe checks, or fail-fast query checks as appropriate |
| Trigger fix works in UI but fails in automation | Order of execution or Flow re-entry was not inspected | Review validation, duplicate rules, Flows, recursion guards, and async side effects |
| Dynamic optional handler silently does nothing | Target class missing or not `System.Callable` | Use direct call for required logic; document optional seams |
| `escape=false` causes bad PDF content | Untrusted or malformed HTML rendered in Visualforce | Sanitize input or render as escaped/plain text |
| CSV bulk import parse error from PowerShell file | Encoding/BOM or quoting mismatch | Emit UTF-8 without BOM and validate CSV quoting |
