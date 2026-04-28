# External Repo Intelligence Strategy

## Executive Summary

The external repositories can make this Codex-ready Salesforce coding engine stronger by acting as intelligence sources, not as vendored dependencies. Their best value is in the patterns they expose: how Salesforce tooling validates Apex and LWC, how sample apps organize real `force-app/main/default` metadata, how JavaScript quality gates are wired, how Apex formatting is checked, and how CI can annotate or block risky changes.

The main repo should keep original public-safe guidance that points to the upstream projects by URL. Codex should read the distilled guidance first, then optionally inspect locally cloned reference repos only when they are present and relevant. Any code or configuration copied from upstream should require explicit owner approval, license review, and attribution. The default integration path should be docs, prompt rules, checklists, automation behavior, workflow drafts, and reference maps.

## Core Strategy

- External repos are knowledge sources, not source trees to vendor.
- This repo stores distilled guidance, not upstream implementation code.
- Codex reads this repo's instructions, Salesforce knowledge base, tools docs, quality gates, prompts, and checklists before editing a user's Salesforce DX project.
- Codex can optionally inspect cloned external repos if available locally, but only as references.
- Quality gates turn external tool concepts into practical validation steps.
- Prompt and checklist rules force Codex to use the right pattern for Apex, LWC, metadata, mobile, testing, deployment, and public release work.
- Attribution is preserved with upstream repo URLs and license notes.
- Commands that depend on fast-moving tools should be verified against installed CLI help or upstream docs before use.

## Repo-by-Repo Intelligence Extraction

### forcedotcom/code-analyzer

- Source URL: https://github.com/forcedotcom/code-analyzer
- Purpose: Salesforce Code Analyzer tooling for static analysis across engines such as ESLint, PMD, Regex, RetireJS, Flow, and Salesforce graph/security analysis.
- What it teaches Codex:
  - Static analysis should be treated as evidence, not decoration.
  - `workspace` and `target` are different: some engines need the full workspace even when scanning a narrow target.
  - Rule selection should be explicit for high-risk work, especially security, performance, and recommended rules.
  - Analyzer output can be table, detail, CSV, JSON, SARIF, HTML, or XML depending on downstream use.
  - Severity thresholds can turn findings into failing quality gates.
- Important commands:
  - `sf code-analyzer run` - verify against installed Salesforce CLI help.
  - `sf code-analyzer rules` - verify against installed Salesforce CLI help.
  - `sf code-analyzer config` - verify against installed Salesforce CLI help.
  - Example pattern: `sf code-analyzer run --rule-selector Recommended --workspace . --target force-app/main/default --view table`.
  - Example pattern: `sf code-analyzer run --config-file code-analyzer.yml --output-file results.sarif --severity-threshold 3`.
- Important parameters/options:
  - `--workspace`
  - `--target`
  - `--rule-selector`
  - `--config-file`
  - `--view table`
  - `--view detail`
  - `--output-file`
  - `--severity-threshold`
  - `--include-fixes`
  - `--include-suggestions`
  - `--no-suppressions`
- Important configuration files:
  - `code-analyzer.yml`
  - `code-analyzer.yaml`
  - Existing ESLint and PMD config files in the user's project, when auto-discovery is enabled.
- Important folder patterns:
  - Scan the Salesforce DX project root as workspace.
  - Target `force-app/main/default` or a narrower set of changed files under it.
  - Keep output artifacts out of source metadata unless intentionally stored.
- Important testing/validation patterns:
  - First list applicable rules with `rules`.
  - Run recommended rules for ordinary changes.
  - Use severity thresholds for CI.
  - Use SARIF or JSON output for machine-readable review.
- Important Salesforce-specific rules:
  - Apex security, sharing, CRUD/FLS, injection, unsafe endpoints, dangerous methods, and named credential guidance.
  - LWC and JavaScript static analysis through ESLint-related engines.
  - Graph/data-flow analysis may require the full workspace.
- What should be added to our repo:
  - A Code Analyzer command matrix.
  - A result triage guide for pass, warnings, errors, skipped, and tool missing.
  - Prompt rules requiring Codex to run or recommend Code Analyzer after Apex, LWC, metadata, or deployment-sensitive changes.
  - A CI workflow draft that is explicit about setup and skipped states.
- What should NOT be copied:
  - Engine source code.
  - Rule implementation files.
  - Message templates.
  - Test suites.
  - Release workflows.
  - Generated artifacts.
- Recommended integration type:
  - docs
  - checklist rule
  - automation script behavior
  - quality gate
  - workflow draft
  - setup guidance

### trailheadapps/lwc-recipes

- Source URL: https://github.com/trailheadapps/lwc-recipes
- Purpose: Salesforce sample app with focused Lightning Web Component recipes and Salesforce DX metadata.
- What it teaches Codex:
  - Real LWC work spans JavaScript, HTML, XML metadata, Apex controllers, permissions, record pages, message channels, static resources, and tests.
  - LWC examples should be mapped by task type instead of copied.
  - Component behavior must be validated in the context of real metadata and real page placement.
- Important commands:
  - `sf org login web -d -a <alias>` - sample app setup pattern only.
  - `sf org create scratch -d -f config/project-scratch-def.json -a <alias>` - sample app setup pattern only.
  - `sf project deploy start`
  - `sf project deploy start -d force-app`
  - `sf org assign permset -n <permission-set-name>`
  - `sf data tree import -p ./data/data-plan.json`
  - `npm run lint`
  - `npm run prettier`
  - `npm run test:unit`
- Important parameters/options:
  - `-d` for default dev hub or default org behavior, depending on command.
  - `-a` for alias.
  - `-f config/project-scratch-def.json` for scratch org shape.
  - `-d force-app` for deploying a specific source directory.
  - `-p ./data/data-plan.json` for data import plans.
- Important configuration files:
  - `sfdx-project.json`
  - `jest.config.js`
  - `eslint.config.js`
  - `.prettierrc`
  - `code-analyzer.yml`
  - `config/project-scratch-def.json`
- Important folder patterns:
  - `force-app/main/default/lwc`
  - `force-app/main/default/classes`
  - `force-app/main/default/flexipages`
  - `force-app/main/default/quickActions`
  - `force-app/main/default/permissionsets`
  - `force-app/main/default/messageChannels`
  - `force-app/main/default/staticresources`
