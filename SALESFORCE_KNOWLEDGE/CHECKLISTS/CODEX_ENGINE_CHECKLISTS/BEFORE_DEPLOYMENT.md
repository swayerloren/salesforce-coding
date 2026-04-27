# Before Deployment

Use this checklist before any Salesforce validation, deploy dry run, or real deploy.

## Required Reads

- [ ] `START_HERE.md`
- [ ] `INSTRUCTIONS/`
- [ ] `SALESFORCE_KNOWLEDGE/INDEX.md`
- [ ] `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_DEPLOYMENT_GUIDE.md`
- [ ] `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_TESTING_GUIDE.md`
- [ ] `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md`
- [ ] `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md`
- [ ] `SALESFORCE_KNOWLEDGE/TOPICS/deployment/`
- [ ] `SALESFORCE_KNOWLEDGE/CHECKLISTS/before-deployment.md`
- [ ] `SALESFORCE_KNOWLEDGE/CHECKLISTS/metadata-deploy.md`

## Scope Checks

- [ ] Real Salesforce project located.
- [ ] Real `force-app/main/default` confirmed.
- [ ] Exact changed metadata files identified.
- [ ] Deploy scope includes only changed, required metadata.
- [ ] Documentation folders excluded: `INSTRUCTIONS/`, `SALESFORCE_KNOWLEDGE/`, `MEMORY/`, `HISTORY/`, `WORKSPACE/`, `ARCHIVE/`, `WIKI_DRAFTS/`.
- [ ] Helper repo files excluded unless they are intentionally docs-only and not part of deployment.
- [ ] No unrelated layouts, FlexiPages, profiles, or permission metadata included.
- [ ] No destructive operation is planned unless explicitly requested and reviewed.

## Test Checks

- [ ] Test level selected deliberately.
- [ ] Focused tests identified for changed Apex.
- [ ] Deploy-bound coverage impact considered.
- [ ] Callout mocks and async tests considered if relevant.
- [ ] Broad local tests considered only if risk requires them and the org can tolerate them.

## Command Checks

- [ ] Dry-run command prepared before real deploy.
- [ ] `--source-dir` or manifest scope is exact.
- [ ] Org alias is a placeholder in docs or a verified local alias for execution.
- [ ] No `--ignore-errors` or equivalent failure-hiding flag.
- [ ] Real deploy command matches the passing dry-run command when deployment is requested.

## Result Logging

- [ ] Deployment command and result will be recorded in `HISTORY/DEPLOYMENT_LOG.md`.
- [ ] Test command and result will be recorded in `HISTORY/TEST_RESULTS_LOG.md`.
- [ ] Failure root cause and prevention rule will be recorded in `MEMORY/FAILURE_HISTORY.md` if reusable.
- [ ] Final response will include command, result, files changed, assumptions, and limits.

