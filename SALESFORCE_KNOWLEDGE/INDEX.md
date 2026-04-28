# Salesforce Knowledge Index

This is the master map for the Salesforce knowledge base.

Use it before Codex edits Apex, LWC, Aura, Visualforce, metadata, tests, deployment files, Salesforce Files, mobile behavior, or Salesforce-specific documentation.

## Purpose

`SALESFORCE_KNOWLEDGE/` gives Codex public-safe Salesforce guidance before it changes real project metadata.

| Area | Purpose |
| --- | --- |
| `GUIDES/` | Broad platform guidance by Salesforce area. |
| `TOPICS/` | Focused notes and troubleshooting by task type. |
| `PATTERNS/` | Good patterns and anti-patterns. |
| `PROMPTS/` | Copy-ready Codex prompts. |
| `CHECKLISTS/` | Preflight and review checklists. |
| `EXAMPLES/` | Public-safe Apex, LWC, and metadata examples. |
| `REFERENCE/` | Glossary, CLI commands, discovery templates, and lesson catalog. |
| `DOCS/` | Documentation governance, engineering principles, and public-safety policy. |

## Reading Order

| Order | Read | Why |
| ---: | --- | --- |
| 1 | [../START_HERE.md](../START_HERE.md) | Confirms repo purpose and startup flow. |
| 2 | [../INSTRUCTIONS/](../INSTRUCTIONS/) | Defines mandatory Codex rules. |
| 3 | [../FORCE_APP_DIRECTORY/](../FORCE_APP_DIRECTORY/) | Locates or documents the real Salesforce DX project. |
| 4 | This index | Selects the right Salesforce knowledge. |
| 5 | Task-specific guides, topics, patterns, prompts, and checklists | Prevents avoidable platform mistakes. |
| 6 | [../TOOLS/](../TOOLS/) and [../QUALITY_GATES/](../QUALITY_GATES/) | Selects optional tooling and validation gates after code changes. |
| 7 | [../MEMORY/](../MEMORY/) and [../HISTORY/](../HISTORY/) | Reuses lessons and checks recent work. |

## Task-Specific Read Map

