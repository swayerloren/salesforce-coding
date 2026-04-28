# Deep Repo Quality Audit

## Executive Summary

The repo is strong as a Codex-ready Salesforce coding engine. The structure is clear, the first-read flow is practical, the Codex rules are explicit, and the Salesforce knowledge base covers the high-frequency areas that cause real Apex, LWC, metadata, deployment, testing, Files, and mobile failures.

The repo is not yet ready to promote heavily without one more improvement pass. The main blockers are release/documentation integrity and safety guardrails around real project placement. The published `v1.1.0` tag points at the latest release-documentation commit, but release docs still name the earlier restructure commit. Also, the workflow invites users to copy real Salesforce metadata into `FORCE_APP_DIRECTORY/`, but the repo does not yet have a `.gitignore` guard that prevents accidental commits of private real project metadata. That is a practical public-safety gap.

The technical Salesforce content is useful and credible, but several areas are broad rather than deep. The strongest coverage is Apex bulk safety, LWC template/refresh/navigation patterns, record pages, deployment/test basics, Salesforce Files, and mobile webview issues. The weakest coverage is Flow/Process Builder, reports/dashboards, email templates, translations, custom labels, Experience Cloud, Lightning Web Security, UI API wire adapters, `lightning-record-edit-form`, Apex CRUD/FLS enforcement patterns, and full scratch-org/sandbox/package workflows.

## Overall Score

Overall score: **82 / 100**

| Area | Score | Notes |
| --- | ---: | --- |
| Repo structure | 92 | Clean root, strong separation between instructions, knowledge, examples, Memory, History, workspace reports, and wiki drafts. |
| New user onboarding | 86 | README and `START_HERE.md` are clear; external project placement still needs safer local-pointer handling. |
| Codex operating instructions | 88 | Strong anti-guessing, smallest-safe-fix, validation, and Memory/History rules. Needs stronger uncommitted-change and local-safety enforcement. |
| Salesforce technical depth | 72 | Good practical foundation, but several Salesforce metadata and platform surfaces are thin or absent. |
| Apex coverage | 76 | Solid bulk, trigger, SOQL, DML, async basics; thin on selectors, user-mode security, FLS/CRUD enforcement, advanced async, callout architecture. |
| LWC coverage | 80 | Good template, refresh, navigation, mobile, toast examples; thin on UI API wire adapters, form components, Jest, Lightning Web Security. |
| Metadata coverage | 70 | Good FlexiPage/action/layout foundation; missing or thin for flows, reports, dashboards, email templates, translations, labels, Experience Cloud. |
| Testing/deployment coverage | 78 | Strong narrow deploy and selected tests guidance; needs fuller scratch/sandbox/package and validation matrix coverage. |
| Debugging/troubleshooting coverage | 75 | Good root-cause discipline and common failures; needs deeper error-specific runbooks and CLI evidence templates. |
| Prompt quality | 86 | Prompt pack is practical and task-specific; could add git-diff protection, validation discovery, and evidence checklist prompts. |
| Checklist quality | 82 | Strict checklists exist; they are not yet backed by scripts or a single command runner. |
| Memory/history usefulness | 82 | Strong templates and logs; current durable Memory contains some historical status that could age poorly. |
| Public safety | 94 | Scans pass and wording is strong; biggest gap is no ignore guard for private metadata placed under `FORCE_APP_DIRECTORY/`. |
| GitHub/release/wiki readiness | 78 | Release exists and wiki drafts are clean; release docs have commit drift and some manual-release notes are now stale. |

## What Is Strong

