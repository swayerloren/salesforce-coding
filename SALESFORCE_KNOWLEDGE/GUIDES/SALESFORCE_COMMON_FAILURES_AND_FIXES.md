# Salesforce Common Failures And Fixes

| Symptom | Likely Root Cause | Fix Pattern |
| --- | --- | --- |
| Production deploy rejects `NoTestRun` | Production org requires tests even for metadata-only changes | Use `RunSpecifiedTests` with stable affected tests or `RunLocalTests` when appropriate |
| All selected tests pass but deploy fails coverage | Touched Apex class under selected-class coverage threshold | Add branch and negative-path tests for touched classes |
| `UNABLE_TO_LOCK_ROW` on files in broad tests | Parallel tests contend on `ContentVersion` / file records | Isolate test data; mark specific file-heavy tests `isParallel=false` |
| `Too many SOQL queries: 101` in unrelated test | Broad test list includes unstable legacy subsystem | Narrow deploy tests to affected classes for hotfix; fix SOQL separately |
| LWC template compile error | Template uses JS expressions | Move logic to getters |
| Quick action configured but not visible | Page assignment, overflow, permissions, or layout/action mismatch | Check quick action metadata, Highlights Panel, layout actions, page activation, FLS, Apex access |
| Visualforce retrieve fails for page | Wrong metadata type | Use `ApexPage:<Name>` |
| Apex math/helper compile issue | Runtime does not support assumed method/operator form | Use plain arithmetic known to compile |
| Batch test says only one executeBatch allowed | Test data creates multiple batch execute scopes | Increase batch size or split test scenarios |
| Mobile viewer opens at top of page | Inline mount inside scrolled record subtree | Use supported modal host and explicit fullscreen shell |
| Mobile page freezes after overlay close | Scroll/touch cleanup left to delayed unmount | Release interaction state synchronously in close path |
| Camera privacy indicator active but blank UI | Camera acquired but component shell/preview did not paint | Prove mount and shell visibility; gate ready state on visible preview |
| Blob PDF works desktop but not mobile | Mobile webview cannot reliably hand off blob target | Use durable HTTPS PDF URL for final mobile handoff |
| File list stale after upload/delete | Cacheable data not explicitly refreshed | Store wire result and call `refreshApex`; notify parent record |
| Compound address update fails | State leaf set without country leaf or root field updated directly | Write leaf fields and populate country code |
| Dynamic optional handler silently does nothing | Target class missing or not `System.Callable` | Use direct call for required logic; document optional seams |
| `escape=false` causes bad PDF content | Untrusted or malformed HTML rendered in Visualforce | Sanitize input or render as escaped/plain text |
| CSV bulk import parse error from PowerShell file | Encoding/BOM or quoting mismatch | Emit UTF-8 without BOM and validate CSV quoting |