| Task type | Codex should read |
| --- | --- |
| Apex class or trigger | [GUIDES/SALESFORCE_APEX_GUIDE.md](GUIDES/SALESFORCE_APEX_GUIDE.md), [GUIDES/SALESFORCE_TESTING_GUIDE.md](GUIDES/SALESFORCE_TESTING_GUIDE.md), [GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md](GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md), [TOPICS/apex/](TOPICS/apex/), [REFERENCE/EXTERNAL_PATTERN_USAGE_RULES.md](REFERENCE/EXTERNAL_PATTERN_USAGE_RULES.md), [REFERENCE/EXTERNAL_APEX_RECIPES_MAP.md](REFERENCE/EXTERNAL_APEX_RECIPES_MAP.md) when a public pattern reference is useful, [../TOOLS/SALESFORCE_CODE_ANALYZER.md](../TOOLS/SALESFORCE_CODE_ANALYZER.md), [../TOOLS/PRETTIER_APEX.md](../TOOLS/PRETTIER_APEX.md), [../QUALITY_GATES/CODE_ANALYZER_RULES.md](../QUALITY_GATES/CODE_ANALYZER_RULES.md), [../QUALITY_GATES/APEX_FORMATTING.md](../QUALITY_GATES/APEX_FORMATTING.md) |
| LWC | [GUIDES/SALESFORCE_LWC_GUIDE.md](GUIDES/SALESFORCE_LWC_GUIDE.md), [GUIDES/SALESFORCE_RECORD_PAGE_GUIDE.md](GUIDES/SALESFORCE_RECORD_PAGE_GUIDE.md), [GUIDES/SALESFORCE_MOBILE_GUIDE.md](GUIDES/SALESFORCE_MOBILE_GUIDE.md), [TOPICS/lwc/](TOPICS/lwc/), [../TOOLS/LWC_JEST.md](../TOOLS/LWC_JEST.md), [../TOOLS/ESLINT_LWC.md](../TOOLS/ESLINT_LWC.md), [../QUALITY_GATES/LWC_LINT_RULES.md](../QUALITY_GATES/LWC_LINT_RULES.md), [../QUALITY_GATES/TESTING_GATE.md](../QUALITY_GATES/TESTING_GATE.md), [REFERENCE/EXTERNAL_PATTERN_USAGE_RULES.md](REFERENCE/EXTERNAL_PATTERN_USAGE_RULES.md), [REFERENCE/EXTERNAL_LWC_RECIPES_MAP.md](REFERENCE/EXTERNAL_LWC_RECIPES_MAP.md) when a public pattern reference is useful |
| Aura | [GUIDES/SALESFORCE_AURA_GUIDE.md](GUIDES/SALESFORCE_AURA_GUIDE.md), [TOPICS/aura/](TOPICS/aura/) |
| Visualforce | [GUIDES/SALESFORCE_VISUALFORCE_GUIDE.md](GUIDES/SALESFORCE_VISUALFORCE_GUIDE.md), [TOPICS/visualforce/](TOPICS/visualforce/) |
| Metadata | [GUIDES/SALESFORCE_METADATA_GUIDE.md](GUIDES/SALESFORCE_METADATA_GUIDE.md), [GUIDES/SALESFORCE_RECORD_PAGE_GUIDE.md](GUIDES/SALESFORCE_RECORD_PAGE_GUIDE.md), [GUIDES/SALESFORCE_PLATFORM_LIMITATIONS.md](GUIDES/SALESFORCE_PLATFORM_LIMITATIONS.md), [TOPICS/metadata/](TOPICS/metadata/), [CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EDITING_METADATA.md](CHECKLISTS/CODEX_ENGINE_CHECKLISTS/BEFORE_EDITING_METADATA.md), [../QUALITY_GATES/RELEASE_GATE.md](../QUALITY_GATES/RELEASE_GATE.md) |
| Deployment | [GUIDES/SALESFORCE_DEPLOYMENT_GUIDE.md](GUIDES/SALESFORCE_DEPLOYMENT_GUIDE.md), [GUIDES/SALESFORCE_TESTING_GUIDE.md](GUIDES/SALESFORCE_TESTING_GUIDE.md), [TOPICS/deployment/](TOPICS/deployment/), [../QUALITY_GATES/RELEASE_GATE.md](../QUALITY_GATES/RELEASE_GATE.md), [../QUALITY_GATES/CODE_ANALYZER_RULES.md](../QUALITY_GATES/CODE_ANALYZER_RULES.md) |
| Testing | [GUIDES/SALESFORCE_TESTING_GUIDE.md](GUIDES/SALESFORCE_TESTING_GUIDE.md), [TOPICS/testing/](TOPICS/testing/), [../QUALITY_GATES/TESTING_GATE.md](../QUALITY_GATES/TESTING_GATE.md) |
| Salesforce Files | [GUIDES/SALESFORCE_FILE_HANDLING_GUIDE.md](GUIDES/SALESFORCE_FILE_HANDLING_GUIDE.md) |
| Mobile | [GUIDES/SALESFORCE_MOBILE_GUIDE.md](GUIDES/SALESFORCE_MOBILE_GUIDE.md), [GUIDES/SALESFORCE_LWC_GUIDE.md](GUIDES/SALESFORCE_LWC_GUIDE.md), [TOPICS/mobile/](TOPICS/mobile/), [../TOOLS/LWC_MOBILE_LINT.md](../TOOLS/LWC_MOBILE_LINT.md), [../TOOLS/LWC_JEST.md](../TOOLS/LWC_JEST.md), [../QUALITY_GATES/LWC_LINT_RULES.md](../QUALITY_GATES/LWC_LINT_RULES.md), [../QUALITY_GATES/TESTING_GATE.md](../QUALITY_GATES/TESTING_GATE.md) |
| Debugging | [GUIDES/SALESFORCE_DEBUGGING_GUIDE.md](GUIDES/SALESFORCE_DEBUGGING_GUIDE.md), [GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md](GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md), [TOPICS/troubleshooting/](TOPICS/troubleshooting/) |
| Project discovery | [REFERENCE/project-discovery-template.md](REFERENCE/project-discovery-template.md), [CHECKLISTS/project-discovery.md](CHECKLISTS/project-discovery.md), [DOCS/documentation-governance.md](DOCS/documentation-governance.md) |
| Documentation | [DOCS/documentation-governance.md](DOCS/documentation-governance.md), [DOCS/public-sanitization-policy.md](DOCS/public-sanitization-policy.md) |

## Guide Map

