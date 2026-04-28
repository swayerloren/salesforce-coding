# Before Editing LWC

Use this checklist before editing Lightning Web Components.

## Required Reads

- [ ] `START_HERE.md`
- [ ] `INSTRUCTIONS/`
- [ ] `SALESFORCE_KNOWLEDGE/INDEX.md`
- [ ] `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md`
- [ ] `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_RECORD_PAGE_GUIDE.md`
- [ ] `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_MOBILE_GUIDE.md`
- [ ] `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md`
- [ ] `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md`
- [ ] `SALESFORCE_KNOWLEDGE/TOPICS/lwc/`
- [ ] `SALESFORCE_KNOWLEDGE/TOPICS/lwc/wire-imperative-cache-rules.md`
- [ ] `SALESFORCE_KNOWLEDGE/TOPICS/lwc/dynamic-record-fields.md`
- [ ] `SALESFORCE_KNOWLEDGE/TOPICS/lwc/navigation-toast-refresh.md`
- [ ] `SALESFORCE_KNOWLEDGE/TOPICS/mobile/mobile-camera-and-file-handoff.md` when mobile, quick actions, files, camera, or generated documents are in scope
- [ ] `SALESFORCE_KNOWLEDGE/TOPICS/metadata/quick-action-visibility-matrix.md` when record actions are in scope
- [ ] `SALESFORCE_KNOWLEDGE/TOPICS/files/photo-capture-annotation-viewer.md` when files, photos, reports, or PDFs are in scope
- [ ] `SALESFORCE_KNOWLEDGE/CHECKLISTS/before-lwc.md`
- [ ] `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_PATTERN_USAGE_RULES.md`
- [ ] `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/LWC_RECIPES_STRATEGY.md`
- [ ] `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/LWC_JEST_STRATEGY.md`
- [ ] `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/LWC_ESLINT_STRATEGY.md`
- [ ] `SALESFORCE_KNOWLEDGE/COMMANDS/LWC_TEST_COMMAND_MAP.md`
- [ ] `SALESFORCE_KNOWLEDGE/COMMANDS/NPM_SCRIPT_COMMAND_MAP.md`
- [ ] `SALESFORCE_KNOWLEDGE/PARAMETERS/LWC_JEST_PARAMETERS.md`
- [ ] `SALESFORCE_KNOWLEDGE/PARAMETERS/ESLINT_LWC_PARAMETERS.md`
- [ ] `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/LWC_QUALITY_STRATEGY.md`
- [ ] `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/FIX_LWC_FLOW.md`

## Project And Bundle Checks

- [ ] Real Salesforce project located.
- [ ] Real `force-app/main/default` confirmed.
- [ ] Full LWC bundle inspected: `.html`, `.js`, `.css`, `.js-meta.xml`.
- [ ] Parent and child components inspected.
- [ ] Imported Apex controller methods inspected.
- [ ] DTO shape and server response handling inspected.
- [ ] `lightning/uiRecordApi`, navigation, toast, refresh, and event usage inspected.
- [ ] Wire versus imperative Apex, cacheability, and post-save refresh inspected.
- [ ] Record forms, dynamic fields, and compound fields inspected when present.
- [ ] Jest tests inspected if present.

## Metadata And Visibility Checks

- [ ] `.js-meta.xml` targets checked.
- [ ] Object restrictions checked.
- [ ] Form factors checked.
- [ ] Quick action metadata checked if relevant.
- [ ] Dynamic Actions and action bar placement checked if relevant.
- [ ] FlexiPage placement checked if relevant.
- [ ] Permission sets and object/field access checked if relevant.
- [ ] Mobile visibility and record-page behavior checked if relevant.

## LWC Safety Checks

- [ ] Template contains no unsupported JavaScript expressions.
- [ ] Computed display state belongs in JavaScript getters.
- [ ] Public `@api` contracts are preserved or all callers are updated.
- [ ] Component state and loading/error states remain coherent.
- [ ] Refresh behavior is explicit after data changes.
- [ ] Navigation URL state is public-safe.
- [ ] Toasts happen after the durable operation, not before.
- [ ] File, photo, generated PDF, and Chatter-like mobile flows have explicit state and cleanup when present.
- [ ] CSS changes are scoped and do not break mobile or dark/light readability.
- [ ] No private data or credentials are hardcoded.
- [ ] Object, field, component, Apex method, target, form-factor, permission, and metadata names are verified in source.
- [ ] External repo intelligence is used as learning only; no source, sample metadata, config, workflow, or sample names are copied.
- [ ] No broad refactor, unrelated restyling, or template rewrite is included unless required by the root cause.

## Validation Plan

- [ ] Lint/Jest/static checks identified if configured.
- [ ] Existing package scripts are preferred over direct `npx` commands.
- [ ] LWC Jest, ESLint, mobile lint, or graph analyzer skipped reasons will be documented if unavailable.
- [ ] Focused Apex tests identified if Apex changed.
- [ ] Deploy dry-run scope identified if metadata validation is appropriate.
- [ ] Jest, ESLint, mobile lint, graph analyzer, Code Analyzer, deploy, and Apex tests will only be reported as passed when the exact command actually ran and passed.
- [ ] If validation cannot run, the reason will be stated.

## Memory And History

- [ ] Reusable LWC lesson will be recorded in `MEMORY/` if applicable.
- [ ] Chronological result will be recorded in `HISTORY/`.