- Root structure is easy to understand and matches the repo purpose.
- `README.md` and `START_HERE.md` clearly explain that this is an engine, not the user's Salesforce DX project.
- `INSTRUCTIONS/` gives Codex concrete rules for reading order, project discovery, inspection before editing, no guessing, smallest safe fix, output, and Memory/History updates.
- `FORCE_APP_DIRECTORY/` is currently placeholder-only and contains no real metadata.
- `SALESFORCE_KNOWLEDGE/INDEX.md` is a good master map with task-based reading guidance.
- Apex guidance emphasizes bulk safety, SOQL safety, thin triggers, DML dedupe, async rules, and test alignment.
- LWC guidance covers template limitations, getters, refresh patterns, `NavigationMixin`, toast handling, mobile overlays, and Salesforce theme behavior.
- Metadata guidance correctly treats FlexiPages, layouts, quick actions, permissions, tabs, and custom metadata as part of the code surface.
- Deployment guidance pushes narrow dry-run deploys and focused tests instead of broad noisy changes.
- Salesforce Files content is practical and covers `ContentVersion`, `ContentDocument`, `ContentDocumentLink`, latest-version behavior, refresh, previews, and mobile handoff.
- Prompt pack is copy-ready and consistently tells Codex to read the right docs, locate the real project, inspect source, avoid private data, validate, and update Memory/History.
- Checklist pack is strict enough to prevent many bad Codex edits.
- Memory and History split is useful: Memory for reusable lessons, History for chronological evidence.
- Public safety language is repeated in the right places.
- Markdown link check passed across the repo.
- Public safety scans found no credentials, API tokens, session IDs, private keys, Salesforce org IDs, local-only public-doc paths, or temporary-folder references.

## Critical Gaps

| ID | Gap | Impact | Likely Fix |
| --- | --- | --- | --- |
| P0-1 | `v1.1.0` release docs still name commit `f973f5bbe555f0ec5bb0e9ebe0365000b82ba9ac`, but the current pushed release-doc commit and local tag point to `90c6ddf8ecfc942f4bc069eb13f10c27e380d3a2`. | Public release records are inconsistent. Users cannot tell which commit is authoritative for `v1.1.0`. | Update `RELEASES.md`, `CHANGELOG.md`, `RELEASE_NOTES_v1.1.0.md`, and related workspace reports to distinguish "restructure commit" from "release tag commit", or standardize on the tag commit. |
| P0-2 | Real project placement is under a tracked folder, but `.gitignore` does not protect copied real Salesforce DX metadata or a local external-path pointer file. | A user may copy private org metadata into `FORCE_APP_DIRECTORY/` and accidentally commit it. They may also paste local paths/org aliases into tracked docs. | Add a public-safe untracked local pointer workflow and ignore real project contents by default while preserving README/placeholders. |

## Medium Gaps

| ID | Gap | Impact |
| --- | --- | --- |
| P1-1 | No one-command local validation script for links, path references, secret-like patterns, Salesforce ID-shaped values, and `FORCE_APP_DIRECTORY/` contents. | Safety depends on manually re-running scattered commands. |
| P1-2 | Metadata coverage is thin for Flow, Process Builder, reports, dashboards, email templates, custom labels, translations, Experience Cloud, and static resources outside Visualforce. | Codex may under-inspect important metadata dependencies in real orgs. |
| P1-3 | Apex security guidance does not deeply cover `Security.stripInaccessible`, `WITH SECURITY_ENFORCED`, user-mode DML/SOQL, CRUD/FLS checks, or controller sharing decisions. | Codex could make server-side changes that compile but are not access-safe. |
| P1-4 | Apex architecture coverage mentions selectors but lacks a concrete selector/query-service pattern and examples. | Larger orgs often need consistent selector conventions to avoid scattered SOQL and test fragility. |
| P1-5 | LWC data-access coverage is thin for UI API wire adapters such as `getRecord`, `getObjectInfo`, `getPicklistValues`, `createRecord`, `updateRecord`, and `deleteRecord`. | Codex may overuse Apex where LDS/UI API is safer or more standard. |
| P1-6 | No dedicated `lightning-record-edit-form` or standard base component form guidance. | Record-edit use cases may be over-customized unnecessarily. |
| P1-7 | Lightning Web Security, Locker, DOM restrictions, third-party scripts, and static-resource loading need deeper coverage. | Codex can break Salesforce runtime constraints even when JavaScript looks normal. |
| P1-8 | Prompts do not consistently require checking existing git status/diff before editing a real project. | Codex might overwrite user changes or conflate unrelated work. |
| P1-9 | Memory contains useful facts mixed with historical one-time status notes such as prior "not a git repository" context and manual release reminders. | Future Codex sessions may treat stale history as current truth. |
| P1-10 | Output rules require complete updated files whenever code changes. | This can be impractical for large files and can crowd out higher-value root-cause/validation evidence. |

