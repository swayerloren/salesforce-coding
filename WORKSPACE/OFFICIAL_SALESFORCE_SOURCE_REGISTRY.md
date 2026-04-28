# Official Salesforce Source Registry

Generated: 2026-04-28

Scope: P0 and P1 topics from `WORKSPACE/OFFICIAL_SALESFORCE_WEB_RESEARCH_PLAN.md`.

This registry records official Salesforce sources to use when strengthening the public-safe Salesforce coding knowledge repo. It uses Salesforce Developer Docs, Salesforce Help, Salesforce DX, Salesforce CLI, Salesforce Code Analyzer, Salesforce Object Reference, Salesforce Metadata API, Salesforce-maintained GitHub projects where official tooling lives, and Trailhead learning content. No long passages are copied from the sources.

## Summary

- Topics covered: 29
- Source entries found: 88
- Topics still missing official sources: none
- Community sources used as authority: none
- Manual review notes: one original plan URL for VS Code project setup did not produce usable content in the browser session; use the official Source Format page and Salesforce DX Developer Guide PDF until the replacement URL is confirmed.

## Source Registry By Topic

### Apex

- Priority: P0
- Sources:
  - Apex Developer Guide: Apex Overview - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_intro.htm
  - Apex Developer Guide PDF - https://resources.docs.salesforce.com/latest/latest/en-us/sfdc/pdf/salesforce_apex_developer_guide.pdf
  - Trailhead: Apex Database - https://trailhead.salesforce.com/content/learn/modules/apex_database
- Key rules learned:
  - Apex guidance must separate transaction behavior, DML, SOQL, exception handling, and service boundaries.
  - Public examples should stay bulk-safe and avoid org-specific IDs, profiles, users, and data.
  - Trailhead is useful for learning support but Developer Docs should anchor normative rules.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/apex-service-controller-trigger.md`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/anti_patterns/apex-anti-patterns.md`
- Appears current: yes; version-sensitive details should be rechecked before editing limits or syntax claims.

### Apex Triggers

- Priority: P0
- Sources:
  - Apex Developer Guide: Apex Triggers - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_triggers.htm
  - Salesforce Architects: Order of Execution - https://developer.salesforce.com/docs/platform/data-models/guide/order-of-execution.html
  - Trailhead: Apex Triggers - https://trailhead.salesforce.com/content/learn/modules/apex_triggers
- Key rules learned:
  - Trigger guidance must account for context variables, before/after phases, order of execution, and Flow interactions.
  - Bulk trigger behavior should be taught as a default expectation, not an optimization.
  - Order of execution deserves a dedicated warning because UI symptoms can originate from validation rules, Flow, assignment, duplicate rules, or async work.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/apex/`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/apex-service-controller-trigger.md`
- Appears current: yes; order-of-execution details should be checked before adding exact step claims.

### Apex Tests

- Priority: P0
- Sources:
  - Apex Developer Guide: Testing Apex - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_testing.htm
  - Trailhead: Apex Testing - https://trailhead.salesforce.com/content/learn/modules/apex_testing
  - Trailhead: Unit Testing on the Lightning Platform - https://trailhead.salesforce.com/content/learn/modules/unit-testing-on-the-lightning-platform
- Key rules learned:
  - Tests need isolated data, meaningful assertions, async flushing, and deploy-aware coverage.
  - Codex should distinguish test execution, assertion quality, coverage, and deployment validation.
  - Trailhead can support examples, but repo guidance should avoid copying exercise-specific code.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_TESTING_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/testing/apex-test-patterns.md`
  - `SALESFORCE_KNOWLEDGE/PROMPTS/deployable-test-classes.md`
- Appears current: yes.

### Async Apex

- Priority: P1
- Sources:
  - Apex Developer Guide: Asynchronous Apex Overview - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_async_overview.htm
  - Trailhead: Asynchronous Apex - https://trailhead.salesforce.com/content/learn/modules/asynchronous_apex
- Key rules learned:
  - Async guidance should compare future, queueable, batch, scheduled, and platform-event alternatives by transaction and limit needs.
  - Tests and retry behavior need explicit handling.
  - Idempotency is essential for async work that touches external systems or generated artifacts.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/apex/async-dml-patterns.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_TESTING_GUIDE.md`
