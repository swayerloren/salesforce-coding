# Repo Audit Before Restructure

Audit date: 2026-04-27

Scope:
- Current repository folder.
- Temporary sibling reference folder used during setup.

Constraints honored:
- No existing files were edited.
- No files were moved.
- No files were deleted.
- The temporary reference folder must not become a permanent repo dependency.
- The final repo should not link to or require the temporary reference folder.

## 1. Current Root Structure

The current repo is a public Salesforce knowledge base with root-level guides, topic folders, examples, prompts, checklists, and publishing metadata.

Root folders:

| Folder | Current role | File count | Markdown count |
| --- | --- | ---: | ---: |
| `anti_patterns/` | Topic-specific anti-pattern docs | 3 | 3 |
| `apex/` | Apex deep-dive docs | 2 | 2 |
| `aura/` | Aura template guidance | 1 | 1 |
| `checklists/` | Preflight and review checklists | 8 | 8 |
| `deployment/` | Deployment runbooks and test selection | 2 | 2 |
| `docs/` | General engineering and public-sanitization policy | 2 | 2 |
| `examples/` | Public-safe Apex, LWC, and metadata examples | 25 | 2 |
| `lwc/` | LWC deep-dive docs | 3 | 3 |
| `metadata/` | Metadata and activation guidance | 1 | 1 |
| `mobile/` | Salesforce mobile runtime lessons | 1 | 1 |
| `patterns/` | Reusable implementation patterns | 7 | 7 |
| `prompts/` | Reusable AI-agent prompts | 8 | 8 |
| `reference/` | Glossary, CLI reference, sanitized lesson catalog | 3 | 3 |
| `testing/` | Apex test guidance | 1 | 1 |
| `troubleshooting/` | Symptom-specific troubleshooting docs | 4 | 4 |
| `visualforce/` | Visualforce PDF maintenance guidance | 1 | 1 |

Root files:

- `.gitattributes`
- `.gitignore`
- `CHANGELOG.md`
- `CODE_OF_CONDUCT.md`
- `CONTRIBUTING.md`
- `CONTRIBUTING_GUIDELINES.md`
- `INDEX.md`
- `LICENSE`
- `PUBLIC_REPO_REVIEW_CHECKLIST.md`
- `README.md`
- `RELEASES.md`
- `RELEASE_NOTES_v1.0.0.md`
- `SALESFORCE_APEX_GUIDE.md`
- `SALESFORCE_ARCHITECTURE_GUIDE.md`
- `SALESFORCE_AURA_GUIDE.md`
- `SALESFORCE_COMMON_FAILURES_AND_FIXES.md`
- `SALESFORCE_COPY_PASTE_SAFE_PATTERNS.md`
- `SALESFORCE_DEBUGGING_GUIDE.md`
- `SALESFORCE_DEPLOYMENT_GUIDE.md`
- `SALESFORCE_DO_AND_DONT.md`
- `SALESFORCE_FILE_HANDLING_GUIDE.md`
- `SALESFORCE_LWC_GUIDE.md`
- `SALESFORCE_METADATA_GUIDE.md`
- `SALESFORCE_MOBILE_GUIDE.md`
- `SALESFORCE_PLATFORM_LIMITATIONS.md`
- `SALESFORCE_RECORD_PAGE_GUIDE.md`
- `SALESFORCE_TESTING_GUIDE.md`
- `SALESFORCE_VISUALFORCE_GUIDE.md`
- `SECURITY.md`
- `SOURCE_MAPPING.md`

Current repo size snapshot:
- 102 files total.
- 76 Markdown files.
- 10 XML metadata/example files.
- 6 Apex class files.
- 3 HTML files.
- 3 JavaScript files.
- 1 trigger file.
- No `.git/` directory is present in this extracted workspace.

## 2. Current Salesforce Knowledge Folders

The current Salesforce knowledge is split across generic topic folders instead of a single canonical knowledge root.

Current knowledge folders:

- `anti_patterns/`
- `apex/`
- `aura/`
- `checklists/`
- `deployment/`
- `docs/`
- `examples/`
- `lwc/`
- `metadata/`
- `mobile/`
- `patterns/`
- `prompts/`
- `reference/`
- `testing/`
- `troubleshooting/`
- `visualforce/`

These folders are already public-safe and generic. They mostly contain reusable Salesforce guidance rather than org-specific implementation notes. They are good candidates to move under a future `SALESFORCE_KNOWLEDGE/` root so the repository root can stay small and operational.

## 3. Current Guide Files

Current root guide files:

| File | Current purpose |
| --- | --- |
| `README.md` | Public repo landing page and usage guide |
| `INDEX.md` | Navigation map for every major file and folder |
| `SALESFORCE_ARCHITECTURE_GUIDE.md` | Salesforce architecture principles |
| `SALESFORCE_APEX_GUIDE.md` | Apex, triggers, SOQL, DML, async, and safety |
| `SALESFORCE_LWC_GUIDE.md` | LWC templates, state, navigation, refresh, styling, and mobile |
| `SALESFORCE_AURA_GUIDE.md` | Aura shells, templates, and Aura/LWC boundaries |
| `SALESFORCE_VISUALFORCE_GUIDE.md` | Visualforce PDF maintenance |
| `SALESFORCE_DEPLOYMENT_GUIDE.md` | Deployment process, validation, CLI, and test levels |
| `SALESFORCE_TESTING_GUIDE.md` | Apex test design and deployable coverage |
| `SALESFORCE_METADATA_GUIDE.md` | Metadata structure, FlexiPages, actions, permissions, and tabs |
| `SALESFORCE_RECORD_PAGE_GUIDE.md` | Record-page architecture and action visibility |
| `SALESFORCE_MOBILE_GUIDE.md` | Salesforce mobile and webview lessons |
| `SALESFORCE_FILE_HANDLING_GUIDE.md` | Salesforce Files, preview, upload, download, PDF, and rollups |
| `SALESFORCE_DEBUGGING_GUIDE.md` | Root-cause debugging and instrumentation |
| `SALESFORCE_COMMON_FAILURES_AND_FIXES.md` | Symptom-to-fix catalog |
| `SALESFORCE_DO_AND_DONT.md` | Practical do/don't guidance |
| `SALESFORCE_COPY_PASTE_SAFE_PATTERNS.md` | Safe snippets and skeletons |
| `SALESFORCE_PLATFORM_LIMITATIONS.md` | Platform limits and design constraints |
| `SOURCE_MAPPING.md` | Source categories analyzed and public-safety exclusions |
| `PUBLIC_REPO_REVIEW_CHECKLIST.md` | Manual checklist before GitHub publishing |
| `CONTRIBUTING.md` | Public contribution workflow |
| `CONTRIBUTING_GUIDELINES.md` | Rules for public-safe contributions |
| `SECURITY.md` | Security/privacy reporting policy |
| `CODE_OF_CONDUCT.md` | Community behavior expectations |
| `CHANGELOG.md` | Version history |
| `RELEASES.md` | Release strategy |
| `RELEASE_NOTES_v1.0.0.md` | v1.0.0 release notes |

These guide files currently mix two categories:
- Permanent repo governance and publishing files.
- Salesforce knowledge content that could live under `SALESFORCE_KNOWLEDGE/`.

## 4. What Content Appears Duplicated

Current repo duplication:

- No exact duplicate file hashes were found in the current repo.
- There is intentional topical overlap between root Salesforce guides and deeper folders:
  - `SALESFORCE_APEX_GUIDE.md` overlaps with `apex/`, `patterns/apex-service-controller-trigger.md`, `testing/apex-test-patterns.md`, and `anti_patterns/apex-anti-patterns.md`.
  - `SALESFORCE_LWC_GUIDE.md` overlaps with `lwc/`, `patterns/lwc-patterns.md`, `patterns/modal-edit-form-pattern.md`, and `anti_patterns/lwc-anti-patterns.md`.
  - `SALESFORCE_DEPLOYMENT_GUIDE.md` overlaps with `deployment/`, `checklists/before-deployment.md`, and `checklists/metadata-deploy.md`.
  - `SALESFORCE_METADATA_GUIDE.md` and `SALESFORCE_RECORD_PAGE_GUIDE.md` overlap with `metadata/`, `patterns/record-page-patterns.md`, and `troubleshooting/record-page-actions.md`.
  - `SALESFORCE_FILE_HANDLING_GUIDE.md` overlaps with `patterns/file-upload-and-rollup.md`, `mobile/`, and `troubleshooting/mobile-file-preview.md`.
  - `SALESFORCE_COMMON_FAILURES_AND_FIXES.md` overlaps by design with `troubleshooting/`.