## Minor Gaps

| ID | Gap | Impact |
| --- | --- | --- |
| P2-1 | README clone command still uses `<repo-url>` instead of the real public repo URL. | Slight friction for brand-new users. |
| P2-2 | Some topic `README.md` files are very short and do not summarize their contents. | Navigation is clear from the index, but folder-local browsing is weaker. |
| P2-3 | `EXAMPLES/README.md` is short and does not map examples to guide sections or explain which examples are intentionally non-deployable as a complete project. | Users may not know which example to inspect for a task. |
| P2-4 | Several workspace reports are historical and may confuse public readers if they read them as current release state. | The repo is transparent, but public users may not distinguish audit history from current instructions. |
| P2-5 | Wiki drafts are useful but not yet checked against actual GitHub Wiki navigation after publication. | Copying pages manually may produce broken cross-page expectations. |
| P2-6 | Common failures are useful but compact; they could become richer runbooks with symptoms, evidence to collect, commands, and false leads. | Codex gets a good starting point but not always a full debug path. |
| P2-7 | No issue templates or pull request template exist for external contributors. | GitHub contribution quality depends on free-form submissions. |
| P2-8 | Some checklists duplicate instructions from prompts and guides, creating drift risk. | Maintenance cost grows as the knowledge base expands. |

## Broken Links Or Path Problems

Markdown link check result: **passed** across 158 Markdown files, excluding fenced code blocks.

No broken Markdown links were found in the scan.

Path/reference concerns:

| Concern | Location | Severity | Notes |
| --- | --- | --- | --- |
| Release commit mismatch | `RELEASES.md`, `CHANGELOG.md`, `RELEASE_NOTES_v1.1.0.md` | P0 | Docs name `f973f5b...`, while current `v1.1.0` tag points at `90c6ddf...`. |
| Stale manual release notes | `RELEASE_NOTES_v1.1.0.md`, `HISTORY/CHANGE_ARCHIVE.md` | P2 | Some notes still say to create/update the GitHub Release manually even though it now exists. This is historical but confusing. |
| Tracked external-path template | `FORCE_APP_DIRECTORY/README.md` | P0 | It asks users to paste external project paths into a tracked file. Safer workflow should use an ignored local pointer file. |
| Generic clone URL | `README.md`, `WIKI_DRAFTS/Installation-Guide.md` | P2 | `<repo-url>` is safe, but less polished than the actual repository URL. |
| Historical old root path mentions | `WORKSPACE/REPO_AUDIT_BEFORE_RESTRUCTURE.md`, release migration notes | Informational | These are valid historical/migration references, not broken links. |

## Missing Salesforce Development Areas