- Appears current: yes; exact limits require version check.

### Batch/Queueable/Scheduled Apex

- Priority: P1
- Sources:
  - Apex Developer Guide: Batch Apex - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_batch_interface.htm
  - Apex Developer Guide: Queueable Apex - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_queueing_jobs.htm
  - Apex Developer Guide: Scheduled Apex - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_scheduler.htm
  - Trailhead: Asynchronous Apex - https://trailhead.salesforce.com/content/learn/modules/asynchronous_apex
- Key rules learned:
  - Batch, queueable, and scheduled Apex need separate selection criteria.
  - Queueable chaining, batch scope behavior, and test restrictions are nuanced and should be warning-level guidance.
  - Scheduled work should be documented as operational behavior, not just code syntax.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/TOPICS/apex/async-dml-patterns.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md`
- Appears current: yes.

### SOQL/SOSL

- Priority: P1
- Sources:
  - SOQL and SOSL Reference - https://developer.salesforce.com/docs/atlas.en-us.soql_sosl.meta/soql_sosl/
  - Salesforce Extensions: Write SOQL Queries - https://developer.salesforce.com/docs/platform/sfvscode-extensions/guide/soql-writing.html
  - Trailhead: SOQL for Admins - https://trailhead.salesforce.com/content/learn/modules/soql-for-admins
- Key rules learned:
  - Dynamic query guidance must validate fields, operators, object names, bind values, and relationship paths.
  - SOSL should be researched separately from SOQL where search across objects is the actual requirement.
  - Query examples should avoid private object and field names.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/apex/dynamic-soql-safety.md`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/anti_patterns/apex-anti-patterns.md`
- Appears current: yes.

### Security: Sharing, FLS, CRUD, User Mode, System Mode

- Priority: P0
- Sources:
  - LWC Developer Guide: Secure Apex Classes - https://developer.salesforce.com/docs/platform/lwc/guide/apex-security
  - Apex Developer Guide: Enforce User Mode - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_enforce_usermode.htm
  - Apex Developer Guide: WITH SECURITY_ENFORCED - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_with_security_enforced.htm
  - Trailhead: Secure Server-Side Development - https://trailhead.salesforce.com/content/learn/modules/secure-serverside-development
- Key rules learned:
  - Apex generally runs with elevated permissions, so repo guidance must distinguish record sharing from object and field access.
  - LDS/UI API can simplify security for simple record access; Apex needs explicit security posture.
  - User mode operations, `stripInaccessible`, describe checks, and sharing keywords should be documented as different tools with different tradeoffs.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_PLATFORM_LIMITATIONS.md`
  - `SALESFORCE_KNOWLEDGE/CHECKLISTS/production-safety.md`
- Appears current: yes; this is a high-priority nuanced warning area.

### LWC

- Priority: P0
- Sources:
  - LWC Developer Guide: Get Started - https://developer.salesforce.com/docs/platform/lwc/guide/get-started-introduction
  - LWC Developer Guide: Component Folder - https://developer.salesforce.com/docs/platform/lwc/guide/create-components-folder
  - Trailhead: Lightning Web Components Basics - https://trailhead.salesforce.com/content/learn/modules/lightning-web-components-basics
- Key rules learned:
  - LWC is the preferred Lightning component model when choosing between LWC and Aura.
  - Component folder structure, metadata targets, lifecycle, and template constraints need concise repo guidance.
  - Base components and SLDS should be preferred where they satisfy the UI requirement.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/lwc/`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/lwc-patterns.md`
- Appears current: yes.

### LWC Wire Adapters