Temporary reference folder duplication:

- The temporary folder contains 111 Markdown files.
- It has many exact duplicates where a root-level `README_*` file is repeated inside a numbered category folder.
- Confirmed exact duplicate pairs include:
  - `README_AI_AGENT_MASTER_PROMPT.md` and `00_START_HERE/README_AI_AGENT_MASTER_PROMPT.md`
  - `README_CODEX_WORKFLOW_RULES.md` and `00_START_HERE/README_CODEX_WORKFLOW_RULES.md`
  - `README_DEBUG_LOG_RULES.md` and `00_START_HERE/README_DEBUG_LOG_RULES.md`
  - `README_DOC_UPDATE_RULES.md` and `00_START_HERE/README_DOC_UPDATE_RULES.md`
  - `README_REPO_MAP.md` and `00_START_HERE/README_REPO_MAP.md`
  - `README_APEX_AND_TRIGGER_STANDARDS.md` and `01_GLOBAL_RULES/README_APEX_AND_TRIGGER_STANDARDS.md`
  - `README_DEPLOYMENT_RULES.md` and `01_GLOBAL_RULES/README_DEPLOYMENT_RULES.md`
  - `README_LWC_MOBILE_DESIGN.md` and `01_GLOBAL_RULES/README_LWC_MOBILE_DESIGN.md`
  - `README_LWC_STYLE_RULES.md` and `01_GLOBAL_RULES/README_LWC_STYLE_RULES.md`
  - `README_SALESFORCE_DARK_MODE.md` and `01_GLOBAL_RULES/README_SALESFORCE_DARK_MODE.md`
  - `README_VISUALFORCE_PDF_RULES.md` and `01_GLOBAL_RULES/README_VISUALFORCE_PDF_RULES.md`
  - `README_COMPOUND_ADDRESS_LOGIC.md` and `03_SHARED_PATTERNS/README_COMPOUND_ADDRESS_LOGIC.md`
  - `README_FILE_ANALYSIS_RUN_FRAMEWORK.md` and `03_SHARED_PATTERNS/README_FILE_ANALYSIS_RUN_FRAMEWORK.md`
  - `README_JOB_NUMBER_ASSIGNMENT.md` and `03_SHARED_PATTERNS/README_JOB_NUMBER_ASSIGNMENT.md`
  - `README_LEAD_TO_JOB.md` and `03_SHARED_PATTERNS/README_LEAD_TO_JOB.md`
  - `README_CODEX_ERRORS_DEBUGS.md` and `04_DEBUG_LOGS/README_CODEX_ERRORS_DEBUGS.md`
  - `README_CHANGE_HISTORY_INDEX.md` and `05_CHANGE_HISTORY/README_CHANGE_HISTORY_INDEX.md`
  - `README_CURRENT_PRIORITIES.md` and `06_ACTIVE_WORK/README_CURRENT_PRIORITIES.md`
  - `README_ARCHITECTURE_INDEX.md` and `07_REFERENCE/README_ARCHITECTURE_INDEX.md`

The temporary folder should be treated as source material only. Its duplicate root-level files should not be copied as-is into the final repo.

## 5. What Content Appears Misplaced

Current repo:

- The root contains too many Salesforce knowledge guides. They make the root hard to scan and belong under a knowledge root.
- `SOURCE_MAPPING.md` is useful publishing provenance, but it currently references a broad local source category. It should stay public-safe and not mention any temporary local folder path.
- Topic folders such as `apex/`, `lwc/`, `deployment/`, `patterns/`, `troubleshooting/`, and `reference/` are well named, but they are currently peers of governance files. They would be clearer under `SALESFORCE_KNOWLEDGE/`.
- `examples/` contains useful code scaffolds, but it should move with the knowledge set unless the repo later becomes an actual Salesforce DX project.

