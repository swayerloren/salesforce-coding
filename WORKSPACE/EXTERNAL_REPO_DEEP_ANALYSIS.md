# External Repo Deep Analysis

## Executive Summary

The external repositories are valuable as reference material, quality-gate inspiration, and optional tooling recommendations. They should not be vendored into this repo.

The strongest immediate integrations are:

- a `TOOLS/` map that explains optional Salesforce analysis, linting, formatting, testing, and CI tools;
- a `QUALITY_GATES/` folder with public-safe command recipes for Salesforce Code Analyzer, LWC ESLint, LWC Jest, Apex formatting checks, and mobile/offline linting;
- an attribution file that records upstream projects, URLs, licenses, and permitted usage boundaries;
- prompt/checklist improvements that tell Codex when to suggest or run each tool in a real Salesforce DX project.

The cloned repos fall into three categories:

| Category | Repos | Best use |
| --- | --- | --- |
| Official or Salesforce-authored tools | `code-analyzer`, `sfdx-lwc-jest`, `eslint-plugin-lwc`, `eslint-config-lwc`, `eslint-plugin-lwc-mobile`, `eslint-plugin-lwc-graph-analyzer`, `salesforcedx-vscode` | Reference maps, optional dev dependencies, quality gates, and docs links. |
| Salesforce sample apps | `lwc-recipes`, `apex-recipes` | Pattern catalogs and learning references; do not copy whole examples into this repo. |
| Community tooling/action | `prettier-plugin-apex`, `sfdx-scan-pull-request` | Optional formatter/action recommendations with attribution and risk notes. |

Do not copy source code, workflows, large configs, or sample app files directly. Integrate the ideas as public-safe documentation, optional commands, and minimal config templates that users can apply to their own real Salesforce DX projects.

## Repo-by-Repo Analysis

### forcedotcom/code-analyzer

| Field | Analysis |
| --- | --- |
| Purpose | Salesforce Code Analyzer plugin/tooling for static analysis across engines such as ESLint, PMD, Flow, Regex, RetireJS, and graph/security engines. |
| Best use in this project | Quality gate reference and optional validation command set for real Salesforce DX projects. |
| What to extract | A `QUALITY_GATES/code-analyzer.md` guide; examples of when to use static analysis; guidance for target paths, severity thresholds, and interpreting results; a prompt rule telling Codex not to claim safety until analyzer results are reported or explicitly unavailable. |
| What not to copy | Do not copy source, engine internals, messages, test suites, workflows, or package code. |
| License notes | BSD-3-Clause. Attribution required if material is derived. Preserve upstream URL and license identity. |
| Integration risk | Medium. Code Analyzer behavior/versioning changes over time, and generated findings can be noisy without tuned config. |
| Recommended integration type | `quality gate`, `reference map`, optional `GitHub Action` guidance. |

High-signal later inspection targets:

- `README.md`
- `package.json`
- `src/`
- `messages/`
- `pmd-appexchange/`
- `.github/workflows/validate-pr.yml`
- `.github/workflows/run-tests.yml`

### trailheadapps/lwc-recipes

| Field | Analysis |
| --- | --- |
| Purpose | Salesforce sample application with many focused Lightning Web Component examples. |
| Best use in this project | Reference catalog for LWC guidance, LWC examples, Jest testing patterns, UI API, GraphQL, LDS, navigation, forms, events, static resources, workspace API, and accessibility checks. |
| What to extract | A reference map from common LWC task types to upstream recipe names; ideas for docs covering UI API wire adapters, `lightning-record-edit-form`, GraphQL, workspace API, LMS, static resources, and Jest tests. |
| What not to copy | Do not copy complete recipe components, metadata, scratch org config, package files, data files, or workflows into this repo. |
| License notes | CC0-1.0. Even though permissive, keep attribution for clarity and provenance. |
| Integration risk | Low for reference usage, medium if copying examples because recipes assume the sample app's metadata/data model. |
| Recommended integration type | `reference map`, optional `optional vendor reference`; not a direct dependency. |

High-signal later inspection targets:

- `force-app/main/default/lwc/`
- `force-app/main/default/classes/`
- `force-app/main/default/flexipages/`
- `force-app/main/default/quickActions/`
- `jest.config.js`
- `eslint.config.js`
- `code-analyzer.yml`
- `.github/workflows/ci.yml`

