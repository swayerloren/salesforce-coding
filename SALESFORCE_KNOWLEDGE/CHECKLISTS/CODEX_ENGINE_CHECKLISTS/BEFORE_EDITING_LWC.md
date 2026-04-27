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
- [ ] `SALESFORCE_KNOWLEDGE/CHECKLISTS/before-lwc.md`

## Project And Bundle Checks

- [ ] Real Salesforce project located.
- [ ] Real `force-app/main/default` confirmed.
- [ ] Full LWC bundle inspected: `.html`, `.js`, `.css`, `.js-meta.xml`.
- [ ] Parent and child components inspected.
- [ ] Imported Apex controller methods inspected.
- [ ] DTO shape and server response handling inspected.
- [ ] `lightning/uiRecordApi`, navigation, toast, refresh, and event usage inspected.
- [ ] Jest tests inspected if present.

## Metadata And Visibility Checks

- [ ] `.js-meta.xml` targets checked.
- [ ] Object restrictions checked.
- [ ] Form factors checked.
- [ ] Quick action metadata checked if relevant.
- [ ] FlexiPage placement checked if relevant.
- [ ] Permission sets and object/field access checked if relevant.
- [ ] Mobile visibility and record-page behavior checked if relevant.

## LWC Safety Checks

- [ ] Template contains no unsupported JavaScript expressions.
- [ ] Computed display state belongs in JavaScript getters.
- [ ] Public `@api` contracts are preserved or all callers are updated.
- [ ] Component state and loading/error states remain coherent.
- [ ] Refresh behavior is explicit after data changes.
- [ ] CSS changes are scoped and do not break mobile or dark/light readability.
- [ ] No private data or credentials are hardcoded.

## Validation Plan

- [ ] Lint/Jest/static checks identified if configured.
- [ ] Focused Apex tests identified if Apex changed.
- [ ] Deploy dry-run scope identified if metadata validation is appropriate.
- [ ] If validation cannot run, the reason will be stated.

## Memory And History

- [ ] Reusable LWC lesson will be recorded in `MEMORY/` if applicable.
- [ ] Chronological result will be recorded in `HISTORY/`.

