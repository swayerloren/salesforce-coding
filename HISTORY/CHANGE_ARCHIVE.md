# Change Archive

## Purpose

`CHANGE_ARCHIVE.md` summarizes larger completed changes after they are finished.

Use this file for completed repo restructures, major feature work, large Salesforce fixes, broad documentation updates, or multi-file changes that future readers may need to understand at a high level.

This is history, not current operating instruction.

## When Codex Should Update It

Update this file when:

- a larger change spans multiple files or folders,
- a restructure is completed,
- a major Salesforce feature/fix is completed,
- a substantial documentation wave is completed,
- a set of related smaller changes should be summarized together.

Do not use this for every small edit. Use `HISTORY/CODEX_RUN_LOG.md` for normal task logs.

## Entry Template

```markdown
## YYYY-MM-DD - <Completed Change Name>

- Date:
- Summary:
- Scope:
- Key files or folders:
- Validation:
- Outcome:
- Follow-up:
```

## Example Entry

```markdown
## 2026-04-27 - Salesforce Knowledge Restructure

- Date: 2026-04-27
- Summary: Moved Salesforce guides, topics, prompts, patterns, examples, references, and support docs under `SALESFORCE_KNOWLEDGE/`.
- Scope: Repository documentation structure only.
- Key files or folders: `SALESFORCE_KNOWLEDGE/GUIDES/`, `SALESFORCE_KNOWLEDGE/TOPICS/`, `SALESFORCE_KNOWLEDGE/INDEX.md`, `README.md`
- Validation: Confirmed moved paths exist and old root knowledge paths were cleared.
- Outcome: Root now stays focused on setup, instructions, contribution, release, and public safety.
- Follow-up: Continue updating internal links if deeper docs are moved again.
```

## 2026-04-27 - Memory And History System

- Date: 2026-04-27
- Summary: Added specialized memory files for reusable knowledge and specialized history files for chronological Codex records.
- Scope: Repository operating system documentation only.
- Key files or folders: `MEMORY/`, `HISTORY/`, `INSTRUCTIONS/MEMORY_AND_HISTORY_RULES.md`
- Validation: Confirmed required files exist, required sections are present, and examples remain generic/public-safe.
- Outcome: Future Codex sessions have clear places to record fix patterns, failure prevention rules, decisions, org patterns, run logs, deployments, tests, and larger changes.
- Follow-up: Populate project-specific org patterns only after verifying names in a real Salesforce DX project.

## 2026-04-27 - Public-Safe Temporary Reference Extraction

- Date: 2026-04-27
- Summary: Extracted generic documentation governance and project discovery patterns from temporary reference material into permanent public-safe repo docs.
- Scope: Knowledge base, instructions, workspace summary, and memory/history records.
- Key files or folders: `SALESFORCE_KNOWLEDGE/DOCS/documentation-governance.md`, `SALESFORCE_KNOWLEDGE/REFERENCE/project-discovery-template.md`, `SALESFORCE_KNOWLEDGE/CHECKLISTS/project-discovery.md`, `WORKSPACE/TEMP_REFERENCE_EXTRACTION_SUMMARY.md`
- Validation: Searched final public docs for local temporary-folder references and source-specific provider names; verified updated knowledge index links.
- Outcome: The repo preserves useful generic guidance and remains safe if the temporary reference folder is deleted.
- Follow-up: Use the project discovery template only after locating and inspecting a real Salesforce DX project.

## 2026-04-27 - GitHub Wiki Draft Source

- Date: 2026-04-27
- Summary: Added `WIKI_DRAFTS/` with source Markdown pages for the future GitHub Wiki.
- Scope: Public documentation draft source only.
- Key files or folders: `WIKI_DRAFTS/`
- Validation: Confirmed all requested pages exist, checked draft links, and searched for local paths, temporary-folder references, and private-data patterns.
- Outcome: The repo owner has wiki-ready draft pages describing installation, Codex workflow, Salesforce task guides, prompt library, memory/history, folder map, and safety rules.
- Follow-up: Copy these drafts into the GitHub Wiki when ready.

## 2026-04-27 - Codex Prompt Pack