- Important testing/validation patterns:
  - LWC Jest for unit tests.
  - ESLint for JavaScript quality.
  - Prettier for format checks.
  - Code Analyzer configuration can defer to project ESLint config.
- Important Salesforce-specific rules:
  - Wire adapters and imperative Apex require matching real Apex methods and schema.
  - `NavigationMixin`, `ShowToastEvent`, `lightning-record-edit-form`, Lightning Data Service, GraphQL, events, slots, and static resources all have distinct metadata and testing implications.
  - Never assume a recipe object, field, permission set, or data file exists in a user's org.
- What should be added to our repo:
  - Task-to-pattern map for wire adapters, imperative Apex, navigation, toast, forms, events, slots, GraphQL, static resources, LMS, and Jest.
  - Prompt rules telling Codex to inspect the user's LWC bundle, Apex controller, XML metadata, permissions, and record page placement before editing.
  - A checklist requiring mobile/layout review for UI changes.
- What should NOT be copied:
  - Sample components.
  - Sample Apex classes.
  - Sample metadata.
  - Data plans.
  - Scratch org definitions.
  - CI workflows.
- Recommended integration type:
  - docs
  - prompt rule
  - checklist rule
  - reference map
  - setup guidance

### trailheadapps/apex-recipes

- Source URL: https://github.com/trailheadapps/apex-recipes
- Purpose: Salesforce sample app with focused Apex implementation and testing recipes.
- What it teaches Codex:
  - Apex guidance must be organized by behavior: data access, DML, SOQL, security, async, callouts, triggers, testing, files, platform events, custom metadata, and LDV.
  - Tests should create their own data and assert behavior.
  - Security and sharing intent should be visible in the code.
  - Trigger work should be bulk-safe and framework-aware.
- Important commands:
  - `sf org create scratch -d -f config/project-scratch-def.json -a <alias>` - sample app setup pattern only.
  - `sf project deploy start`
  - `sf project deploy start -d force-app`
  - `sf org assign permset -n <permission-set-name>`
  - `sf data tree import -p ./data/data-plan.json`
  - `sf apex run --file data/setup.apex`
  - `npm run apexdocs`
  - `npm run lint`
  - `npm run prettier`
- Important parameters/options:
  - `-d force-app` for scoped deployment.
  - `-n <permission-set-name>` for permission assignment.
  - `--file` for anonymous Apex setup scripts.
- Important configuration files:
  - `sfdx-project.json`
  - `ruleset.xml`
  - `package.json`
  - `.prettierrc`
  - `config/project-scratch-def.json`
- Important folder patterns:
  - `force-app/main/default/classes`
  - `force-app/main/default/triggers`
  - `force-app/main/default/customMetadata`
  - `force-app/main/default/namedCredentials`
  - `force-app/main/default/permissionsets`
  - `force-app/main/default/flows`
  - `force-app/main/default/objects`
- Important testing/validation patterns:
  - PMD/security ruleset for Apex.
  - Test helper and test double patterns.
  - Separate recipe categories for async Apex, trigger handlers, integrations, files, security, and data access.
- Important Salesforce-specific rules:
  - No SOQL or DML in loops.
  - No hard-coded IDs.
  - Use CRUD/FLS and sharing decisions intentionally.
  - Prefer named credentials for authenticated callouts.
  - Use test data factories or helper builders suited to the user's actual org model.
- What should be added to our repo:
  - Apex reference map by task type.
  - Better trigger, async, callout, file, custom metadata, and test-data guidance.
  - Prompt rules forcing Codex to identify existing service/selector/handler patterns before editing.
  - Quality gate guidance tying Apex changes to Code Analyzer and tests.
- What should NOT be copied:
  - Recipe class source.
  - Trigger source.
  - Metadata.
  - Ruleset XML copied verbatim.
  - Data setup scripts.
  - Generated docs.
- Recommended integration type:
  - docs
  - prompt rule
  - checklist rule
  - reference map
  - quality gate

### salesforce/sfdx-lwc-jest

- Source URL: https://github.com/salesforce/sfdx-lwc-jest
- Purpose: Official Jest testing tooling for Lightning Web Components in Salesforce DX projects.
- What it teaches Codex:
  - LWC fixes need test strategy, not just syntax checks.
  - Existing `package.json` scripts should be detected before inventing commands.
  - Jest config and mocks must be project-specific.
  - Wire adapter tests and namespace component mocks are common pain points.
- Important commands:
  - `npm install --save-dev @salesforce/sfdx-lwc-jest`
  - `sfdx-lwc-jest`
  - `sfdx-lwc-jest --watch`
  - `sfdx-lwc-jest --debug`
  - `sfdx-lwc-jest --coverage`
  - `sfdx-lwc-jest -- --json`
  - `sfdx-lwc-jest --debug -- --no-cache`
  - `npm run test:unit`
  - `npm run test:unit:watch`
  - `npm run test:unit:debug`
  - `npm run test:unit:coverage`
- Important parameters/options:
  - `--watch`
  - `--debug`
  - `--coverage`
  - `-u` / `--updateSnapshot`
  - `--` to pass arguments through to Jest.
- Important configuration files:
  - `package.json`
  - `jest.config.js`
  - `force-app/test/jest-mocks` for project-owned mocks.
- Important folder patterns:
  - LWC bundle tests near components or under Jest test folders, based on project convention.
  - Project-specific mocks for non-standard namespaces.
- Important testing/validation patterns:
  - Prefer `npm run test:unit` when the real project defines it.
  - Use coverage as evidence when available.
  - Use debug/no-cache when test behavior is inconsistent.
- Important Salesforce-specific rules:
  - Lightning base component stubs are provided by the test tooling.
  - External namespace components may need `moduleNameMapper`.
  - Wire adapters require test utilities and explicit emitted data/error states.
- What should be added to our repo:
  - LWC Jest command map.
  - Test-writing checklist for wire, imperative Apex, events, navigation, toast, form, and error states.
  - Prompt rule: Codex must not claim Jest passed unless it ran and passed.
- What should NOT be copied:
  - Lightning stubs.
  - Resolver/transformer internals.
  - Package source.
  - Upstream Jest config source.
- Recommended integration type:
  - docs
  - checklist rule
  - automation script behavior
  - quality gate
  - setup guidance