Important recipe areas found:

- Apex imperative and wired calls.
- UI API forms and record adapters.
- `recordEditFormDynamicContact`, `recordEditFormStaticContact`, `recordViewFormDynamicContact`, `recordFormStaticContact`.
- `wireGetRecord`, `wireGetObjectInfo`, `wireGetPicklistValues`, `wireGetRecords`.
- GraphQL create/update/delete/query/refresh examples.
- Navigation examples for records, objects, related lists, files, tabs, home, list views, new records, and Flow.
- Workspace API examples.
- Jest tests; 131 LWC test files were present in the clone.

### trailheadapps/apex-recipes

| Field | Analysis |
| --- | --- |
| Purpose | Salesforce sample application with focused Apex patterns and tests. |
| Best use in this project | Reference catalog for Apex topic depth, especially security, async, callouts, named credentials, custom metadata, platform events, invocable methods, trigger handling, testing, and data access. |
| What to extract | A reference map from Apex task types to recipe categories; improved docs for `Security.stripInaccessible`, CRUD/FLS, sharing, `CanTheUser`-style permission helpers, trigger handlers, async recipes, named credential callouts, platform events, and test doubles. |
| What not to copy | Do not copy recipe classes, triggers, metadata, data files, scratch definitions, workflows, or docs wholesale. |
| License notes | CC0-1.0. Still keep attribution and avoid implying this repo owns upstream examples. |
| Integration risk | Low for reference, medium for copied patterns because recipes use sample-specific objects, labels, permissions, and app structure. |
| Recommended integration type | `reference map`, `quality gate` inspiration, optional `optional vendor reference`. |

High-signal later inspection targets:

- `force-app/main/default/classes/`
- `force-app/main/default/triggers/`
- `force-app/main/default/flows/`
- `force-app/main/default/namedCredentials/`
- `force-app/main/default/customMetadata/`
- `force-app/main/default/permissionsets/`
- `ruleset.xml`
- `config/project-scratch-def.json`
- `bin/install-scratch.*`

Important recipe categories found:

- Async Apex recipes: future, batch, queueable, queueable chaining, queueable callouts, scheduled Apex.
- Data recipes: DML, SOQL, SOSL, dynamic SOQL, metadata catalog.
- Security recipes: permission helper patterns, safe DML/query helpers, inaccessible-field stripping.
- Integration recipes: REST, callouts, named credentials, Aura-enabled Apex.
- Trigger recipes: metadata-driven trigger handlers and trigger framework examples.
- Testing recipes: test doubles, stubs, helpers.
- Files, email, encryption, platform cache, platform events, invocable, custom metadata, and LDV examples.

### salesforce/sfdx-lwc-jest

| Field | Analysis |
| --- | --- |
| Purpose | Official Jest testing tooling for Lightning Web Components in Salesforce DX workspaces. |
| Best use in this project | Quality gate guidance for LWC unit tests and optional dev dependency for real projects. |
| What to extract | `QUALITY_GATES/lwc-jest.md`; prompt/checklist guidance for finding `package.json` scripts, running `test:unit`, using watch/debug/coverage, wire adapter testing, and mocking external namespace components. |
| What not to copy | Do not copy stubs, resolver, transformer, package source, or generated Jest internals. |
| License notes | MIT. Preserve attribution if config guidance is derived from upstream docs. |
| Integration risk | Low as optional dev dependency; medium if prescribing one setup across all projects because existing projects may already customize Jest. |
| Recommended integration type | `quality gate`, optional `dev dependency`, `script/config` guidance. |

High-signal later inspection targets:

- `README.md`
- `package.json`
- `config.js`
- `src/lightning-stubs/`
- `.github/workflows/unit.yml`

Useful concepts:

- `test:unit`, `test:unit:watch`, `test:unit:debug`, and coverage scripts.
- Custom `jest.config.js` overrides based on the default config.
- `moduleNameMapper` for external namespace component mocks.
- Wire adapter testing guidance through Salesforce Jest utilities.

### dangmai/prettier-plugin-apex

