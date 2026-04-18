# Index

This is the navigation map for the public Salesforce coding knowledge base.

## Root Guides

- [README.md](README.md): repo purpose, audience, usage, and public-sanitization statement.
- [LICENSE](LICENSE): MIT license.
- [.gitignore](.gitignore): excludes local state, logs, temp files, and generated release archives.
- [.gitattributes](.gitattributes): normalizes text file line endings for cross-platform contributors.
- [CONTRIBUTING.md](CONTRIBUTING.md): public contribution workflow.
- [CONTRIBUTING_GUIDELINES.md](CONTRIBUTING_GUIDELINES.md): rules for adding public-safe lessons and examples.
- [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md): community behavior expectations.
- [SECURITY.md](SECURITY.md): how to report security or privacy issues.
- [CHANGELOG.md](CHANGELOG.md): version history and release categories.
- [RELEASES.md](RELEASES.md): release strategy and asset naming.
- [SALESFORCE_ARCHITECTURE_GUIDE.md](SALESFORCE_ARCHITECTURE_GUIDE.md): architecture principles for Salesforce systems.
- [SALESFORCE_APEX_GUIDE.md](SALESFORCE_APEX_GUIDE.md): Apex, triggers, services, async, SOQL, DML, and safety guidance.
- [SALESFORCE_LWC_GUIDE.md](SALESFORCE_LWC_GUIDE.md): LWC templates, state, refresh, navigation, styling, and mobile behavior.
- [SALESFORCE_AURA_GUIDE.md](SALESFORCE_AURA_GUIDE.md): Aura shells, template regions, and Aura/LWC boundaries.
- [SALESFORCE_VISUALFORCE_GUIDE.md](SALESFORCE_VISUALFORCE_GUIDE.md): Visualforce and PDF maintenance.
- [SALESFORCE_DEPLOYMENT_GUIDE.md](SALESFORCE_DEPLOYMENT_GUIDE.md): deployment process, validation, CLI usage, and test levels.
- [SALESFORCE_TESTING_GUIDE.md](SALESFORCE_TESTING_GUIDE.md): Apex test design and deployment-safe coverage.
- [SALESFORCE_METADATA_GUIDE.md](SALESFORCE_METADATA_GUIDE.md): metadata structure, FlexiPages, actions, permissions, and tabs.
- [SALESFORCE_RECORD_PAGE_GUIDE.md](SALESFORCE_RECORD_PAGE_GUIDE.md): record-page architecture, Dynamic Forms, layouts, related lists, and action visibility.
- [SALESFORCE_MOBILE_GUIDE.md](SALESFORCE_MOBILE_GUIDE.md): Salesforce mobile and webview lessons.
- [SALESFORCE_FILE_HANDLING_GUIDE.md](SALESFORCE_FILE_HANDLING_GUIDE.md): Salesforce Files, preview, download, upload, PDF, and rollup patterns.
- [SALESFORCE_DEBUGGING_GUIDE.md](SALESFORCE_DEBUGGING_GUIDE.md): root-cause debugging and instrumentation methods.
- [SALESFORCE_COMMON_FAILURES_AND_FIXES.md](SALESFORCE_COMMON_FAILURES_AND_FIXES.md): symptom-to-fix catalog.
- [SALESFORCE_DO_AND_DONT.md](SALESFORCE_DO_AND_DONT.md): practical Salesforce do/don't guidance.
- [SALESFORCE_COPY_PASTE_SAFE_PATTERNS.md](SALESFORCE_COPY_PASTE_SAFE_PATTERNS.md): safe snippets and skeletons.
- [SALESFORCE_PLATFORM_LIMITATIONS.md](SALESFORCE_PLATFORM_LIMITATIONS.md): platform limits and design constraints.
- [SOURCE_MAPPING.md](SOURCE_MAPPING.md): source categories analyzed, extraction choices, and public-safety exclusions.
- [PUBLIC_REPO_REVIEW_CHECKLIST.md](PUBLIC_REPO_REVIEW_CHECKLIST.md): manual checklist before publishing to GitHub.

## Docs

- [docs/engineering-principles.md](docs/engineering-principles.md): engineering posture for Salesforce work.
- [docs/public-sanitization-policy.md](docs/public-sanitization-policy.md): what must be removed or generalized before public release.

## Patterns

- [patterns/apex-service-controller-trigger.md](patterns/apex-service-controller-trigger.md): trigger, handler, service, controller boundaries.
- [patterns/lwc-patterns.md](patterns/lwc-patterns.md): practical LWC implementation patterns.
- [patterns/metadata-safe-deployment-structure.md](patterns/metadata-safe-deployment-structure.md): organizing deployable metadata safely.
- [patterns/record-page-patterns.md](patterns/record-page-patterns.md): record-page and FlexiPage composition patterns.
- [patterns/file-upload-and-rollup.md](patterns/file-upload-and-rollup.md): Salesforce Files upload, refresh, and rollup flow.
- [patterns/lookup-address-patterns.md](patterns/lookup-address-patterns.md): lookup display/update and compound address handling.
- [patterns/modal-edit-form-pattern.md](patterns/modal-edit-form-pattern.md): mobile-safe modal edit form structure.

## Examples

