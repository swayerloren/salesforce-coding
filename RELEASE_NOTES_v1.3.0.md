# Salesforce Coding v1.3.0 - External Salesforce Tooling Intelligence

Release date: 2026-04-28

Commit: `c15aa299ee8312a46813e2fa8e1811c2014b027f`

## Summary

`v1.3.0` integrates intelligence from external Salesforce tooling and reference repositories into this Codex-ready Salesforce coding engine without copying or vendoring their source.

This release builds on `v1.2.0`. `v1.2.0` added the tooling, quality gate, automation, workflow, and optional vendor reference layers. `v1.3.0` adds deeper distilled guidance so Codex can understand which commands, parameters, validation sequences, and Salesforce quality strategies to use before claiming code changes are safe.

External repositories are treated as attribution-aware knowledge sources, not copy/paste sources. The repo now stores original public-safe documentation, prompt rules, checklists, command maps, parameter maps, quality strategies, and validation flows derived from analysis of those tools.

## What Changed

| Area | Change |
| --- | --- |
| External intelligence strategy | Added strategy reports and implementation docs explaining how external repos inform this engine without becoming dependencies. |
| External intelligence reference docs | Added `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/` with repo-by-repo strategy maps. |
| Command maps | Added `SALESFORCE_KNOWLEDGE/COMMANDS/` for Salesforce CLI, npm script, LWC test, Apex validation, and GitHub Action command routing. |
| Parameter maps | Added `SALESFORCE_KNOWLEDGE/PARAMETERS/` for Code Analyzer, LWC Jest, ESLint LWC, Prettier Apex, and local automation parameters. |
| Quality strategies | Added `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/` for Apex, LWC, metadata, mobile, deployment, and pull request quality posture. |
| Validation flows | Added `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/` for Apex, LWC, metadata, deployment, and pre-release work. |
| Prompt pack | Updated task prompts so Codex reads command maps, parameter maps, quality strategies, and validation flows before selecting validation steps. |
| Checklists | Updated Codex checklists so skipped gates, missing tools, and validation evidence must be documented. |
| Routing docs | Updated `TOOLS/`, `QUALITY_GATES/`, `AUTOMATION/`, `VENDOR_REFERENCES/`, and `SALESFORCE_KNOWLEDGE/INDEX.md` to route Codex through the new intelligence layers. |

## New Knowledge Layers

### External Intelligence

New docs under [SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/](SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/) explain how Codex should learn from:

- Salesforce Code Analyzer
- Apex Recipes
- LWC Recipes
- LWC Jest
- ESLint LWC and related configuration repos
- LWC mobile lint and graph analysis
- Prettier Apex
- Salesforce VS Code extensions
- Pull request scan automation

These docs describe concepts, setup flows, validation ideas, and integration rules. They do not copy external source.

### Command Maps

New command maps under [SALESFORCE_KNOWLEDGE/COMMANDS/](SALESFORCE_KNOWLEDGE/COMMANDS/) help Codex choose the right validation command family:

- Salesforce CLI and deployment validation commands
- npm script detection and selection
- LWC Jest test command patterns
- Apex validation and test command patterns
- GitHub Action command and trigger patterns

Commands that depend on upstream tool versions are marked so Codex verifies them against installed tooling or upstream docs before claiming support.

### Parameter Maps

New parameter maps under [SALESFORCE_KNOWLEDGE/PARAMETERS/](SALESFORCE_KNOWLEDGE/PARAMETERS/) explain commonly used options and when they are appropriate:

- Salesforce Code Analyzer targets, workspaces, rule selectors, output formats, and severity controls
- LWC Jest watch, coverage, debug, and passthrough options
- ESLint LWC configuration profiles and rule-family decisions
- Prettier Apex check-first and write-mode behavior
- Local automation script parameters for safe project discovery and validation

### Quality Strategies

New quality strategy docs under [SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/](SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/) define the expected quality posture for:

- bulk-safe Apex,
- LWC data flow and component behavior,
- metadata structure and activation chains,
- mobile-safe Salesforce UI changes,
- deployment validation,
- pull request review readiness.

### Validation Flows

New validation flows under [SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/](SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/) give Codex ordered task sequences for:

- Apex fixes,
- LWC fixes,
- metadata fixes,
- deployment failures,
- pre-release checks.

These flows reinforce that Codex must inspect the real Salesforce DX project first, make narrow changes, run available validation, and state skipped gates clearly.

## Updated Codex Controls

The Codex prompt pack and checklist pack now require Codex to:

- read the new command maps before selecting commands,
- read the relevant parameter maps before choosing flags,
- read the relevant quality strategy before editing,
- follow the relevant validation flow before claiming completion,
- document missing optional tools as `MISSING` or `SKIPPED`,
- avoid claiming tests, lint, formatting, static analysis, or deployment validation passed without evidence,
- treat external repos as pattern references only,
- keep the user's real `force-app/main/default` metadata as the source of truth.

## External Repository Policy

This release preserves the no-vendoring rule.

No external repo trees, `.git` folders, `node_modules`, generated artifacts, dependency code, copied source files, credentials, tokens, local-only paths, Salesforce org IDs, private customer data, or session values were copied into this repo.

External repos remain attribution-aware knowledge sources. If users optionally clone them locally through `VENDOR_REFERENCES/`, those clones stay ignored and outside the public release content.

## Upgrade Notes From v1.2.0

`v1.3.0` is backward-compatible with `v1.2.0`.

Recommended upgrades:

1. Keep using [START_HERE.md](START_HERE.md) as the first read.
2. Keep using [TOOLS/](TOOLS/), [QUALITY_GATES/](QUALITY_GATES/), [AUTOMATION/](AUTOMATION/), and [VENDOR_REFERENCES/](VENDOR_REFERENCES/) from `v1.2.0`.
3. Add the new [SALESFORCE_KNOWLEDGE/COMMANDS/](SALESFORCE_KNOWLEDGE/COMMANDS/) layer when Codex needs command selection guidance.
4. Add the new [SALESFORCE_KNOWLEDGE/PARAMETERS/](SALESFORCE_KNOWLEDGE/PARAMETERS/) layer when Codex needs flag or option guidance.
5. Add the new [SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/](SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/) layer before Apex, LWC, metadata, mobile, deployment, or pull request work.
6. Add the new [SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/](SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/) layer before Codex reports task completion.
7. Continue treating optional external references as local-only, ignored, and license-aware.

## Using This Release From ZIP

For a new workspace:

1. Download the release ZIP.
2. Extract it.
3. Open the extracted folder in VS Code with Codex.
4. Place or reference the real Salesforce DX project through `FORCE_APP_DIRECTORY/`.
5. Tell Codex to read `START_HERE.md`.
6. Codex should read instructions, knowledge, command maps, parameter maps, quality strategies, validation flows, prompts, checklists, tools, and quality gates before editing.
7. Codex should inspect current project files, make narrow fixes, run or recommend validation, and update Memory/History after meaningful work.

## Validation Performed

The implementation commit `c15aa299ee8312a46813e2fa8e1811c2014b027f` was validated with:

- Markdown local link checks across 219 Markdown files.
- Public-safety scans for credential-like assignments, token/session patterns, Salesforce org ID-shaped values, and local-only path references in public docs.
- Confirmation that no external source repo trees were copied.
- Confirmation that no `.git` folders were copied except the repository's own git metadata.
- Confirmation that no `node_modules` directories were copied.
- Confirmation that no local-only paths remain in public docs.
- Confirmation that no credentials, tokens, or Salesforce org IDs were found.
- Confirmation that `FORCE_APP_DIRECTORY/` contains only placeholder and instruction files.
- `git diff --check`.

This release documentation update should be committed only after the same public-safety and Markdown checks pass again.

## Known Notes

- No GitHub Release page is created by this Markdown file. The owner still needs to create or update the GitHub Release for `v1.3.0`.
- No real Salesforce DX project is included by default. Project-specific tests, deployments, static analysis, linting, and formatting remain skipped until a real project is placed or referenced.
- Some command and parameter guidance is version-sensitive and should be verified against installed tools or upstream docs before execution.
- External repositories are references only. Do not copy their source or sample metadata into this repo without deliberate owner approval and license attribution.