| Field | Analysis |
| --- | --- |
| Purpose | Apex formatter built as a Prettier plugin and parser/serializer ecosystem. |
| Best use in this project | Optional formatting quality gate for real Salesforce DX projects, not a mandatory repo-wide default. |
| What to extract | `QUALITY_GATES/apex-formatting.md`; rules for when Codex should avoid mass formatting; `--check` and `--debug-check` guidance; caution about separate formatting commits. |
| What not to copy | Do not copy parser, serializer, package sources, native executable handling, workflows, or large config files. |
| License notes | MIT, copyright Dang Mai. Keep attribution and upstream URL. |
| Integration risk | Medium. Formatting can create large diffs and parser/runtime setup may vary by OS and project. |
| Recommended integration type | optional `dev dependency`, `quality gate`, `script/config` guidance. |

High-signal later inspection targets:

- `packages/prettier-plugin-apex/README.md`
- `package.json`
- `CHANGELOG.md`
- `.prettierrc`
- `.github/workflows/tests-deployments.yml`

Useful concepts:

- Install as local dev dependency with Prettier.
- Use `--check` for CI and `--debug-check` before first broad formatting.
- Avoid formatting anonymous Apex unless explicitly scoped.
- Treat formatting as separate from functional fixes.

### salesforce/eslint-plugin-lwc

| Field | Analysis |
| --- | --- |
| Purpose | ESLint plugin for Lightning Web Components with LWC-specific rules and processors. |
| Best use in this project | LWC quality gate docs and checklist mappings from rule families to Codex review concerns. |
| What to extract | A rule map for common Codex mistakes: API reassignment, async operations, DOM querying, inner HTML, leaky event listeners, invalid wire usage, unknown wire adapters, template child manipulation, and invalid `@api`/`@wire` patterns. |
| What not to copy | Do not copy rule implementations, test fixtures, or docs verbatim. |
| License notes | MIT. Preserve attribution when referencing rule names. |
| Integration risk | Low as optional dev dependency; medium if existing project ESLint version/config differs. |
| Recommended integration type | `quality gate`, optional `dev dependency`, `reference map`. |

High-signal later inspection targets:

- `README.md`
- `docs/rules/`
- `docs/rules/ssr/`
- `lib/`
- `eslint.config.js`

Useful rule-doc areas found:

- `no-api-reassignments`
- `no-async-operation`
- `no-document-query`
- `no-inner-html`
- `no-leaky-event-listeners`
- `no-template-children`
- `no-unexpected-wire-adapter-usages`
- `no-unknown-wire-adapters`
- `valid-api`
- `valid-wire`
- SSR-specific browser/global/import restrictions.

### salesforce/eslint-config-lwc

| Field | Analysis |
| --- | --- |
| Purpose | Shareable ESLint configurations for LWC projects. |
| Best use in this project | Optional lint config reference for real Salesforce DX projects. |
| What to extract | Guidance for choosing base, recommended, extended, i18n, SSR, and TypeScript configs; minimal example config templates that users can adapt. |
| What not to copy | Do not copy config files wholesale into this repo as authoritative defaults. |
| License notes | MIT. Preserve attribution if config shapes are derived. |
| Integration risk | Low to medium. Existing projects may already have ESLint 8/9 differences, TypeScript constraints, or custom globals. |
| Recommended integration type | `script/config`, `quality gate`, optional `dev dependency`. |

High-signal later inspection targets:

- `README.md`
- `base.js`
- `recommended.js`
- `extended.js`
- `i18n.js`
- `ssr.js`
- `lib/defaults.js`
- `lib/typescript.js`

### salesforce/eslint-plugin-lwc-mobile

| Field | Analysis |
| --- | --- |
| Purpose | ESLint plugin for Salesforce mobile/offline LWC constraints, especially GraphQL/mobile limitations. |
| Best use in this project | Mobile quality gate and mobile checklist depth. |
| What to extract | Mobile rule map for unsupported GraphQL features, Apex imports, mutation restrictions, aggregate query limits, child/root entity limits, field-count limits, semi/anti join limits, and unsupported scopes. |
| What not to copy | Do not copy TypeScript rule code, tests, or config files. |
| License notes | MIT. Preserve attribution and upstream URL. |
| Integration risk | Medium. Applies most directly to Salesforce mobile/offline use cases, not every LWC project. |
| Recommended integration type | `quality gate`, optional `dev dependency`, `reference map`. |

High-signal later inspection targets:

- `README.md`
- `src/docs/`
- `src/rules/`
- `src/configs/`
- `eslint.config.mjs`

Useful rule-doc areas found:

- `apex-import`
- `no-aggregate-query-supported`
- `no-fiscal-date-filtering-supported`
- `no-more-than-100-fields`
- `no-more-than-1-parent-record`
- `no-more-than-3-child-entities`
- `no-more-than-3-root-entities`
- `no-mutation-supported`
- `no-semi-anti-join-supported`
- `unsupported-scope`

### salesforce/eslint-plugin-lwc-graph-analyzer

| Field | Analysis |
| --- | --- |
| Purpose | Static analysis plugin for LWC composition/resource graph constraints. |
| Best use in this project | Advanced LWC quality gate and future Codex checklist rules for composition, wire dependency, inaccessible getters, namespace boundaries, and unsupported globals. |
| What to extract | A reference table of high-risk composition/wire/static-analysis findings; guidance for using it as an advanced optional lint step. |
| What not to copy | Do not copy analyzer code, rule implementations, processor code, or test fixtures. |
| License notes | MIT. Preserve attribution. |
| Integration risk | Medium to high. Advanced analyzer may be more specialized and less broadly adopted than core LWC ESLint. |
| Recommended integration type | `quality gate` for advanced projects, `reference map`, P2 optional dependency. |

High-signal later inspection targets:

- `README.md`
- `lib/docs/`
- `lib/configs/`
- `lib/lwc-bundle.js`
- `lib/processor.js`
- `test/`

Useful rule-doc areas found:

- getter and render-function constraints,
- unsupported namespace references,
- missing/inaccessible composition properties,
- eval usage,
- wire config circular dependencies,
- wire config values from non-primeable wires,
- multiple template files,
- unresolved parent class references.

### forcedotcom/salesforcedx-vscode

| Field | Analysis |
| --- | --- |
| Purpose | Salesforce VS Code extensions monorepo, including Apex, LWC, Aura, Visualforce, SOQL, metadata, org browser, testing, and language-server packages. |
| Best use in this project | Reference only for VS Code/Salesforce DX developer workflow concepts, language-server surfaces, metadata commands, test workflows, and docs structure. |
| What to extract | High-level project setup guidance, VS Code recommended extensions, language server awareness, Apex test/debug workflow concepts, metadata/org browser cautions, and QA/testing doc organization ideas. |
| What not to copy | Do not copy extension source, packages, scripts, CI workflows, telemetry docs, language server internals, or `.claude` assets. |
| License notes | BSD-3-Clause. Preserve attribution if derived. |
| Integration risk | High if copied because it is a large product monorepo with complex build, telemetry, extension, and release workflows. Low as reference. |
| Recommended integration type | `reference map` only. |

High-signal later inspection targets:

- `docs/`
- `packages/salesforcedx-vscode-apex/`
- `packages/salesforcedx-vscode-lwc/`
- `packages/salesforcedx-vscode-metadata/`
- `packages/salesforcedx-vscode-apex-testing/`
- `packages/salesforcedx-visualforce-language-server/`
- `test-workspaces/`

### mitchspano/sfdx-scan-pull-request

| Field | Analysis |
| --- | --- |
| Purpose | GitHub Action that runs Salesforce scanner/static analysis over pull request scope and reports inline/check-run findings. |
| Best use in this project | Optional GitHub Action integration pattern for real Salesforce DX projects, with careful version pinning and attribution. |
| What to extract | GitHub Action setup guidance; inputs map; check-run vs comment reporting; severity thresholds; PMD ruleset references; target path guidance; warning about pinning versions. |
| What not to copy | Do not copy `dist/`, action source, workflows, test fixtures, or bundled dependencies. |
| License notes | Apache-2.0. Preserve license and notices if any derived material is used. |
| Integration risk | Medium. External GitHub Action dependencies and behavior may change; projects should pin a version/commit. |
| Recommended integration type | `GitHub Action`, optional `quality gate`, reference only in this repo. |

High-signal later inspection targets:

- `README.md`
- `action.yml`
- `.github/workflows/test-action.yml`
- `.github/workflows/pmd-ruleset.xml`
- `src/`
- `tests/`

Important action inputs found:

- rule category and engine selection,
- ESLint config path,
- PMD config path,
- custom PMD rules,
- severity threshold,
- strictly enforced rules,
- target path,
- TypeScript config path,
- report mode,
- delete resolved comments.

## Cross-Repo Opportunities

### Salesforce Code Analyzer

Code Analyzer can be the central static-analysis quality gate. It can coordinate Apex, LWC, PMD, ESLint, regex, RetireJS, and security graph checks depending on installed engines and configuration.

Recommended use:

- Add a documentation-only gate first: how Codex should discover whether Code Analyzer is installed and how to run it against a real project.
- Later add optional scripts or workflow examples with version pinning.
- Keep findings scoped to changed paths where possible.
- Treat analyzer output as evidence, not as automatic permission to refactor.

### Apex Recipes

Apex Recipes fills many P1 gaps from the deep quality audit:

- Apex security helpers and inaccessible-field handling.
- Trigger handler architecture.
- Async patterns for Queueable, Batch, Scheduled Apex, and callouts.
- Named Credential and integration examples.
- Platform events, invocable methods, custom metadata, and testing patterns.

Recommended use:

- Add a public-safe reference map instead of copying recipe code.
- Expand Apex guide/checklists using paraphrased lessons and source attribution.
- Point users to upstream recipes for full examples.

### LWC Recipes

LWC Recipes fills gaps in:

- UI API wire adapters,
- `lightning-record-edit-form`,
- LDS,
- GraphQL,
- navigation,
- refresh patterns,
- workspace API,
- static resources,
- Jest tests,
- accessibility test setup.

Recommended use:

- Add a reference map from repo task type to upstream recipe names.
- Expand LWC guide topics using concise public-safe summaries.
- Use recipe names for discoverability, not copied component code.

### LWC Jest

LWC Jest should power an optional test gate for real projects.

Recommended use:

- Add a `QUALITY_GATES/lwc-jest.md` guide.
- Tell Codex to detect existing `test:unit` scripts before adding anything.
- If no Jest setup exists, recommend optional installation rather than silently editing package config.

### ESLint LWC

`eslint-plugin-lwc` and `eslint-config-lwc` should power LWC static checks.

Recommended use:

- Add a `QUALITY_GATES/lwc-eslint.md` guide.
- Map rule names to common Codex risks:
  - invalid wire adapters,
  - `@api` misuse,
  - unsafe DOM access,
  - inner HTML,
  - leaky listeners,
  - async lifecycle risks,
  - SSR/mobile compatibility where relevant.

### LWC Mobile Lint

`eslint-plugin-lwc-mobile` should be optional and task-specific, not universal.

Recommended use:

- Add mobile/offline gate guidance.
- Use it when the real project targets Salesforce Mobile/offline, GraphQL mobile constraints, or field/entity limits.
- Link findings to the mobile checklist.

### Prettier Apex

Prettier Apex should be optional and controlled.

Recommended use:

- Add a formatting gate guide.
- Codex should never run broad Apex formatting as part of a functional fix unless explicitly requested.
- Use `--check` in validation and keep `--write` for separate formatting tasks.

### GitHub Actions

The GitHub Action opportunity is to provide optional workflow templates, not a mandatory CI system.

Recommended use:

- Add workflow guidance under `AUTOMATION/github-actions/`.
- Offer a minimal check workflow and a PR scanner workflow as optional examples.
- Pin external actions or package versions.
- Include permissions and secret-safety notes.
- Avoid copying third-party workflow files directly.

## Best Final Folder Structure

Recommended additions:

```text
TOOLS/
|-- README.md
|-- salesforce-code-analyzer.md
|-- lwc-eslint.md
|-- lwc-jest.md
|-- apex-formatting.md
|-- mobile-lwc-lint.md
|-- vscode-salesforce-extensions.md
`-- external-tool-reference-map.md

QUALITY_GATES/
|-- README.md
|-- before-codex-fix.md
|-- apex-static-analysis.md
|-- lwc-static-analysis.md
|-- lwc-unit-tests.md
|-- apex-format-check.md
|-- mobile-offline-checks.md
|-- deployment-validation.md
`-- public-repo-safety.md

AUTOMATION/
|-- README.md
|-- local-validation.md
|-- github-actions/
|   |-- README.md
|   |-- code-analyzer-pr-check.md
|   |-- lwc-jest-check.md
|   `-- apex-format-check.md
`-- scripts/
    `-- README.md

