# Aura And Visualforce Guide

Use this page for legacy Aura components, Aura wrappers, Visualforce pages, Visualforce controllers, and PDF output.

## Required Reads

| Work type | Read |
| --- | --- |
| Aura | `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_AURA_GUIDE.md` and `SALESFORCE_KNOWLEDGE/TOPICS/aura/` |
| Visualforce | `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_VISUALFORCE_GUIDE.md` and `SALESFORCE_KNOWLEDGE/TOPICS/visualforce/` |
| Record pages | `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_RECORD_PAGE_GUIDE.md` |
| Metadata | `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md` |
| Testing | `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_TESTING_GUIDE.md` |

## Aura Checklist

- [ ] Inspect `.cmp`, `.js`, `.helper.js`, `.css`, `.design`, `.auradoc`, and metadata files.
- [ ] Check whether Aura wraps LWC or exposes a template region.
- [ ] Check event contracts between Aura and child components.
- [ ] Check Apex controller calls.
- [ ] Check Lightning App Builder targets and design attributes.
- [ ] Avoid replacing Aura with LWC unless the task explicitly asks for that migration.

## Visualforce Checklist

- [ ] Inspect the `.page`.
- [ ] Inspect Apex controller and extension classes.
- [ ] Inspect related tests.
- [ ] Inspect custom labels, static resources, and object/field references.
- [ ] Preserve PDF rendering constraints if `renderAs="pdf"` is used.
- [ ] Avoid modern CSS or JavaScript that Visualforce PDF rendering cannot support.

## Visualforce PDF Rules

| Rule | Reason |
| --- | --- |
| Preserve stable markup. | PDF rendering is more fragile than browser rendering. |
| Keep CSS simple. | Salesforce PDF support is limited. |
| Avoid client-side dependencies. | PDF generation is server-rendered. |
| Validate output paths. | A page can compile but still render badly as PDF. |
| Keep controller tests focused. | Data shaping is usually the real behavior. |

## When To Refactor

Refactor only when:

- the user explicitly asks for it,
- the current implementation blocks the fix,
- test coverage protects the behavior,
- the deployment risk is understood.