- Date: 2026-04-27
- Summary: Added a dedicated copy-paste prompt pack for common Salesforce Codex tasks.
- Scope: Salesforce knowledge prompt library and supporting memory/history records.
- Key files or folders: `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/`, `SALESFORCE_KNOWLEDGE/PROMPTS/README.md`, `SALESFORCE_KNOWLEDGE/INDEX.md`
- Validation: Confirmed all requested prompt files exist, required workflow wording is present, links resolve, and unsafe local/private references are absent.
- Outcome: Users can start Codex with task-specific prompts that reinforce project location, knowledge reading, source inspection, narrow fixes, validation, output expectations, privacy, and memory/history updates.
- Follow-up: Keep the prompt pack in sync when required Codex operating rules change.

## 2026-04-27 - Codex Engine Checklist Pack

- Date: 2026-04-27
- Summary: Added strict checklist gates for Codex tasks, Salesforce edits, deployment, GitHub push readiness, and public repo safety.
- Scope: Salesforce knowledge checklist library and supporting memory/history records.
- Key files or folders: `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/`, `SALESFORCE_KNOWLEDGE/CHECKLISTS/README.md`, `SALESFORCE_KNOWLEDGE/INDEX.md`
- Validation: Confirmed requested checklist files exist, required content is present, links resolve, and unsafe local/private references are absent.
- Outcome: Codex and repo maintainers have stricter preflight gates for safe Salesforce work and public publishing.
- Follow-up: Keep checklist gates aligned with future instruction changes and public-safety policy updates.

## 2026-04-27 - Link And Path Consistency Pass

- Date: 2026-04-27
- Summary: Updated stale public documentation references after the Salesforce knowledge restructure and documented the link/path review.
- Scope: Release notes, wiki draft, workspace review report, and memory/history records.
- Key files or folders: `RELEASE_NOTES_v1.0.0.md`, `WIKI_DRAFTS/Common-Failures-Codex-Must-Check.md`, `WORKSPACE/LINK_AND_PATH_REVIEW.md`
- Validation: Scanned repo-local Markdown/config text files, checked Markdown links, and searched for temporary/local path references.
- Outcome: Public-facing docs point to the current `SALESFORCE_KNOWLEDGE/` structure; historical old-path mentions remain only as audit context.
- Follow-up: Rerun link checks after future file moves.

## 2026-04-27 - Public GitHub Release Safety Review

- Date: 2026-04-27
- Summary: Completed a strict public-release safety review and documented findings in `WORKSPACE/PUBLIC_RELEASE_REVIEW.md`.
- Scope: Full repo safety and documentation accuracy review.
- Key files or folders: `WORKSPACE/PUBLIC_RELEASE_REVIEW.md`, `README.md`, `START_HERE.md`, `INSTRUCTIONS/`, `SALESFORCE_KNOWLEDGE/`, `WIKI_DRAFTS/`, `FORCE_APP_DIRECTORY/`, `MEMORY/`, `HISTORY/`
- Validation: Scanned for credentials, tokens, session IDs, Salesforce IDs, private emails, local paths, temporary-folder references, private screenshots, private logs, export files, and accidental real metadata in `FORCE_APP_DIRECTORY/`; Markdown links passed.
- Outcome: No blocking unsafe public-release content was found.
- Follow-up: Owner should confirm final README badge/release repository URLs and decide whether `WORKSPACE/` audit reports should be published.

## 2026-04-27 - Final Documentation Polish

- Date: 2026-04-27
- Summary: Polished the main public-facing docs for GitHub readability, consistent terminology, and clearer Codex operation.
- Scope: Root README, start guide, instruction docs, project placement docs, Salesforce knowledge entry points, Memory/History readmes, wiki drafts, prompt/checklist wording, and workspace summary.
- Key files or folders: `README.md`, `START_HERE.md`, `INSTRUCTIONS/`, `FORCE_APP_DIRECTORY/`, `SALESFORCE_KNOWLEDGE/README.md`, `SALESFORCE_KNOWLEDGE/INDEX.md`, `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/`, `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/`, `MEMORY/`, `HISTORY/`, `WIKI_DRAFTS/`, `WORKSPACE/FINAL_POLISH_SUMMARY.md`
- Validation: Markdown links passed; local-only and temporary-folder reference scan passed for final public docs; avoid-list terminology was checked.
- Outcome: The repo now presents more clearly as a Codex-ready Salesforce coding engine for real Salesforce DX projects.
- Follow-up: Confirm final GitHub repo badge URLs and Mermaid rendering before push.