Temporary reference folder:

- Root-level duplicates are misplaced because canonical categorized copies already exist under numbered folders.
- `INSTRUCTIONS.md`, `FOR CHAT GPT.md`, and files containing hard local boundaries are not public knowledge docs. They are private execution context and should not be copied into public-facing knowledge folders.
- `04_DEBUG_LOGS/`, `05_CHANGE_HISTORY/`, and `06_ACTIVE_WORK/` include operational history and point-in-time notes. Stable lessons can be extracted, but raw logs/history should not become public canonical guidance.
- Several subsystem docs are highly org-specific and include concrete object/class/component names, emails, deploy IDs, local paths, external storage details, and production notes. These are useful for extracting patterns but are not safe to publish as-is.
- Some docs are marked historical or external-boundary notes. They should not be treated as current source of truth without verification.

## 6. What Should Remain At Root

Recommended root keepers:

- `README.md`
- `LICENSE`
- `.gitignore`
- `.gitattributes`
- `CODE_OF_CONDUCT.md`
- `CONTRIBUTING.md`
- `CONTRIBUTING_GUIDELINES.md`
- `SECURITY.md`
- `CHANGELOG.md`
- `RELEASES.md`
- `RELEASE_NOTES_v1.0.0.md`
- `PUBLIC_REPO_REVIEW_CHECKLIST.md`
- `SOURCE_MAPPING.md`
- `WORKSPACE/`

Root may also keep a short `INDEX.md`, but after restructure it should become a top-level navigation file that points into `SALESFORCE_KNOWLEDGE/`, `INSTRUCTIONS/`, `MEMORY/`, `HISTORY/`, and `WORKSPACE/`.

If the repo will become a Salesforce DX-compatible workspace, root should also eventually contain:

- `sfdx-project.json`
- `force-app/`

No production metadata exists in the current repo today; only examples exist.

## 7. What Should Move Under `SALESFORCE_KNOWLEDGE/`

Move current Salesforce knowledge folders under `SALESFORCE_KNOWLEDGE/`:

- `anti_patterns/`
- `apex/`
- `aura/`
- `checklists/`
- `deployment/`
- `docs/`
- `examples/`
- `lwc/`
- `metadata/`
- `mobile/`
- `patterns/`
- `prompts/`
- `reference/`
- `testing/`
- `troubleshooting/`
- `visualforce/`

Move current root Salesforce knowledge guides under `SALESFORCE_KNOWLEDGE/`:

- `SALESFORCE_ARCHITECTURE_GUIDE.md`
- `SALESFORCE_APEX_GUIDE.md`
- `SALESFORCE_LWC_GUIDE.md`
- `SALESFORCE_AURA_GUIDE.md`
- `SALESFORCE_VISUALFORCE_GUIDE.md`
- `SALESFORCE_DEPLOYMENT_GUIDE.md`
- `SALESFORCE_TESTING_GUIDE.md`
- `SALESFORCE_METADATA_GUIDE.md`
- `SALESFORCE_RECORD_PAGE_GUIDE.md`
- `SALESFORCE_MOBILE_GUIDE.md`
- `SALESFORCE_FILE_HANDLING_GUIDE.md`
- `SALESFORCE_DEBUGGING_GUIDE.md`
- `SALESFORCE_COMMON_FAILURES_AND_FIXES.md`
- `SALESFORCE_DO_AND_DONT.md`
- `SALESFORCE_COPY_PASTE_SAFE_PATTERNS.md`
- `SALESFORCE_PLATFORM_LIMITATIONS.md`

Possible layout:

```text
SALESFORCE_KNOWLEDGE/
  README.md
  INDEX.md
  guides/
  apex/
  lwc/
  aura/
  visualforce/
  metadata/
  mobile/
  deployment/
  testing/
  patterns/
  anti_patterns/
  troubleshooting/
  checklists/
  prompts/
  reference/
  examples/
  docs/
```

