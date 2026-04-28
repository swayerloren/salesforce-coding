# Quality Strategies

These strategies explain how Codex should combine Salesforce knowledge, external tooling intelligence, local automation, and project-specific inspection.

## Strategy Files

| File | Use |
| --- | --- |
| [APEX_QUALITY_STRATEGY.md](APEX_QUALITY_STRATEGY.md) | Apex and trigger quality. |
| [LWC_QUALITY_STRATEGY.md](LWC_QUALITY_STRATEGY.md) | Lightning Web Component quality. |
| [METADATA_QUALITY_STRATEGY.md](METADATA_QUALITY_STRATEGY.md) | Salesforce metadata and record page quality. |
| [MOBILE_QUALITY_STRATEGY.md](MOBILE_QUALITY_STRATEGY.md) | Salesforce mobile/offline quality. |
| [DEPLOYMENT_QUALITY_STRATEGY.md](DEPLOYMENT_QUALITY_STRATEGY.md) | Validation and deployment quality. |
| [PULL_REQUEST_QUALITY_STRATEGY.md](PULL_REQUEST_QUALITY_STRATEGY.md) | GitHub PR quality gates. |

## Codex Rule

Quality is evidence-backed. If a command did not run, Codex must report the gate as skipped and explain why.

For deployment work, Codex must name the exact evidence category: static review, local tool pass, Apex test pass, dry-run deploy pass, production validation pass, quick deploy pass, real deploy pass, or skipped.