## 2026-04-27 - v1.1.0 Release Documentation

- Date: 2026-04-27
- Summary: Updated release documentation for the Codex-ready Salesforce workspace engine restructure.
- Scope: Release notes, changelog, release index, README release link, repo map, workspace release reports, and memory/history records.
- Key files or folders: `RELEASE_NOTES_v1.1.0.md`, `RELEASES.md`, `CHANGELOG.md`, `README.md`, `INSTRUCTIONS/REPO_MAP.md`, `WORKSPACE/RELEASE_UPDATE_REPORT.md`
- Validation: Markdown links passed; public-safety scans found no credentials, tokens, local-only paths, temporary-folder references, Salesforce org IDs, session IDs, or private customer data.
- Outcome: `v1.1.0` is documented as the latest release for the workspace-engine restructure while `v1.0.0` remains the initial public Salesforce coding knowledge base release.
- Follow-up: Create or update the GitHub Release page manually if GitHub Releases does not automatically use these Markdown release files.

## 2026-04-27 - Deep Repo Quality Audit

- Date: 2026-04-27
- Summary: Audited the repo as a Codex-ready Salesforce coding engine against onboarding, Codex controls, Salesforce technical coverage, prompts, checklists, Memory/History, public safety, release readiness, and GitHub user experience.
- Scope: Full repository documentation and knowledge structure; no Salesforce source edits or repo reorganization.
- Key files or folders: `WORKSPACE/DEEP_REPO_QUALITY_AUDIT.md`, `WORKSPACE/DEEP_REPO_QUALITY_AUDIT_SUMMARY.json`, `README.md`, `START_HERE.md`, `INSTRUCTIONS/`, `FORCE_APP_DIRECTORY/`, `SALESFORCE_KNOWLEDGE/`, `MEMORY/`, `HISTORY/`, `WIKI_DRAFTS/`
- Validation: Markdown links passed; public safety scans found no credentials, tokens, session IDs, private keys, Salesforce org IDs, temporary-folder references, or local-only public-doc paths.
- Outcome: Repo scored 82/100. It is safe for limited public sharing but should get a P0 follow-up pass before heavy promotion.
- Follow-up: Fix release commit consistency and strengthen `FORCE_APP_DIRECTORY/` private metadata guardrails first.

## 2026-04-27 - Tooling And Quality Gate Integration Layer

- Date: 2026-04-27
- Summary: Added root-level documentation and local-script scaffolding for optional Salesforce tooling, quality gates, automation helpers, and vendor/reference attribution.
- Scope: Public-safe docs and helper scripts only; no external repo source was copied or vendored.
- Key files or folders: `TOOLS/`, `QUALITY_GATES/`, `AUTOMATION/`, `VENDOR_REFERENCES/`, `.github/workflows/README.md`, `README.md`, `START_HERE.md`, `SALESFORCE_KNOWLEDGE/INDEX.md`, `INSTRUCTIONS/`
- Validation: PowerShell local quality helper passed; Salesforce project validator produced expected placeholder-repo warnings; Markdown links passed across 182 Markdown files outside fenced code blocks; public-safety scans found no credential-like assignments, Salesforce ID-shaped values, local-only public-doc paths, or temporary-folder references; `git diff --check` passed. Bash helper scripts were inspected but not executed because Bash is not installed in this Windows environment.
- Outcome: Codex now has a first-class place to discover optional Salesforce Code Analyzer, LWC Jest, LWC ESLint, mobile lint, Apex formatting, and release gates.
- Follow-up: Add deeper reference maps and optional workflow examples only after attribution/no-vendoring policy is reviewed.

## 2026-04-27 - Robust Local Validation Scripts

