# Before Editing Metadata

Use this checklist before editing Salesforce metadata such as objects, fields, layouts, FlexiPages, actions, tabs, permission sets, profiles, record types, custom metadata, named credentials, external credentials, and record pages.

## Required Reads

- [ ] `START_HERE.md`
- [ ] `INSTRUCTIONS/`
- [ ] `SALESFORCE_KNOWLEDGE/INDEX.md`
- [ ] `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md`
- [ ] `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_RECORD_PAGE_GUIDE.md`
- [ ] `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_DEPLOYMENT_GUIDE.md`
- [ ] `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md`
- [ ] `SALESFORCE_KNOWLEDGE/TOPICS/metadata/`
- [ ] `SALESFORCE_KNOWLEDGE/CHECKLISTS/metadata-deploy.md`
- [ ] `SALESFORCE_KNOWLEDGE/CHECKLISTS/before-record-page-ui-change.md`

## Project And Metadata Checks

- [ ] Real Salesforce project located.
- [ ] Real `force-app/main/default` confirmed.
- [ ] Target metadata family inspected, not only one XML file.
- [ ] Object API names verified in `objects/`.
- [ ] Field API names verified in field metadata.
- [ ] Layouts inspected if field or UI placement changes.
- [ ] FlexiPages inspected if record page visibility changes.
- [ ] Quick actions and action overrides inspected if relevant.
- [ ] Permission sets inspected if access changes.
- [ ] Profiles inspected only if the project uses them and the task requires it.
- [ ] Record types inspected if behavior or page assignment depends on them.
- [ ] LWC/Aura metadata inspected if a component is involved.

## Metadata Safety Checks

- [ ] No metadata name is guessed.
- [ ] No profile churn unless explicitly required.
- [ ] No broad retrieve noise or unrelated formatting churn.
- [ ] High-blast-radius files are handled deliberately: layouts, FlexiPages, app pages, profiles, permission sets, and record types.
- [ ] Page activation chain is understood: component metadata, action availability, page placement, permissions, record type, app assignment, and form factor.
- [ ] Named credential and external credential values are not exposed.
- [ ] No private URLs or secrets are added.

## Validation Plan

- [ ] Static XML/source inspection completed.
- [ ] Narrow deploy dry-run scope identified if possible.
- [ ] Focused tests identified if Apex behavior is affected.
- [ ] If validation cannot run, the reason will be stated.

## Memory And History

- [ ] Reusable metadata lesson will be recorded in `MEMORY/` if applicable.
- [ ] Verified project-specific metadata patterns will be recorded in `MEMORY/KNOWN_ORG_PATTERNS.md` if useful and public-safe.
- [ ] Chronological result will be recorded in `HISTORY/`.