- Priority: P1
- Sources:
  - LWC Developer Guide: Understand the Wire Service - https://developer.salesforce.com/docs/platform/lwc/guide/data-wire-service-about
  - LWC Developer Guide: Record Wire Adapters - https://developer.salesforce.com/docs/platform/lwc/guide/reference-wire-adapters-record
  - LWC Developer Guide: Object Info Wire Adapters - https://developer.salesforce.com/docs/platform/lwc/guide/reference-wire-adapters-object-info
- Key rules learned:
  - Wire data is immutable from the component's perspective and should be copied before mutation.
  - Wire config cannot rely on undefined values; reactive variables and cache behavior are nuanced.
  - UI API adapters respect sharing and field/object permissions, but dynamic field use needs careful error handling.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/lwc/navigation-toast-refresh.md`
  - `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/LWC_QUALITY_STRATEGY.md`
- Appears current: yes; current repo has little explicit wire-service language.

### LWC Imperative Apex

- Priority: P1
- Sources:
  - LWC Developer Guide: Call Apex Methods - https://developer.salesforce.com/docs/platform/lwc/guide/apex
  - LWC Developer Guide: Call Apex Imperatively - https://developer.salesforce.com/docs/platform/lwc/guide/apex-call-imperative
  - LWC Developer Guide: Apex Result Caching - https://developer.salesforce.com/docs/platform/lwc/guide/apex-result-caching
- Key rules learned:
  - Imperative Apex is required for non-cacheable operations and developer-controlled mutations.
  - Imperative Apex returns a single response rather than a wire stream.
  - Caching and record refresh require explicit invalidation or notification patterns.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/lwc-patterns.md`
- Appears current: yes.

### LWC Navigation

- Priority: P1
- Sources:
  - LWC Developer Guide: Basic Navigation - https://developer.salesforce.com/docs/platform/lwc/guide/use-navigate-basic
  - LWC Developer Guide: PageReference Types - https://developer.salesforce.com/docs/platform/lwc/guide/reference-page-reference-type.html
  - LWC Developer Guide: Add Query Parameters - https://developer.salesforce.com/docs/platform/lwc/guide/use-navigate-add-params-url
- Key rules learned:
  - Navigation should use `NavigationMixin` and PageReference objects instead of hardcoded Lightning URLs.
  - PageReference support varies by target surface.
  - URL state parameters need explicit namespacing and should not carry private data.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/TOPICS/lwc/navigation-toast-refresh.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/anti_patterns/lwc-anti-patterns.md`
- Appears current: yes.

### LWC Forms

- Priority: P1
- Sources:
  - LWC Developer Guide: Edit a Record - https://developer.salesforce.com/docs/platform/lwc/guide/data-edit-record
  - Lightning Component Reference: lightning-record-edit-form - https://developer.salesforce.com/docs/platform/lightning-component-reference/guide/lightning-record-edit-form.html
  - LWC Developer Guide: Get User Input - https://developer.salesforce.com/docs/platform/lwc/guide/data-get-user-input-intro.html
- Key rules learned:
  - Base record forms are safer for standard record editing, validation, and field errors when they meet requirements.
  - Custom forms need explicit field errors, FLS expectations, compound field handling, and refresh behavior.
  - Dynamic field renderers need stronger rules than ordinary static forms.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/record-page-patterns.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/lwc/dynamic-record-fields.md`
- Appears current: yes.

### LWC Testing/Jest

- Priority: P1
- Sources:
  - LWC Developer Guide: Unit Testing - https://developer.salesforce.com/docs/platform/lwc/guide/unit-testing
  - LWC Developer Guide: Test Wire Adapters - https://developer.salesforce.com/docs/platform/lwc/guide/unit-testing-using-wire-utility
  - Salesforce-maintained GitHub: sfdx-lwc-jest - https://github.com/salesforce/sfdx-lwc-jest