VENDOR_REFERENCES/
|-- README.md
|-- ATTRIBUTION.md
|-- external-repos.md
|-- apex-recipes-map.md
|-- lwc-recipes-map.md
|-- lint-rule-map.md
`-- no-vendoring-policy.md

.github/
|-- workflows/
|   `-- README.md
|-- ISSUE_TEMPLATE/
`-- pull_request_template.md
```

Notes:

- `TOOLS/` explains what tools exist and when to use them.
- `QUALITY_GATES/` defines repeatable local checks and Codex validation behavior.
- `AUTOMATION/` documents optional scripts and GitHub Actions without forcing them into every user project.
- `VENDOR_REFERENCES/` stores attribution and reference maps, not third-party source.
- `.github/workflows/` should start with documentation or disabled/example templates, then become real workflows only after owner approval.

## P0 Integrations

| Integration | Why it is P0 | Suggested files |
| --- | --- | --- |
| External attribution and no-vendoring policy | Prevents accidental license/source copying as repo learns from external projects. | `VENDOR_REFERENCES/ATTRIBUTION.md`, `VENDOR_REFERENCES/no-vendoring-policy.md` |
| Tool reference map | Gives Codex a sanctioned way to use external repos as references without copying. | `TOOLS/external-tool-reference-map.md` |
| Quality gate overview | Turns external tooling into a controlled validation model. | `QUALITY_GATES/README.md`, `QUALITY_GATES/before-codex-fix.md` |
| Code Analyzer guide | Most important cross-language Salesforce static-analysis gate. | `TOOLS/salesforce-code-analyzer.md`, `QUALITY_GATES/apex-static-analysis.md`, `QUALITY_GATES/lwc-static-analysis.md` |
| LWC Jest guide | Immediate value for LWC validation. | `TOOLS/lwc-jest.md`, `QUALITY_GATES/lwc-unit-tests.md` |
| LWC ESLint guide | Immediate guard against common Codex LWC mistakes. | `TOOLS/lwc-eslint.md`, `QUALITY_GATES/lwc-static-analysis.md` |
| Apex Recipes and LWC Recipes reference maps | Fill current knowledge gaps without copying sample app code. | `VENDOR_REFERENCES/apex-recipes-map.md`, `VENDOR_REFERENCES/lwc-recipes-map.md` |

## P1 Integrations

| Integration | Why it matters | Suggested files |
| --- | --- | --- |
| Apex security guidance from Apex Recipes categories | Addresses CRUD/FLS/sharing/security gaps. | `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`, `TOPICS/apex/apex-security.md` |
| Apex async/callout/named credential map | Deepens async and integration guidance. | `TOPICS/apex/async-patterns.md`, `TOPICS/apex/callout-and-named-credential-patterns.md` |
| LWC UI API and form guidance from LWC Recipes categories | Fills `lightning-record-edit-form` and UI API gaps. | `TOPICS/lwc/ui-api-and-record-forms.md` |
| LWC GraphQL/navigation/workspace API guidance | Improves modern LWC coverage. | `TOPICS/lwc/graphql-navigation-workspace.md` |
| Mobile LWC lint guide | Makes mobile/offline constraints actionable. | `TOOLS/mobile-lwc-lint.md`, `QUALITY_GATES/mobile-offline-checks.md` |
| Apex formatting guide | Gives Codex controlled formatting rules. | `TOOLS/apex-formatting.md`, `QUALITY_GATES/apex-format-check.md` |
| Optional GitHub Actions guidance | Helps users automate checks without this repo becoming a CI product. | `AUTOMATION/github-actions/` |

## P2 Integrations

| Integration | Why it is future/advanced | Suggested files |
| --- | --- | --- |
| LWC graph analyzer deep-dive | Useful but more advanced/specialized than core ESLint. | `TOOLS/lwc-graph-analyzer.md`, `VENDOR_REFERENCES/lint-rule-map.md` |
| Salesforce VS Code extension reference map | Good for developer experience, but large and indirect. | `TOOLS/vscode-salesforce-extensions.md` |
| Advanced GitHub Action based on `sfdx-scan-pull-request` | Valuable but should be optional and version-pinned. | `AUTOMATION/github-actions/sfdx-scan-pull-request.md` |
| Scratch org and sample app install notes | Useful for users who want to explore recipes, not required for this engine. | `VENDOR_REFERENCES/optional-clone-workflows.md` |
| CI matrix examples for Windows/macOS/Linux | Good future polish after local validation scripts stabilize. | `.github/workflows/README.md`, `AUTOMATION/github-actions/` |