- Date: 2026-04-27
- Summary: Replaced the first-pass automation helpers with stricter Salesforce DX project discovery and quality-gate detection scripts for PowerShell and Bash.
- Scope: Local validation scripts and supporting automation/tooling documentation only.
- Key files or folders: `AUTOMATION/local-quality-check.ps1`, `AUTOMATION/validate-salesforce-project.ps1`, `AUTOMATION/local-quality-check.sh`, `AUTOMATION/validate-salesforce-project.sh`, `AUTOMATION/README.md`, `QUALITY_GATES/README.md`, `TOOLS/INSTALL_TOOLING.md`
- Validation: PowerShell scripts passed in allow-missing mode; Bash syntax checks and allow-missing runtime checks passed through Git Bash; Markdown links passed across 182 Markdown files; public-safety scans passed; `git diff --check` passed.
- Outcome: Codex has practical local validation commands that can locate a real Salesforce DX project, detect available tools and package scripts, recommend or run safe local gates, and avoid deployment or org-login assumptions.
- Follow-up: Test the scripts against a real Salesforce DX project under `FORCE_APP_DIRECTORY/` before relying on project-specific lint, Jest, or formatting results.

## 2026-04-27 - GitHub Action Workflow Drafts

- Date: 2026-04-27
- Summary: Added public-safe GitHub Actions workflows for Markdown links, public-safety scanning, and conditional Salesforce Code Analyzer checks.
- Scope: Workflow drafts and supporting documentation only; no deployment workflow, org login, or repository secrets were added.
- Key files or folders: `.github/workflows/markdown-link-check.yml`, `.github/workflows/public-safety-check.yml`, `.github/workflows/salesforce-code-analyzer.yml`, `.github/workflows/README.md`, `QUALITY_GATES/RELEASE_GATE.md`, `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_GITHUB_PUSH.md`
- Validation: Local workflow-script replicas passed for Markdown links and public-safety scanning; workflow YAML formatting passed with Prettier; public-doc path scans passed.
- Outcome: Pull requests and pushes to `main` now have draftable quality gates that require no secrets by default and can be adapted for real Salesforce DX projects.
- Follow-up: Confirm first GitHub Actions run after push and adjust Code Analyzer install strategy if the upstream package or official action changes.

## 2026-04-27 - External Recipe Reference Maps

- Date: 2026-04-27
- Summary: Added reference maps for public Apex Recipes and LWC Recipes repositories so Codex can learn pattern locations without copying external source wholesale.
- Scope: Salesforce knowledge reference docs, vendor reference docs, prompt pack reminders, and memory/history records.
- Key files or folders: `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_APEX_RECIPES_MAP.md`, `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_LWC_RECIPES_MAP.md`, `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_PATTERN_USAGE_RULES.md`
- Validation: Markdown links passed across 185 Markdown files outside fenced code blocks; public-safety scans for temporary folder references, local-only paths, and credential-like assignments passed; `git diff --check` passed.
- Outcome: Codex now has explicit rules and repo-relative maps for Apex SOQL/DML/services/async/platform-event/security/testing patterns and LWC wire/Apex/navigation/toast/form/composition/event/slot/Jest patterns.
- Follow-up: Keep these maps as references only; do not vendor recipe source into this repo.

## 2026-04-27 - Salesforce Code Analyzer First-Class Gate

- Date: 2026-04-27
- Summary: Strengthened Salesforce Code Analyzer as a documented, automated, and prompt-level quality gate for Salesforce source changes.
- Scope: Tool docs, quality-gate docs, local automation helpers, GitHub Actions workflow, Codex operating instructions, task prompts, and memory/history records.
- Key files or folders: `TOOLS/SALESFORCE_CODE_ANALYZER.md`, `QUALITY_GATES/CODE_ANALYZER_RULES.md`, `AUTOMATION/local-quality-check.ps1`, `AUTOMATION/local-quality-check.sh`, `.github/workflows/salesforce-code-analyzer.yml`
- Validation: PowerShell and Git Bash local quality checks passed in allow-missing mode and detected `sf code-analyzer`; workflow YAML formatting passed with Prettier; Markdown links passed across 185 Markdown files; public-safety scans passed; `git diff --check` passed.
- Outcome: Codex must now run or explicitly skip Code Analyzer after Salesforce source changes and must not claim static analysis passed without an actual passing analyzer run.
- Follow-up: Test `-RunCodeAnalyzer` or `--run-code-analyzer` against a real Salesforce DX project under `FORCE_APP_DIRECTORY/`.

