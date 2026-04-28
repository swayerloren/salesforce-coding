# Salesforce Tooling References And Codex Quality Gates v1.2.0

Release date: 2026-04-28

Commit: `3f321c1f7316eb35ecb44dee6c17f49999b68308`

## Summary

`v1.2.0` adds a backward-compatible tooling, validation, automation, and external-reference layer to the Codex-ready Salesforce coding engine.

This release helps Codex move beyond documentation-only guidance by giving it practical ways to identify optional validation tools, run safe local checks, interpret missing tooling, and use public Salesforce reference repos without vendoring third-party source into this repo.

Use `v1.2.0` if you want Codex to:

- find the real Salesforce DX project before editing,
- read Salesforce knowledge before changing source,
- check available tooling and quality gates after meaningful code changes,
- avoid claiming validation passed unless evidence exists,
- keep optional external references local-only and license-aware.

## What Changed

| Area | Change |
| --- | --- |
| Tooling layer | Added `TOOLS/` with guides for Salesforce Code Analyzer, LWC Jest, LWC ESLint, mobile lint, Prettier Apex, installation, and external reference repos. |
| Quality gates | Added `QUALITY_GATES/` with Code Analyzer, LWC lint, Apex formatting, testing, and release gates. |
| Automation | Added `AUTOMATION/` scripts for local Salesforce DX project discovery and quality checks. |
| Vendor references | Added `VENDOR_REFERENCES/` with optional clone scripts, source maps, license notes, and no-vendoring rules. |
| GitHub workflows | Added `.github/workflows/` drafts for Markdown links, public-safety scanning, and Salesforce Code Analyzer. |
| Salesforce knowledge | Added external Apex Recipes and LWC Recipes reference maps plus stricter metadata topic guidance. |
| Prompt pack | Updated task prompts to route Codex through tooling and quality gates. |
| Checklists | Strengthened Codex engine checklists for Apex, metadata, and GitHub push safety. |
| Wiki drafts | Updated wiki pages to explain tooling, quality gates, automation, and optional vendor references. |

## Added Tooling Layer

New tooling docs live in [TOOLS/](TOOLS/):

| File | Purpose |
| --- | --- |
| [TOOLS/README.md](TOOLS/README.md) | Entry point for optional tooling guidance. |
| [TOOLS/TOOL_REGISTRY.md](TOOLS/TOOL_REGISTRY.md) | Tool map and use cases. |
| [TOOLS/INSTALL_TOOLING.md](TOOLS/INSTALL_TOOLING.md) | Install examples and Codex usage notes. |
| [TOOLS/SALESFORCE_CODE_ANALYZER.md](TOOLS/SALESFORCE_CODE_ANALYZER.md) | Salesforce Code Analyzer install, run, and interpretation guidance. |
| [TOOLS/LWC_JEST.md](TOOLS/LWC_JEST.md) | LWC Jest testing guidance. |
| [TOOLS/ESLINT_LWC.md](TOOLS/ESLINT_LWC.md) | LWC ESLint guidance. |
| [TOOLS/LWC_MOBILE_LINT.md](TOOLS/LWC_MOBILE_LINT.md) | Mobile and offline lint guidance. |
| [TOOLS/PRETTIER_APEX.md](TOOLS/PRETTIER_APEX.md) | Optional Apex formatting guidance. |
| [TOOLS/EXTERNAL_REFERENCE_REPOS.md](TOOLS/EXTERNAL_REFERENCE_REPOS.md) | Public external repo reference map. |

Codex should treat these tools as optional unless the user project already has them installed or the user approves setup.

## Added Quality Gates

New validation guidance lives in [QUALITY_GATES/](QUALITY_GATES/):