| Guide | Use for |
| --- | --- |
| [SALESFORCE_ARCHITECTURE_GUIDE.md](GUIDES/SALESFORCE_ARCHITECTURE_GUIDE.md) | Architecture boundaries and Salesforce design tradeoffs. |
| [SALESFORCE_APEX_GUIDE.md](GUIDES/SALESFORCE_APEX_GUIDE.md) | Apex, triggers, services, async, SOQL, DML, and safe controller patterns. |
| [SALESFORCE_LWC_GUIDE.md](GUIDES/SALESFORCE_LWC_GUIDE.md) | LWC templates, state, refresh, navigation, styling, and mobile behavior. |
| [SALESFORCE_AURA_GUIDE.md](GUIDES/SALESFORCE_AURA_GUIDE.md) | Aura shells, template regions, and Aura/LWC boundaries. |
| [SALESFORCE_VISUALFORCE_GUIDE.md](GUIDES/SALESFORCE_VISUALFORCE_GUIDE.md) | Visualforce pages, controllers, and PDF maintenance. |
| [SALESFORCE_METADATA_GUIDE.md](GUIDES/SALESFORCE_METADATA_GUIDE.md) | Salesforce DX metadata paths, objects, fields, layouts, FlexiPages, actions, permissions, profiles, tabs, apps, reports, dashboards, static resources, and manifest safety. |
| [SALESFORCE_RECORD_PAGE_GUIDE.md](GUIDES/SALESFORCE_RECORD_PAGE_GUIDE.md) | Record pages, activation chain, Dynamic Forms, Dynamic Actions, layouts, compact layouts, quick actions, permissions, and mobile/desktop visibility. |
| [SALESFORCE_DEPLOYMENT_GUIDE.md](GUIDES/SALESFORCE_DEPLOYMENT_GUIDE.md) | Validation, deploy strategy, CLI usage, and test levels. |
| [SALESFORCE_TESTING_GUIDE.md](GUIDES/SALESFORCE_TESTING_GUIDE.md) | Apex test design and deployable coverage. |
| [SALESFORCE_FILE_HANDLING_GUIDE.md](GUIDES/SALESFORCE_FILE_HANDLING_GUIDE.md) | Salesforce Files, uploads, previews, PDFs, and rollups. |
| [SALESFORCE_MOBILE_GUIDE.md](GUIDES/SALESFORCE_MOBILE_GUIDE.md) | Salesforce mobile and webview behavior. |
| [SALESFORCE_DEBUGGING_GUIDE.md](GUIDES/SALESFORCE_DEBUGGING_GUIDE.md) | Root-cause debugging and instrumentation. |
| [SALESFORCE_COMMON_FAILURES_AND_FIXES.md](GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md) | Repeated Salesforce failure patterns. |
| [SALESFORCE_COPY_PASTE_SAFE_PATTERNS.md](GUIDES/SALESFORCE_COPY_PASTE_SAFE_PATTERNS.md) | Safe snippets and skeletons to adapt after verifying real names. |
| [SALESFORCE_DO_AND_DONT.md](GUIDES/SALESFORCE_DO_AND_DONT.md) | Practical Salesforce do/don't rules. |
| [SALESFORCE_PLATFORM_LIMITATIONS.md](GUIDES/SALESFORCE_PLATFORM_LIMITATIONS.md) | Salesforce platform limits and constraints. |

## Topic Folder Map

| Topic folder | Contains |
| --- | --- |
| [TOPICS/apex/](TOPICS/apex/) | Dynamic SOQL safety, async/DML patterns, and Apex notes. |
| [TOPICS/aura/](TOPICS/aura/) | Aura template and region contracts. |
| [TOPICS/deployment/](TOPICS/deployment/) | Narrow deployment and test-selection strategy. |
| [TOPICS/lwc/](TOPICS/lwc/) | Template rules, navigation/toast/refresh, and mobile overlays. |
| [TOPICS/metadata/](TOPICS/metadata/) | Metadata paths, high-risk metadata, FlexiPage/action activation, package manifests, and record-page root causes. |
| [TOPICS/mobile/](TOPICS/mobile/) | Salesforce mobile webview lessons. |
| [TOPICS/testing/](TOPICS/testing/) | Apex test patterns. |
| [TOPICS/troubleshooting/](TOPICS/troubleshooting/) | Deployment, LWC, Files, and record-page troubleshooting. |
| [TOPICS/visualforce/](TOPICS/visualforce/) | Visualforce PDF maintenance. |

## Patterns, Prompts, And Checklists