| Area | Coverage | Evidence / Gap |
| --- | --- | --- |
| Apex triggers | Adequate | Trigger rules, handler example, trigger checklist. |
| Apex services | Adequate | Service guidance and `ProjectService.cls` example. |
| Apex selectors | Partial | Selector term appears, but no dedicated selector pattern/example. |
| Apex controllers | Adequate | Controller facade guidance and example controller. |
| Queueable/batch/scheduled Apex | Partial | Queueable example and batch test warning exist; scheduled Apex and chaining/dead-letter patterns are thin. |
| Apex test data factories | Partial | `TestDataFactory.cls` exists; deeper factory strategy and object graph setup guidance is limited. |
| LWC wire adapters | Partial | Wired Apex and `refreshApex` covered; UI API adapters are missing. |
| LWC imperative Apex calls | Adequate | Prompt and `safeRecordAction` example cover imperative Apex. |
| LWC refresh patterns | Adequate | `refreshApex`, `notifyRecordUpdateAvailable`, and refresh topic exist. |
| LWC mobile layout issues | Adequate | Mobile guide, overlay topic, mobile checklist, and mobile prompt exist. |
| `NavigationMixin` | Adequate | Guide, topic, and example exist. |
| `ShowToastEvent` | Partial | Example exists; deeper error/toast UX standard could be added. |
| `lightning-record-edit-form` | Missing | No direct coverage found. |
| Salesforce Files | Adequate | Dedicated guide, prompt, pattern, and troubleshooting. |
| `ContentDocument` / `ContentVersion` / `ContentDocumentLink` | Adequate | Dedicated Files guidance and example. |
| FlexiPages | Adequate | Metadata and record page docs cover FlexiPage activation. |
| Page layouts | Partial | Layouts are covered in action/field context; deeper layout XML patterns are thin. |
| Compact layouts | Thin | Mentioned, but not deeply covered. |
| Quick actions | Adequate | Metadata, record page, troubleshooting, and checklist coverage. |
| Permission sets | Partial | Included in metadata checks; lacks deep examples for object/field/class access. |
| Profiles | Partial | Warnings exist; lacks profile-vs-permission-set migration guidance. |
| Custom metadata | Partial | Good safety notes; lacks examples for real configuration patterns. |
| Validation rules | Thin | Mentioned but no dedicated guidance. |
| Flows / Process Builder considerations | Missing / thin | Flow is mentioned, but no dedicated guide; Process Builder has no coverage. |
| Reports / dashboards metadata | Missing | Search found no dashboard coverage and only incidental report wording. |
| Email templates | Missing | No meaningful coverage found. |
| Static resources | Partial | Visualforce static resource coverage exists; LWC/third-party script loading is thin. |
| Named credentials | Partial | Mentioned with external credentials; needs deeper auth, principal, packaging, and secret-boundary guidance. |
| Custom labels | Thin | Almost no coverage. |
| Translations | Missing | No meaningful coverage found. |
| Experience Cloud | Thin | Community target is mentioned; no dedicated Experience Cloud/site metadata guidance. |
| Salesforce CLI commands | Adequate | CLI reference and deployment runbooks exist. |
| `package.xml` manifests | Partial | Narrow manifest example exists; broader manifest generation/retrieve strategy is thin. |
| Scratch orgs / sandboxes | Thin | Mentioned, but no full setup/validation strategy. |
| Production deployment practices | Adequate | Narrow dry-run, selected tests, production rules, and logs exist. |

## Missing Codex/AI Agent Controls

| Control | Status | Notes |
| --- | --- | --- |
| Guessing API names | Strong | Repeated in README, instructions, prompts, and checklists. |
| Editing unrelated files | Strong | Smallest-safe-fix and unrelated-file warnings are clear. |
| Inventing metadata | Strong | Codex is told to inspect real metadata and not create placeholder deployable metadata. |
| Writing unsafe tests | Partial | Testing guidance is good; stronger rules against weakening assertions and `SeeAllData=true` shortcuts could be centralized. |
| Ignoring permissions | Partial | Permission checks are required, but Apex CRUD/FLS/security enforcement needs more concrete patterns. |
| Ignoring mobile behavior | Strong | Mobile is repeatedly called out in LWC, record page, Files, prompts, and checklists. |
| Creating fake data | Partial | Placeholder metadata warnings exist; add clearer rules about fake records, fake org facts, and invented test fixtures. |
| Leaking private data | Strong | Public-safety controls are extensive and scans passed. |
| Over-refactoring | Strong | Smallest-safe-fix wording is clear, though the exact phrase "over-refactor" is not used. |
| Claiming success without validation | Strong | Output rules and checklists require evidence or stated limits. |
| Failing to update Memory/History | Strong | Required in README, START_HERE, instructions, prompts, and checklists. |
| Protecting user working tree | Partial | Current rules say inspect files, but should explicitly require `git status`/diff review before edits when inside a git repo. |
| Machine-enforced preflight | Missing | No script or CI workflow currently runs the documented checks. |

## GitHub User Experience Review