- [examples/apex/ProjectTrigger.trigger](examples/apex/ProjectTrigger.trigger): thin trigger entry point with matching trigger metadata.
- [examples/apex/ProjectTriggerHandler.cls](examples/apex/ProjectTriggerHandler.cls): trigger handler dispatch with matching class metadata.
- [examples/apex/ProjectService.cls](examples/apex/ProjectService.cls): service-layer logic with matching class metadata.
- [examples/apex/ProjectRollupQueueable.cls](examples/apex/ProjectRollupQueueable.cls): async rollup scaffold with matching class metadata.
- [examples/apex/ProjectActionController.cls](examples/apex/ProjectActionController.cls): LWC-facing Apex controller with matching class metadata.
- [examples/apex/ProjectActionControllerTest.cls](examples/apex/ProjectActionControllerTest.cls): controller and file test examples with matching class metadata.
- [examples/apex/TestDataFactory.cls](examples/apex/TestDataFactory.cls): required-field test data factory with matching class metadata.
- [examples/lwc/safeRecordAction/](examples/lwc/safeRecordAction/): record-page action LWC with loading, toast, refresh, and Apex call.
- [examples/lwc/refreshableRelatedFiles/](examples/lwc/refreshableRelatedFiles/): file list LWC with `refreshApex` and file navigation.
- [examples/lwc/templateGetterExample/](examples/lwc/templateGetterExample/): getter-based template-safe rendering.
- [examples/metadata/package-xml-notes.md](examples/metadata/package-xml-notes.md): narrow manifest notes.
- [examples/metadata/quick-action-and-flexipage-notes.md](examples/metadata/quick-action-and-flexipage-notes.md): activation path for actions and pages.

## Troubleshooting

- [troubleshooting/deployment-errors.md](troubleshooting/deployment-errors.md): deployment failures and fixes.
- [troubleshooting/lwc-template-errors.md](troubleshooting/lwc-template-errors.md): LWC compile and template errors.
- [troubleshooting/mobile-file-preview.md](troubleshooting/mobile-file-preview.md): mobile file preview/download failures.
- [troubleshooting/record-page-actions.md](troubleshooting/record-page-actions.md): action visibility and record-page activation failures.

## Prompts

- [prompts/fix-lwc-safely.md](prompts/fix-lwc-safely.md): prompt for repairing an LWC with metadata awareness.
- [prompts/production-safe-apex.md](prompts/production-safe-apex.md): prompt for Apex service/controller/trigger work.
- [prompts/debug-deployment.md](prompts/debug-deployment.md): prompt for deployment failure diagnosis.
- [prompts/build-record-page-lwc.md](prompts/build-record-page-lwc.md): prompt for record-page LWC implementation.
- [prompts/analyze-flexipages.md](prompts/analyze-flexipages.md): prompt for FlexiPage and action analysis.
- [prompts/mobile-safe-component.md](prompts/mobile-safe-component.md): prompt for mobile-safe Salesforce UI.
- [prompts/deployable-test-classes.md](prompts/deployable-test-classes.md): prompt for Apex tests that support deployment.
- [prompts/audit-metadata-safely.md](prompts/audit-metadata-safely.md): prompt for metadata review without leaking org details.

## Checklists

- [checklists/before-deployment.md](checklists/before-deployment.md): deployment preflight.
- [checklists/before-lwc.md](checklists/before-lwc.md): LWC preflight.
- [checklists/before-apex.md](checklists/before-apex.md): Apex preflight.
- [checklists/before-tests.md](checklists/before-tests.md): test-writing preflight.
- [checklists/before-record-page-ui-change.md](checklists/before-record-page-ui-change.md): record-page change preflight.
- [checklists/mobile-compatibility.md](checklists/mobile-compatibility.md): mobile compatibility checks.
- [checklists/production-safety.md](checklists/production-safety.md): production-readiness review.
- [checklists/metadata-deploy.md](checklists/metadata-deploy.md): metadata deploy review.

## Reference And Anti-Patterns

- [reference/glossary.md](reference/glossary.md): Salesforce vocabulary used in this repo.
- [reference/salesforce-cli-command-reference.md](reference/salesforce-cli-command-reference.md): CLI commands for validation, deploy, tests, and inspection.
- [reference/sanitized-lessons-catalog.md](reference/sanitized-lessons-catalog.md): public-safe catalog of extracted lessons.
- [anti_patterns/apex-anti-patterns.md](anti_patterns/apex-anti-patterns.md): Apex patterns to avoid.
- [anti_patterns/lwc-anti-patterns.md](anti_patterns/lwc-anti-patterns.md): LWC patterns to avoid.
- [anti_patterns/metadata-anti-patterns.md](anti_patterns/metadata-anti-patterns.md): metadata patterns to avoid.

## Topic Deep Dives

- [deployment/narrow-deploy-runbook.md](deployment/narrow-deploy-runbook.md): small-payload deploy process.
- [deployment/test-selection-guide.md](deployment/test-selection-guide.md): test-level and selected-test strategy.
- [lwc/template-rules.md](lwc/template-rules.md): getter-first LWC template rules.
- [lwc/navigation-toast-refresh.md](lwc/navigation-toast-refresh.md): navigation, toast, and refresh patterns.
- [lwc/modal-overlay-mobile.md](lwc/modal-overlay-mobile.md): mobile-safe overlays.
- [apex/dynamic-soql-safety.md](apex/dynamic-soql-safety.md): dynamic SOQL guardrails.
- [apex/async-dml-patterns.md](apex/async-dml-patterns.md): chunked DML, dedupe, and async work.
- [aura/aura-template-region-contracts.md](aura/aura-template-region-contracts.md): Aura template and region contracts.
- [visualforce/pdf-maintenance.md](visualforce/pdf-maintenance.md): Visualforce PDF practices.
- [metadata/flexipage-and-action-activation.md](metadata/flexipage-and-action-activation.md): page/action activation debugging.
- [testing/apex-test-patterns.md](testing/apex-test-patterns.md): Apex test examples and rules.
- [mobile/salesforce-mobile-webview-lessons.md](mobile/salesforce-mobile-webview-lessons.md): mobile webview behavior.
