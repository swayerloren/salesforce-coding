# External Intelligence Implementation Report

## Purpose

This report records the implementation of the external repo intelligence strategy into original repo documentation. No external source repositories were copied, vendored, or added as dependencies.

## Files Created

### External Intelligence

- `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/README.md`
- `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/EXTERNAL_REPO_INTELLIGENCE_MAP.md`
- `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/APEX_RECIPES_STRATEGY.md`
- `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/LWC_RECIPES_STRATEGY.md`
- `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/CODE_ANALYZER_STRATEGY.md`
- `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/LWC_JEST_STRATEGY.md`
- `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/LWC_ESLINT_STRATEGY.md`
- `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/LWC_MOBILE_STRATEGY.md`
- `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/APEX_FORMATTING_STRATEGY.md`
- `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/SALESFORCE_VSCODE_STRATEGY.md`
- `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/PR_SCAN_STRATEGY.md`

### Command Maps

- `SALESFORCE_KNOWLEDGE/COMMANDS/README.md`
- `SALESFORCE_KNOWLEDGE/COMMANDS/SALESFORCE_CLI_COMMAND_MAP.md`
- `SALESFORCE_KNOWLEDGE/COMMANDS/NPM_SCRIPT_COMMAND_MAP.md`
- `SALESFORCE_KNOWLEDGE/COMMANDS/LWC_TEST_COMMAND_MAP.md`
- `SALESFORCE_KNOWLEDGE/COMMANDS/APEX_VALIDATION_COMMAND_MAP.md`
- `SALESFORCE_KNOWLEDGE/COMMANDS/GITHUB_ACTION_COMMAND_MAP.md`

### Parameter Maps

- `SALESFORCE_KNOWLEDGE/PARAMETERS/README.md`
- `SALESFORCE_KNOWLEDGE/PARAMETERS/CODE_ANALYZER_PARAMETERS.md`
- `SALESFORCE_KNOWLEDGE/PARAMETERS/LWC_JEST_PARAMETERS.md`
- `SALESFORCE_KNOWLEDGE/PARAMETERS/ESLINT_LWC_PARAMETERS.md`
- `SALESFORCE_KNOWLEDGE/PARAMETERS/PRETTIER_APEX_PARAMETERS.md`
- `SALESFORCE_KNOWLEDGE/PARAMETERS/LOCAL_AUTOMATION_PARAMETERS.md`

### Quality Strategies

- `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/README.md`
- `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/APEX_QUALITY_STRATEGY.md`
- `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/LWC_QUALITY_STRATEGY.md`
- `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/METADATA_QUALITY_STRATEGY.md`
- `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/MOBILE_QUALITY_STRATEGY.md`
- `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/DEPLOYMENT_QUALITY_STRATEGY.md`
- `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/PULL_REQUEST_QUALITY_STRATEGY.md`

### Validation Flows

- `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/README.md`
- `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/FIX_APEX_FLOW.md`
- `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/FIX_LWC_FLOW.md`
- `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/FIX_METADATA_FLOW.md`
- `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/FIX_DEPLOYMENT_FLOW.md`
- `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/PRE_RELEASE_FLOW.md`

## Files Updated

- `README.md`
- `START_HERE.md`
- `SALESFORCE_KNOWLEDGE/INDEX.md`
- `TOOLS/TOOL_REGISTRY.md`
- `TOOLS/EXTERNAL_REFERENCE_REPOS.md`
- `QUALITY_GATES/README.md`
- `AUTOMATION/README.md`
- `VENDOR_REFERENCES/TOOL_SOURCE_MAP.md`
- `INSTRUCTIONS/CODEX_RULES.md`
- `INSTRUCTIONS/DEVELOPMENT_WORKFLOW.md`
- `INSTRUCTIONS/REPO_MAP.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/01_START_NEW_SALESFORCE_TASK.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/02_FIX_LWC.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/03_FIX_APEX.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/04_FIX_APEX_TESTS.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/05_FIX_DEPLOYMENT_FAILURE.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/06_FIX_METADATA_OR_RECORD_PAGE.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/09_REVIEW_BEFORE_GITHUB_PUSH.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EVERY_CODEX_TASK.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EDITING_APEX.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EDITING_LWC.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EDITING_METADATA.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_DEPLOYMENT.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_GITHUB_PUSH.md`
- `HISTORY/CODEX_RUN_LOG.md`
- `HISTORY/CHANGE_ARCHIVE.md`
- `MEMORY/PROJECT_MEMORY.md`

