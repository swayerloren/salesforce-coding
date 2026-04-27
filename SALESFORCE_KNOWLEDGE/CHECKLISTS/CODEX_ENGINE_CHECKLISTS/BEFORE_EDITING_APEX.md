# Before Editing Apex

Use this checklist before editing Apex classes, triggers, services, controllers, invocable methods, queueables, batches, schedulers, futures, callout code, or Apex tests.

## Required Reads

- [ ] `START_HERE.md`
- [ ] `INSTRUCTIONS/`
- [ ] `SALESFORCE_KNOWLEDGE/INDEX.md`
- [ ] `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
- [ ] `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_ARCHITECTURE_GUIDE.md`
- [ ] `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_TESTING_GUIDE.md`
- [ ] `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md`
- [ ] `SALESFORCE_KNOWLEDGE/TOPICS/apex/`
- [ ] `SALESFORCE_KNOWLEDGE/CHECKLISTS/before-apex.md`

## Project And File Checks

- [ ] Real Salesforce project located.
- [ ] Real `force-app/main/default` confirmed.
- [ ] Target `.cls`, `.trigger`, and matching metadata files inspected.
- [ ] Related tests inspected.
- [ ] Callers and entry points inspected: triggers, controllers, services, LWC imports, Aura, Visualforce, Flow, scheduled jobs, invocable methods, and async paths.
- [ ] Referenced object and field metadata inspected.
- [ ] Public method usage searched before changing signatures.
- [ ] Required dependencies are separated from optional dynamic integrations.

## Apex Safety Checks

- [ ] No SOQL or DML in loops.
- [ ] Bulk behavior considered for all trigger and service paths.
- [ ] Recursion, re-entry, and async side effects considered.
- [ ] Sharing mode and access expectations understood.
- [ ] CRUD/FLS handling reviewed for UI-facing or external-facing Apex.
- [ ] Callout paths use mocks in tests.
- [ ] Required business behavior is not hidden behind optional dynamic dispatch.
- [ ] Existing behavior is preserved unless the root cause requires changing it.

## Validation Plan

- [ ] Focused Apex tests identified.
- [ ] Deploy dry-run scope identified if deployment validation is appropriate.
- [ ] Coverage impact considered for changed deploy-bound classes.
- [ ] If validation cannot run, the reason will be stated.

## Memory And History

- [ ] Reusable fix pattern will be recorded in `MEMORY/FIX_HISTORY.md` if applicable.
- [ ] Failure prevention rule will be recorded in `MEMORY/FAILURE_HISTORY.md` if applicable.
- [ ] Verified project-specific names or paths will be recorded in `MEMORY/KNOWN_ORG_PATTERNS.md` if useful and public-safe.
- [ ] Chronological result will be recorded in `HISTORY/`.