## Do Not Vendor Directly

| Repo/files | Do not vendor because |
| --- | --- |
| `code-analyzer/src/`, `messages/`, `pmd-appexchange/`, workflows | Tool source and engine wiring are upstream-maintained; copying creates stale, licensed duplicate code. |
| `lwc-recipes/force-app/` | Full sample app metadata depends on sample objects, app pages, data, and recipes. Copying would bloat this repo and confuse the real-project boundary. |
| `apex-recipes/force-app/` | Full sample app metadata/classes/triggers are not a generic library and would blur public-safe examples with upstream sample source. |
| `sfdx-lwc-jest/src/`, `src/lightning-stubs/`, `bin/` | Package internals should be installed from npm, not copied. |
| `prettier-plugin-apex/packages/` | Parser/formatter implementation and native executable tooling must remain upstream. |
| `eslint-plugin-lwc/lib/` and `docs/` copied verbatim | Rule source/docs should be referenced, not duplicated. |
| `eslint-config-lwc/*.js` copied verbatim | Configs are package-maintained and version-sensitive. Provide minimal examples instead. |
| `eslint-plugin-lwc-mobile/src/` | Rule implementation is package source; use as optional dependency/reference. |
| `eslint-plugin-lwc-graph-analyzer/lib/` | Advanced analyzer internals are upstream-maintained. |
| `salesforcedx-vscode/packages/`, `scripts/`, `.claude/`, workflows | Large product monorepo source, not suitable for this public helper repo. |
| `sfdx-scan-pull-request/dist/`, `src/`, `action.yml` copied directly | GitHub Action should be referenced/pinned externally; vendoring creates maintenance and license risk. |

## License / Attribution Requirements

Create attribution docs before integrating any derived ideas:

```text
VENDOR_REFERENCES/
|-- ATTRIBUTION.md
|-- external-repos.md
`-- no-vendoring-policy.md
```

Recommended attribution fields:

| Field | Purpose |
| --- | --- |
| Upstream repo name | Clear source identity. |
| Upstream URL | Direct provenance. |
| License | CC0-1.0, MIT, BSD-3-Clause, Apache-2.0, or other exact license. |
| Integration type | Reference, optional dependency, quality gate, GitHub Action, or no integration. |
| Material used | Paraphrased docs, config inspiration, rule names, command shape, or reference map. |
| Copy status | Explicitly say whether source files were copied. Default should be no. |
| Required action before copying | Owner approval and license review. |

License summary from the clones:

| Repo | License signal |
| --- | --- |
| `apex-recipes` | CC0-1.0 |
| `lwc-recipes` | CC0-1.0 |
| `code-analyzer` | BSD-3-Clause |
| `salesforcedx-vscode` | BSD-3-Clause |
| `sfdx-lwc-jest` | MIT |
| `eslint-plugin-lwc` | MIT |
| `eslint-config-lwc` | MIT |
| `eslint-plugin-lwc-mobile` | MIT |
| `eslint-plugin-lwc-graph-analyzer` | MIT |
| `prettier-plugin-apex` | MIT |
| `sfdx-scan-pull-request` | Apache-2.0 |

## Recommended Next Action

Create the integration scaffolding only, without copying external source:

```text
Read START_HERE.md and INSTRUCTIONS/. Create TOOLS/, QUALITY_GATES/, AUTOMATION/, and VENDOR_REFERENCES/ documentation scaffolding based on WORKSPACE/EXTERNAL_REPO_DEEP_ANALYSIS.md. Add attribution/no-vendoring policy docs. Add reference maps for Apex Recipes, LWC Recipes, Code Analyzer, LWC ESLint, LWC Jest, Apex Prettier, LWC Mobile lint, LWC Graph Analyzer, Salesforce VS Code, and sfdx-scan-pull-request. Do not copy external source code. Validate links and public safety. Do not commit or push.
```
