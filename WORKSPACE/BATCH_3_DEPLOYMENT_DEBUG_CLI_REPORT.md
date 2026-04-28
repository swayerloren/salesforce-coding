# Batch 3 Deployment Debug CLI Report

## Summary

Implemented Batch 3 as original, public-safe Salesforce guidance for deployment, debugging, Salesforce CLI command selection, destructive deployment safety, debug-log triage, validation flows, Code Analyzer gating, release gates, and no-success-without-evidence behavior.

No private source data, raw logs, org usernames, org IDs, deployment IDs, credentials, local paths, private URLs, or external source code were copied into public repo knowledge files.

## Files Updated

- `SALESFORCE_KNOWLEDGE/INDEX.md`
- `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_DEPLOYMENT_GUIDE.md`
- `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_DEBUGGING_GUIDE.md`
- `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md`
- `SALESFORCE_KNOWLEDGE/COMMANDS/SALESFORCE_CLI_COMMAND_MAP.md`
- `SALESFORCE_KNOWLEDGE/COMMANDS/GITHUB_ACTION_COMMAND_MAP.md`
- `SALESFORCE_KNOWLEDGE/COMMANDS/README.md`
- `SALESFORCE_KNOWLEDGE/REFERENCE/salesforce-cli-command-reference.md`
- `SALESFORCE_KNOWLEDGE/PARAMETERS/LOCAL_AUTOMATION_PARAMETERS.md`
- `SALESFORCE_KNOWLEDGE/PARAMETERS/CODE_ANALYZER_PARAMETERS.md`
- `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/DEPLOYMENT_QUALITY_STRATEGY.md`
- `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/README.md`
- `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/FIX_DEPLOYMENT_FLOW.md`
- `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/PRE_RELEASE_FLOW.md`
- `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/README.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/deployment/destructive-deployment-safety.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/deployment/narrow-deploy-runbook.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/deployment/test-selection-guide.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/troubleshooting/debug-log-triage.md`
- `SALESFORCE_KNOWLEDGE/TOPICS/troubleshooting/deployment-errors.md`
- `SALESFORCE_KNOWLEDGE/EXAMPLES/metadata/package-xml-notes.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/before-deployment.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/metadata-deploy.md`
- `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_DEPLOYMENT.md`
- `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/05_FIX_DEPLOYMENT_FAILURE.md`
- `QUALITY_GATES/RELEASE_GATE.md`
- `QUALITY_GATES/CODE_ANALYZER_RULES.md`
- `TOOLS/SALESFORCE_CODE_ANALYZER.md`
- `TOOLS/INSTALL_TOOLING.md`
- `AUTOMATION/README.md`
- `AUTOMATION/local-quality-check.ps1`
- `AUTOMATION/local-quality-check.sh`
- `HISTORY/CODEX_RUN_LOG.md`
- `HISTORY/CHANGE_ARCHIVE.md`
- `MEMORY/PROJECT_MEMORY.md`

## New Files Created

- `WORKSPACE/BATCH_3_DEPLOYMENT_DEBUG_CLI_REPORT.md`

## Gaps Fixed

- Distinguished `sf project deploy start --dry-run`, `sf project deploy validate`, `sf project deploy report`, `sf project deploy quick`, and real deploy evidence.
- Added Salesforce CLI installed-help verification rules before mutating commands.
- Expanded `RunSpecifiedTests`, `RunLocalTests`, `NoTestRun`, and deployment-bound coverage warnings.
- Added package.xml and destructive manifest safety rules, including pre/post destructive timing, no wildcard deletion, no default purge, and rollback notes.
- Strengthened retrieve guidance so broad retrieve output is not treated as safe source without review.
- Added deployment/test/debug failure triage categories and report templates.
- Added deploy timeout and async job status rules requiring report commands before success/failure claims.
- Tightened Code Analyzer v5 guidance and removed retired scanner command shapes from current automation behavior.
- Added no-success-without-evidence rules across deployment, release, command maps, validation flows, and quality gates.
- Updated local automation wrappers to check current Salesforce CLI help for deploy, retrieve, Apex test, and Code Analyzer command families without running mutating commands.

## Sources Used

- Official Salesforce CLI command reference and installed local help for `project deploy start`, `project deploy validate`, `project deploy report`, `project deploy quick`, `project retrieve start`, and `apex run test`.
- Official Salesforce Code Analyzer docs for `code-analyzer rules` and `code-analyzer run`.
- Official Metadata API docs and source registry notes for package manifests and destructive deployments.
- Local public-safe extraction report for repeated deployment, debug-log, destructive deployment, and no-evidence failure patterns.
- Existing repo Batch 1 and Batch 2 topic docs for destructive deployment, debug-log triage, metadata activation, Code Analyzer, Files, and public-safety behavior.

## Private Details Skipped

- Org usernames, aliases, org IDs, deployment IDs, test run IDs, and raw command output containing private local configuration.
- Raw debug logs, stack traces, query filters, file names, generated document content, email or Chatter bodies, and screenshots.
- Credentials, tokens, auth URLs, session IDs, private URLs, local absolute paths, and private project names.
- External source code and copied command output examples from non-repo sources.

## Remaining Gaps

- Real deploy, retrieve, Apex test, Code Analyzer, and debug-log validation must run inside the actual Salesforce DX project and target org.
- Production validation and quick deploy behavior requires an authenticated org, owner-approved target alias, and release policy.
- Bash parse validation could only run if Bash is available on the machine.
- Batch 4 should route this guidance more deeply through remaining prompts/checklists and any release documentation polish.

## Validation Result

- Markdown link check: passed across 260 Markdown files.
- Public safety scan: passed across 34 Batch 3 files.
- PowerShell script parse check: passed for `AUTOMATION/local-quality-check.ps1`.
- Bash script parse check: skipped because Bash is not available in this PowerShell environment.
- No copied source code: passed; no external repo source markers were found in Batch 3 files.
- No local-only public paths: passed for Batch 3 changed/new files.
- `git diff --check`: skipped because this downloaded folder has no Git repository metadata.

Result: Batch 3 is ready for the next improvement batch, with the runtime limitation that real deploy, retrieve, Apex test, production validation, quick deploy, debug-log collection, and Code Analyzer gates must run inside the actual Salesforce DX project and target org when those features are changed.
