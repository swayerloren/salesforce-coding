# Source Mapping

## Source Areas Analyzed

The public repo was created after reviewing the Salesforce engineering documentation under the local `AI_AGENT` folder, excluding the prohibited prompt file named `FOR CHAT GPT.md`.

The analyzed areas included:

- execution and deployment instructions,
- global Apex, LWC, deployment, dark mode, mobile, and Visualforce rules,
- root architecture guides,
- deployment and testing runbooks,
- test audit notes,
- shared file-analysis and address patterns,
- debug logs and failure histories,
- system docs for files, record contacts, email reply ingestion, mobile action bars, mobile Chatter, media flows, Visualforce PDFs, and record-page architecture,
- reference exports describing FlexiPage, LWC placement, record-page, action, Aura template, and layout behavior.

## Knowledge Extracted

The extracted reusable knowledge includes:

- thin trigger and service-layer Apex patterns,
- direct required dependency vs optional dynamic dependency guidance,
- production deploy and test-level rules,
- selected-class coverage lessons,
- test design and file row-lock lessons,
- LWC template getter rules,
- LWC refresh, navigation, toast, and modal patterns,
- Salesforce mobile webview quirks,
- file upload, rollup, preview, and large PDF handling,
- FlexiPage, action, Dynamic Forms, and record-page assignment reasoning,
- Visualforce PDF preservation rules,
- debugging and instrumentation methods,
- public-safe prompts and checklists for AI agents.

## Intentionally Excluded

The new public repo intentionally excludes:

- private customer or business names,
- customer-specific page maps and workflows copied verbatim,
- real addresses, claim/customer details, users, emails, IDs, tokens, credentials, deploy IDs, and sensitive URLs,
- private local paths except where this source-mapping file explains the broad local source category,
- raw JSON exports,
- raw internal debug timelines that included private org context,
- source code copied directly from production metadata,
- any file explicitly marked out of Codex scope by the local instructions.

## Mapping From Source Categories To New Docs

| AI_AGENT source category | Public docs created |
| --- | --- |
| Execution/deploy rules | `SALESFORCE_DEPLOYMENT_GUIDE.md`, `deployment/`, `checklists/before-deployment.md` |
| Apex architecture and trigger standards | `SALESFORCE_APEX_GUIDE.md`, `apex/`, `examples/apex/` |
| LWC architecture and style/mobile docs | `SALESFORCE_LWC_GUIDE.md`, `lwc/`, `mobile/`, `examples/lwc/` |
| Debug logs | `SALESFORCE_DEBUGGING_GUIDE.md`, `SALESFORCE_COMMON_FAILURES_AND_FIXES.md`, `troubleshooting/` |
| File and media lessons | `SALESFORCE_FILE_HANDLING_GUIDE.md`, `mobile/`, `troubleshooting/mobile-file-preview.md` |
| Visualforce/PDF rules | `SALESFORCE_VISUALFORCE_GUIDE.md`, `visualforce/pdf-maintenance.md` |
| FlexiPage and LWC placement references | `SALESFORCE_METADATA_GUIDE.md`, `SALESFORCE_RECORD_PAGE_GUIDE.md`, `metadata/` |
| Test audit and coverage notes | `SALESFORCE_TESTING_GUIDE.md`, `testing/`, `deployment/test-selection-guide.md` |
| AI-agent workflow patterns | `prompts/`, `checklists/`, `docs/engineering-principles.md` |