### dangmai/prettier-plugin-apex

- Source URL: https://github.com/dangmai/prettier-plugin-apex
- Purpose: Prettier plugin for formatting Apex.
- What it teaches Codex:
  - Apex formatting can be automated, but broad formatting is risky in feature fixes.
  - Formatting should usually be a separate, intentional step.
  - `--check` is safer than `--write` during validation.
  - `--debug-check` helps detect formatting instability before adopting the formatter broadly.
- Important commands:
  - `npm install --save-dev prettier prettier-plugin-apex`
  - `prettier --plugin=prettier-plugin-apex --check "<project>/**/*.{trigger,cls}"`
  - `prettier --plugin=prettier-plugin-apex --write "<project>/**/*.{trigger,cls}"`
  - `prettier --plugin=prettier-plugin-apex --debug-check "<project>/**/*.{trigger,cls}"`
  - `prettier --plugin=prettier-plugin-apex --check "<project>/**/*.{trigger,cls}" --apex-standalone-parser built-in`
- Important parameters/options:
  - `--plugin=prettier-plugin-apex`
  - `--check`
  - `--write`
  - `--debug-check`
  - `--parser apex-anonymous` for anonymous Apex, when intentionally formatting anonymous blocks.
  - `--apex-standalone-parser built-in`
  - `--apex-standalone-host`
  - `--apex-standalone-port`
- Important configuration files:
  - `.prettierrc`
  - `.prettierignore`
  - `package.json` scripts.
- Important folder patterns:
  - Apex classes under `force-app/main/default/classes`.
  - Apex triggers under `force-app/main/default/triggers`.
  - Avoid formatting generated, vendored, or non-project folders.
- Important testing/validation patterns:
  - Use `--check` in CI.
  - Use `--debug-check` before first broad formatter rollout.
  - Keep formatting-only diffs separate from behavior changes when possible.
- Important Salesforce-specific rules:
  - Apex parser support changes by version; Codex should not assume all newest language features are supported by the installed formatter.
  - Formatting should not be treated as functional validation.
- What should be added to our repo:
  - Apex formatting gate with check-first behavior.
  - Prompt rule: do not mass-format unrelated Apex.
  - Automation behavior: detect `prettier` and `prettier-plugin-apex`, then recommend scoped checks.
- What should NOT be copied:
  - Parser packages.
  - Serializer packages.
  - Native executable handling.
  - Test fixtures.
  - Upstream workflows.
- Recommended integration type:
  - docs
  - checklist rule
  - automation script behavior
  - quality gate
  - setup guidance

### salesforce/eslint-plugin-lwc

- Source URL: https://github.com/salesforce/eslint-plugin-lwc
- Purpose: ESLint plugin with LWC-specific correctness, best-practice, compatibility, and SSR rules.
- What it teaches Codex:
  - LWC rules catch many mistakes Codex is likely to make, especially invalid `@api`, invalid `@wire`, DOM access, async behavior, and event listener cleanup.
  - LWC HTML and JavaScript are coupled; changing one without linting the bundle is incomplete.
  - SSR and compatibility rules are specialized and should be used only where relevant.
- Important commands:
  - `npm install eslint @babel/core @babel/eslint-parser @lwc/eslint-plugin-lwc --save-dev`
  - `npx eslint force-app/main/default/lwc`
  - `npm run lint` when the real project defines it.
- Important parameters/options:
  - ESLint flat config for current ESLint versions.
  - `@babel/eslint-parser` for decorators and class fields.
  - TypeScript parser/plugin additions only when the project uses LWC TypeScript.
- Important configuration files:
  - `eslint.config.js`
  - `eslint.config.mjs`
  - Legacy `.eslintrc` files for older projects.
- Important folder patterns:
  - LWC bundle JavaScript and HTML under `force-app/main/default/lwc`.
  - Rule docs under upstream `docs/rules`.
- Important testing/validation patterns:
  - Use project-defined `npm run lint` first.
  - If no script exists, recommend `npx eslint force-app/main/default/lwc` only after confirming config exists or documenting missing config.
- Important Salesforce-specific rules:
  - `lwc/no-api-reassignments`
  - `lwc/no-async-operation`
  - `lwc/no-document-query`
  - `lwc/no-inner-html`
  - `lwc/no-leaky-event-listeners`
  - `lwc/no-template-children`
  - `lwc/no-unexpected-wire-adapter-usages`
  - `lwc/no-unknown-wire-adapters`
  - `lwc/valid-api`
  - `lwc/valid-wire`
  - `lwc/valid-graphql-wire-adapter-callback-parameters`
- What should be added to our repo:
  - LWC lint rule map tied to common Codex mistakes.
  - Checklist requirements for template safety, wire correctness, event listener cleanup, DOM access, and getter-based template logic.
  - Prompt rule: Codex should run or recommend ESLint after LWC JavaScript or template changes.
- What should NOT be copied:
  - Rule implementation source.
  - Test fixtures.
  - Upstream docs verbatim.
- Recommended integration type:
  - docs
  - prompt rule
  - checklist rule
  - quality gate
  - setup guidance

### salesforce/eslint-config-lwc

- Source URL: https://github.com/salesforce/eslint-config-lwc
- Purpose: Shareable ESLint configurations for LWC projects.
- What it teaches Codex:
  - A real project may need base, recommended, extended, i18n, SSR, or TypeScript-aware lint profiles.
  - ESLint major versions matter; current configs may require ESLint 9 while older projects need older config versions.
  - Config should fit the user's project, not overwrite it.
- Important commands:
  - `npm install --save-dev @salesforce/eslint-config-lwc @lwc/eslint-plugin-lwc @salesforce/eslint-plugin-lightning eslint-plugin-import eslint-plugin-jest`
  - `npx eslint force-app/main/default/lwc`
  - `npm run lint` when present.
- Important parameters/options:
  - `configs.base`
  - `configs.recommended`
  - `configs.extended`
  - `configs.i18n`
  - `configs.ssr`
  - TypeScript variants such as `recommendedTs`, where supported by the installed package.
- Important configuration files:
  - `eslint.config.js`
  - `eslint.config.mjs`
  - `package.json`.
- Important folder patterns:
  - LWC bundles under `force-app/main/default/lwc`.
  - Optional TypeScript LWC files in projects that have adopted Salesforce LWC TypeScript support.
