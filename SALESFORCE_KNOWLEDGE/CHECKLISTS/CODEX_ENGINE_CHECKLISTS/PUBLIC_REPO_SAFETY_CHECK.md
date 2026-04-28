# Public Repo Safety Check

This is a strict public-safety gate.

Use it before publishing, pushing, releasing, sharing, or copying content from this repo into a public GitHub repository or GitHub Wiki.

If any item fails, stop and fix it before publishing.

## Absolute No-Leak Items

- [ ] No passwords.
- [ ] No access tokens.
- [ ] No refresh tokens.
- [ ] No session IDs.
- [ ] No API keys.
- [ ] No private keys.
- [ ] No OAuth client secrets.
- [ ] No authorization headers.
- [ ] No `.sfdx/` auth state.
- [ ] No `.sf/` auth state.
- [ ] No environment files containing secrets.
- [ ] No named credential secret values.
- [ ] No external credential secret values.

## Salesforce Private Identifiers

- [ ] No org IDs.
- [ ] No deploy IDs.
- [ ] No test run IDs.
- [ ] No real record IDs.
- [ ] No package installation IDs.
- [ ] No sandbox names that identify a private customer or org.
- [ ] No internal org aliases that reveal private names.
- [ ] No private permission set, profile, queue, role, or group names unless intentionally public and reviewed.

## People And Customer Data

- [ ] No customer names.
- [ ] No company names that are not intentionally public.
- [ ] No user names.
- [ ] No usernames.
- [ ] No email addresses.
- [ ] No phone numbers.
- [ ] No street addresses.
- [ ] No claim, job, invoice, case, lead, or opportunity identifiers.
- [ ] No notes copied from real customer records.
- [ ] No raw debug logs containing record values.

## URLs, Paths, And Files

- [ ] No local machine paths.
- [ ] No temporary folder references.
- [ ] No private domains or URLs.
- [ ] No sandbox or production org URLs.
- [ ] No private storage bucket names.
- [ ] No screenshots from private orgs.
- [ ] No downloaded HTML pages from private orgs.
- [ ] No CSV, JSON, XML, or log exports from private orgs.
- [ ] No local audit paths are copied into public docs except temporary workspace audit reports that are not intended as reusable knowledge.

## Repo Content Rules

- [ ] `FORCE_APP_DIRECTORY/` contains no real private Salesforce metadata unless intentionally included and reviewed.
- [ ] No placeholder deployable Salesforce metadata is placed in `FORCE_APP_DIRECTORY/`.
- [ ] Public examples live under `SALESFORCE_KNOWLEDGE/EXAMPLES/` and use placeholders.
- [ ] Prompt files do not include private identifiers.
- [ ] Checklist files do not include private identifiers.
- [ ] `WIKI_DRAFTS/` files do not include private identifiers.
- [ ] Memory and history files contain generic summaries, not raw private logs.
- [ ] Workspace and archive files have been reviewed before publication.
- [ ] Private reference lessons are rewritten as generic guidance, checklists, failure modes, or pseudocode.
- [ ] External repo intelligence is rewritten as original guidance only; no source code, sample metadata, configs, workflow files, or sample names are copied.

## Search Terms To Run

Run recursive searches for these categories before publishing:

```text
password
secret
token
authorization
client_id
client_secret
private key
refresh_token
access_token
session
orgId
deploy id
test run id
@example.com replacement needed
```

Also search for:

```text
Windows drive-root path patterns
macOS user-home path patterns
Linux user-home path patterns
download-folder names
desktop-folder names
<temporary folder name>
```

Use generic placeholder examples instead:

```text
<alias>
<org-alias>
<Object__c>
<Field__c>
<TestClass>
<External provider>
<Project path>
user@example.com
```

## Required Outcome

- [ ] The repo can be downloaded by a stranger without exposing private data.
- [ ] The repo can be used by Codex without needing any temporary local folder.
- [ ] The repo explains that users must provide or reference their own real Salesforce DX project.
- [ ] The repo does not imply that placeholder files are live Salesforce metadata.
- [ ] Every sensitive example is generic, fictional, and clearly a placeholder.