| Area | Evaluation |
| --- | --- |
| Repo description | Strong. The purpose is understandable from README and START_HERE. |
| README first impression | Strong. It explains what the repo is, what it is not, setup, reading order, project placement, and safety. |
| Release clarity | Mixed. Release page exists, but release docs still point at the earlier commit and include now-stale manual release notes. |
| Wiki drafts | Good. They are public-safe and useful, but need publication/navigation validation after copying to GitHub Wiki. |
| Folder names | Strong. Names are clear and task-oriented. |
| Public safety wording | Strong in docs, but not yet enforced by `.gitignore` for real project metadata under `FORCE_APP_DIRECTORY/`. |
| New user next step | Mostly clear. A new user knows to read `START_HERE.md` and add/reference a Salesforce DX project, but safer local external-path handling should be added before broad promotion. |

## Suggested Improvements By Priority

| Priority | Improvement | Why It Matters | Files Likely Affected | Risk Level |
| --- | --- | --- | --- | --- |
| P0 | Align `v1.1.0` release docs with the actual tag/current commit or clearly distinguish release tag commit from restructure commit. | Prevents public release confusion. | `RELEASES.md`, `CHANGELOG.md`, `RELEASE_NOTES_v1.1.0.md`, `WORKSPACE/RELEASE_UPDATE_REPORT.md` | Low |
| P0 | Add an ignored local project pointer workflow and ignore copied real metadata under `FORCE_APP_DIRECTORY/` by default. | Prevents accidental public commits of private Salesforce metadata and local paths. | `.gitignore`, `FORCE_APP_DIRECTORY/README.md`, `INSTRUCTIONS/SALESFORCE_PROJECT_PLACEMENT.md`, `START_HERE.md` | Medium |
| P1 | Add a `WORKSPACE` or `scripts` safety/link validation command. | Makes public-safety checks repeatable. | New script/check doc, `README.md`, `PUBLIC_REPO_REVIEW_CHECKLIST.md` | Low |
| P1 | Deepen metadata coverage for Flow, Process Builder, reports, dashboards, email templates, labels, translations, Experience Cloud, and static resources. | These frequently block real deployments. | `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md`, `TOPICS/metadata/`, `CHECKLISTS/` | Medium |
| P1 | Add Apex security patterns for CRUD/FLS, user-mode operations, sharing, and controller access. | Prevents insecure Apex fixes. | `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`, `PATTERNS/good_patterns/`, `CHECKLISTS/before-apex.md` | Medium |
| P1 | Add selector/query-service guidance and examples. | Helps Codex work safely in larger Apex codebases. | `TOPICS/apex/`, `PATTERNS/good_patterns/`, `EXAMPLES/apex/` | Medium |
| P1 | Add LWC UI API/base form guidance. | Prevents over-customized Apex-backed LWC work. | `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md`, `TOPICS/lwc/`, `EXAMPLES/lwc/` | Medium |
| P1 | Add Lightning Web Security/static resource/third-party JS constraints. | Prevents runtime-only LWC failures. | `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md`, `GUIDES/SALESFORCE_PLATFORM_LIMITATIONS.md` | Medium |
| P1 | Add git status/diff protection to prompts and checklists. | Prevents overwriting user edits. | `INSTRUCTIONS/CODEX_RULES.md`, `DEVELOPMENT_WORKFLOW.md`, prompt pack, checklist pack | Low |
| P1 | Separate current Memory facts from historical status notes. | Prevents stale Memory from misleading future tasks. | `MEMORY/PROJECT_MEMORY.md`, `INSTRUCTIONS/MEMORY_AND_HISTORY_RULES.md` | Low |
| P1 | Refine output rules for large changed files. | Keeps Codex responses useful without dumping huge files. | `INSTRUCTIONS/OUTPUT_FORMAT_RULES.md`, prompt pack | Low |
| P2 | Replace `<repo-url>` with the real repository URL where appropriate. | Improves onboarding polish. | `README.md`, `WIKI_DRAFTS/Installation-Guide.md` | Low |
| P2 | Expand folder-local README files. | Improves navigation when users browse folders directly. | `GUIDES/README.md`, `TOPICS/README.md`, `EXAMPLES/README.md`, `PATTERNS/README.md` | Low |
| P2 | Add a map from examples to related guides and task types. | Makes examples more discoverable. | `SALESFORCE_KNOWLEDGE/EXAMPLES/README.md`, `SALESFORCE_KNOWLEDGE/INDEX.md` | Low |
| P2 | Add GitHub issue and PR templates. | Improves external contribution quality. | `.github/ISSUE_TEMPLATE/`, `.github/pull_request_template.md` | Low |
| P2 | Convert common failures into deeper runbooks. | Improves troubleshooting evidence quality. | `GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md`, `TOPICS/troubleshooting/` | Medium |
| P2 | Reduce duplicated rules across README, START_HERE, wiki drafts, prompts, and checklists. | Reduces drift. | Public docs and prompt/checklist packs | Medium |
| P2 | Add publication checklist specifically for GitHub Wiki copy/paste. | Prevents wiki drift. | `WIKI_DRAFTS/README.md` or `WIKI_DRAFTS/Home.md` | Low |
| P2 | Add clearer "workspace reports are historical" language. | Reduces confusion for public users. | `WORKSPACE/README.md`, selected workspace reports | Low |
| P3 | Add CI workflow for Markdown links and secret-like pattern checks. | Automates release confidence. | `.github/workflows/` | Medium |
| P3 | Add sample project-discovery output using only fictional metadata. | Helps users understand how to fill discovery docs. | `SALESFORCE_KNOWLEDGE/REFERENCE/`, `EXAMPLES/` | Low |
| P3 | Add more real-world LWC/Jest example patterns. | Improves front-end validation depth. | `EXAMPLES/lwc/`, `TOPICS/lwc/` | Medium |
| P3 | Add package and scratch-org strategy guide. | Helps teams with multi-package or source-tracked workflows. | `TOPICS/deployment/`, `REFERENCE/` | Medium |
| P3 | Add agent-specific quick-start cards for Codex, Cursor, Claude Code, and generic AI agents. | Broadens adoption beyond Codex. | `README.md`, `WIKI_DRAFTS/` | Low |

