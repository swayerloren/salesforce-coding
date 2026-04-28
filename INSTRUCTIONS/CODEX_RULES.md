# Codex Rules

These rules apply before every task in this Codex-ready Salesforce coding engine.

This repo is not automatically the user's Salesforce DX project. It is an operating layer, Salesforce knowledge base, workspace, Memory, and History system. Codex must locate the real Salesforce DX project before editing real project metadata.

## Required Reading Order

| Order | Read | Why |
| ---: | --- | --- |
| 1 | [START_HERE.md](../START_HERE.md) | Confirms purpose, boundaries, and startup order. |
| 2 | [INSTRUCTIONS/](README.md) | Defines mandatory Codex behavior. |
| 3 | [FORCE_APP_DIRECTORY/README.md](../FORCE_APP_DIRECTORY/README.md) | Explains where the real Salesforce DX project is placed or referenced. |
| 4 | [SALESFORCE_KNOWLEDGE/INDEX.md](../SALESFORCE_KNOWLEDGE/INDEX.md) | Routes Codex to task-specific Salesforce guidance. |
| 5 | [TOOLS/](../TOOLS/) and [QUALITY_GATES/](../QUALITY_GATES/) | Identifies optional tooling and validation gates. |
| 6 | [MEMORY/](../MEMORY/) and [HISTORY/](../HISTORY/) | Reuses durable lessons and checks recent work. |

## Non-Negotiable Rules

- [ ] Read `START_HERE.md` first.
- [ ] Locate the real Salesforce DX project before editing Salesforce source.
- [ ] Confirm the real `force-app/main/default` path.
- [ ] Do not assume this helper repo is the Salesforce DX project.
- [ ] Do not treat examples, guides, prompts, checklists, wiki drafts, or workspace notes as live source.
- [ ] Inspect existing real project files before editing.
- [ ] Identify root cause before changing files.
- [ ] Do not guess Salesforce names or identifiers.
- [ ] Make the smallest safe change.
- [ ] Do not edit unrelated files.
- [ ] Preserve Salesforce DX structure.
- [ ] Run available quality gates after code changes when practical.
- [ ] Run or recommend Salesforce Code Analyzer after Apex, LWC, Aura, metadata, Flow, static resource, or deployment-scope changes.
- [ ] Do not claim static analysis passed unless Salesforce Code Analyzer actually ran and passed.
- [ ] Keep all committed content public-safe.
- [ ] Update Memory and History after meaningful work.

## Locate The Real Project

Before editing Salesforce metadata, Codex must find and confirm:

```text
force-app/main/default/
```

Supported patterns:

```text
FORCE_APP_DIRECTORY/my-project/force-app/main/default/
FORCE_APP_DIRECTORY/force-app/main/default/
<user-provided external project>/force-app/main/default/
```

If multiple Salesforce DX projects are present, Codex must use the one identified by the user. If the target is ambiguous, ask one concise question before editing.

## No Guessing

Codex must not guess:

| Do not guess | Verify by inspecting |
| --- | --- |
| Object API names | Object metadata, Apex references, LWC references, manifests |
| Field API names | Field metadata, layouts, permissions, Apex, LWC, reports if present |
| Relationship names | Object metadata and source references |
| Apex class, method, DTO, or property names | Apex source and callers |
| Component bundle names | LWC or Aura bundle folders and metadata |
| Metadata names | Source XML, manifests, and related metadata families |
| Record type IDs | Record type metadata or runtime evidence from the user |
| Profiles and permission sets | Project metadata and deployment scope |
| Named credentials and external credentials | Metadata files and documented integration patterns |

Required behavior:

1. Search the real Salesforce DX project.
2. Inspect the relevant source and metadata files.
3. Verify references across code, metadata, tests, and manifests.
4. Ask the user if a required name is not available locally.

## Inspect Before Editing

Before editing, inspect the target file and related files.

| Work type | Inspect |
| --- | --- |
| Apex | Class, metadata pair, callers, triggers, services, tests, relevant metadata references |
| LWC | `.html`, `.js`, `.css`, `.js-meta.xml`, Apex controllers, parent components, target configuration |
| Aura | Component, controller, helper, renderer, design file, documentation file if present |
| Visualforce | Page, controller or extension, tests, static resources, PDF behavior if relevant |
| Metadata | Owning metadata family, references, permissions, layouts, FlexiPages, manifests |
| Deployment | Changed source, package manifests, tests, org alias, prior deployment or test logs if available |

## Documentation Authority

The real Salesforce DX source is the authority for live behavior.

Use documentation this way:

| Source | Role |
| --- | --- |
| `START_HERE.md` and `INSTRUCTIONS/` | Operating rules. |
| `SALESFORCE_KNOWLEDGE/` | Salesforce guidance and safety checks. |
| `MEMORY/` | Durable lessons that may need source reverification. |
| `HISTORY/` | Chronological context, not current architecture. |
| `WORKSPACE/` | Task notes, audits, and review reports. |
| `TOOLS/` | Optional tooling guidance. |
| `QUALITY_GATES/` | Validation gates and evidence expectations. |
| `AUTOMATION/` | Local public-safe validation scripts. |
| `VENDOR_REFERENCES/` | External repo attribution and no-vendoring rules. |
| `ARCHIVE/` | Superseded public-safe material. |

When notes conflict with real project metadata, inspect the real source and follow the current user request.

## Smallest Safe Change

Prefer:

- localized fixes,
- existing project patterns,
- narrow metadata payloads,
- focused tests and validation,
- available quality gates,
- clear root-cause fixes.

Avoid:

- broad refactors,
- unrelated formatting,
- renaming public Apex methods without checking callers,
- changing metadata exposure without checking placement and permissions,
- moving files unless the task is a restructure,
- editing generated or irrelevant files.

## Preserve Salesforce DX Structure

Expected deployable source root:

```text
force-app/main/default/
```

Common metadata locations:

| Metadata type | Expected folder |
| --- | --- |
| Apex classes | `force-app/main/default/classes/` |
| Apex triggers | `force-app/main/default/triggers/` |
| LWC bundles | `force-app/main/default/lwc/<bundleName>/` |
| Aura bundles | `force-app/main/default/aura/<bundleName>/` |
| Visualforce pages | `force-app/main/default/pages/` |
| Objects and fields | `force-app/main/default/objects/` |
| FlexiPages | `force-app/main/default/flexipages/` |
| Layouts | `force-app/main/default/layouts/` |
| Permission sets | `force-app/main/default/permissionsets/` |
| Tabs | `force-app/main/default/tabs/` |
| Custom metadata records | `force-app/main/default/customMetadata/` |
| Named credentials | `force-app/main/default/namedCredentials/` |
| External credentials | `force-app/main/default/externalCredentials/` |

Do not create nonstandard metadata folders unless the real project already uses them or the user explicitly requests them.

## Quality Gates

After code changes, Codex should check [QUALITY_GATES/](../QUALITY_GATES/) and [TOOLS/](../TOOLS/) for relevant validation.

Use gates that are available in the real Salesforce DX project:

| Change type | Gate examples |
| --- | --- |
| Apex | Focused Apex tests, Salesforce Code Analyzer, Apex formatting check if configured. |
| LWC | LWC Jest, LWC ESLint, Salesforce Code Analyzer if configured. |
| Mobile LWC | LWC mobile lint, mobile checklist, relevant LWC tests. |
| Metadata/deployment | Narrow dry-run deploy, deployment checklist, Code Analyzer if applicable. |
| Docs | Markdown links, public-safety scans, path consistency checks. |

If a gate is unavailable, report that limitation instead of inventing results.

### Salesforce Code Analyzer

Use [TOOLS/SALESFORCE_CODE_ANALYZER.md](../TOOLS/SALESFORCE_CODE_ANALYZER.md) and [QUALITY_GATES/CODE_ANALYZER_RULES.md](../QUALITY_GATES/CODE_ANALYZER_RULES.md) after Salesforce source changes.

Codex must:

- confirm the real project root,
- target `force-app/main/default` or a narrower changed folder,
- report pass, warnings/findings, errors, or skipped status,
- state the install recommendation if the analyzer is missing,
- update History with the command, target, and result.

Do not treat a missing analyzer as a successful static-analysis result.

## Public-Safe Rule

Never add committed content containing:

- credentials,
- tokens,
- passwords,
- private keys,
- authorization headers,
- real customer data,
- real user emails,
- internal URLs,
- org IDs,
- deploy IDs,
- local-only paths,
- raw private debug logs,
- private screenshots.

Use generic examples and placeholders when documentation needs examples.

## Memory And History

After meaningful work, update:

| File | Use |
| --- | --- |
| `MEMORY/PROJECT_MEMORY.md` | Durable lessons, stable repo facts, and reusable decisions. |
| `HISTORY/TASK_HISTORY.md` | Chronological task record. |
| Specialized Memory or History files | Fix patterns, failures, decisions, deployment logs, test results, or larger changes when relevant. |

Meaningful work includes code changes, metadata changes, repo structure changes, instruction updates, knowledge-base edits, debugging conclusions, validation results, and public-release reviews.

## Final Response

Do not claim success without evidence.

Include:

- root cause or reason for the change,
- fix summary,
- validation performed and results,
- files changed,
- assumptions or limits.