- Key rules learned:
  - LWC Jest guidance should cover setup, mocks, wire adapters, DOM assertions, and limitations.
  - Salesforce-maintained GitHub is appropriate for tooling behavior, but official docs should anchor repo rules.
  - Codex should never claim Jest passed unless an actual test command ran.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/COMMANDS/LWC_TEST_COMMAND_MAP.md`
  - `SALESFORCE_KNOWLEDGE/PARAMETERS/LWC_JEST_PARAMETERS.md`
  - `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/LWC_QUALITY_STRATEGY.md`
- Appears current: yes; GitHub package behavior should be checked against installed package versions.

### Visualforce PDF

- Priority: P1
- Sources:
  - Visualforce Developer Guide: PDF Considerations - https://developer.salesforce.com/docs/atlas.en-us.pages.meta/pages/pages_output_pdf_considerations.htm
  - Visualforce Developer Guide: apex:page Component - https://developer.salesforce.com/docs/atlas.en-us.pages.meta/pages/pages_compref_page.htm
  - Visualforce Developer Guide: Introduction - https://developer.salesforce.com/docs/atlas.en-us.pages.meta/pages/pages_intro.htm
- Key rules learned:
  - Visualforce PDF rendering has important CSS, resource, page-break, and browser-engine limitations.
  - PDF pages should be treated as output contracts and tested visually.
  - Generated PDF handoff to Files or mobile should be documented separately from ordinary page rendering.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_VISUALFORCE_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/visualforce/pdf-maintenance.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_FILE_HANDLING_GUIDE.md`
- Appears current: yes; Visualforce PDF behavior is nuanced and should be warning-heavy.

### Metadata API/Source Format

- Priority: P0
- Sources:
  - Metadata API Developer Guide: Introduction - https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_intro.htm
  - Metadata Coverage Report - https://developer.salesforce.com/docs/success/metadata-coverage-report/references/metadata-types/v66.0/metadata-types.html
  - Metadata API Developer Guide PDF - https://resources.docs.salesforce.com/latest/latest/en-us/sfdc/pdf/api_meta.pdf
- Key rules learned:
  - Metadata support and behavior varies by type and release.
  - Coverage and metadata-type docs should be checked before adding retrieve/deploy claims.
  - Source format and metadata format differences should be explained without broad conversion advice.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/EXAMPLES/metadata/package-xml-notes.md`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/metadata-safe-deployment-structure.md`
- Appears current: yes; version-specific metadata coverage should always be rechecked.

### Salesforce DX Project Structure

- Priority: P0
- Sources:
  - Salesforce DX Developer Guide PDF - https://resources.docs.salesforce.com/latest/latest/en-us/sfdc/pdf/sfdx_dev.pdf
  - Salesforce Extensions: Source Format - https://developer.salesforce.com/docs/platform/sfvscode-extensions/guide/source-format.html
  - Salesforce CLI - https://developer.salesforce.com/tools/salesforcecli
- Key rules learned:
  - Salesforce DX source format is optimized for version control and differs from metadata format.
  - Project discovery needs to inspect `sfdx-project.json`, package directories, source directories, and local state.
  - Conversion and source-format migration guidance is nuanced and should not be condensed into unsafe one-liners.
- Repo files to update:
  - `FORCE_APP_DIRECTORY/README.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/CHECKLISTS/project-discovery.md`
- Appears current: mostly; original project setup URL needs manual replacement.

### Salesforce CLI Commands

- Priority: P0
- Sources:
  - Salesforce CLI Product Page - https://developer.salesforce.com/tools/salesforcecli
  - Salesforce CLI Command Reference - https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/
  - Salesforce CLI Reference PDF - https://resources.docs.salesforce.com/latest/latest/en-us/sfdc/pdf/sfdx_cli_reference.pdf