- Important testing/validation patterns:
  - Detect project ESLint version before recommending a config.
  - Do not replace an existing lint config blindly.
- Important Salesforce-specific rules:
  - Use the recommended profile for ordinary LWC projects.
  - Add i18n only when text/localization checks are relevant.
  - Add SSR only when the project actually targets SSR-compatible LWC.
- What should be added to our repo:
  - Config selection guide.
  - Example-only config snippets labeled as non-active drafts.
  - Prompt rule: preserve existing lint config unless the user asks to change it.
- What should NOT be copied:
  - Config files verbatim.
  - Package internals.
  - Test files.
- Recommended integration type:
  - docs
  - setup guidance
  - checklist rule
  - quality gate

### salesforce/eslint-plugin-lwc-mobile

- Source URL: https://github.com/salesforce/eslint-plugin-lwc-mobile
- Purpose: ESLint plugin for Salesforce mobile/offline LWC constraints.
- What it teaches Codex:
  - Mobile Salesforce work requires different validation from desktop-only LWC.
  - GraphQL/offline constraints can limit query shape, mutation support, scope, parent/child counts, and field counts.
  - Apex imports may need special review for mobile/offline behavior.
- Important commands:
  - `npm install --save-dev @salesforce/eslint-plugin-lwc-mobile`
  - `npx eslint force-app/main/default/lwc`
  - `npm run lint` when the real project defines it.
- Important parameters/options:
  - Flat config recommended settings for ESLint 9 and later.
  - Legacy config: `plugin:@salesforce/lwc-mobile/recommended-legacy`.
- Important configuration files:
  - `eslint.config.js`
  - `eslint.config.mjs`
  - Legacy `.eslintrc` files.
- Important folder patterns:
  - LWC JavaScript files under `force-app/main/default/lwc`.
  - Mobile/offline-sensitive components should have extra lint review.
- Important testing/validation patterns:
  - Enable only when the project targets Salesforce mobile/offline behavior.
  - Report skipped state when the mobile plugin is not installed or not applicable.
- Important Salesforce-specific rules:
  - Apex import review.
  - GraphQL aggregate query support limits.
  - Fiscal date filtering limits.
  - Parent/child/root entity count limits.
  - Field count limits.
  - Mutation and semi/anti-join support limits.
  - Scope support limits.
- What should be added to our repo:
  - Mobile/offline LWC checklist.
  - Prompt rule for Salesforce mobile tasks: treat mobile behavior as a first-class acceptance area.
  - Automation script detection for plugin presence.
- What should NOT be copied:
  - TypeScript rule source.
  - Test specs.
  - Config source files verbatim.
- Recommended integration type:
  - docs
  - prompt rule
  - checklist rule
  - quality gate
  - setup guidance

### salesforce/eslint-plugin-lwc-graph-analyzer

- Source URL: https://github.com/salesforce/eslint-plugin-lwc-graph-analyzer
- Purpose: ESLint plugin that analyzes LWC dependency/data-flow graph for static analyzability, data priming, and offline use cases.
- What it teaches Codex:
  - Some LWC designs are hard or impossible to analyze statically.
  - Offline-capable components need analyzable `@wire` configurations, templates, getters, imports, and component composition.
  - LWC HTML must not be ignored when using graph analyzer rules.
- Important commands:
  - `npm install --save-dev @salesforce/eslint-plugin-lwc-graph-analyzer`
  - `npx eslint force-app/main/default/lwc`
  - `npm run lint` when the real project defines it.
- Important parameters/options:
  - Flat config recommended settings for ESLint 9 and later.
  - Legacy config: `plugin:@salesforce/lwc-graph-analyzer/recommended-legacy`.
- Important configuration files:
  - `eslint.config.js`
  - `eslint.config.mjs`
  - Legacy `.eslintrc` files.
  - `.eslintignore`, if present, must not ignore LWC HTML when graph analysis is required.
- Important folder patterns:
  - LWC JavaScript and HTML files under `force-app/main/default/lwc`.
  - Components with multiple templates, dynamic composition, non-literal wire configs, or external namespace dependencies need careful review.
- Important testing/validation patterns:
  - Use as an advanced optional gate for mobile/offline-heavy projects.
  - Pair with mobile lint where offline support is required.
- Important Salesforce-specific rules:
  - Avoid `eval`.
  - Keep getters analyzable and simple.
  - Avoid unresolved parent classes, unsupported namespaces, unsupported globals, circular wire dependencies, and private wire config properties.
  - Ensure wire adapters and resource dependencies can be statically analyzed.
- What should be added to our repo:
  - Advanced LWC analyzability checklist.
  - Prompt rule: for mobile/offline LWC tasks, inspect HTML and JS together and do not ignore templates.
  - Quality gate documentation for graph analyzer as optional advanced validation.
- What should NOT be copied:
  - Analyzer implementation.
  - Rule source.
  - Test fixtures.
  - Config source files verbatim.
- Recommended integration type:
  - docs
  - checklist rule
  - quality gate
  - setup guidance

### forcedotcom/salesforcedx-vscode

- Source URL: https://github.com/forcedotcom/salesforcedx-vscode
- Purpose: Salesforce VS Code extensions monorepo and developer workflow reference.
- What it teaches Codex:
  - Developer tools need layered quality gates: compile, lint, tests, link checks, duplicate checks, dependency checks, and secret scans.
  - VS Code extension workflows show how local developer tooling can be documented without assuming org access.
  - Salesforce development benefits from IDE support for Apex language services, LWC language services, metadata browsing, org browser, Apex logs, and tests.
- Important commands:
  - `npm run compile`
  - `npm run lint`
  - `npm run test`
  - `npm run check:links`
  - `npm run check:dupes`
  - `npm run check:knip`
  - `npm run precommit`
  - `npm run prepush`
- Important parameters/options:
  - Workspace/package scoping in npm scripts, where used by a real project.
  - Link-check response allowances such as HTTP 200, 206, and 429 as a concept.
  - Secret scanning as a release safety step.
- Important configuration files:
  - `package.json`
  - `eslint.config.mjs`
  - `jest.config.js`
  - `.jscpd.json`
  - `knip.json`
  - Markdown link check settings.