| File | Purpose |
| --- | --- |
| [QUALITY_GATES/CODE_ANALYZER_RULES.md](QUALITY_GATES/CODE_ANALYZER_RULES.md) | When and how to use Salesforce Code Analyzer. |
| [QUALITY_GATES/LWC_LINT_RULES.md](QUALITY_GATES/LWC_LINT_RULES.md) | LWC lint expectations and skipped-tool handling. |
| [QUALITY_GATES/APEX_FORMATTING.md](QUALITY_GATES/APEX_FORMATTING.md) | Optional Apex formatting checks. |
| [QUALITY_GATES/TESTING_GATE.md](QUALITY_GATES/TESTING_GATE.md) | LWC Jest, Apex tests, lint, and analyzer evidence. |
| [QUALITY_GATES/RELEASE_GATE.md](QUALITY_GATES/RELEASE_GATE.md) | Release, deployment, public-safety, and metadata review checks. |

Example config drafts were added under [QUALITY_GATES/examples/](QUALITY_GATES/examples/). They are inactive examples and must not be copied blindly into a real project.

## Added Automation Scripts

New local scripts live in [AUTOMATION/](AUTOMATION/):

| Script | Purpose |
| --- | --- |
| [AUTOMATION/validate-salesforce-project.ps1](AUTOMATION/validate-salesforce-project.ps1) | PowerShell Salesforce DX project placement and metadata-path validator. |
| [AUTOMATION/validate-salesforce-project.sh](AUTOMATION/validate-salesforce-project.sh) | Bash Salesforce DX project placement and metadata-path validator. |
| [AUTOMATION/local-quality-check.ps1](AUTOMATION/local-quality-check.ps1) | PowerShell local quality check and public-safety scan. |
| [AUTOMATION/local-quality-check.sh](AUTOMATION/local-quality-check.sh) | Bash local quality check and public-safety scan. |

These scripts:

- locate `force-app/main/default`,
- check available tools gracefully,
- report `FOUND`, `MISSING`, `SKIPPED`, `PASS`, and `FAIL`,
- do not require org login,
- do not deploy,
- do not modify user Salesforce files.

## Added Optional Vendor Reference System

New optional reference docs and scripts live in [VENDOR_REFERENCES/](VENDOR_REFERENCES/).

Users may clone public Salesforce tooling and recipe repos locally into:

```text
VENDOR_REFERENCES/_external/
```

That folder is ignored by git. It is not required to use the repo and must not be committed.

Clone helpers:

- [VENDOR_REFERENCES/clone-reference-repos.ps1](VENDOR_REFERENCES/clone-reference-repos.ps1)
- [VENDOR_REFERENCES/clone-reference-repos.sh](VENDOR_REFERENCES/clone-reference-repos.sh)

Reference docs:

- [VENDOR_REFERENCES/TOOL_SOURCE_MAP.md](VENDOR_REFERENCES/TOOL_SOURCE_MAP.md)
- [VENDOR_REFERENCES/EXTERNAL_REPOS_TO_CLONE_OPTIONALLY.md](VENDOR_REFERENCES/EXTERNAL_REPOS_TO_CLONE_OPTIONALLY.md)
- [VENDOR_REFERENCES/LICENSE_AND_ATTRIBUTION_NOTES.md](VENDOR_REFERENCES/LICENSE_AND_ATTRIBUTION_NOTES.md)

## Added GitHub Workflow Drafts

New workflow drafts live in [.github/workflows/](.github/workflows/):

| Workflow | Purpose |
| --- | --- |
| [.github/workflows/markdown-link-check.yml](.github/workflows/markdown-link-check.yml) | Checks repository-local Markdown links. |
| [.github/workflows/public-safety-check.yml](.github/workflows/public-safety-check.yml) | Scans for obvious unsafe public repo content without printing secret values. |
| [.github/workflows/salesforce-code-analyzer.yml](.github/workflows/salesforce-code-analyzer.yml) | Runs Salesforce Code Analyzer when real Salesforce metadata is present. |

The workflows require no secrets by default. The Code Analyzer workflow skips when no `force-app/main/default` folder exists.

## External Repo Attribution And Reference Notes