The `guides/` folder would hold the renamed or moved root `SALESFORCE_*_GUIDE.md` files.

## 8. New Instruction, Memory, History, Workspace, And Force App Placeholder Folders Needed

Needed folders:

| Folder | Purpose | Initial contents later |
| --- | --- | --- |
| `INSTRUCTIONS/` | Stable repo operating instructions for humans and AI agents | `README.md`, repo-boundary rules, documentation update rules, public-safety rules |
| `MEMORY/` | Durable project memory that should survive sessions but is not public Salesforce tutorial content | `README.md`, architecture decisions, durable assumptions, canonical decisions |
| `HISTORY/` | Historical release/change/audit records that should not compete with current guidance | `README.md`, change history index, migration logs, old audits |
| `WORKSPACE/` | Current working notes and task-local audits | This audit file and future temporary planning files |
| `force-app/` | Placeholder for future Salesforce DX source if this repo becomes more than a knowledge base | `force-app/main/default/.gitkeep` or `force-app/main/default/README.md` |

Optional placeholder folders under `force-app/main/default/` if a future phase needs Salesforce DX structure:

- `force-app/main/default/classes/`
- `force-app/main/default/lwc/`
- `force-app/main/default/aura/`
- `force-app/main/default/pages/`
- `force-app/main/default/triggers/`
- `force-app/main/default/objects/`
- `force-app/main/default/flexipages/`
- `force-app/main/default/permissionsets/`
- `force-app/main/default/tabs/`
- `force-app/main/default/customMetadata/`
- `force-app/main/default/namedCredentials/`
- `force-app/main/default/externalCredentials/`

Do not create these placeholders until the restructure phase, because this task is audit-only.

## 9. Useful Information In The Temporary Reference Folder

The temporary folder is much larger and more org-specific than the current public repo:

- 111 Markdown files.
- About 1.47 MB of Markdown.
- Numbered categories:
  - `00_START_HERE/`
  - `01_GLOBAL_RULES/`
  - `02_SYSTEMS/`
  - `03_SHARED_PATTERNS/`
  - `04_DEBUG_LOGS/`
  - `05_CHANGE_HISTORY/`
  - `06_ACTIVE_WORK/`
  - `07_REFERENCE/`

High-value reusable ideas:

- A clearer long-term documentation model:
  - start-here docs
  - global rules
  - architecture
  - objects
  - systems
  - integrations
  - runbooks
  - troubleshooting
  - active work
  - change history
  - reference
- Strong instruction concepts:
  - read existing docs before coding
  - keep documentation separate from deployable Salesforce metadata
  - make minimal targeted production-safe changes
  - update documentation after meaningful changes
  - keep debug logs and change history out of canonical current-state docs
- Strong documentation governance:
  - one canonical architecture doc per topic
  - one canonical subsystem README per business area
  - one canonical object doc per core object
  - one canonical integration doc per external system
  - mark historical docs clearly
  - do not hide permanent rules in debug logs or active-work notes
- Strong recommended structure from `RECOMMENDED_DOC_STRUCTURE.md`:
  - `00_START_HERE/`
  - `01_GLOBAL_RULES/`
  - `02_ARCHITECTURE/`
  - `03_OBJECTS/`
  - `04_SYSTEMS/`
  - `05_INTEGRATIONS/`
  - `06_RUNBOOKS/`
  - `07_TROUBLESHOOTING/`
  - `08_ACTIVE_WORK/`
  - `09_CHANGE_HISTORY/`
  - `10_REFERENCE/`
- Strong gap analysis:
  - subsystem notes are useful but not enough
  - cross-system architecture is the highest-value missing layer
  - object model documentation is important for future work
  - Apex and LWC architecture should be documented as systems, not just snippets
  - integration catalogs and test/deploy runbooks should be first-class docs
- Strong reusable Salesforce lessons:
  - trigger orchestration maps
  - Apex trigger-handler-service-controller boundaries
  - LWC composition and host/child patterns
  - mobile-safe and dark-mode-safe LWC guidance
  - Visualforce PDF preservation rules
  - file-analysis run lifecycle and supersession
  - compound address handling
  - narrow deployment and specified-test runbooks
  - troubleshooting summaries with symptom, root cause, and final fix