- Important folder patterns:
  - Monorepo `packages`.
  - `docs`.
  - `scripts`.
  - `test-workspaces`.
  - `config`.
- Important testing/validation patterns:
  - Precommit should run compile/lint/dependency checks.
  - Prepush should add tests.
  - E2E testing should use real packaged artifacts when relevant.
- Important Salesforce-specific rules:
  - Apex, Aura, LWC, Visualforce, SOQL, metadata, org browser, Apex testing, and Apex log features each have distinct validation concerns.
  - TypeScript LWC support deploys raw `.ts` in supported Salesforce contexts; do not compile to arbitrary JS and deploy that as metadata.
- What should be added to our repo:
  - Developer workflow reference for VS Code users.
  - Local quality script improvements inspired by compile/lint/test/link/secret/dependency gates.
  - Wiki page or tools doc explaining Salesforce Extension Pack and Code Analyzer extension as optional local aids.
- What should NOT be copied:
  - Extension source.
  - Monorepo package code.
  - Internal scripts.
  - Product docs verbatim.
  - Test workspaces.
- Recommended integration type:
  - docs
  - automation script behavior
  - quality gate
  - workflow draft
  - setup guidance

### mitchspano/sfdx-scan-pull-request

- Source URL: https://github.com/mitchspano/sfdx-scan-pull-request
- Purpose: GitHub Action for running Salesforce scanner/static analysis on pull request scope and reporting findings.
- What it teaches Codex:
  - PR quality gates should focus on changed files where possible.
  - Findings can be reported as comments or check runs.
  - Severity thresholds and strictly enforced rules make scans actionable.
  - Older scanner-based automation may need modernization or replacement with Salesforce Code Analyzer.
- Important commands:
  - `sfdx plugins:install @salesforce/sfdx-scanner` - legacy scanner setup, verify current upstream guidance.
  - `npx sfdx plugins:install @salesforce/sfdx-scanner` - legacy scanner setup, verify current upstream guidance.
  - `act pull_request --input pmdconfig=tests/pmd-ruleset.xml --input severity-threshold=3 --eventpath tests/example-github-event.json` - local action-test concept, not a repo default.
- Important parameters/options:
  - `category`
  - `engine`
  - `eslint-env`
  - `eslintconfig`
  - `pmdconfig`
  - `custom-pmd-rules`
  - `severity-threshold`
  - `strictly-enforced-rules`
  - `target`
  - `tsconfig`
  - `report-mode`
  - `delete-resolved-comments`
- Important configuration files:
  - `action.yml`
  - GitHub workflow YAML.
  - PMD ruleset XML.
  - ESLint config.
- Important folder patterns:
  - `.github/workflows`.
  - CI-specific rulesets.
  - Source project paths under `force-app/main/default`.
- Important testing/validation patterns:
  - Trigger on `pull_request`.
  - Use severity thresholds.
  - Prefer check runs when comments would be noisy.
  - Consider changed-file scope for PR speed and signal.
- Important Salesforce-specific rules:
  - Scanner engines can include PMD, ESLint, and LWC ESLint concepts.
  - Current projects should compare this action with Salesforce Code Analyzer before adopting it.
- What should be added to our repo:
  - PR scan strategy doc.
  - Workflow draft notes about severity thresholds and changed-file scope.
  - Migration note: prefer current Salesforce Code Analyzer guidance when available.
- What should NOT be copied:
  - `dist`.
  - `src`.
  - `action.yml` copied verbatim.
  - Test fixtures.
  - Example event payloads.
- Recommended integration type:
  - docs
  - workflow draft
  - quality gate
  - setup guidance

## Cross-Repo Design Strategy

| External intelligence source | Role in this repo | How it combines with others |
| --- | --- | --- |
| Salesforce Code Analyzer | Static analysis and security gate. | Runs after Apex, LWC, metadata, and release-sensitive changes; can produce SARIF/JSON for CI. |
| Apex Recipes | Apex implementation pattern source. | Feeds Apex docs, test guidance, trigger checklists, and security review prompts. |
| LWC Recipes | LWC implementation pattern source. | Feeds LWC docs, prompt rules, component testing maps, and metadata placement checks. |
| LWC Jest | LWC testing strategy. | Runs or is recommended after LWC changes; complements ESLint and recipe pattern maps. |
| ESLint LWC | LWC lint strategy. | Catches invalid decorators, wire usage, DOM access, unsafe async behavior, and template-adjacent mistakes. |
| LWC Mobile | Mobile-safe LWC strategy. | Adds offline/mobile-specific limits and GraphQL constraints. |
| LWC Graph Analyzer | Advanced static analyzability strategy. | Helps prevent mobile/offline components from using unanalyzable getters, wire configs, imports, and templates. |
| Prettier Apex | Apex formatting strategy. | Provides optional format checks while avoiding broad unrelated formatting. |
| VS Code Salesforce Extensions | Local developer workflow reference. | Inspires docs for local setup, language services, link checks, secret checks, and quality scripts. |
| SFDX scan PR | Pull request review automation strategy. | Contributes severity threshold, changed-file scope, and PR annotation ideas; should be compared with current Code Analyzer workflows. |

The practical design is:

1. Codex locates the real Salesforce DX project.
2. Codex identifies task type: Apex, LWC, metadata, mobile, files, tests, deployment, or release.
3. Codex reads this repo's distilled guidance and task-specific prompt/checklist.
4. Codex inspects real project files before editing.
5. Codex makes the smallest safe change.
6. Codex runs available quality gates or records why each gate was skipped.
7. Codex updates Memory and History with evidence.

## Parameters And Commands Map