## Recommended Next Prompts

Use these prompts in order.

### 1. Fix P0 Gaps

```text
Read START_HERE.md and INSTRUCTIONS/. This is a helper-repo documentation task, not a Salesforce metadata task. Fix only the P0 issues from WORKSPACE/DEEP_REPO_QUALITY_AUDIT.md: align v1.1.0 release docs with the actual tag/current commit, and make FORCE_APP_DIRECTORY safe by adding an ignored local project pointer workflow and default ignore protection for copied real Salesforce metadata. Do not move Salesforce knowledge content. Do not add private paths. Validate links, safety scans, and git status. Update MEMORY/ and HISTORY/.
```

### 2. Fix P1 Docs Gaps

```text
Read START_HERE.md and INSTRUCTIONS/. Use WORKSPACE/DEEP_REPO_QUALITY_AUDIT.md as the source. Improve the P1 documentation gaps only: add repeatable safety/link validation instructions, git status/diff protection, Memory cleanup rules, and practical output rules for large changed files. Do not change Salesforce examples yet. Validate links and safety scans. Update MEMORY/ and HISTORY/.
```

### 3. Improve Salesforce Technical Depth

```text
Read START_HERE.md, INSTRUCTIONS/, and SALESFORCE_KNOWLEDGE/INDEX.md. Improve Salesforce technical depth for metadata, Apex security, selectors, LWC UI API/base forms, Lightning Web Security, Flow/Process Builder, reports/dashboards, email templates, labels, translations, Experience Cloud, scratch orgs, sandboxes, and package.xml workflows. Keep content generic and public-safe. Add focused topic docs where needed. Validate links. Update MEMORY/ and HISTORY/.
```

### 4. Improve Prompt Pack

```text
Read START_HERE.md, INSTRUCTIONS/, SALESFORCE_KNOWLEDGE/INDEX.md, and WORKSPACE/DEEP_REPO_QUALITY_AUDIT.md. Update the Codex prompt pack so every prompt requires git status/diff review when a git repo exists, explicit validation command discovery, no local path/private data writes, no fake Salesforce facts, and evidence-based final reporting. Keep prompts copy-paste-ready. Validate links and safety scans. Update MEMORY/ and HISTORY/.
```

