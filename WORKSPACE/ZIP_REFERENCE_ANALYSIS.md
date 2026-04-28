# Zip Reference Analysis

Generated: 2026-04-28

Scope: nine local zip archives were extracted temporarily under `WORKSPACE/_zip_analysis_tmp/` for reference inspection only. The permanent report below contains only generic observations. No archive source code, generated reports, screenshots, metadata XML, package files, or README prose was copied into the repo.

## Summary

| Zip name | Extract status | Main technology | Salesforce relevance | Recommended integration priority |
| --- | --- | --- | --- | --- |
| `awesome-salesforce-master.zip` | Extracted | Curated Markdown/link directory | Indirect ecosystem reference | Low |
| `Hotel-Booking-Project-using-SalesForce-master.zip` | Extracted | Salesforce DX metadata sample | Direct Salesforce metadata reference | Medium |
| `SalesForce_WebViewTest-master.zip` | Extracted | iOS Swift WebView UI test sample | Low, mobile auth/container reference only | Ignore / Low |
| `SalesForceAutomationFrameWork-main.zip` | Extracted | Java Selenium/TestNG automation | Indirect UI automation reference | Ignore / Low |
| `salesforce-commerce-cloud-libraries-master.zip` | Extracted | Commerce Cloud JavaScript cartridges | Low for core platform, possible Commerce Cloud-only reference | Ignore unless Commerce Cloud work |
| `SalesForce-Testng-frameWork-master.zip` | Extracted | Java Selenium/TestNG automation | Indirect UI automation reference | Ignore / Low |
| `SalesForce-master.zip` | Extracted | Minimal SFDX/LWC quickstart projects | Direct but shallow Salesforce DX reference | Low / Medium |
| `Selenium.TestNG_FrameWork.SalesForceApplication-main.zip` | Extracted | Small Java Selenium/TestNG sample | Very low, UI testing concept only | Ignore |
| `salesforce-docs-master.zip` | Extracted | Markdown Salesforce standards documentation | Medium to high for documentation structure | Medium |

## Per-Zip Findings

### awesome-salesforce-master.zip

- Extract status: Extracted.
- Main technology: Markdown curated resource list with image assets and old link-check automation.
- Salesforce relevance: Indirect. It is useful as an example of organizing external Salesforce ecosystem references, not as implementation guidance.
- Useful patterns:
  - Categorize external references by topic instead of placing all links in one flat list.
  - Include contribution and issue templates so public reference lists can be maintained.
  - Add automated link checking for curated resource pages.
- Anti-patterns:
  - Old CI stack and dependency choices should not be copied.
  - Link directories become stale quickly without recency checks.
  - Image-heavy resource repositories do not improve Codex coding guidance unless the assets serve a clear documentation purpose.
- What our repo should learn:
  - Add or keep link-checking and source-recency review for external reference maps.
  - Treat curated link lists as navigation aids, not technical authority.
- What should not be copied:
  - Link lists wholesale, logos, screenshots, category prose, or old CI config.
- Recommended integration priority: Low.

### Hotel-Booking-Project-using-SalesForce-master.zip

- Extract status: Extracted.
- Main technology: Salesforce DX source-format metadata with object folders, fields, layouts, FlexiPages, reports, dashboards, sharing rules, a trigger, scratch-org config, package scripts, and lint/test tooling.
- Salesforce relevance: Direct for source structure and metadata relationships.
- Useful patterns:
  - Standard `force-app/main/default` shape with object-scoped fields, layouts, FlexiPages, reports, dashboards, sharing rules, triggers, and scratch config.
  - Package scripts for linting, unit tests, formatting, and precommit checks are good project-readiness signals.
  - Reports and dashboards demonstrate that metadata deployments often include folder and dependency structure, not just code.
  - Custom objects plus validation rules show why metadata edits need dependency checks across object, field, layout, and reporting layers.