- Key rules learned:
  - Current guidance should prefer `sf` command families while noting legacy `sfdx` only when needed.
  - Command examples should be verified against installed CLI help before execution.
  - Parameter maps should distinguish deploy, retrieve, test, data, org, project, and plugin commands.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/COMMANDS/SALESFORCE_CLI_COMMAND_MAP.md`
  - `SALESFORCE_KNOWLEDGE/REFERENCE/salesforce-cli-command-reference.md`
  - `SALESFORCE_KNOWLEDGE/PARAMETERS/LOCAL_AUTOMATION_PARAMETERS.md`
- Appears current: yes; installed CLI can still differ by local version.

### Package.xml and Destructive Deployments

- Priority: P0
- Sources:
  - Metadata API: Deleting Files from an Organization - https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_deploy_deleting_files.htm
  - Metadata API: Sample package.xml Manifests - https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/manifest_samples.htm
  - Metadata API Developer Guide PDF - https://resources.docs.salesforce.com/latest/latest/en-us/sfdc/pdf/api_meta.pdf
- Key rules learned:
  - Destructive changes need a separate manifest and safer review workflow than ordinary deploys.
  - Metadata dependencies and rollback plans must be explicit before deletion.
  - Package manifests should stay narrow and source-type aware.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/TOPICS/deployment/destructive-deployment-safety.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_DEPLOYMENT_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/metadata-safe-deployment-structure.md`
- Appears current: yes; exact manifest behavior should be rechecked before publishing command examples.

### Permission Sets/Profiles

- Priority: P1
- Sources:
  - Metadata API: PermissionSet - https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_permissionset.htm
  - Metadata API: Profile - https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_profile.htm
  - Salesforce Help: Profiles - https://help.salesforce.com/s/articleView?id=sf.users_profiles.htm&type=5
- Key rules learned:
  - Profiles and permission sets are high-risk metadata surfaces because they can include broad access state.
  - Repo guidance should prefer targeted permission changes where project conventions allow.
  - Access review should include object, field, class, tab, app, custom permission, and Experience Cloud context when relevant.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/CHECKLISTS/production-safety.md`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/anti_patterns/metadata-anti-patterns.md`
- Appears current: yes; Help UI guidance can change.

### FlexiPages/Lightning App Builder

- Priority: P1
- Sources:
  - Metadata API: FlexiPage - https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_flexipage.htm
  - Salesforce Help: Lightning App Builder - https://help.salesforce.com/s/articleView?id=platform.lightning_app_builder.htm&type=5
  - LWC Developer Guide: Configure Components for App Builder - https://developer.salesforce.com/docs/platform/lwc/guide/use-config-for-app-builder.html
- Key rules learned:
  - FlexiPage behavior depends on component metadata, page metadata, app/profile/record-type activation, visibility rules, and form factor.
  - Lightning App Builder concepts need to be represented as metadata checks in Codex guidance.
  - Dynamic visibility and form-factor support are common sources of false fixes.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_RECORD_PAGE_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/metadata/flexipage-and-action-activation.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/metadata/quick-action-visibility-matrix.md`
- Appears current: yes.

### Quick Actions/Actions/Buttons

- Priority: P1
- Sources:
  - Metadata API: QuickAction - https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_quickaction.htm
  - LWC Developer Guide: Quick Actions - https://developer.salesforce.com/docs/platform/lwc/guide/use-quick-actions.html
  - LWC Developer Guide: Migrate Quick Actions - https://developer.salesforce.com/docs/platform/lwc/guide/migrate-quick-actions.html
- Key rules learned:
  - Quick action visibility is a metadata-chain issue, not only an LWC issue.
  - LWC quick action support, screen/headless behavior, target metadata, and layout placement need explicit rules.
  - Migration guidance should warn against assuming Aura and LWC actions have identical contracts.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/TOPICS/metadata/quick-action-visibility-matrix.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_RECORD_PAGE_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/troubleshooting/record-page-actions.md`
- Appears current: yes; high-priority nuanced warning area.

### Salesforce Files

- Priority: P0
- Sources:
  - Object Reference: ContentDocument - https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_contentdocument.htm
  - Object Reference: ContentVersion - https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_contentversion.htm
  - Object Reference: ContentDocumentLink - https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_contentdocumentlink.htm
