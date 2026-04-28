# Before Every Codex Task

Use this checklist before every task in this repo.

## Required Startup

- [ ] `START_HERE.md` has been read.
- [ ] `INSTRUCTIONS/` has been read for the relevant workflow, output, memory/history, and project placement rules.
- [ ] The real Salesforce project has been located, or the task has been confirmed as helper-repo-only.
- [ ] The real `force-app/main/default` folder has been confirmed before any Salesforce source edit.
- [ ] `SALESFORCE_KNOWLEDGE/INDEX.md` has been read.
- [ ] The relevant Salesforce knowledge guide has been read.
- [ ] The task-specific guide, topic, prompt, checklist, or pattern has been read.
- [ ] Relevant command maps in `SALESFORCE_KNOWLEDGE/COMMANDS/` have been read.
- [ ] Relevant parameter maps in `SALESFORCE_KNOWLEDGE/PARAMETERS/` have been read.
- [ ] Relevant quality strategy in `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/` has been read.
- [ ] Relevant validation flow in `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/` has been read.
- [ ] Relevant `MEMORY/` and `HISTORY/` context has been checked.
- [ ] The memory/history update plan is known for meaningful work.

## Source Inspection

- [ ] Existing real files have been inspected before editing.
- [ ] Related callers, tests, metadata, and UI entry points have been inspected where relevant.
- [ ] Object API names, field API names, metadata names, permission names, profile names, record type names or IDs, Apex method names, and component names have been verified in source.
- [ ] If multiple Salesforce DX projects are present, the intended target project is unambiguous.

## Change Control

- [ ] The root cause or reason for the change is understood.
- [ ] The smallest safe fix is clear.
- [ ] Unrelated files will not be edited.
- [ ] Salesforce DX structure will be preserved.
- [ ] No placeholder deployable Salesforce metadata will be created.
- [ ] Validation plan is clear, or validation limits are known.
- [ ] Available local automation wrappers have been considered before claiming validation is complete.
- [ ] Skipped validation gates will be reported with exact reasons.

## Safety

- [ ] No credentials, tokens, passwords, private keys, private URLs, org IDs, deploy IDs, user emails, customer names, local machine paths, or raw private debug logs will be added.
- [ ] If private data appears in user-provided output, it will be summarized or generalized before being written to repo files.
- [ ] Final response will not claim success without evidence.