| Area | Command or option | Source intelligence | How Codex should use it |
| --- | --- | --- | --- |
| Code Analyzer | `sf code-analyzer run` | `forcedotcom/code-analyzer` | Verify command with installed CLI help, then run against the real Salesforce DX workspace when available. |
| Code Analyzer | `sf code-analyzer rules` | `forcedotcom/code-analyzer` | Preview rules and engines before changing analyzer configuration. |
| Code Analyzer | `sf code-analyzer config` | `forcedotcom/code-analyzer` | Generate or inspect config only with owner approval. |
| Code Analyzer | `--workspace` | `forcedotcom/code-analyzer` | Point to the full Salesforce DX project root when engines need full context. |
| Code Analyzer | `--target` | `forcedotcom/code-analyzer` | Narrow analysis to `force-app/main/default` or changed files when safe. |
| Code Analyzer | `--rule-selector Recommended` | `forcedotcom/code-analyzer` | Default scan selector for general validation. |
| Code Analyzer | `--rule-selector eslint:Recommended` | `forcedotcom/code-analyzer` | JavaScript/LWC-focused scan, verify rules with installed tool. |
| Code Analyzer | `--rule-selector "pmd:(2,3):Performance"` | `forcedotcom/code-analyzer` | Example selector pattern for PMD severity/tag filtering; verify before use. |
| Code Analyzer | `--severity-threshold 3` | `forcedotcom/code-analyzer` | CI fail threshold for moderate-or-higher findings when project policy supports it. |
| Code Analyzer | `--view table` | `forcedotcom/code-analyzer` | Concise terminal result. |
| Code Analyzer | `--view detail` | `forcedotcom/code-analyzer` | Detailed triage result. |
| Code Analyzer | `--output-file results.sarif` | `forcedotcom/code-analyzer` | CI/reporting artifact pattern; ensure output path exists. |
| LWC Jest | `npm install --save-dev @salesforce/sfdx-lwc-jest` | `salesforce/sfdx-lwc-jest` | Setup guidance only; do not install without user approval. |
| LWC Jest | `npm run test:unit` | `salesforce/sfdx-lwc-jest`, recipes | Preferred when the real project defines it. |
| LWC Jest | `sfdx-lwc-jest --coverage` | `salesforce/sfdx-lwc-jest` | Coverage validation when installed. |
| LWC Jest | `sfdx-lwc-jest --watch` | `salesforce/sfdx-lwc-jest` | Developer workflow, not CI. |
| LWC Jest | `sfdx-lwc-jest --debug -- --no-cache` | `salesforce/sfdx-lwc-jest` | Debug path for inconsistent tests; use only when troubleshooting. |
| LWC Jest | `--updateSnapshot` | `salesforce/sfdx-lwc-jest` | Only with explicit review; snapshot updates can hide regressions. |
| LWC ESLint | `npm run lint` | recipes, ESLint repos | Preferred project-defined lint command. |
| LWC ESLint | `npx eslint force-app/main/default/lwc` | ESLint repos | Recommend only after confirming ESLint config/dependencies. |
| LWC ESLint | `@salesforce/eslint-config-lwc` configs | `salesforce/eslint-config-lwc` | Config selection guidance; do not overwrite existing project config blindly. |
| LWC Mobile | `@salesforce/eslint-plugin-lwc-mobile` | `salesforce/eslint-plugin-lwc-mobile` | Optional mobile/offline lint plugin. |
| LWC Graph Analyzer | `@salesforce/eslint-plugin-lwc-graph-analyzer` | `salesforce/eslint-plugin-lwc-graph-analyzer` | Optional advanced offline/static analyzability plugin. |
| Apex formatting | `npm install --save-dev prettier prettier-plugin-apex` | `dangmai/prettier-plugin-apex` | Setup guidance only; do not install without user approval. |
| Apex formatting | `prettier --plugin=prettier-plugin-apex --check "<project>/**/*.{trigger,cls}"` | `dangmai/prettier-plugin-apex` | Check formatting without modifying files. |
| Apex formatting | `prettier --plugin=prettier-plugin-apex --write "<project>/**/*.{trigger,cls}"` | `dangmai/prettier-plugin-apex` | Use only when formatting is explicitly requested or scoped. |
| Apex formatting | `--debug-check` | `dangmai/prettier-plugin-apex` | Stability check before broad formatter adoption. |
| Salesforce CLI setup | `sf org create scratch -d -f config/project-scratch-def.json -a <alias>` | recipes | Pattern only; do not run in user org without explicit approval. |
| Salesforce CLI deploy | `sf project deploy start -d force-app` | recipes | Scoped deploy pattern; verify project path and org target first. |
| Salesforce data import | `sf data tree import -p ./data/data-plan.json` | recipes | Sample app pattern only; never run against user org casually. |
| PR scanning | `engine: pmd,eslint,eslint-lwc` | `mitchspano/sfdx-scan-pull-request` | Legacy scanner/action concept; verify current scanner support. |
| PR scanning | `severity-threshold` | `mitchspano/sfdx-scan-pull-request` | Use severity threshold concept for CI gates. |
| PR scanning | `report-mode` | `mitchspano/sfdx-scan-pull-request` | Prefer check-run style reporting when comments would be noisy. |
| Repo hygiene | `npm run check:links` | `forcedotcom/salesforcedx-vscode` | Link-check concept for this repo's docs. |
| Repo hygiene | `npm run check:dupes` | `forcedotcom/salesforcedx-vscode` | Duplicate-check concept for future docs/scripts. |
| Repo hygiene | `npm run check:knip` | `forcedotcom/salesforcedx-vscode` | Unused dependency/export check concept for Node tooling projects. |

## Function/Behavior Map

