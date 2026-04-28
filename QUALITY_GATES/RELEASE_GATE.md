# Release Gate

Use this gate before pushing or releasing repo changes.

## Repository Release Checks

- [ ] `git status` reviewed.
- [ ] Markdown links checked.
- [ ] No local-only paths in public docs.
- [ ] No temporary folder references.
- [ ] No credentials, tokens, private keys, session IDs, org IDs, or private data.
- [ ] `FORCE_APP_DIRECTORY/` contains only intended placeholder/instruction content unless owner intentionally adds public metadata.
- [ ] Release notes, changelog, tags, and latest release page agree.
- [ ] GitHub Actions workflow status reviewed for Markdown link check, public-safety check, and Salesforce Code Analyzer when applicable.
- [ ] Workflow failures are understood and fixed, or a documented limitation is recorded.

## Salesforce Project Release Checks

- [ ] Real `force-app/main/default` path confirmed.
- [ ] `sfdx-project.json` package directories inspected.
- [ ] Metadata path checks passed: object-scoped metadata under `objects/<Object>/`, top-level metadata in the correct source-format folders.
- [ ] Deploy payload is narrow.
- [ ] `package.xml` manifest reviewed if used.
- [ ] Manifest avoids wide wildcards for high-blast-radius metadata unless owner-approved.
- [ ] Permission and metadata dependencies inspected.
- [ ] Record-page activation, assignment, permissions, record type, app, profile, and form factor checked when page behavior is involved.
- [ ] Layout, FlexiPage, quick action, Dynamic Forms, Dynamic Actions, and compact layout dependencies inspected when relevant.
- [ ] Permission set changes preferred over profile changes when project conventions allow.
- [ ] Profile changes reviewed carefully and kept narrow if unavoidable.
- [ ] Focused tests selected.
- [ ] Dry-run deploy completed or limitation stated.
- [ ] If production quick deploy is intended, `sf project deploy validate` completed and produced a successful validation job before `sf project deploy quick`.
- [ ] If deploy/test command timed out or ran async, `sf project deploy report` or matching test report command was used before claiming result.
- [ ] Real deploy success is not claimed from static review, local lint, dry run, or validation alone.
- [ ] Salesforce Code Analyzer ran when available, or the reason it was skipped is documented.
- [ ] Analyzer target was the real project path, such as `force-app/main/default` from repo root or `FORCE_APP_DIRECTORY/your-project/force-app/main/default`.
- [ ] Analyzer findings were triaged against changed files first.
- [ ] Analyzer pass/warnings/errors/skipped status was recorded in `HISTORY/CODEX_RUN_LOG.md` or `HISTORY/TEST_RESULTS_LOG.md`.

## Code Analyzer Release Result

| Result | Release action |
| --- | --- |
| Pass | Record command and target in History. |
| Warnings/findings | Fix findings related to changed files or document owner-approved deferral. |
| Error/nonzero exit | Treat release gate as failed until resolved or explicitly accepted by owner. |
| Missing tool | Document skipped reason and recommended install; do not claim static analysis passed. |
| No project target | Confirm whether the repo intentionally has no real Salesforce DX metadata. |

## Metadata Release Risk Checks

| Metadata area | Release risk | Required review |
| --- | --- | --- |
| Profiles | Broad org-state churn and accidental permission changes. | Avoid when possible; keep edits minimal and owner-reviewed. |
| Permission sets | User access can change immediately after deploy. | Verify object, field, Apex class, custom permission, and tab access. |
| FlexiPages | Page visibility depends on activation and form factor. | Check app/profile/record type/form-factor assignment. |
| Layouts | Buttons, related lists, fields, and actions can move. | Check record type/profile assignment and action list. |
| Quick actions | Deployed actions may still be hidden. | Check placement, Dynamic Actions, permissions, and target component. |
| Record types | Affects layouts, picklists, automation, and page assignment. | Verify dependencies and avoid hard-coded IDs. |
| Static resources | Can contain private files or large assets. | Inspect contents and public-safety risk. |
| Reports/dashboards/email | Can expose business details. | Inspect names, folders, filters, recipients, and examples. |
| `package.xml` | Wide manifests increase blast radius. | Keep narrow and inspect before validation or deploy. |
| Destructive manifests | Can permanently remove metadata or alter runtime behavior. | Separate from feature changes, validate first, require rollback note and explicit approval. |
| Failure-hiding flags | Can turn warnings or partial behavior into apparent success. | Avoid `--ignore-errors`, `--ignore-warnings`, `--ignore-conflicts`, and `--purge-on-delete` unless owner-approved and recorded. |

## No-Success-Without-Evidence Rule

Codex may only report a release gate as passed when the relevant evidence exists:

- link and safety scans for documentation changes;
- script parse checks for script changes;
- test, analyzer, dry-run, validation, quick deploy, or real deploy command output for Salesforce source changes;
- explicit skipped reasons for unavailable tools, missing projects, or untestable runtime paths.

Static review is a valid activity, but it is not a passed deploy, test, analyzer, or runtime validation.

## Codex Rule

Codex should not push, tag, or publish releases unless the user explicitly asks.
