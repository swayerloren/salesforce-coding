# Before GitHub Push

Use this checklist before pushing this repo, publishing it, or preparing a release.

## Sensitive Data

- [ ] No credentials.
- [ ] No access tokens, refresh tokens, session IDs, API keys, private keys, OAuth secrets, or authorization headers.
- [ ] No org IDs.
- [ ] No deploy IDs or test run IDs.
- [ ] No private customer data.
- [ ] No real usernames, user emails, phone numbers, street addresses, claim numbers, job numbers, invoice numbers, or record identifiers.
- [ ] No private URLs, internal domains, sandbox login links, or private service endpoints.
- [ ] No local-only paths.
- [ ] No temporary folder references.
- [ ] No raw private debug logs, screenshots, HTML exports, or downloaded org data.

## Repo Accuracy

- [ ] `README.md` is accurate for the current repo purpose.
- [ ] `START_HERE.md` still tells Codex to locate the real Salesforce DX project before editing.
- [ ] `INSTRUCTIONS/` still requires source inspection and no guessing.
- [ ] `SALESFORCE_KNOWLEDGE/INDEX.md` links current guide, topic, prompt, checklist, example, reference, and docs paths.
- [ ] Links work after restructure.
- [ ] Wiki drafts are safe.
- [ ] Prompt pack is safe and generic.
- [ ] Checklist pack is safe and generic.
- [ ] Command, parameter, quality strategy, validation flow, and external intelligence docs are public-safe and link correctly.
- [ ] `FORCE_APP_DIRECTORY/` does not contain real private Salesforce metadata unless intentionally included.
- [ ] If real Salesforce metadata is intentionally included, public-safety review has been performed file by file.

## Placeholder Folder Checks

- [ ] `FORCE_APP_DIRECTORY/` has no placeholder `force-app/main/default` tree.
- [ ] `FORCE_APP_DIRECTORY/` contains only instructions/placeholders unless the repo owner intentionally adds a real project.
- [ ] External project paths are not committed unless they are generic placeholders.

## GitHub Content Checks

- [ ] `WIKI_DRAFTS/` contains no local-only paths, private names, credentials, org IDs, or temporary references.
- [ ] `MEMORY/` contains reusable lessons only, not private logs.
- [ ] `HISTORY/` contains chronological summaries only, not private logs.
- [ ] `WORKSPACE/` has been reviewed for temporary audits or summaries that should not be public.
- [ ] `ARCHIVE/` has been reviewed for old fixes that may contain private content.
- [ ] `.github/workflows/` contains only public-safe workflows that do not require secrets by default.
- [ ] GitHub Actions workflow comments do not include private project paths, org IDs, credentials, or temporary folder references.
- [ ] No external repo source, generated artifacts, `.git` folders, `node_modules`, or vendor clone trees are committed.

## Final Gate

- [ ] A recursive search for private-data indicators has been run.
- [ ] A Markdown link check has been run for changed docs.
- [ ] `git diff --check` has been run.
- [ ] GitHub Actions results are green or documented with exact reasons for any skipped/failed workflow.
- [ ] The final pushed content is safe even if a user downloads it publicly.
