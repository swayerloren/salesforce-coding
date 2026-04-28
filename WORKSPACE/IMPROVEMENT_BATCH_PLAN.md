# Improvement Batch Plan

Generated: 2026-04-28

Purpose: divide the repo improvements into safe batches. This plan intentionally keeps all future drafted content public-safe and staged through `WORKSPACE/` before any main knowledge files are edited.

## Batch Rules

- Do not copy private local reference text.
- Do not copy zip source code, metadata XML, generated reports, screenshots, logs, or README prose.
- Prefer official Salesforce docs for normative behavior.
- Use Trailhead only as learning support.
- Keep command examples behind an explicit verification step against official docs and local installed help.
- Draft proposed edits in `WORKSPACE/proposed_knowledge_updates/` before changing `SALESFORCE_KNOWLEDGE/`.
- Run JSON, link/path, and private-data scans before any public knowledge update.

## Batch 1: P0 Salesforce Technical Gaps

Objective: fix the highest-risk Salesforce behavior gaps first.

Topics:

- Security matrix for sharing, CRUD/FLS, user mode, system mode, LDS/UI API, and exposed Apex.
- Apex trigger order-of-execution and Flow-aware warnings.
- Apex tests for async, Files, permissions, selected tests, communication automation, and branch assertions.
- Salesforce Files object lifecycle for `ContentDocument`, `ContentVersion`, and `ContentDocumentLink`.
- Destructive deployment safety.
- Code Analyzer v5 command and parameter alignment.
- Deployment validation evidence.
- Debug-log triage and sanitization.
- Governor-limit warning model.
- Compound address field rules.
- Communication automation for email, activity, Chatter, ConnectApi, mentions, idempotency, and logging.

Primary files to create:

- `SALESFORCE_KNOWLEDGE/TOPICS/security/sharing-crud-fls-user-mode-matrix.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/apex/trigger-order-of-execution.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/files/contentdocument-lifecycle.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/deployment/destructive-deployment-safety.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/troubleshooting/debug-log-triage.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/addresses/compound-address-fields.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/communication/chatter-email-activity-patterns.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/before-communication-automation.md`

Primary files to update:

- `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
- `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_TESTING_GUIDE.md`
- `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_FILE_HANDLING_GUIDE.md`
- `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_DEPLOYMENT_GUIDE.md`
- `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_DEBUGGING_GUIDE.md`
- `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_PLATFORM_LIMITATIONS.md`
- `TOOLS/SALESFORCE_CODE_ANALYZER.md`
- `QUALITY_GATES/CODE_ANALYZER_RULES.md`
- `SALESFORCE_KNOWLEDGE/PARAMETERS/CODE_ANALYZER_PARAMETERS.md`
- `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/FIX_DEPLOYMENT_FLOW.md`
- `SALESFORCE_KNOWLEDGE/DOCS/public-sanitization-policy.md`

Draft validation:

- JSON not required unless adding metadata maps.
- No raw debug logs, email bodies, Chatter bodies, source code from archives, or private names.
- All examples use generic object names and placeholder IDs only where necessary.
- Command examples include a "verify installed help first" note.

Done criteria:

- Every P0 gap has a proposed public-safe page or patch draft.
- Drafts cite or name official source families without long copied text.
- A private-data scan returns zero high-risk matches.

## Batch 2: LWC/Mobile/Files/VF Gaps

Objective: improve user-interface and generated-document guidance after the core P0 platform gaps are drafted.

Topics:

- LWC wire service, imperative Apex, LDS/UI API, caching, refresh, and navigation.
- Dynamic record field components.
- Salesforce mobile app runtime versus desktop responsive testing.
- Camera, preview, annotation, upload, generated-document handoff, and overlay cleanup.
- Experience Cloud and portal file access.
- Visualforce PDF rendering constraints and file/mobile handoff.
- Quick action visibility from LWC and record pages.

Primary files to create:

- `SALESFORCE_KNOWLEDGE/TOPICS/lwc/dynamic-record-fields.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/lwc/wire-imperative-cache-rules.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/files/photo-capture-annotation-viewer.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/mobile/mobile-camera-and-file-handoff.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/experience-cloud/portal-access-and-files.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/metadata/quick-action-visibility-matrix.md`

Primary files to update:

- `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md`
- `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_MOBILE_GUIDE.md`
- `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_VISUALFORCE_GUIDE.md`
- `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_RECORD_PAGE_GUIDE.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/lwc/navigation-toast-refresh.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/visualforce/pdf-maintenance.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/07_FIX_SALESFORCE_FILES.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/08_FIX_MOBILE_SALESFORCE.md`

Draft validation:

- Do not include screenshots, file names, local URLs, or mobile app recordings.
- Keep mobile validation claims explicit: verified, not verified, or requires real-device check.
- Avoid hardcoded Lightning URLs in examples.

Done criteria:

- LWC data access choices are clear.
- Mobile and Files runtime warnings are represented in guides, topics, prompts, and quality strategies.
- Visualforce PDF guidance separates rendering constraints from generated file handoff.

## Batch 3: Deployment/Debugging/CLI/Metadata Gaps

Objective: improve release and metadata safety after core technical pages exist.

Topics:

- Salesforce CLI command verification.
- `package.xml` and metadata coverage.
- Source format versus metadata format.
- Salesforce DX project discovery.
- FlexiPages, layouts, permission sets, profiles, reports, dashboards, and static resources.
- Debugging and deployment evidence capture.
- Named credentials and external credentials.
- Flow interaction with Apex/LWC.

Primary files to create:

- `SALESFORCE_KNOWLEDGE/TOPICS/security/named-external-credentials.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/architecture/flow-apex-lwc-interactions.md`

Primary files to update:

- `SALESFORCE_KNOWLEDGE/COMMANDS/SALESFORCE_CLI_COMMAND_MAP.md`
- `SALESFORCE_KNOWLEDGE/REFERENCE/salesforce-cli-command-reference.md`
- `SALESFORCE_KNOWLEDGE/PARAMETERS/LOCAL_AUTOMATION_PARAMETERS.md`
- `SALESFORCE_KNOWLEDGE/EXAMPLES/metadata/package-xml-notes.md`
- `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md`
- `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_RECORD_PAGE_GUIDE.md`
- `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_ARCHITECTURE_GUIDE.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/project-discovery.md`
- `FORCE_APP_DIRECTORY/README.md`

Draft validation:

- CLI commands are marked as examples until verified against installed help.
- Destructive commands remain fenced behind explicit user request and validation-only checks.
- High-risk metadata examples stay generic and source-format-aware.

Done criteria:

- Deployment and metadata docs tell Codex what to inspect before changing source.
- CLI maps distinguish inspect, retrieve, validate, deploy, test, and destructive operations.
- Named/external credential guidance makes secret non-publication explicit.

## Batch 4: Prompts/Checklists/Validation Flows

Objective: turn the new knowledge into Codex behavior rules.

Prompt updates:

- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/02_FIX_LWC.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/03_FIX_APEX.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/04_FIX_APEX_TESTS.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/05_FIX_DEPLOYMENT_FAILURE.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/06_FIX_METADATA_OR_RECORD_PAGE.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/07_FIX_SALESFORCE_FILES.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/08_FIX_MOBILE_SALESFORCE.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/fix-chatter-email-activity-safely.md`