- Anti-patterns:
  - No visible Apex test coverage for trigger behavior in the archive.
  - README is product-facing and not enough for maintainable developer onboarding.
  - Some automation concepts appear dated and should be verified against current Salesforce automation guidance before reuse.
  - Generated report/dashboard metadata names are not suitable as public examples.
- What our repo should learn:
  - Improve metadata guide examples around report/dashboard/folder dependencies.
  - Add a checklist item: a trigger in source should have matching test strategy and deployable coverage.
  - Use this only to reinforce source-format structure and metadata dependency mapping.
- What should not be copied:
  - Object model, metadata XML, report/dashboard names, business workflow, trigger source, package files, or README prose.
- Recommended integration priority: Medium.

### SalesForce_WebViewTest-master.zip

- Extract status: Extracted.
- Main technology: Small iOS Swift project for WebView login UI testing.
- Salesforce relevance: Low. It is outside Salesforce DX but loosely relevant to mobile WebView/auth testing.
- Useful patterns:
  - Native mobile UI tests can validate login and WebView flows that browser-only tests miss.
  - Mobile container behavior should be tested in its real platform when authentication or WebView state matters.
- Anti-patterns:
  - Very small sample with minimal documentation.
  - No Salesforce metadata, Apex, LWC, or deployment value.
  - Old or external tutorial-style references should not become repo guidance without current verification.
- What our repo should learn:
  - Keep mobile/WebView guidance focused on runtime verification and not only desktop browser behavior.
- What should not be copied:
  - Swift project files, app configuration, storyboard files, tutorial text, or WebView implementation.
- Recommended integration priority: Ignore / Low.

### SalesForceAutomationFrameWork-main.zip

- Extract status: Extracted.
- Main technology: Java Selenium/TestNG Maven automation with report generation and screenshots.
- Salesforce relevance: Indirect. It is a browser automation framework, not a Salesforce DX reference.
- Useful patterns:
  - Browser automation can produce execution evidence through structured reports and screenshots.
  - TestNG suite files can represent browser or environment matrix execution.
  - Page/object utility separation is a useful UI-testing concept when applied cleanly.
- Anti-patterns:
  - Generated screenshots and HTML reports are committed in the archive.
  - Duplicate build-output folders are present.
  - No README was found for reliable setup or maintenance.
  - Configuration files and automation samples contain credential-like risk surfaces and must not be copied.
  - Older logging dependencies and generic UI automation should not be treated as Salesforce platform best practice.
- What our repo should learn:
  - Document UI automation evidence as generated artifacts, not committed source.
  - Add hygiene rules for test data, reports, screenshots, logs, and config files before publication.
- What should not be copied:
  - Java source, test data/config files, screenshots, generated HTML reports, logs, Maven config, or suite XML.
- Recommended integration priority: Ignore / Low.

### salesforce-commerce-cloud-libraries-master.zip

- Extract status: Extracted.
- Main technology: Salesforce Commerce Cloud cartridge-style JavaScript library packaging with linting, Jest tests, platform mocks, and CI.
- Salesforce relevance: Low for core Salesforce Platform; relevant only for Commerce Cloud-specific work.
- Useful patterns:
  - Platform-specific mocks can make unit tests run outside the hosted runtime.
  - CI that runs install, test, and lint is a reusable quality-gate pattern.
  - Large JavaScript packages need clear license and attribution boundaries.
- Anti-patterns:
  - Large vendored third-party library trees are not appropriate for this knowledge repo.
  - Old Node and workflow action versions should not be copied.
  - Commerce Cloud cartridge structure can mislead Apex/LWC/metadata guidance if mixed into core platform docs.
  - Many docs and snapshots are library-specific noise for this repo's purpose.
- What our repo should learn:
  - Keep Commerce Cloud references separate from core Salesforce DX, Apex, LWC, and metadata guidance.
  - If platform mocks are documented, present them as a testing concept, not copied implementations.
- What should not be copied:
  - Vendored libraries, cartridges, package files, mocks, tests, workflow YAML, generated docs, or library prose.
