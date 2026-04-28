# Salesforce Coding v1.4.0 — Expanded Salesforce Knowledge Base

Release date: 2026-04-28

Knowledge-base improvement commit: `e8cc6424b3b2b00a033e55eadd5250d68f88e03e`

## Summary

`v1.4.0` expands this Codex-ready Salesforce coding engine with a deeper public-safe Salesforce knowledge base, stronger Codex behavior controls, and clearer onboarding for users starting from a release ZIP.

This release builds on `v1.3.0`. `v1.3.0` added external Salesforce tooling intelligence, command maps, parameter maps, quality strategies, and validation flows. `v1.4.0` uses a structured audit of local private reference lessons, zipped Salesforce reference repos, and official Salesforce documentation research to close high-priority Salesforce knowledge gaps without copying private data or external source code.

## Local Reference Audit

The improvement pass inventoried local Salesforce README/reference materials and extracted only generic lessons:

- recurring Apex, trigger, test, metadata, deployment, Files, mobile, Visualforce, PDF, Chatter, email, debugging, and public-safety patterns,
- common failure modes and validation gaps,
- Codex behavior rules for inspecting current files before editing,
- public-safe extraction rules for avoiding private names, org identifiers, customer details, credentials, raw logs, emails, phone numbers, and local-only paths.

Private reference material was treated as evidence only. The public repo received original summaries, checklists, failure patterns, validation flows, and topic guidance.

## Zip Repo Reference Audit

The release also analyzed zipped Salesforce and automation reference repos as learning material only. The resulting guidance focuses on:

- useful repo structure patterns,
- test and automation ideas,
- Selenium/TestNG and automation anti-pattern warnings,
- outdated or low-relevance repo patterns Codex should avoid,
- no-vendoring rules for external source trees, generated artifacts, `.git` folders, `node_modules`, and ZIP extraction leftovers.

No zipped repo source code was copied into the public knowledge base.

## Official Salesforce Docs Research

The web research plan and source registry organized official Salesforce sources by topic, including:

- Apex, triggers, tests, async Apex, SOQL/SOSL, governor limits, and security,
- LWC, wire adapters, imperative Apex, navigation, forms, and Jest,
- Visualforce and PDF rendering,
- Metadata API, Salesforce DX source format, package manifests, destructive deployments, and CLI behavior,
- Salesforce Files, email, Chatter, reports, Experience Cloud, mobile, debug logs, Code Analyzer, custom metadata, named credentials, static resources, labels, translations, Flow interaction, and platform events.

The docs were summarized into original guidance. Long official text was not copied.

## Knowledge Gaps Closed

`v1.4.0` closes the highest-priority gaps identified in the master knowledge matrix:

- Apex service, trigger, test, async, SOQL/DML, and security guidance,
- Salesforce Files and photo/document lifecycle guidance,
- LWC data flow, mobile, quick action, toast, navigation, and record-form behavior,
- Visualforce PDF and generated file handoff guidance,
- metadata, FlexiPage, layout, action, permission, package, and destructive deployment safety,
- deployment validation, debug logs, Salesforce CLI command routing, Code Analyzer gating, and release evidence rules,
- Codex prompt/checklist behavior controls,
- new-user onboarding and wiki draft clarity.

## Apex Improvements

Added or strengthened guidance for:

- service class boundaries and trigger handler structure,
- trigger order of execution, Flow re-entry, recursion guards, delete/undelete paths, and side effects,
- bulk-safe SOQL/DML patterns and no SOQL/DML in loops,
- async Apex selection across future, queueable, batch, scheduled, and platform-event-adjacent work,
- user mode, system mode, sharing, CRUD/FLS, LDS/UI API, exposed Apex, and DTO filtering,
- required-field and test-data factory patterns,
- assertions that prove behavior instead of only covering lines,
- Apex validation command maps and Code Analyzer routing.

## LWC, Mobile, Files, And Visualforce Improvements

Added or strengthened guidance for:

- LWC getter/template rules and avoiding inline JavaScript expressions in templates,
- wire versus imperative Apex, cache behavior, refresh flows, and error handling,
- `NavigationMixin`, toast behavior, record forms, dynamic fields, and parent refresh patterns,
- mobile action visibility across component metadata, quick actions, layouts, Dynamic Actions, FlexiPages, permissions, form factors, and runtime surface,
- mobile file preview/download and camera/file handoff behavior,
- Salesforce Files lifecycle across `ContentVersion`, `ContentDocument`, `ContentDocumentLink`, latest version behavior, sharing, upload, preview, download, and generated artifacts,
- photo capture, annotation, viewer, reporting, and PDF handoff patterns as generic Salesforce Files guidance,
- Visualforce controller/page/PDF constraints, static resource dependencies, and durable file-generation patterns.