Useful temporary root files to mine for sanitized structure, not copy as-is:

- `RECOMMENDED_DOC_STRUCTURE.md`
- `AI_AGENT_DOCS_GAP_ANALYSIS.md`
- `PROJECT_INDEX.md`
- `ORG_ARCHITECTURE_OVERVIEW.md`
- `CUSTOM_OBJECTS_OVERVIEW.md`
- `APEX_ARCHITECTURE.md`
- `LWC_ARCHITECTURE.md`
- `INTEGRATIONS_AND_AGENTS.md`
- `DEPLOYMENT_AND_TESTING_RUNBOOK.md`
- `DOC_CREATION_SUMMARY.md`

Do not copy as-is:

- `INSTRUCTIONS.md`
- `FOR CHAT GPT.md`
- raw debug logs
- raw change history
- any file with local absolute paths, private emails, deploy IDs, org-specific names, external-agent paths, production notes, or private implementation details.

## 10. Risks Before Pushing To GitHub

Current repo risks:

- The extracted workspace is not currently a Git repository. It has no `.git/` directory.
- Links in `README.md` and `INDEX.md` currently point to root-level Salesforce guide files and root-level topic folders. These will break after moving content unless updated.
- `README.md` contains a GitHub release badge targeting a specific GitHub repository. Confirm that owner/repo is correct before publishing.
- `SOURCE_MAPPING.md` references a local source category named `AI_AGENT`. It is broad rather than an absolute path, but it should be reviewed after the restructure to ensure it still reflects the final repo accurately.
- If `WORKSPACE/` is committed, it may contain temporary planning/audit content. Decide whether `WORKSPACE/` is intended to be tracked or ignored.
- No `sfdx-project.json` or Salesforce DX project root exists. If users expect deployable Salesforce project behavior, the repo will need explicit placeholders and a clear statement that examples are not deployable as a complete org.
- The current repo appears public-safe from a quick pattern scan, but the public review checklist still needs to be run after restructure.

Temporary reference risks:

- It contains local absolute paths.
- It contains private org and production context.
- It contains real emails and deploy IDs.
- It contains external service/provider details and token/security-sensitive concepts.
- It contains raw change history and debug logs.
- It contains exact duplicate files.
- It contains docs explicitly marked historical or external-boundary-only.
- It must not be copied into the final repo without sanitization and rewriting.

Publishing risk summary:

- The biggest risk is accidentally importing private, org-specific, or local-path content from the temporary reference folder.
- The second biggest risk is breaking internal Markdown links during the restructure.
- The third biggest risk is making the root look like a deployable Salesforce DX project when it is currently a public knowledge base with examples.

## 11. Links That Need Updating After Restructure

Update links in these files after moving Salesforce knowledge under `SALESFORCE_KNOWLEDGE/`:

- `README.md`
- `INDEX.md`
- `SOURCE_MAPPING.md`
- `CONTRIBUTING.md`
- `CONTRIBUTING_GUIDELINES.md`
- any moved `SALESFORCE_*` guide that links to sibling folders
- any moved folder doc that links to root guides

Known current root links affected:

- `README.md` links to:
  - `INDEX.md`
  - `SALESFORCE_DO_AND_DONT.md`
  - `SALESFORCE_COMMON_FAILURES_AND_FIXES.md`
  - `checklists/`
  - `prompts/`
  - `SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_LWC_GUIDE.md`
  - `SALESFORCE_DEPLOYMENT_GUIDE.md`
  - `SALESFORCE_TESTING_GUIDE.md`
  - `SALESFORCE_METADATA_GUIDE.md`
  - `SALESFORCE_RECORD_PAGE_GUIDE.md`
  - `SALESFORCE_FILE_HANDLING_GUIDE.md`
  - `SALESFORCE_PLATFORM_LIMITATIONS.md`
  - `examples/`
  - `docs/public-sanitization-policy.md`