- Recommended integration priority: Ignore unless a future Commerce Cloud section is intentionally added.

### SalesForce-Testng-frameWork-master.zip

- Extract status: Extracted.
- Main technology: Java Selenium/TestNG Maven framework with logs, screenshots, test-output, reports, and browser automation files.
- Salesforce relevance: Indirect and low. Useful mainly as an anti-pattern source for repo hygiene.
- Useful patterns:
  - UI automation can capture report and screenshot evidence when kept outside source control.
  - Suite XML and Maven dependencies show a common browser automation stack.
- Anti-patterns:
  - Generated logs, reports, screenshots, and test-output files are committed.
  - No README was found for setup, maintenance, or quality expectations.
  - Credential-like and test-data risk surfaces appear in automation artifacts.
  - UI tests appear tightly coupled to generated output and local state.
- What our repo should learn:
  - Add explicit public-repo hygiene rules: never publish generated browser-test output, logs, screenshots, or data files.
  - Treat Selenium samples as optional external testing references, not Salesforce coding patterns.
- What should not be copied:
  - Java source, generated reports, logs, screenshots, test-output, data files, Maven config, or suite XML.
- Recommended integration priority: Ignore / Low.

### SalesForce-master.zip

- Extract status: Extracted.
- Main technology: Two minimal Salesforce DX/LWC quickstart-style projects with scratch-org config and generated local typings.
- Salesforce relevance: Direct but shallow.
- Useful patterns:
  - Minimal SFDX project layout is useful for new-user orientation.
  - Scratch definition plus `sfdx-project.json` demonstrates the minimum project metadata needed for Salesforce DX work.
  - Separate example projects can make quickstart comparisons easier when kept small.
- Anti-patterns:
  - Generated `.sfdx` local state appears in the archive and should not be committed.
  - README content is skeletal.
  - No meaningful test, lint, deployment, or metadata quality strategy is visible.
- What our repo should learn:
  - Reinforce `.sfdx/` and `.sf/` ignore rules.
  - Keep quickstart examples small but include actual validation commands and expected structure.
- What should not be copied:
  - Generated local state, TypeScript declaration files, scratch config, README stubs, or project files.
- Recommended integration priority: Low / Medium.

### Selenium.TestNG_FrameWork.SalesForceApplication-main.zip

- Extract status: Extracted.
- Main technology: Very small Java Selenium/TestNG sample with spreadsheet-driven data.
- Salesforce relevance: Very low.
- Useful patterns:
  - Data-driven UI test concept can be useful when sanitized and kept outside repo source.
- Anti-patterns:
  - Spreadsheet test data is bundled with source.
  - No README, setup guide, or quality contract.
  - No Salesforce DX metadata or platform code.
  - Credential-like and local automation risk surfaces are possible in browser automation samples.
- What our repo should learn:
  - Do not treat spreadsheet-driven UI samples as Salesforce development guidance.
  - Keep test data and credentials out of public examples.
- What should not be copied:
  - Java source, spreadsheet data, suite XML, browser automation logic, or hardcoded test data.
- Recommended integration priority: Ignore.

### salesforce-docs-master.zip

- Extract status: Extracted.
- Main technology: Markdown documentation site with standards, testing, deployment, security, logging, naming, source-control, Visualforce, triggers, and governance pages.
- Salesforce relevance: Medium to high for documentation taxonomy and governance patterns.
- Useful patterns:
  - Separate standards pages by topic: bulkification, triggers, testing, security, sharing, deployment, logging, naming, tooling, and source control.
  - Include contribution, changelog, install, terms, and open-source checklist documents for public docs governance.
  - Use a documentation site structure with pages and supporting images when a public docs site is the target.
  - Treat architecture, release management, and quality standards as first-class documentation, not only coding notes.