This release references public external repos by URL and license notes. It does not copy or vendor their source code.

Referenced repos include:

- [forcedotcom/code-analyzer](https://github.com/forcedotcom/code-analyzer)
- [trailheadapps/lwc-recipes](https://github.com/trailheadapps/lwc-recipes)
- [trailheadapps/apex-recipes](https://github.com/trailheadapps/apex-recipes)
- [salesforce/sfdx-lwc-jest](https://github.com/salesforce/sfdx-lwc-jest)
- [dangmai/prettier-plugin-apex](https://github.com/dangmai/prettier-plugin-apex)
- [salesforce/eslint-plugin-lwc](https://github.com/salesforce/eslint-plugin-lwc)
- [salesforce/eslint-config-lwc](https://github.com/salesforce/eslint-config-lwc)
- [salesforce/eslint-plugin-lwc-mobile](https://github.com/salesforce/eslint-plugin-lwc-mobile)
- [salesforce/eslint-plugin-lwc-graph-analyzer](https://github.com/salesforce/eslint-plugin-lwc-graph-analyzer)
- [forcedotcom/salesforcedx-vscode](https://github.com/forcedotcom/salesforcedx-vscode)
- [mitchspano/sfdx-scan-pull-request](https://github.com/mitchspano/sfdx-scan-pull-request)

Codex may inspect optional local clones if users create them, but must:

- inspect the user's real Salesforce DX project first,
- treat external repos as pattern references only,
- preserve license attribution if any external code is copied with approval,
- never invent object, field, Apex, metadata, component, or permission names from recipe repos.

## Upgrade Notes From v1.1.0

`v1.2.0` is backward-compatible with the `v1.1.0` workspace-engine layout.

Recommended upgrades:

1. Keep using [START_HERE.md](START_HERE.md) as the first read.
2. Keep placing or referencing real Salesforce DX projects through [FORCE_APP_DIRECTORY/](FORCE_APP_DIRECTORY/).
3. Add the new tooling step to Codex prompts: read [TOOLS/](TOOLS/) and [QUALITY_GATES/](QUALITY_GATES/) before claiming validation.
4. Use [AUTOMATION/](AUTOMATION/) scripts for local project discovery and quality checks when practical.
5. Use [VENDOR_REFERENCES/](VENDOR_REFERENCES/) only for optional local reference clones.
6. Do not commit `VENDOR_REFERENCES/_external/`, `temp/`, or `*.local.md`.
7. Watch the new GitHub Actions after pushes and pull requests.

## Validation Performed

Before this release documentation update, the tooling integration commit was validated with:

- Markdown local link/path checks across 192 Markdown files.
- Local quality check in allow-missing-project mode.
- Public-safety scans for credentials, private keys, session patterns, Salesforce org ID-shaped values, local-only paths, and temporary-folder references.
- Confirmation that no external repo clone directories were copied into the main repo.
- Confirmation that `VENDOR_REFERENCES/_external/`, `temp/`, and `*.local.md` are ignored.
- Confirmation that `FORCE_APP_DIRECTORY/` contains only placeholder and instruction files.
- Confirmation that `README.md` and `START_HERE.md` mention `TOOLS`, `QUALITY_GATES`, `AUTOMATION`, and `VENDOR_REFERENCES`.
- `git diff --check`.

This release documentation update should be committed only after the same public-safety and Markdown checks pass again.

## Known Notes

- No GitHub Release page is created by this Markdown file. The owner still needs to create or update the GitHub Release manually.
- No real Salesforce DX project is included by default, so project-specific tests, deploy dry runs, LWC Jest, LWC ESLint, Apex formatting, and Salesforce Code Analyzer runs are skipped until a real project is placed or referenced.
- The workflow drafts are public-safe defaults. Repo owners may customize them for private deployment, org authentication, or stricter project-specific gates.
- Optional external repos are references only. They remain outside the public repo unless a user clones them locally into the ignored `_external/` folder.