## 2026-04-27 - LWC Jest, ESLint, And Mobile Lint Gates

- Date: 2026-04-27
- Summary: Strengthened LWC validation guidance and local helper detection for LWC Jest, LWC ESLint, mobile lint, and the advanced graph analyzer.
- Scope: Tool docs, quality-gate docs, optional example configs, local automation helpers, Codex prompt pack, LWC/mobile guide notes, knowledge index, and memory/history records.
- Key files or folders: `TOOLS/LWC_JEST.md`, `TOOLS/ESLINT_LWC.md`, `TOOLS/LWC_MOBILE_LINT.md`, `QUALITY_GATES/LWC_LINT_RULES.md`, `QUALITY_GATES/TESTING_GATE.md`, `QUALITY_GATES/examples/`, `AUTOMATION/local-quality-check.ps1`, `AUTOMATION/local-quality-check.sh`
- Validation: PowerShell local quality check passed in allow-missing mode; Git Bash syntax and allow-missing runtime checks passed; Markdown links passed across 188 Markdown files; public-safety scans for temporary/local research folder references, credential-like assignments, and Salesforce ID-shaped values passed; `git diff --check` passed.
- Outcome: Codex now has clearer rules for running or skipping LWC Jest/lint/mobile checks and must not claim these gates passed without actual successful command execution.
- Follow-up: Test the helper scripts against a real Salesforce DX project that contains LWC Jest, ESLint, and mobile lint scripts.

## 2026-04-27 - Apex Output Quality Gates

- Date: 2026-04-27
- Summary: Strengthened Apex guidance, prompts, checklist, and quality gates around safe Apex generation and validation.
- Scope: Apex formatter docs, Apex Code Analyzer guidance, Apex Recipes reference map, Apex/testing guides, prompt pack, before-editing checklist, optional examples, and memory/history records.
- Key files or folders: `TOOLS/PRETTIER_APEX.md`, `QUALITY_GATES/APEX_FORMATTING.md`, `QUALITY_GATES/CODE_ANALYZER_RULES.md`, `QUALITY_GATES/examples/`, `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`, `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_TESTING_GUIDE.md`, `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/03_FIX_APEX.md`, `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/04_FIX_APEX_TESTS.md`
- Validation: PowerShell local quality check passed in allow-missing mode; Bash syntax check passed; Markdown links passed across 190 Markdown files; public-safety scans for temporary/local research folder references, credential-like assignments, and Salesforce ID-shaped values passed; `git diff --check` passed.
- Outcome: Codex now has stricter Apex requirements for bulk safety, SOQL/DML placement, hard-coded ID avoidance, null safety, sharing/security intent, real tests, optional formatting, and Code Analyzer usage.
- Follow-up: Test Apex formatting, Code Analyzer, and focused Apex test examples against a real Salesforce DX project under `FORCE_APP_DIRECTORY/`.

## 2026-04-27 - Metadata, Record Page, And Project Structure Guidance

- Date: 2026-04-27
- Summary: Strengthened metadata and record-page guidance plus project validation around Salesforce DX source-format paths and high-risk metadata.
- Scope: Metadata guide, record page guide, platform limitations, metadata topic notes, metadata checklist, metadata prompt, release gate, project validators, index, README, and memory/history records.
- Key files or folders: `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md`, `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_RECORD_PAGE_GUIDE.md`, `SALESFORCE_KNOWLEDGE/TOPICS/metadata/README.md`, `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EDITING_METADATA.md`, `AUTOMATION/validate-salesforce-project.ps1`, `AUTOMATION/validate-salesforce-project.sh`
- Validation: PowerShell validator passed in allow-missing mode; local quality check passed in allow-missing mode; Git Bash validator syntax/runtime passed in allow-missing mode; temporary metadata smoke test passed for common source-format paths; Markdown links passed across 191 Markdown files; public-safety scans for temporary/local research folder references, credential-like assignments, and Salesforce ID-shaped values passed; `git diff --check` passed.
- Outcome: Codex now has stricter metadata rules for inspecting existing source, verifying API names, checking activation/assignment/permissions, avoiding blind profile edits, keeping manifests narrow, and preserving Salesforce DX structure.
- Follow-up: Test metadata path checks against a real Salesforce DX project under `FORCE_APP_DIRECTORY/`.