| Area | Path | Use |
| --- | --- | --- |
| Good patterns | [PATTERNS/good_patterns/](PATTERNS/good_patterns/) | Reusable implementation approaches. |
| Anti-patterns | [PATTERNS/anti_patterns/](PATTERNS/anti_patterns/) | Known patterns to avoid. |
| Copy-paste safe patterns | [GUIDES/SALESFORCE_COPY_PASTE_SAFE_PATTERNS.md](GUIDES/SALESFORCE_COPY_PASTE_SAFE_PATTERNS.md) | Snippets that must be adapted only after verifying real project names. |
| Prompt library | [PROMPTS/](PROMPTS/) | Reusable Codex prompts. |
| Codex prompt pack | [PROMPTS/CODEX_PROMPT_PACK/](PROMPTS/CODEX_PROMPT_PACK/) | Complete copy-ready prompts by task type. |
| Checklists | [CHECKLISTS/](CHECKLISTS/) | Preflight and review gates. |
| Codex engine checklists | [CHECKLISTS/CODEX_ENGINE_CHECKLISTS/](CHECKLISTS/CODEX_ENGINE_CHECKLISTS/) | Strict task, edit, deployment, GitHub push, and public-safety gates. |

## Prompt Pack Shortcuts

| Need | Prompt |
| --- | --- |
| Start a new Salesforce task | [PROMPTS/CODEX_PROMPT_PACK/01_START_NEW_SALESFORCE_TASK.md](PROMPTS/CODEX_PROMPT_PACK/01_START_NEW_SALESFORCE_TASK.md) |
| Fix LWC | [PROMPTS/CODEX_PROMPT_PACK/02_FIX_LWC.md](PROMPTS/CODEX_PROMPT_PACK/02_FIX_LWC.md) |
| Fix Apex | [PROMPTS/CODEX_PROMPT_PACK/03_FIX_APEX.md](PROMPTS/CODEX_PROMPT_PACK/03_FIX_APEX.md) |
| Fix Apex tests | [PROMPTS/CODEX_PROMPT_PACK/04_FIX_APEX_TESTS.md](PROMPTS/CODEX_PROMPT_PACK/04_FIX_APEX_TESTS.md) |
| Fix deployment failure | [PROMPTS/CODEX_PROMPT_PACK/05_FIX_DEPLOYMENT_FAILURE.md](PROMPTS/CODEX_PROMPT_PACK/05_FIX_DEPLOYMENT_FAILURE.md) |
| Fix metadata or record page | [PROMPTS/CODEX_PROMPT_PACK/06_FIX_METADATA_OR_RECORD_PAGE.md](PROMPTS/CODEX_PROMPT_PACK/06_FIX_METADATA_OR_RECORD_PAGE.md) |
| Fix Salesforce Files | [PROMPTS/CODEX_PROMPT_PACK/07_FIX_SALESFORCE_FILES.md](PROMPTS/CODEX_PROMPT_PACK/07_FIX_SALESFORCE_FILES.md) |
| Fix mobile Salesforce | [PROMPTS/CODEX_PROMPT_PACK/08_FIX_MOBILE_SALESFORCE.md](PROMPTS/CODEX_PROMPT_PACK/08_FIX_MOBILE_SALESFORCE.md) |
| Review before GitHub push | [PROMPTS/CODEX_PROMPT_PACK/09_REVIEW_BEFORE_GITHUB_PUSH.md](PROMPTS/CODEX_PROMPT_PACK/09_REVIEW_BEFORE_GITHUB_PUSH.md) |

## Examples, Reference, And Docs

