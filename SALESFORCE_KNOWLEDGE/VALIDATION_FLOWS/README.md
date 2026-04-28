# Validation Flows

These flows tell Codex which sequence to follow for common Salesforce task types.

Validation flows do not replace source inspection. They help Codex choose the next check after the real `force-app/main/default` is confirmed.

## Flow Files

| File | Use |
| --- | --- |
| [FIX_APEX_FLOW.md](FIX_APEX_FLOW.md) | Apex fixes and test failures. |
| [FIX_LWC_FLOW.md](FIX_LWC_FLOW.md) | LWC bugs and UI behavior. |
| [FIX_METADATA_FLOW.md](FIX_METADATA_FLOW.md) | Metadata, layouts, FlexiPages, actions, permissions. |
| [FIX_DEPLOYMENT_FLOW.md](FIX_DEPLOYMENT_FLOW.md) | Deployment and validation failures. |
| [PRE_RELEASE_FLOW.md](PRE_RELEASE_FLOW.md) | Pre-release or pre-push review. |

## Status Words

Use `PASS`, `FAIL`, `FOUND`, `MISSING`, and `SKIPPED` consistently when reporting validation.

Do not report `PASS` unless a command or runtime check actually passed. Static review, dry run, production validation, quick deploy, real deploy, test run, and analyzer run are separate evidence categories.
