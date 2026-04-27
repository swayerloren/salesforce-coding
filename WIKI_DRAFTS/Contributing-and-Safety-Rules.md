# Contributing And Safety Rules

This repo is designed to be public-safe and useful as a Codex helper for Salesforce DX projects.

## Contribution Goals

Good contributions improve:

- Codex instructions,
- Salesforce knowledge,
- public-safe examples,
- prompts,
- checklists,
- memory/history templates,
- wiki drafts,
- public safety checks.

## Public Safety Checklist

Before contributing, confirm:

- [ ] No credentials, tokens, passwords, private keys, or auth files.
- [ ] No org IDs, deploy IDs, test run IDs, or private URLs.
- [ ] No real customer names, user emails, phone numbers, addresses, or screenshots.
- [ ] No local machine paths.
- [ ] No placeholder deployable Salesforce metadata under `FORCE_APP_DIRECTORY/`.
- [ ] No helper docs included in a Salesforce deploy command.
- [ ] Examples use placeholders and generic names.

## Documentation Rules

| Rule | Reason |
| --- | --- |
| Keep root docs focused on setup and navigation. | Users need a fast start. |
| Keep Salesforce guidance under `SALESFORCE_KNOWLEDGE/`. | Codex needs one knowledge base. |
| Keep reusable lessons under `MEMORY/`. | Future tasks need durable context. |
| Keep chronological records under `HISTORY/`. | Users need a factual work trail. |
| Keep temporary work under `WORKSPACE/`. | Drafts and audits should not become canonical accidentally. |

## Salesforce Source Rules

The helper repo does not ship a real Salesforce DX project by default.

Users provide their own project under `FORCE_APP_DIRECTORY/` or reference it externally.

Do not contribute placeholder deployable Apex, LWC, object, layout, or metadata files just to demonstrate structure. Use public-safe examples under `SALESFORCE_KNOWLEDGE/EXAMPLES/` instead.

## Pull Request Review Focus

Review for:

- broken links,
- unclear Codex instructions,
- private data leakage,
- unsafe deployment advice,
- guidance that encourages guessing API names,
- docs that confuse helper content with deployable Salesforce metadata,
- examples that look like real private org source.

## Safe Language

Use:

```text
<alias>
<TestClass>
<Object__c>
<Field__c>
<External provider>
<Project path>
```

Do not use real private identifiers.