### 5. Improve Checklists

```text
Read START_HERE.md, INSTRUCTIONS/, SALESFORCE_KNOWLEDGE/INDEX.md, and WORKSPACE/DEEP_REPO_QUALITY_AUDIT.md. Strengthen checklists for Apex security, LWC UI API/form usage, metadata dependency chains, deployment validation, public repo safety, and git working-tree protection. Avoid duplicating whole guides; make each checklist a strict preflight gate. Validate links and safety scans. Update MEMORY/ and HISTORY/.
```

### 6. Improve Examples

```text
Read START_HERE.md, INSTRUCTIONS/, SALESFORCE_KNOWLEDGE/INDEX.md, and WORKSPACE/DEEP_REPO_QUALITY_AUDIT.md. Improve public-safe examples by adding an example map, stronger disclaimers that examples are not a full deployable org, and a few targeted fictional examples for selectors, UI API LWC, lightning-record-edit-form, permission-safe Apex, and metadata manifests. Do not create fake force-app/main/default in FORCE_APP_DIRECTORY. Validate links and safety scans. Update MEMORY/ and HISTORY/.
```

### 7. Improve Public Wiki

```text
Read START_HERE.md, INSTRUCTIONS/, WIKI_DRAFTS/, and WORKSPACE/DEEP_REPO_QUALITY_AUDIT.md. Improve wiki drafts for publication: add a wiki copy checklist, ensure page names and cross-links are GitHub Wiki friendly, update release/current-version references, and keep all content public-safe. Do not publish the wiki automatically. Validate links and safety scans. Update MEMORY/ and HISTORY/.
```

### 8. Final Safety/Release Check

```text
Read START_HERE.md and INSTRUCTIONS/. Run a final public safety, link, path, release, tag, and repo-structure check after the audit follow-up changes. Confirm FORCE_APP_DIRECTORY has no real private metadata, release docs match the current tag, no local-only paths or temporary references exist, and Memory/History are current. Create a final readiness report. Do not push unless explicitly asked.
```

## Do Not Do Yet

- Do not reorganize the repo again until P0 and P1 documentation/safety issues are fixed.
- Do not add a fake `force-app/main/default` tree.
- Do not commit real Salesforce metadata into `FORCE_APP_DIRECTORY/` unless the repo owner intentionally wants that metadata public.
- Do not add org-specific object names, customer names, usernames, org IDs, aliases, or private URLs.
- Do not replace the existing knowledge base with a new framework before filling the gaps.
- Do not publish more releases until release docs and tag semantics are made consistent.
- Do not make examples depend on private org configuration.
- Do not add broad CI that blocks users before the local scripts/checks are stable.

## Validation Performed

| Check | Result |
| --- | --- |
| Repo status before report creation | Clean on `main` before audit files/log updates. |
| Root structure inspection | Passed; expected root engine folders exist. |
| Salesforce knowledge inventory | Passed; guides, topics, patterns, prompts, checklists, examples, reference, and docs exist. |
| `FORCE_APP_DIRECTORY/` placeholder check | Passed; only `.gitkeep`, `README.md`, and `PLACE_SALESFORCE_PROJECT_HERE.md` were present. |
| Markdown link scan | Passed across 158 Markdown files outside fenced code blocks. |
| Temporary folder reference scan | Passed; no temporary folder name references found. |
| Local-only public-doc path scan | Passed; no local-only Windows paths found in public docs. |
| Credential-like assignment scan | Passed. |
| Private-key/token/session pattern scan | Passed. |
| Salesforce ID-shaped value scan | Passed. |
| Email scan | Passed with documented generic placeholder `user@example.com` only. |

## Final Recommendation

The repo is safe to share publicly in a limited way, but it should get another improvement pass before being promoted heavily.

Fix the two P0 gaps first: release-doc commit consistency and `FORCE_APP_DIRECTORY/` private metadata guardrails. After that, the repo will be much stronger as a public Codex-ready Salesforce coding engine. Then address P1 depth gaps in metadata, Apex security, LWC UI API, prompt controls, checklists, and repeatable validation.