## Intelligence Integrated

| Source intelligence | Integrated as |
| --- | --- |
| Salesforce Code Analyzer | Static analysis strategy, command maps, parameter maps, quality gate routing, prompt/checklist rules. |
| Apex Recipes | Apex pattern strategy and reference-only guardrails. |
| LWC Recipes | LWC pattern strategy and reference-only guardrails. |
| LWC Jest | LWC unit test strategy and command/parameter maps. |
| ESLint LWC and config repos | LWC lint strategy, config decision guidance, rule-family guidance. |
| LWC mobile and graph analyzer | Mobile/offline quality strategy and optional validation guidance. |
| Prettier Apex | Check-first Apex formatting strategy and parameter map. |
| Salesforce VS Code Extensions | Local developer workflow and layered quality gate ideas. |
| SFDX scan pull request | PR scan strategy, severity threshold concepts, and check-run guidance. |

## Commands Documented

- Salesforce CLI deploy/test/Code Analyzer patterns.
- NPM script detection and preferred script behavior.
- LWC Jest command patterns.
- Apex test, Code Analyzer, and formatting validation patterns.
- GitHub Actions trigger and quality gate patterns.

## Parameters Documented

- Code Analyzer parameters: `--workspace`, `--target`, `--rule-selector`, `--config-file`, `--view`, `--output-file`, `--severity-threshold`, `--include-fixes`, `--include-suggestions`, and `--no-suppressions`.
- LWC Jest parameters: `--watch`, `--debug`, `--coverage`, `--updateSnapshot`, and `--`.
- LWC ESLint profile concepts: base, recommended, extended, i18n, SSR, TypeScript, mobile, and graph analyzer configurations.
- Prettier Apex parameters: plugin, check, write, debug-check, parser, and standalone parser options.
- Local automation parameters for PowerShell and shell scripts.

## Validation Flows Added

- Apex fix flow.
- LWC fix flow.
- Metadata fix flow.
- Deployment failure flow.
- Pre-release flow.

## Prompt And Checklist Updates

- Prompts now route Codex to the new command maps, parameter maps, quality strategies, validation flows, and external intelligence docs.
- Checklists now require Codex to identify validation command maps, tool parameters, skipped gates, and evidence before claiming success.

## What Was Not Copied

- No external source files.
- No external workflow files.
- No external package internals.
- No external sample metadata.
- No generated artifacts.
- No `.git` folders.
- No `node_modules`.
- No dependency code.
- No private data.

## Remaining Gaps

- The new docs are concise first-pass maps; future passes can deepen task-specific playbooks.
- GitHub Actions were not expanded in this pass beyond documentation routing.
- Commands marked as version-sensitive still need verification against installed tools in a real Salesforce DX project.
- No real Salesforce DX project is present in `FORCE_APP_DIRECTORY/`, so project-specific validation remains skipped by design.

## Validation Results

Validation was run after implementation:

- Markdown link check: passed across 219 Markdown files for local links outside fenced code blocks.
- Public safety scan: passed for credential-like assignments, token/session patterns, Salesforce org ID-shaped values, and local-only path references in public docs.
- No external code copied: passed; no cloned external repo trees were found in the main repo.
- No `.git` folders copied: passed; only the repository's own `.git` folder exists.
- No `node_modules` copied: passed.
- No local-only paths in public docs: passed after replacing literal path examples in the public safety checklist with descriptive patterns.
- No credentials/tokens/org IDs: passed.
- `FORCE_APP_DIRECTORY/`: contains only `.gitkeep`, `PLACE_SALESFORCE_PROJECT_HERE.md`, and `README.md`.
- `git diff --check`: passed.

## Commit Readiness

READY TO COMMIT after owner review. No commit or push was performed.