## Metadata, Deployment, Debug, And CLI Improvements

Added or strengthened guidance for:

- source-format folder safety and package manifest scope,
- permission sets versus profiles,
- FlexiPage, layout, quick action, report, dashboard, static resource, and activation-chain review,
- `project deploy start --dry-run`, `project deploy validate`, deploy reports, quick deploy, and test-level selection,
- `RunSpecifiedTests` and local versus production validation expectations,
- destructive deployment review rules, separate manifests, dependency inspection, rollback notes, and explicit owner approval before real deletion,
- debug-log collection, triage, and sanitized evidence handling,
- common deployment/test failures,
- Code Analyzer gating and no-success-without-evidence release gates.

## Prompt And Checklist Improvements

The prompt pack and Codex engine checklists now more consistently require Codex to:

- read `START_HERE.md`,
- locate the real `force-app/main/default`,
- read Salesforce knowledge, command maps, parameter maps, quality strategies, and validation flows,
- inspect current files before editing,
- avoid guessed API names and invented metadata,
- avoid unrelated edits and broad refactors,
- treat external repo intelligence as learning only,
- preserve public safety,
- update Memory and History after meaningful work,
- avoid claiming tests, lint, analyzer, deploy, retrieve, GitHub, or runtime checks passed unless the command actually ran and passed.

## Wiki And Onboarding Improvements

Updated public onboarding now explains the expected user flow:

1. Download the release ZIP.
2. Extract it.
3. Place or reference the real Salesforce DX project.
4. Open the repo in VS Code with Codex.
5. Tell Codex to read `START_HERE.md`.
6. Let Codex route through instructions, knowledge, commands, parameters, strategies, flows, prompts, and checklists.
7. Make narrow fixes.
8. Run or recommend validation.
9. Update Memory and History.

The wiki drafts now mirror this workflow for users who prefer GitHub Wiki-style onboarding.

## Public Safety Validation

Before the knowledge-base improvement commit was pushed, validation confirmed:

- Markdown link check passed across 263 Markdown files.
- Workspace JSON parse check passed across 10 JSON files.
- Public safety scan passed across 298 text files.
- PowerShell script syntax check passed across 3 scripts.
- Bash script syntax check was skipped because Bash was unavailable in the PowerShell environment.
- `git diff --check` passed in the real git checkout.
- No `node_modules`, copied `.git` folders, optional external clone folders, ZIP extraction temp folders, or ZIP files were found.
- `FORCE_APP_DIRECTORY/` remained placeholder-only.

This release-documentation update should be committed only after the same checks pass again.

## No Private Data Copied

No private/business-specific details were intentionally copied into the public repo.

The workspace source inventory was sanitized before publishing. Public docs do not include local-only paths, customer records, credentials, tokens, private URLs, org IDs, private emails, phone numbers, raw debug logs, screenshots, or project-specific private data.

## No External Source Copied

External repos and ZIP files were used as reference material only.

No external source trees, copied source files, generated artifacts, `.git` folders, `node_modules`, or vendored dependency code were added to this repo.

## Upgrade Notes From v1.3.0

`v1.4.0` is backward-compatible with `v1.3.0`.

Recommended upgrades:

1. Continue starting every task with [START_HERE.md](START_HERE.md).
2. Continue using command maps, parameter maps, quality strategies, and validation flows introduced in `v1.3.0`.
3. Read the expanded Salesforce guides before Apex, LWC, mobile, Files, Visualforce, metadata, deployment, or debugging work.
4. Use the new focused topic docs for trigger order, sharing/security, Files lifecycle, mobile file handoff, quick action visibility, destructive deployment, and debug-log triage.
5. Use the updated prompt pack and checklists to force source inspection, verified API names, narrow edits, validation evidence, Memory/History updates, and public-safety checks.
6. Treat local/private references and optional external repos as learning material only.

## Known Notes

- No real Salesforce DX project is included by default. Project-specific Apex tests, LWC Jest, ESLint, Code Analyzer, deploy validation, retrieve validation, mobile runtime behavior, and Visualforce PDF rendering require a real project and org context.
- Bash syntax checks are skipped in environments where Bash is unavailable.
- Salesforce CLI and Code Analyzer behavior can change by installed version; Codex should verify command help before mutating commands.
- Named credentials/external credentials and Flow interaction with Apex/LWC remain useful candidates for deeper dedicated topic pages.
- This Markdown file does not create the GitHub Release page by itself. The owner still needs to create the GitHub Release for `v1.4.0` if publishing tagged release assets.