- Key rules learned:
  - File guidance must distinguish logical file, version, and link objects.
  - Latest version, sharing visibility, link behavior, deletion, and preview are separate concerns.
  - File tests and rollups need warnings because object behavior is not equivalent to a single custom object row.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_FILE_HANDLING_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/files/contentdocument-lifecycle.md`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/file-upload-and-rollup.md`
- Appears current: yes; object field details should be checked against the active API version.

### Mobile Salesforce App

- Priority: P1
- Sources:
  - LWC Developer Guide: Mobile-Ready Components - https://developer.salesforce.com/docs/platform/lwc/guide/mobile.html
  - Mobile SDK Guide: Introduction - https://developer.salesforce.com/docs/platform/mobile-sdk/guide/intro.html
  - Salesforce Help: Salesforce Mobile App - https://help.salesforce.com/s/articleView?id=sf.salesforce_app.htm&type=5
- Key rules learned:
  - Mobile behavior must be treated as runtime-specific, especially for actions, navigation, media, files, and overlays.
  - Mobile SDK docs are useful context but should not be conflated with ordinary LWC-in-Salesforce-app behavior.
  - Validation claims should say whether real mobile verification actually happened.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_MOBILE_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/mobile/mobile-camera-and-file-handoff.md`
  - `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/MOBILE_QUALITY_STRATEGY.md`
- Appears current: yes; Help pages can change with app releases.

### Code Analyzer

- Priority: P0
- Sources:
  - Code Analyzer Overview - https://developer.salesforce.com/docs/platform/salesforce-code-analyzer/guide/code-analyzer.html
  - Code Analyzer CLI Commands - https://developer.salesforce.com/docs/platform/salesforce-code-analyzer/guide/analyze.html
  - Code Analyzer Rules - https://developer.salesforce.com/docs/platform/salesforce-code-analyzer/guide/rules.html
- Key rules learned:
  - Code Analyzer v5 uses the `code-analyzer` topic and v4 is retired.
  - Command guidance should verify plugin availability, required runtimes, engines, rules, selectors, output formats, and skipped engines.
  - Existing repo guidance still references the upstream GitHub repo heavily and should point to official docs first.
- Repo files to update:
  - `TOOLS/SALESFORCE_CODE_ANALYZER.md`
  - `QUALITY_GATES/CODE_ANALYZER_RULES.md`
  - `SALESFORCE_KNOWLEDGE/PARAMETERS/CODE_ANALYZER_PARAMETERS.md`
- Appears current: yes; source page was crawled recently and explicitly discusses v5.

### Deployment Validation

- Priority: P0
- Sources:
  - Salesforce Extensions: Deploy and Retrieve Changes - https://developer.salesforce.com/docs/platform/sfvscode-extensions/guide/deploy-changes.html
  - Salesforce CLI Project Commands - https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_project_commands_unified.htm
  - Salesforce DX Developer Guide PDF - https://resources.docs.salesforce.com/latest/latest/en-us/sfdc/pdf/sfdx_dev.pdf
- Key rules learned:
  - Deploy validation guidance should be command-family specific and should separate dry-run, deploy, retrieve, tests, and quick deploy.
  - Codex should record command, target org, source/manifest scope, test level, and result evidence.
  - Narrow deployment guidance needs official CLI flag verification.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_DEPLOYMENT_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/FIX_DEPLOYMENT_FLOW.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/deployment/test-selection-guide.md`
- Appears current: yes; installed CLI help should still be checked locally.

### Debug Logs

- Priority: P1
- Sources:
  - Salesforce Help: Debug Logs - https://help.salesforce.com/s/articleView?id=sf.code_debug_log.htm&type=5
  - Apex Developer Guide: Debug Logs - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_debugging_debug_log.htm
  - Apex Developer Guide: Developer Console System Log - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_debugging_system_log_console.htm
