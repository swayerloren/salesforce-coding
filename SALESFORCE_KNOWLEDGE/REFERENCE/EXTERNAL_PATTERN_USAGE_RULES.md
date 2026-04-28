# External Pattern Usage Rules

External repositories can help Codex recognize established Salesforce patterns, but they are not copy-paste sources.

## Required Rules For Codex

- Read the relevant internal guide first.
- Locate the user's real Salesforce DX project.
- Confirm the real `force-app/main/default` path.
- Inspect the user's actual files before adapting any external pattern.
- Match the user's actual org metadata first.
- Do not invent objects, fields, record types, permission sets, profiles, Apex classes, Apex methods, message channels, static resources, or metadata names from recipe repos.
- Preserve the user's existing architecture unless the root cause requires a narrow change.
- Adapt patterns only after verifying the user's real Apex, LWC, metadata, tests, and dependencies.
- Preserve license attribution if any external code is copied.
- Optional local clones under `VENDOR_REFERENCES/_external/` are references only and must not be committed.

## Allowed Uses

| Use | Allowed? | Notes |
| --- | --- | --- |
| Learn pattern shape | Yes | Use recipes to understand approaches such as wire adapters, user-mode DML, or queueables. |
| Point to external relative paths | Yes | Use repo-relative paths and upstream URLs, not local clone paths. |
| Paraphrase implementation strategy | Yes | Explain the pattern in original words and apply it to the user's verified source. |
| Copy a small code fragment | Only with user approval | Preserve attribution and verify license compatibility. |
| Vendor recipe folders into this repo | No | This repo should not include third-party source trees. |
| Invent metadata from recipes | No | Recipe object/field names are sample data, not facts about the user's org. |
| Inspect optional local clones | Yes | Only if present under `VENDOR_REFERENCES/_external/`; still verify the user's real project first. |

## Adaptation Checklist

Before adapting an external pattern:

- [ ] User's project root is known.
- [ ] `force-app/main/default` exists.
- [ ] Target source files were inspected.
- [ ] Related tests were inspected.
- [ ] Related metadata was inspected.
- [ ] Object and field names were verified in source.
- [ ] Existing naming/style conventions were identified.
- [ ] The change is narrower than copying a full recipe.
- [ ] Attribution needs were considered.
- [ ] Optional local clone content is not being committed.

## Attribution Template

Use this when external source code is materially copied or closely adapted:

```text
Adapted with reference to [repo name], [repo URL], [license].
```

Do not add attribution comments inside production code unless the user asks or the copied/adapted code requires it. Prefer documenting attribution in implementation notes, pull request text, or project documentation.