## 2026-04-27 - Optional Vendor Reference Clone System

- Date: 2026-04-27
- Summary: Added a local-only external reference clone workflow for public Salesforce tooling and recipe repos.
- Scope: Vendor reference docs, clone helper scripts, ignore rules, README/start guide, external reference docs, pattern usage rules, and memory/history records.
- Key files or folders: `VENDOR_REFERENCES/`, `VENDOR_REFERENCES/clone-reference-repos.ps1`, `VENDOR_REFERENCES/clone-reference-repos.sh`, `.gitignore`
- Validation: PowerShell clone script parse passed; Bash clone script syntax check passed; `.gitignore` contains and `git check-ignore` confirms `VENDOR_REFERENCES/_external/`, `temp/`, and `*.local.md`; local quality check passed in allow-missing mode; Markdown links passed across 191 Markdown files; public-safety scans for temporary-folder references, credential-like assignments, and Salesforce ID-shaped values passed; `git diff --check` passed. Clone scripts were not executed to fetch external repos.
- Outcome: Users can clone optional references into `VENDOR_REFERENCES/_external/` without bloating the public repo, and Codex has clear no-vendoring and attribution rules.
- Follow-up: Run the clone helpers only when local external references are wanted.

## 2026-04-28 - Tooling Integration Consistency Review

- Date: 2026-04-28
- Summary: Aligned the tooling, quality gate, automation, vendor reference, prompt, checklist, wiki, and public-safety docs after the integration passes.
- Scope: Public docs, wiki drafts, prompt pack references, Salesforce knowledge index, local automation safety scans, GitHub workflow skip rules, Memory, History, and workspace review reports.
- Key files or folders: `README.md`, `START_HERE.md`, `SALESFORCE_KNOWLEDGE/INDEX.md`, `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/`, `AUTOMATION/`, `.github/workflows/`, `WIKI_DRAFTS/`, `WORKSPACE/TOOLING_INTEGRATION_CONSISTENCY_REVIEW.md`
- Validation: PowerShell and Bash script syntax checks passed; local quality check passed in allow-missing mode; Markdown local links passed across 192 Markdown files; public-doc inline `.md` path references resolved; exact temporary reference folder, local-only path, credential/private-key/session, and Salesforce org ID-shaped scans passed; `git check-ignore` confirmed local-only vendor/temp patterns; `git diff --check` passed with only the `.gitignore` CRLF normalization warning.
- Outcome: Public docs and drafts now route users through `TOOLS/`, `QUALITY_GATES/`, `AUTOMATION/`, and `VENDOR_REFERENCES/` consistently, and local scans skip optional cloned references so external repos remain analysis-only.
- Follow-up: Run GitHub Actions after committing and run the automation scripts against a real Salesforce DX project when one is placed or referenced.

## 2026-04-28 - v1.2.0 Release Documentation

- Date: 2026-04-28
- Summary: Prepared release documentation for the Salesforce tooling references and Codex quality gates integration.
- Scope: Release notes, release index, changelog, README latest release link, repo map, workspace release report, Memory, and History.
- Key files or folders: `RELEASE_NOTES_v1.2.0.md`, `RELEASES.md`, `CHANGELOG.md`, `README.md`, `WORKSPACE/RELEASE_UPDATE_REPORT_v1.2.0.md`
- Validation: Markdown local link/path check passed across 194 Markdown files; local quality check passed in allow-missing-project mode; public-safety scans passed; no external repo clone directories were found in the main repo tree; local-only vendor/temp patterns are ignored; `FORCE_APP_DIRECTORY/` contains only placeholder and instruction files; `git diff --check` passed.
- Outcome: `v1.2.0` is the selected version because the integration added significant backward-compatible tooling, quality gates, local automation, optional vendor references, workflow drafts, and validation guidance.
- Follow-up: Create or update the GitHub Release page manually after the release documentation commit is pushed.