- Key rules learned:
  - Debug-log guidance should cover trace flags, log levels, collection, triage, retention, and privacy.
  - Raw logs can expose IDs, users, queries, payloads, and business data, so public docs should require summarization.
  - Logs are evidence, not final root cause by themselves.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_DEBUGGING_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/troubleshooting/debug-log-triage.md`
  - `SALESFORCE_KNOWLEDGE/DOCS/public-sanitization-policy.md`
- Appears current: yes; Help UI steps can change.

### Governor Limits

- Priority: P0
- Sources:
  - Apex Developer Guide: Governor Limits - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_gov_limits.htm
  - Apex Developer Guide: Execution Governors and Limits - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_limits_intro.htm
  - Trailhead: Bulk Apex Triggers - https://trailhead.salesforce.com/content/learn/modules/apex_triggers/apex_triggers_bulk
- Key rules learned:
  - Repo docs should summarize limit-aware patterns, not copy long limit tables.
  - Trigger, async, file, test, callout, and SOQL guidance should be tied back to governor-limit risk.
  - Exact numeric limits should be linked to official docs and verified before publication.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_PLATFORM_LIMITATIONS.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md`
- Appears current: yes; numeric limits are version-sensitive.

### Named Credentials/External Credentials

- Priority: P1
- Sources:
  - Named Credentials Guide: Overview - https://developer.salesforce.com/docs/platform/named-credentials/guide/nc-about.html
  - Named Credentials Guide: OAuth Callouts - https://developer.salesforce.com/docs/platform/named-credentials/guide/nc-use-oauth-cred-in-callout.html
  - Salesforce Help: Named Credentials - https://help.salesforce.com/s/articleView?id=sf.nc_named_credentials.htm&type=5
- Key rules learned:
  - Named credentials and external credentials separate endpoint, authentication configuration, principals, and user access.
  - Metadata cannot be treated as a place to expose or publish secret values.
  - Callout guidance should avoid hardcoded secrets and document permission assignment requirements.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/CHECKLISTS/production-safety.md`
  - `SALESFORCE_KNOWLEDGE/DOCS/public-sanitization-policy.md`
- Appears current: yes; packaging and principal population details need careful manual review before examples.

### Flow Interaction With Apex/LWC

- Priority: P1
- Sources:
  - Apex Developer Guide: InvocableMethod Annotation - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_annotation_InvocableMethod.htm
  - LWC Developer Guide: Use Flow - https://developer.salesforce.com/docs/platform/lwc/guide/use-flow.html
  - Salesforce Help: Flow Builder - https://help.salesforce.com/s/articleView?id=sf.flow.htm&type=5
- Key rules learned:
  - Flow can call Apex and host/interact with LWC, so Codex must inspect Flow entry points before changing shared code.
  - Invocable Apex has signature and bulk behavior constraints.
  - Order of execution and recursion guidance must include Flow as a first-class automation layer.
- Repo files to update:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_ARCHITECTURE_GUIDE.md`
- Appears current: yes; Flow runtime details can change and should be verified.

## Command And Parameter Verification Queue

- `sf project deploy start`: dry-run/deploy flags, manifest/source-dir behavior, test-level flags, wait/result output.
- `sf project retrieve start`: manifest/source-dir/metadata flags and output shape.
- `sf apex test run`: test-level, tests list, result format, wait, coverage, and async result retrieval flags.
- `sf code-analyzer run`: target, workspace, rule selector, config file, output, view, severity threshold, and engine behavior.
- `sf code-analyzer rules`: rule selector, workspace, output/view flags.
- `sfdx-lwc-jest`/npm scripts: repo-local package commands and wire-test utility behavior.
- Destructive deploy packaging: manifest names, `destructiveChanges` file placement, validation command, rollback command.
- Metadata retrieve/deploy for high-risk metadata: profiles, permission sets, FlexiPages, quick actions, reports, dashboards, and Files-related metadata.

## Manual Review / Access Notes

- Original plan URL needing manual replacement: `https://developer.salesforce.com/docs/platform/sfvscode-extensions/guide/project-setup.html`.
- A few older `atlas.en-us` pages render little content in the browser tool but remain official Salesforce Developer URLs. Before changing repo docs, open the current page manually or use the official PDF when exact details matter.
- No P0/P1 topic is missing official source coverage.
