# Batch 2 LWC Mobile Files VF Report

## Summary

Implemented Batch 2 as original, public-safe Salesforce knowledge guidance for LWC data patterns, mobile runtime behavior, Salesforce Files, photo/annotation/viewer flows, Visualforce PDF maintenance, Experience Cloud file access, and quick action visibility.

No private source data, private business details, external repo code, credentials, org IDs, or raw local reference content were copied into the repo knowledge files.

## Files Updated

- `SALESFORCE_KNOWLEDGE/INDEX.md`
- `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md`
- `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_MOBILE_GUIDE.md`
- `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_FILE_HANDLING_GUIDE.md`
- `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_VISUALFORCE_GUIDE.md`
- `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_RECORD_PAGE_GUIDE.md`
- `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/README.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/lwc/navigation-toast-refresh.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/visualforce/pdf-maintenance.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/files/contentdocument-lifecycle.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/metadata/flexipage-and-action-activation.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/troubleshooting/mobile-file-preview.md`
- `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/LWC_QUALITY_STRATEGY.md`
- `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/MOBILE_QUALITY_STRATEGY.md`
- `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/FIX_LWC_FLOW.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/02_FIX_LWC.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/07_FIX_SALESFORCE_FILES.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/08_FIX_MOBILE_SALESFORCE.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/before-lwc.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/mobile-compatibility.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EDITING_LWC.md`

## New Files Created

- `SALESFORCE_KNOWLEDGE/TOPICS/lwc/wire-imperative-cache-rules.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/lwc/dynamic-record-fields.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/files/photo-capture-annotation-viewer.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/mobile/mobile-camera-and-file-handoff.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/experience-cloud/portal-access-and-files.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/metadata/quick-action-visibility-matrix.md`
- `WORKSPACE/BATCH_2_LWC_MOBILE_FILES_VF_REPORT.md`

## Gaps Fixed

- Added LWC wire versus imperative Apex rules, cacheability guidance, refresh responsibilities, and failure patterns.
- Strengthened LWC getter/template rules for dynamic fields and record forms.
- Added guidance for `NavigationMixin`, PageReference safety, `ShowToastEvent`, and refresh ordering.
- Added `lightning-record-edit-form` versus custom form decision rules.
- Added mobile action bar and quick action visibility chain guidance across component metadata, action metadata, layouts, Dynamic Actions, FlexiPage activation, permissions, and form factor.
- Added mobile camera, file preview/download, PDF handoff, and generated artifact lifecycle rules.
- Added generic Salesforce Files guidance for photo capture, annotation, viewer, report generation, latest-version behavior, upload/preview/download, and server-side access.
- Added Visualforce page/controller/PDF rendering and generated file handoff guidance.
- Added Experience Cloud and portal file access rules for parent record access, file links, distributions, and URL safety.
- Added Chatter-like mobile action UX checks for blur timing, attachment progress, duplicate submit, and mention range alignment.

## Sources Used

- Local public-safe extraction report for repeated LWC, mobile, photo, file, Visualforce, Chatter, and PDF failure patterns.
- Official Salesforce source registry for LWC Developer Guide topics, Salesforce Files object model, Visualforce PDF behavior, NavigationMixin, toast events, UI API/LDS, Experience Cloud, and metadata/action guidance.
- Existing repo knowledge from Batch 1 for Files lifecycle, communication automation, metadata activation, and public-safety rules.

## Private Details Skipped

- Private object, field, and component names.
- Customer, employee, user, and business names.
- Emails, phone numbers, addresses, org IDs, session IDs, tokens, credentials, and private URLs.
- Raw debug logs, screenshots, generated document contents, file names, and record data.
- External repo source code and copied example implementations.
- Local-only absolute paths outside workspace audit context.

## Remaining Gaps

- Real Salesforce mobile device validation remains project-specific and cannot be proven inside this helper repo.
- Exact org-specific quick action visibility must be verified against the real project metadata and assigned profiles/apps/record types.
- Generated PDF, photo capture, and file preview/download behavior still needs runtime validation in any real Salesforce DX project that implements those features.
- Batch 3 should continue with deployment, CLI, metadata validation, debug-log, and package/destructive deployment guidance.

## Validation Result

- Markdown link check: passed across 259 Markdown files.
- Public safety scan: passed across Batch 2 changed/new docs and this report.
- No private data: passed for credential/token/private-key/session/org-ID/local-path/email-like scan patterns.
- No copied source code: passed; no external repo source code was copied into permanent docs.
- No local-only paths in public docs: passed for Batch 2 changed/new docs.
- `git diff --check`: skipped because this downloaded folder has no Git repository metadata.

Result: Batch 2 is ready for the next improvement batch, with the runtime limitation that real Salesforce mobile, file preview/download, generated PDF, LWC Jest/ESLint, Apex test, and deploy validation must be run inside the actual Salesforce DX project when those features are changed.
