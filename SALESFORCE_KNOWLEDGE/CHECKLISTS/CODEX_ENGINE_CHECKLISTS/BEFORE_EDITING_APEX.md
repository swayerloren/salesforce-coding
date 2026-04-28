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
- [ ] `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_PATTERN_USAGE_RULES.md`
- [ ] `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_APEX_RECIPES_MAP.md` when a public pattern reference is useful
- [ ] `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/APEX_RECIPES_STRATEGY.md`
- [ ] `SALESFORCE_KNOWLEDGE/COMMANDS/APEX_VALIDATION_COMMAND_MAP.md`
- [ ] `SALESFORCE_KNOWLEDGE/PARAMETERS/CODE_ANALYZER_PARAMETERS.md`
- [ ] `SALESFORCE_KNOWLEDGE/PARAMETERS/PRETTIER_APEX_PARAMETERS.md`
- [ ] `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/APEX_QUALITY_STRATEGY.md`
- [ ] `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/FIX_APEX_FLOW.md`
- [ ] `TOOLS/SALESFORCE_CODE_ANALYZER.md`
- [ ] `TOOLS/PRETTIER_APEX.md`
- [ ] `QUALITY_GATES/CODE_ANALYZER_RULES.md`
- [ ] `QUALITY_GATES/APEX_FORMATTING.md`

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
- [ ] No hard-coded Salesforce IDs, record type IDs, profile IDs, permission set IDs, queue IDs, usernames, or org-specific IDs.
- [ ] Null-safe checks exist for optional relationships, missing map keys, empty query results, blank DTO fields, and missing custom metadata.
- [ ] Recursion, re-entry, and async side effects considered.
- [ ] Sharing mode and access expectations understood.
- [ ] Sharing/security intent is explicit for changed classes.
- [ ] CRUD/FLS handling reviewed for UI-facing or external-facing Apex.
- [ ] User-mode data operation expectations reviewed if the project uses them.
- [ ] Callout paths use mocks in tests.
- [ ] Test data is created in tests or verified project factories.
- [ ] Tests include real assertions that prove behavior.
- [ ] Required business behavior is not hidden behind optional dynamic dispatch.
- [ ] Existing behavior is preserved unless the root cause requires changing it.
- [ ] Apex Recipes is treated as a pattern reference only, not a direct copy source.
- [ ] External repo intelligence is used as learning only; no source, sample metadata, config, workflow, or sample names are copied.
- [ ] Object, field, class, method, permission, record type, and org identifiers are verified in source or treated as unknown.
- [ ] No broad refactor or unrelated formatting churn is included in the fix.

## Validation Plan

- [ ] Focused Apex tests identified.
- [ ] Salesforce Code Analyzer will run if available, or the skipped reason will be documented.
- [ ] Optional Apex formatting check will run if configured, or the skipped reason will be documented.
- [ ] Exact command options have been checked against the command and parameter maps.
- [ ] Deploy dry-run scope identified if deployment validation is appropriate.
- [ ] Coverage impact considered for changed deploy-bound classes.
- [ ] Tests, Code Analyzer, formatting, and deploy checks will only be reported as passed when the exact command actually ran and passed.
- [ ] If validation cannot run, the reason will be stated.

## Memory And History

- [ ] Reusable fix pattern will be recorded in `MEMORY/FIX_HISTORY.md` if applicable.
- [ ] Failure prevention rule will be recorded in `MEMORY/FAILURE_HISTORY.md` if applicable.
- [ ] Verified project-specific names or paths will be recorded in `MEMORY/KNOWN_ORG_PATTERNS.md` if useful and public-safe.
- [ ] Chronological result will be recorded in `HISTORY/`.