Checklist and validation-flow updates:

- `SALESFORCE_KNOWLEDGE/CHECKLISTS/before-apex.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/before-lwc.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/before-deployment.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/before-record-page-ui-change.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/PUBLIC_REPO_SAFETY_CHECK.md`
- `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/FIX_APEX_FLOW.md`
- `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/FIX_LWC_FLOW.md`
- `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/FIX_METADATA_FLOW.md`
- `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/FIX_DEPLOYMENT_FLOW.md`

Done criteria:

- New topic pages are discoverable from relevant prompts and checklists.
- Prompts require evidence, not unsupported claims.
- Public-safety checks cover private-derived lessons, logs, emails, Chatter, screenshots, generated files, local state, and zip artifacts.

## Batch 5: README/Wiki/Release Polish

Objective: make the improved knowledge base navigable without changing the technical meaning.

Files to update:

- `SALESFORCE_KNOWLEDGE/INDEX.md`
- `SALESFORCE_KNOWLEDGE/README.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/README.md`
- `SALESFORCE_KNOWLEDGE/GUIDES/README.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/README.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/README.md`
- `SALESFORCE_KNOWLEDGE/REFERENCE/sanitized-lessons-catalog.md`
- `TOOLS/TOOL_REGISTRY.md`
- `QUALITY_GATES/README.md`

Polish steps:

- Add cross-links for new topic pages.
- Add a short "what changed" release note in `WORKSPACE/` first.
- Keep all navigation repo-relative.
- Avoid adding marketing language or private provenance details.

Done criteria:

- A new user can find P0 safety guidance from the index.
- The prompt pack points to the right topic pages.
- The README/wiki layer reflects the new structure without duplicating full guidance.

## Batch 6: Final Safety Validation

Objective: verify that the final changes are public-safe, parseable where applicable, and limited to intended docs.

Validation checks:

- JSON parse check for every changed `.json` file.
- Private-data scan for email-like values, local absolute paths, org IDs, session markers, authorization header markers, private key blocks, and secret assignments.
- Search for copied zip source-code markers, generated report folders, screenshots, logs, and local Salesforce state references.
- Search for raw debug log, email body, Chatter body, customer-specific record, and private URL leakage.
- Link/path sanity check for new repo-relative links.
- Confirm no extracted zip folders are present.
- Confirm no commits or pushes were made unless a later prompt explicitly requests them.

Suggested validation outputs:

- `WORKSPACE/FINAL_KNOWLEDGE_UPDATE_VALIDATION.md`
- `WORKSPACE/FINAL_KNOWLEDGE_UPDATE_VALIDATION.json`

Done criteria:

- All validation checks pass or have documented, non-sensitive exceptions.
- Main knowledge docs contain only public-safe generic guidance.
- The final summary lists changed files, validation commands, and any residual manual review items.