- Anti-patterns:
  - Organization-specific governance and role language should not be copied into this repo.
  - Screenshots and diagrams can contain context that is not reusable or may age quickly.
  - Technical claims from older standards docs must be verified against current Salesforce documentation before reuse.
- What our repo should learn:
  - Add stronger cross-links and taxonomy around governance, source control, testing, logging, deployment, and security.
  - Keep public docs governance separate from implementation examples.
  - Use open-source release and contribution checklists as a concept, rewritten for this repo.
- What should not be copied:
  - Organization-specific text, screenshots, diagrams, page prose, governance names, or standards wording.
- Recommended integration priority: Medium.

## Best Generic Patterns Found

1. Use a standard Salesforce DX source tree as the center of all deployable metadata examples.
2. Pair source-format metadata examples with dependency checks across objects, fields, layouts, FlexiPages, reports, dashboards, sharing, and triggers.
3. Require package scripts or documented commands for linting, unit tests, formatting, and validation.
4. Keep external reference maps curated, categorized, and link-checked.
5. Treat UI automation reports, screenshots, logs, and data files as generated artifacts, not source.
6. Keep browser/mobile/WebView testing guidance separate from Apex/LWC unit and metadata deployment guidance.
7. Use platform mocks and unit tests only as a testing concept unless the repo intentionally supports that platform.
8. Separate documentation governance from coding examples.
9. Verify older CI, Node, Java, Selenium, and Salesforce automation patterns before recommending them.
10. Do not vendor public example repos, third-party libraries, generated files, or screenshots into a knowledge repo.

## Worst Anti-Patterns Found

1. Committed generated reports, screenshots, logs, and test-output directories.
2. Generated local Salesforce state committed in example projects.
3. Automation config and data files with credential-like risk surfaces.
4. Selenium/TestNG samples without README, setup contract, or security hygiene.
5. Metadata samples with trigger code but no visible matching Apex test strategy.
6. Large vendored third-party library trees in a reference archive.
7. Old CI stacks and dependency versions that should not be copied.
8. Product-specific README prose used instead of developer onboarding docs.
9. Organization-specific governance docs that need rewriting before public reuse.
10. Shallow quickstart repos that show folder shape but not validation or quality gates.

## Zips To Ignore Or Treat As Low Value

- Ignore for Salesforce coding knowledge: `Selenium.TestNG_FrameWork.SalesForceApplication-main.zip`.
- Ignore except as UI automation hygiene anti-patterns: `SalesForceAutomationFrameWork-main.zip`, `SalesForce-Testng-frameWork-master.zip`.
- Ignore unless Commerce Cloud work is explicitly in scope: `salesforce-commerce-cloud-libraries-master.zip`.
- Low-value mobile-only reference: `SalesForce_WebViewTest-master.zip`.
- Low-value curated-reference signal only: `awesome-salesforce-master.zip`.

## Repo Integration Recommendations

### P0

- Add public-repo hygiene rules covering generated UI automation reports, screenshots, logs, spreadsheet data, local Salesforce state, and credential-like config files.
- Add a rule that any Salesforce metadata sample containing Apex triggers must also document a test and deployment strategy.
- Add destructive and generated-artifact checks to public safety and release checklists.

### P1

- Expand metadata docs with report/dashboard/folder dependency notes and source-format package structure examples.
- Expand command/quality docs with package-script expectations for lint, test, format, and validation.
- Add documentation taxonomy ideas from the docs archive to the repo index and governance files.

### P2

- Add optional notes about external link checking for curated reference maps.
- Add UI automation guidance that treats Selenium/WebView tests as optional evidence tools, not core Salesforce coding patterns.
- Keep Commerce Cloud references out of the core knowledge base unless a dedicated section is added.

## Validation Notes

- All nine zip files were extracted successfully into temporary isolated subfolders.
- The temporary extraction folder was not covered by `.gitignore`, so it should be removed after report validation.
- Permanent report files do not include archive source code, generated report content, screenshots, logs, metadata XML, or copied README prose.