- `INDEX.md` links to nearly every root guide and topic folder.
- `CONTRIBUTING.md` links to `docs/public-sanitization-policy.md` and `CONTRIBUTING_GUIDELINES.md`.
- `SOURCE_MAPPING.md` maps source categories to root files and folders that will move.

Suggested post-restructure approach:

- Keep root `README.md` and root `INDEX.md`.
- Make root `INDEX.md` the stable redirecting navigation layer.
- Add `SALESFORCE_KNOWLEDGE/INDEX.md` for detailed Salesforce knowledge navigation.
- Use relative links from root to `SALESFORCE_KNOWLEDGE/...`.
- Use relative links inside `SALESFORCE_KNOWLEDGE/` that do not depend on root placement.

## 12. Recommended Final Repo Structure

Recommended end state:

```text
.
  README.md
  INDEX.md
  LICENSE
  CHANGELOG.md
  RELEASES.md
  RELEASE_NOTES_v1.0.0.md
  CODE_OF_CONDUCT.md
  CONTRIBUTING.md
  CONTRIBUTING_GUIDELINES.md
  SECURITY.md
  PUBLIC_REPO_REVIEW_CHECKLIST.md
  SOURCE_MAPPING.md
  .gitignore
  .gitattributes

  INSTRUCTIONS/
    README.md
    REPO_RULES.md
    DOC_UPDATE_RULES.md
    PUBLIC_SAFETY_RULES.md

  MEMORY/
    README.md
    DECISIONS.md
    ASSUMPTIONS.md

  HISTORY/
    README.md
    CHANGE_HISTORY.md
    AUDITS/

  WORKSPACE/
    REPO_AUDIT_BEFORE_RESTRUCTURE.md

  SALESFORCE_KNOWLEDGE/
    README.md
    INDEX.md
    guides/
      SALESFORCE_ARCHITECTURE_GUIDE.md
      SALESFORCE_APEX_GUIDE.md
      SALESFORCE_LWC_GUIDE.md
      SALESFORCE_AURA_GUIDE.md
      SALESFORCE_VISUALFORCE_GUIDE.md
      SALESFORCE_DEPLOYMENT_GUIDE.md
      SALESFORCE_TESTING_GUIDE.md
      SALESFORCE_METADATA_GUIDE.md
      SALESFORCE_RECORD_PAGE_GUIDE.md
      SALESFORCE_MOBILE_GUIDE.md
      SALESFORCE_FILE_HANDLING_GUIDE.md
      SALESFORCE_DEBUGGING_GUIDE.md
      SALESFORCE_COMMON_FAILURES_AND_FIXES.md
      SALESFORCE_DO_AND_DONT.md
      SALESFORCE_COPY_PASTE_SAFE_PATTERNS.md
      SALESFORCE_PLATFORM_LIMITATIONS.md
    apex/
    aura/
    lwc/
    visualforce/
    metadata/
    mobile/
    deployment/
    testing/
    patterns/
    anti_patterns/
    troubleshooting/
    checklists/
    prompts/
    reference/
    examples/
    docs/

  force-app/
    main/
      default/
        README.md
```

Optional future Salesforce DX files if the repo should become deployable:

```text
sfdx-project.json
config/
  project-scratch-def.json
force-app/
  main/
    default/
      classes/
      lwc/
      aura/
      pages/
      triggers/
      objects/
      flexipages/
      permissionsets/
      tabs/
      customMetadata/
      namedCredentials/
      externalCredentials/
```

Recommended restructure order for a future task:

1. Create new top-level folders.
2. Move Salesforce knowledge folders and root Salesforce guides under `SALESFORCE_KNOWLEDGE/`.
3. Add or rewrite `SALESFORCE_KNOWLEDGE/README.md` and `SALESFORCE_KNOWLEDGE/INDEX.md`.
4. Convert root `INDEX.md` into the short top-level navigation file.
5. Update all links.
6. Add placeholder instruction, memory, history, workspace, and force-app docs.
7. Run the public repo review checklist.
8. Search again for local paths, private identifiers, emails, deploy IDs, sensitive URLs, and secret-related terms.
