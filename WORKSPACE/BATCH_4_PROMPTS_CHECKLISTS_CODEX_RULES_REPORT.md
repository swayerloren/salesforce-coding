# Batch 4 Prompts Checklists Codex Rules Report

## Summary

Implemented Batch 4 by strengthening Codex prompt pack templates, engine checklists, and operating instructions so future Salesforce work is routed through source inspection, verified metadata names, command/parameter maps, quality strategies, validation flows, public-safety rules, and evidence-backed reporting.

## Files Updated

- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/01_START_NEW_SALESFORCE_TASK.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/02_FIX_LWC.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/03_FIX_APEX.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/04_FIX_APEX_TESTS.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/05_FIX_DEPLOYMENT_FAILURE.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/06_FIX_METADATA_OR_RECORD_PAGE.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/07_FIX_SALESFORCE_FILES.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/08_FIX_MOBILE_SALESFORCE.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/09_REVIEW_BEFORE_GITHUB_PUSH.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/10_REVIEW_MEMORY_AND_HISTORY.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EVERY_CODEX_TASK.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EDITING_APEX.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EDITING_LWC.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EDITING_METADATA.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_DEPLOYMENT.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_GITHUB_PUSH.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/PUBLIC_REPO_SAFETY_CHECK.md`
- `INSTRUCTIONS/CODEX_RULES.md`
- `INSTRUCTIONS/DEVELOPMENT_WORKFLOW.md`
- `INSTRUCTIONS/MEMORY_AND_HISTORY_RULES.md`
- `INSTRUCTIONS/OUTPUT_FORMAT_RULES.md`
- `HISTORY/CODEX_RUN_LOG.md`
- `HISTORY/CHANGE_ARCHIVE.md`
- `MEMORY/PROJECT_MEMORY.md`

## New Files Created

- `WORKSPACE/BATCH_4_PROMPTS_CHECKLISTS_CODEX_RULES_REPORT.md`

## Prompt Improvements

- Added a shared global behavior-control block to each prompt pack template.
- Reinforced the required startup sequence: read `START_HERE.md`, read `INSTRUCTIONS/`, locate the real Salesforce DX project, confirm `force-app/main/default`, read the knowledge index, and read relevant Memory/History.
- Required current source inspection before editing or making Salesforce source claims.
- Required command maps, parameter maps, quality strategies, and validation flows before choosing validation commands.
- Added explicit no-guessing rules for object, field, metadata, Apex, component, permission, record type, org, and path names.
- Added explicit no-invented-metadata and no-placeholder-deployable-metadata controls.
- Added no unrelated edits, no broad formatting, and no over-refactor controls.
- Required external repo intelligence to remain learning-only, with no copied source, metadata, configs, workflow files, data, or sample names.
- Strengthened no-success-without-evidence reporting for tests, lint, Code Analyzer, deploys, retrieves, GitHub checks, and runtime checks.

## Checklist Improvements

- Strengthened before-task checks for external intelligence rules, command maps, parameter maps, validation flows, Memory/History planning, and public safety.
- Added Apex checks for verified identifiers, no broad refactors, external reference learning-only use, and exact validation evidence.
- Added LWC checks for external pattern usage rules, verified names, no copied external examples, and exact Jest/lint/analyzer/deploy evidence.
- Added metadata checks for parameter maps, no placeholder deployable metadata, no invented metadata names, and exact validation evidence.
- Added deployment checks for verified manifest names, learning-only external references, and exact command evidence.
- Added GitHub push and public repo safety checks for prompt/checklist behavior controls, no copied external source, no local-only paths, and no false pass claims.

## Instruction Improvements

- `CODEX_RULES.md` now includes external intelligence rules, stricter non-negotiable controls, exact validation terms, and private-derived lesson handling.
- `DEVELOPMENT_WORKFLOW.md` now requires external pattern rules when external lessons are used, current-file inspection before edits, no invented metadata, no over-refactor, no copied external source, and skipped validation reasons.
- `MEMORY_AND_HISTORY_RULES.md` now separates public-safe memory from private or copied content and requires validation status to distinguish passed, failed, skipped, and static-review-only checks.
- `OUTPUT_FORMAT_RULES.md` now defines strict validation terms and forbids passing claims for tests, lint, analyzer, deploy, retrieve, GitHub, or runtime checks without actual successful execution.

## Gaps Fixed

- Codex prompts now consistently route through real project discovery and `force-app/main/default` confirmation.
- Prompt/checklist behavior now blocks guessed API names and invented metadata.
- External repo intelligence is consistently framed as learning-only.
- Validation wording now separates static review from actual passing commands.
- Memory/History rules now protect against storing private or copied reference material.
- Public repo safety checks now cover copied external source and local audit path leakage.

## Sources Used

- `WORKSPACE/MASTER_KNOWLEDGE_GAP_MATRIX.md`
- `WORKSPACE/IMPROVEMENT_BATCH_PLAN.md`
- `WORKSPACE/EXTERNAL_REPO_INTELLIGENCE_STRATEGY.md`
- `WORKSPACE/LOCAL_REFERENCE_KNOWLEDGE_EXTRACTION.md`
- Existing prompt pack, checklist pack, and instruction files in this repo.

## Private Details Skipped

- No private names, customer details, org IDs, record IDs, deploy IDs, emails, phone numbers, local absolute paths, private URLs, credentials, tokens, raw debug logs, screenshots, or external source code were copied.
- Local private reference lessons were represented only as generic behavior controls and public-safe checklist rules.

## Remaining Gaps

- Batch 5 should polish README/wiki/release navigation after all batch changes are complete.
- Prompt effectiveness still needs real usage feedback from future Salesforce tasks.
- No real Salesforce DX project was present, so Salesforce tests, deploys, runtime checks, and org-specific validation were not run.

## Validation Result

- Markdown link check passed across 261 Markdown files.
- Public-safety scan passed across 25 changed/new files.
- No local absolute paths, credentials, tokens, private keys, authorization headers, private emails, Salesforce org ID-shaped values, Salesforce record ID-shaped values, or secret assignments were found in the changed/new files.
- No copied external source-code markers were found in the changed/new files.
- `git diff --check` was skipped because this downloaded workspace has no `.git` directory.
