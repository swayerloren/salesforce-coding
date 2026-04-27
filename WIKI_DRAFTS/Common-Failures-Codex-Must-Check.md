# Common Failures Codex Must Check

This page lists failure patterns Codex should consider before making a Salesforce fix.

Codex must still inspect the real project source. This page is a checklist, not proof of root cause.

## Failure Map

| Symptom | Check first | Likely guide |
| --- | --- | --- |
| LWC deploy fails with template error | Template expressions, computed getters, invalid directives. | `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md` |
| LWC action does not appear | `.js-meta.xml`, quick action metadata, FlexiPage, permissions, form factor, visibility rules. | `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_RECORD_PAGE_GUIDE.md` |
| Apex test fails after a status change | Stale test expectations, normalized values, trigger side effects. | `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_TESTING_GUIDE.md` |
| Apex hits SOQL or DML limits | Loops, selectors, trigger recursion, repeated queries, missing bulkification. | `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md` |
| Deployment fails with missing field or object | Unverified API name, missing metadata, wrong namespace, package dependency. | `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md` |
| Deployment passes tests but fails coverage | Touched Apex class lacks deployable branch coverage. | `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_DEPLOYMENT_GUIDE.md` |
| Record page feature missing for users | Permissions, record type, app assignment, form factor, page activation. | `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_RECORD_PAGE_GUIDE.md` |
| Files behavior is inconsistent | `ContentVersion`, `ContentDocument`, `ContentDocumentLink`, latest version, sharing. | `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_FILE_HANDLING_GUIDE.md` |
| Mobile behavior differs from desktop | Salesforce mobile webview constraints, modal sizing, tap targets, scroll containers. | `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_MOBILE_GUIDE.md` |
| Optional integration silently does nothing | Dynamic class lookup or `System.Callable` missing required implementation. | `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_ARCHITECTURE_GUIDE.md` |

## Root Cause Checklist

- [ ] What exact command, UI flow, or test failed?
- [ ] What file introduces the behavior?
- [ ] Which Salesforce platform rule explains the failure?
- [ ] Which object, field, metadata, class, or component names are verified?
- [ ] Which files are related but should not be edited?
- [ ] What is the smallest safe fix?
- [ ] What validation can prove the fix?

## Do Not Patch Blindly

Do not:

- change unrelated tests to make failures disappear,
- broaden deploy scope without evidence,
- rename metadata without checking references,
- hide required logic behind optional dispatch,
- add `SeeAllData=true` unless there is no reasonable alternative,
- claim a fix works without validation or a stated limitation.