| Source repo | Behavior concept | When Codex should use the idea | How our repo should express it | What should be avoided |
| --- | --- | --- | --- | --- |
| `code-analyzer` | Rule discovery before execution. | Before changing analyzer config or failing CI on new rules. | Document a `rules` preview step. | Pretending all rule selectors are valid without checking installed tool output. |
| `code-analyzer` | Workspace-wide context with target-specific scans. | When graph/security engines need project context. | Automation should pass workspace root and target path separately where possible. | Scanning only one file and claiming graph/security coverage. |
| `code-analyzer` | Machine-readable outputs. | In CI or release gates. | Recommend JSON/SARIF artifacts as optional outputs. | Writing output inside Salesforce metadata folders. |
| `lwc-recipes` | Task-specific LWC examples. | When Codex needs a pattern for wire, imperative Apex, navigation, forms, events, slots, or static resources. | Reference maps and prompt rules. | Copying recipe components or sample metadata. |
| `apex-recipes` | Category-based Apex examples. | When Codex needs patterns for async, security, files, custom metadata, callouts, triggers, or tests. | Reference maps and checklists. | Copying recipe classes or sample-specific object assumptions. |
| `sfdx-lwc-jest` | Default LWC Jest setup and project overrides. | After LWC behavior changes. | LWC testing gate docs and script detection. | Installing or rewriting Jest config without approval. |
| `sfdx-lwc-jest` | Wire and module mocking. | When testing components using LDS, wire adapters, Apex, or namespace components. | Prompt rules requiring explicit data/error test states. | Creating brittle snapshots as the only assertions. |
| `prettier-plugin-apex` | Check-first Apex formatting. | After Apex edits or before release. | Formatting gate with `--check` before `--write`. | Mass formatting unrelated Apex during a bug fix. |
| `eslint-plugin-lwc` | LWC AST rule enforcement. | After LWC JS/template changes. | Lint rule map by common Codex mistake. | Ignoring lint because the component compiles. |
| `eslint-config-lwc` | Config profile selection. | When a project lacks lint config or wants stronger linting. | Example-only config guidance. | Replacing an existing config blindly. |
| `eslint-plugin-lwc-mobile` | Mobile/offline constraints. | For Salesforce mobile app or offline work. | Mobile checklist and optional lint gate. | Treating desktop LWC validation as sufficient. |
| `eslint-plugin-lwc-graph-analyzer` | Static analyzability and dependency graph checks. | For mobile/offline/data priming work. | Advanced LWC quality gate and template inclusion warning. | Ignoring HTML templates or dynamic getters/wire configs. |
| `salesforcedx-vscode` | Layered developer quality workflow. | For repo hygiene and local developer guidance. | Link check, secret scan, duplicate check, dependency check, compile/lint/test phases. | Copying extension product code. |
| `sfdx-scan-pull-request` | PR annotations and changed-scope scanning. | For future CI workflow improvements. | Workflow strategy with severity thresholds and check-run reporting. | Copying legacy action source or assuming scanner commands are current. |

## Proposed Final Repo Structure

The current repo already has most of the right folders. The intelligence strategy recommends strengthening them like this:

```text
TOOLS/
  TOOL_REGISTRY.md
  SALESFORCE_CODE_ANALYZER.md
  LWC_JEST.md
  ESLINT_LWC.md
  LWC_MOBILE_LINT.md
  PRETTIER_APEX.md
  EXTERNAL_REFERENCE_REPOS.md

QUALITY_GATES/
  CODE_ANALYZER_RULES.md
  LWC_LINT_RULES.md
  APEX_FORMATTING.md
  TESTING_GATE.md
  RELEASE_GATE.md
  examples/

AUTOMATION/
  local-quality-check.ps1
  local-quality-check.sh
  validate-salesforce-project.ps1
  validate-salesforce-project.sh

VENDOR_REFERENCES/
  TOOL_SOURCE_MAP.md
  EXTERNAL_REPOS_TO_CLONE_OPTIONALLY.md
  LICENSE_AND_ATTRIBUTION_NOTES.md
  _external/        # local only, gitignored

SALESFORCE_KNOWLEDGE/
  REFERENCE/
    EXTERNAL_APEX_RECIPES_MAP.md
    EXTERNAL_LWC_RECIPES_MAP.md
    EXTERNAL_PATTERN_USAGE_RULES.md
    EXTERNAL_TOOL_INTELLIGENCE_MAP.md
  PROMPTS/
    CODEX_PROMPT_PACK/
  CHECKLISTS/
    CODEX_ENGINE_CHECKLISTS/

.github/
  workflows/
    markdown-link-check.yml
    public-safety-check.yml
    salesforce-code-analyzer.yml
    lwc-quality-gate.example.yml
```

## Gap Analysis

| Gap | Why it matters | Suggested response |
| --- | --- | --- |
| Code Analyzer commands need a stricter matrix. | Codex must know when to run recommended, engine-specific, severity-threshold, SARIF, or detail modes. | Expand `TOOLS/SALESFORCE_CODE_ANALYZER.md` and `QUALITY_GATES/CODE_ANALYZER_RULES.md`. |
| LWC lint rules need mapping to common AI mistakes. | Codex often makes template, wire, DOM, and decorator mistakes. | Add rule-to-risk tables in LWC lint quality gate docs. |
| Mobile/offline LWC needs stronger gate separation. | Mobile-safe behavior is not the same as desktop browser behavior. | Add mobile and graph analyzer decision tree. |
| Apex Recipes intelligence should be task-routed. | A broad recipe map is less useful than "if async, read these concepts." | Add task-specific Apex pattern index. |
| LWC Recipes intelligence should be task-routed. | Codex needs the right pattern quickly without copying sample metadata. | Add task-specific LWC pattern index. |
| Apex formatting needs check-first default. | Formatting can create noisy diffs and hide behavior changes. | Emphasize `--check` and scoped `--write`. |
| Setup flows need guardrails. | Recipe setup commands can create orgs, deploy metadata, and import data. | Label setup commands as examples and require explicit user approval before running. |
| CI examples need current-tool caveats. | Scanner/action commands change over time. | Mark uncertain or legacy commands as verify-against-upstream. |
| VS Code workflow guidance is not fully captured. | New users benefit from local IDE quality setup. | Add optional local developer workflow page. |
| Attribution should be centralized. | External inspiration needs traceability. | Keep `VENDOR_REFERENCES/TOOL_SOURCE_MAP.md` and license notes updated. |

## Integration Plan

### P0

| Action | Files likely affected | Why |
| --- | --- | --- |
| Add Code Analyzer command matrix and skipped/pass/fail interpretation. | `TOOLS/SALESFORCE_CODE_ANALYZER.md`, `QUALITY_GATES/CODE_ANALYZER_RULES.md`, automation docs | Static analysis is the highest-value quality gate. |
| Add LWC Jest command/options map and test evidence rules. | `TOOLS/LWC_JEST.md`, `QUALITY_GATES/TESTING_GATE.md`, LWC prompts | Codex must not claim tests passed without running them. |
| Add LWC ESLint rule-to-risk map. | `TOOLS/ESLINT_LWC.md`, `QUALITY_GATES/LWC_LINT_RULES.md` | Prevents common LWC AI mistakes. |
| Add mobile/offline lint and graph analyzer strategy. | `TOOLS/LWC_MOBILE_LINT.md`, `QUALITY_GATES/LWC_LINT_RULES.md`, mobile checklist | Mobile/offline behavior needs explicit controls. |
| Add Apex formatting check-first guidance. | `TOOLS/PRETTIER_APEX.md`, `QUALITY_GATES/APEX_FORMATTING.md` | Prevents broad unrelated formatting changes. |
| Add recipe pattern usage rules. | `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_PATTERN_USAGE_RULES.md` | Prevents copying sample objects/fields/classes into user projects. |
| Update prompt pack quality-gate requirements. | `SALESFORCE_KNOWLEDGE/PROMPTS/CODEX_PROMPT_PACK/` | Forces Codex to use validations after relevant edits. |
| Update checklist pack with evidence/skip logging. | `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/` | Makes validation behavior auditable. |