| Area | Path | Use |
| --- | --- | --- |
| Apex examples | [EXAMPLES/apex/](EXAMPLES/apex/) | Public-safe Apex scaffolds. |
| LWC examples | [EXAMPLES/lwc/](EXAMPLES/lwc/) | Public-safe LWC bundles. |
| Metadata examples | [EXAMPLES/metadata/](EXAMPLES/metadata/) | Public-safe metadata notes. |
| Glossary | [REFERENCE/glossary.md](REFERENCE/glossary.md) | Salesforce vocabulary. |
| CLI reference | [REFERENCE/salesforce-cli-command-reference.md](REFERENCE/salesforce-cli-command-reference.md) | Validation, deployment, tests, and inspection commands. |
| Project discovery | [REFERENCE/project-discovery-template.md](REFERENCE/project-discovery-template.md) | Public-safe project mapping template. |
| External pattern rules | [REFERENCE/EXTERNAL_PATTERN_USAGE_RULES.md](REFERENCE/EXTERNAL_PATTERN_USAGE_RULES.md) | Rules for using public external repos as references without copying blindly. |
| Apex Recipes map | [REFERENCE/EXTERNAL_APEX_RECIPES_MAP.md](REFERENCE/EXTERNAL_APEX_RECIPES_MAP.md) | Repo-relative map to public Apex Recipes patterns. |
| LWC Recipes map | [REFERENCE/EXTERNAL_LWC_RECIPES_MAP.md](REFERENCE/EXTERNAL_LWC_RECIPES_MAP.md) | Repo-relative map to public LWC Recipes patterns. |
| Documentation governance | [DOCS/documentation-governance.md](DOCS/documentation-governance.md) | Documentation precedence and update placement. |
| Public sanitization | [DOCS/public-sanitization-policy.md](DOCS/public-sanitization-policy.md) | What must be removed or generalized before publication. |

## Tooling And Quality Gates

| Area | Path | Use |
| --- | --- | --- |
| Tooling guides | [../TOOLS/](../TOOLS/) | Optional Salesforce Code Analyzer, LWC Jest, LWC ESLint, mobile lint, and Apex formatting guidance. |
| Salesforce Code Analyzer | [../TOOLS/SALESFORCE_CODE_ANALYZER.md](../TOOLS/SALESFORCE_CODE_ANALYZER.md) | Static analysis setup, run commands, pass/warn/error/skipped interpretation, and History logging expectations. |
| LWC Jest | [../TOOLS/LWC_JEST.md](../TOOLS/LWC_JEST.md) | Local LWC unit test guidance and pass/fail/skipped interpretation. |
| LWC ESLint | [../TOOLS/ESLINT_LWC.md](../TOOLS/ESLINT_LWC.md) | LWC lint setup, rules, template getter guidance, and missing-tool behavior. |
| LWC mobile lint | [../TOOLS/LWC_MOBILE_LINT.md](../TOOLS/LWC_MOBILE_LINT.md) | Salesforce mobile/offline lint and graph analyzer guidance. |
| Prettier Apex | [../TOOLS/PRETTIER_APEX.md](../TOOLS/PRETTIER_APEX.md) | Optional Apex formatting guidance and missing-tool behavior. |
| Quality gates | [../QUALITY_GATES/](../QUALITY_GATES/) | Validation rules to run after code changes when available. |
| Code Analyzer gate | [../QUALITY_GATES/CODE_ANALYZER_RULES.md](../QUALITY_GATES/CODE_ANALYZER_RULES.md) | When to run Salesforce Code Analyzer and how Codex should interpret findings. |
| Apex formatting gate | [../QUALITY_GATES/APEX_FORMATTING.md](../QUALITY_GATES/APEX_FORMATTING.md) | Optional formatting evidence for Apex changes. |
| LWC lint gate | [../QUALITY_GATES/LWC_LINT_RULES.md](../QUALITY_GATES/LWC_LINT_RULES.md) | Strict LWC lint gate for Codex after LWC changes. |
| Testing gate | [../QUALITY_GATES/TESTING_GATE.md](../QUALITY_GATES/TESTING_GATE.md) | LWC Jest, Apex test, lint, and Code Analyzer validation map. |
| Release gate | [../QUALITY_GATES/RELEASE_GATE.md](../QUALITY_GATES/RELEASE_GATE.md) | Metadata release checks, manifest safety, activation/assignment review, and public GitHub release checks. |
| LWC quality examples | [../QUALITY_GATES/examples/](../QUALITY_GATES/examples/) | Optional, inactive example configs and package scripts. |
| Local automation | [../AUTOMATION/](../AUTOMATION/) | Public-safe helper scripts for local quality checks and Salesforce DX project validation. |
| External references | [../VENDOR_REFERENCES/](../VENDOR_REFERENCES/) | Attribution, license notes, and no-vendoring guidance for external repos. |

## Quick Codex Checklist

Before editing real project metadata, confirm:

- [ ] The real `force-app/main/default` folder is located.
- [ ] Relevant task-specific guides and topics were read.
- [ ] Existing real project files were inspected.
- [ ] Object, field, metadata, permission, profile, record type, component, and Apex names were verified.
- [ ] The smallest safe change is clear.
- [ ] Available quality gates were checked and validation is planned or a limitation is stated.
- [ ] Memory and History updates are planned for meaningful work.