### P1

| Action | Files likely affected | Why |
| --- | --- | --- |
| Add CI workflow strategy for Markdown, public safety, Code Analyzer, LWC lint/Jest, and Apex formatting. | `.github/workflows/`, `QUALITY_GATES/RELEASE_GATE.md` | Gives users adaptable public-safe automation. |
| Add Salesforce project setup flow guardrails. | `FORCE_APP_DIRECTORY/README.md`, `TOOLS/INSTALL_TOOLING.md` | Prevents unsafe deploy/data import commands. |
| Add VS Code developer workflow reference. | `TOOLS/README.md`, `WIKI_DRAFTS/` | Helps new users set up local Salesforce development. |
| Add PR review automation strategy. | `QUALITY_GATES/RELEASE_GATE.md`, `.github/workflows/README.md` | Converts scan findings into review feedback. |
| Add ESLint config selection guide. | `TOOLS/ESLINT_LWC.md`, `QUALITY_GATES/examples/` | Reduces config churn and ESLint version conflicts. |
| Improve automation scripts to detect tool presence and package scripts. | `AUTOMATION/` | Lets Codex validate without assuming setup. |
| Add package script examples. | `QUALITY_GATES/examples/` | Gives users copy-adapt starting points. |
| Strengthen attribution/source map. | `VENDOR_REFERENCES/TOOL_SOURCE_MAP.md`, `LICENSE_AND_ATTRIBUTION_NOTES.md` | Keeps external references traceable. |

### P2

| Action | Files likely affected | Why |
| --- | --- | --- |
| Add advanced SARIF/JSON analyzer reporting examples. | `.github/workflows/`, `QUALITY_GATES/CODE_ANALYZER_RULES.md` | Better CI integration. |
| Add mobile/offline graph analyzer decision tree. | `QUALITY_GATES/LWC_LINT_RULES.md`, mobile guide | Helps decide when advanced linting is worth it. |
| Add recipe-to-task playbooks. | `SALESFORCE_KNOWLEDGE/REFERENCE/` | Faster task-specific learning. |
| Add optional changed-file PR scan strategy. | `.github/workflows/`, release gate docs | Improves PR signal and speed. |
| Add duplicate/dependency/link-check repo hygiene guidance. | `QUALITY_GATES/RELEASE_GATE.md`, `.github/workflows/` | Improves public repo quality. |
| Add optional TypeScript LWC guidance. | `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md`, tools docs | Supports modern Salesforce DX projects. |

### P3

| Action | Files likely affected | Why |
| --- | --- | --- |
| Build a tool compatibility matrix by Salesforce CLI, Node, npm, ESLint, Jest, and package versions. | `TOOLS/TOOL_REGISTRY.md` | Useful but requires ongoing maintenance. |
| Add SARIF upload workflow with explicit permissions. | `.github/workflows/` | Advanced GitHub security integration. |
| Add local generated report viewer guidance. | `AUTOMATION/`, `QUALITY_GATES/` | Nice-to-have for large projects. |
| Add org-aware validation playbooks. | `HISTORY/DEPLOYMENT_LOG.md`, deployment guide | Requires careful handling of aliases and permissions. |
| Add package.xml generation guardrails from changed source. | metadata guide, deployment guide | Useful future automation. |

## Do Not Copy List

| Source | Do not copy | Why |
| --- | --- | --- |
| `forcedotcom/code-analyzer` | Engine source, rule implementation, messages, workflows, tests. | Tool internals are third-party source and version-sensitive. |
| `trailheadapps/lwc-recipes` | Sample components, Apex, metadata, data plans, scratch org definitions. | Recipes assume sample objects, fields, permissions, and data. |
| `trailheadapps/apex-recipes` | Classes, triggers, metadata, data scripts, ruleset copied verbatim. | Patterns must be adapted to the user's real org metadata. |
| `salesforce/sfdx-lwc-jest` | Stubs, resolver, transformer, package source. | These belong in the package, not this repo. |
| `dangmai/prettier-plugin-apex` | Parser, serializer, native executable handling, test fixtures. | Formatter implementation should remain upstream. |
| `salesforce/eslint-plugin-lwc` | Rule source, fixtures, docs verbatim. | Use rule names and concepts with attribution. |
| `salesforce/eslint-config-lwc` | Config source copied as defaults. | Existing projects may need different ESLint/package versions. |
| `salesforce/eslint-plugin-lwc-mobile` | Rule source and test specs. | Use as optional guidance only. |
| `salesforce/eslint-plugin-lwc-graph-analyzer` | Analyzer internals, rule source, fixtures. | Advanced static analysis should remain upstream. |
| `forcedotcom/salesforcedx-vscode` | Extension packages, scripts, workflows, product docs verbatim. | Large product repo with different purpose and license obligations. |
| `mitchspano/sfdx-scan-pull-request` | `dist`, `src`, action file copied verbatim, test payloads. | Use PR scan concepts; verify current scanner direction. |
| Any external repo | `.git`, `node_modules`, generated outputs, release artifacts. | Bloats repo, creates license risk, and breaks the no-vendoring rule. |

## Public Safety And License Strategy

- Reference external repos by URL and name.
- Preserve license identity in attribution docs.
- Do not vendor external source, generated outputs, package internals, or sample metadata.
- Do not copy private data, local paths, org IDs, usernames, session IDs, tokens, secrets, or customer names.
- Keep optional clones in a gitignored folder such as `VENDOR_REFERENCES/_external/`.
- Treat commands that create orgs, deploy metadata, assign permissions, or import data as examples requiring explicit user approval.
- Prefer original summaries, original checklists, original prompt rules, and original automation guidance.
- If future work copies even a small external code/config snippet, require owner approval, upstream license review, source attribution, and a reason why a paraphrased guide is insufficient.
