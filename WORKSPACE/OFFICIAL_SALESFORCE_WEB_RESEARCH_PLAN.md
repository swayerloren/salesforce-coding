# Official Salesforce Web Research Plan

Generated: 2026-04-28

This plan defines targeted official-source research for strengthening the public-safe Salesforce coding knowledge repo. It intentionally does not attempt to read every Salesforce document. Each topic names official source URLs to research, repo files likely affected, questions Codex should answer, expected output types, and priority.

## Research Rules

- Use Salesforce official sources first: Developer Docs, Apex Developer Guide, LWC Developer Guide, Metadata API Developer Guide, Salesforce CLI docs, Code Analyzer docs, Salesforce DX docs, Salesforce Help, and Trailhead.
- Use community references only as optional secondary context and label them as community material.
- Do not copy long documentation text. Summarize in original repo guidance.
- Verify any statement phrased as required, unsupported, limit, or recommended against current official docs.
- Draft public-safe changes in `WORKSPACE/` before modifying knowledge files.

## Priority Summary

| Priority | Count | Purpose |
| --- | ---: | --- |
| P0 | 13 | Core platform rules that most directly affect correctness, deployability, security, and public-safe guidance. |
| P1 | 16 | High-value implementation details that strengthen common coding and troubleshooting tasks. |
| P2 | 10 | Important secondary platform areas or context-specific features. |
| P3 | 1 | Relevant but lower-frequency topic to research after higher-impact areas. |
| Total | 40 | Full requested topic set. |

## Topic Research Plan

### 1. Apex

- Priority: P0
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_intro.htm
  - https://resources.docs.salesforce.com/latest/latest/en-us/sfdc/pdf/salesforce_apex_developer_guide.pdf
  - https://trailhead.salesforce.com/content/learn/modules/apex_database
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/apex-service-controller-trigger.md`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/anti_patterns/apex-anti-patterns.md`
- Questions Codex should answer:
  - What are the official baseline rules for Apex class organization, DML, SOQL, exceptions, and transaction behavior?
  - Which Apex recommendations should become Codex pre-edit checks?
  - Which guidance belongs in guides versus anti-patterns?
- Expected output types: guide update, checklist, anti-pattern, example pattern

### 2. Apex Triggers

- Priority: P0
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_triggers.htm
  - https://developer.salesforce.com/docs/platform/data-models/guide/order-of-execution.html
  - https://trailhead.salesforce.com/content/learn/modules/apex_triggers
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/apex/`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/apex-service-controller-trigger.md`
- Questions Codex should answer:
  - What trigger context variables and operation phases must Codex account for?
  - How should order of execution affect trigger, Flow, validation, and async guidance?
  - What official trigger bulkification lessons should be added?
- Expected output types: guide update, checklist, anti-pattern, example pattern

### 3. Apex Tests

- Priority: P0
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_testing.htm
  - https://trailhead.salesforce.com/content/learn/modules/apex_testing
  - https://trailhead.salesforce.com/content/learn/modules/unit-testing-on-the-lightning-platform
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_TESTING_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/testing/apex-test-patterns.md`
  - `SALESFORCE_KNOWLEDGE/PROMPTS/deployable-test-classes.md`
- Questions Codex should answer:
  - What official rules govern test data isolation, assertions, async execution, and deployment coverage?
  - What should Codex require before claiming Apex tests passed?
  - How should tests avoid org-state assumptions?
- Expected output types: guide update, validation flow, checklist, prompt rule

### 4. Async Apex

- Priority: P1
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_async_overview.htm
  - https://trailhead.salesforce.com/content/learn/modules/asynchronous_apex
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/apex/async-dml-patterns.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_TESTING_GUIDE.md`
- Questions Codex should answer:
  - Which async tool is appropriate for callouts, long work, bulk work, scheduled work, or chained work?
  - What limits and test behavior are most important for Codex-generated changes?
  - How should retry and idempotency be documented?
- Expected output types: guide update, checklist, anti-pattern, example pattern

### 5. Batch/Queueable/Scheduled Apex

- Priority: P1
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_batch_interface.htm
  - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_queueing_jobs.htm
  - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_scheduler.htm
  - https://trailhead.salesforce.com/content/learn/modules/asynchronous_apex
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/TOPICS/apex/async-dml-patterns.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md`
- Questions Codex should answer:
  - When should Codex choose batch, queueable, scheduled Apex, or no async Apex?
  - What chaining, scope, and test restrictions should be surfaced?
  - What failure modes belong in the common failures guide?
- Expected output types: guide update, anti-pattern, example pattern, validation flow

### 6. SOQL/SOSL

- Priority: P1
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.soql_sosl.meta/soql_sosl/
  - https://developer.salesforce.com/docs/platform/sfvscode-extensions/guide/soql-writing.html
  - https://trailhead.salesforce.com/content/learn/modules/soql-for-admins
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/apex/dynamic-soql-safety.md`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/anti_patterns/apex-anti-patterns.md`
- Questions Codex should answer:
  - What official query rules are needed for dynamic SOQL and relationship queries?
  - How should Codex validate field names, operators, and bind variables?
  - Where should SOSL be recommended instead of SOQL?
- Expected output types: guide update, anti-pattern, example pattern, checklist

### 7. Security: Sharing/FLS/CRUD/User Mode/System Mode

- Priority: P0
- Official source URLs:
  - https://developer.salesforce.com/docs/platform/lwc/guide/apex-security
  - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_enforce_usermode.htm
  - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_with_security_enforced.htm
  - https://trailhead.salesforce.com/content/learn/modules/secure-serverside-development
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_PLATFORM_LIMITATIONS.md`
  - `SALESFORCE_KNOWLEDGE/CHECKLISTS/production-safety.md`
- Questions Codex should answer:
  - What official options exist for enforcing sharing, object access, field access, user mode, and system mode?
  - What should Codex check before exposing Apex to LWC, Flow, Experience Cloud, or integrations?
  - Which shortcuts are security anti-patterns?
- Expected output types: guide update, checklist, anti-pattern, prompt rule

### 8. LWC

- Priority: P0
- Official source URLs:
  - https://developer.salesforce.com/docs/platform/lwc/guide/get-started-introduction
  - https://developer.salesforce.com/docs/platform/lwc/guide/create-components-folder
  - https://trailhead.salesforce.com/content/learn/modules/lightning-web-components-basics
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/lwc/`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/lwc-patterns.md`
- Questions Codex should answer:
  - What are the official component structure, lifecycle, reactivity, and template constraints?
  - What should be checked before editing `.js`, `.html`, `.css`, and `.js-meta.xml`?
  - What current apiVersion or target metadata guidance should be added?
- Expected output types: guide update, checklist, anti-pattern, example pattern

### 9. LWC Wire Adapters

- Priority: P1
- Official source URLs:
  - https://developer.salesforce.com/docs/platform/lwc/guide/data-wire-service-about
  - https://developer.salesforce.com/docs/platform/lwc/guide/reference-wire-adapters-record
  - https://developer.salesforce.com/docs/platform/lwc/guide/reference-wire-adapters-object-info
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/lwc/navigation-toast-refresh.md`
  - `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/LWC_QUALITY_STRATEGY.md`
- Questions Codex should answer:
  - Which adapters are cacheable, reactive, refreshable, or UI API-backed?
  - What are correct refresh and error-handling patterns?
  - How should wire results be stored for later refresh?
- Expected output types: guide update, example pattern, checklist, prompt rule

### 10. LWC Imperative Apex

- Priority: P1
- Official source URLs:
  - https://developer.salesforce.com/docs/platform/lwc/guide/apex
  - https://developer.salesforce.com/docs/platform/lwc/guide/apex-call-imperative
  - https://developer.salesforce.com/docs/platform/lwc/guide/apex-result-caching
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/lwc-patterns.md`
- Questions Codex should answer:
  - When should LWC call Apex imperatively instead of using LDS, UI API, or wired Apex?
  - How should errors, cache invalidation, and record notification be handled?
  - Which Apex signatures and security expectations should be documented?
- Expected output types: guide update, example pattern, anti-pattern, prompt rule

### 11. LWC Navigation

- Priority: P1
- Official source URLs:
  - https://developer.salesforce.com/docs/platform/lwc/guide/use-navigate-basic
  - https://developer.salesforce.com/docs/platform/lwc/guide/reference-page-reference-type.html
  - https://developer.salesforce.com/docs/platform/lwc/guide/use-navigate-add-params-url
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/TOPICS/lwc/navigation-toast-refresh.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/anti_patterns/lwc-anti-patterns.md`
- Questions Codex should answer:
  - Which PageReference types should be used for records, objects, apps, web pages, and Experience Cloud?
  - When are hardcoded URLs unsafe?
  - What navigation differences matter on mobile or portals?
- Expected output types: guide update, anti-pattern, example pattern

### 12. LWC Forms

- Priority: P1
- Official source URLs:
  - https://developer.salesforce.com/docs/platform/lwc/guide/data-edit-record
  - https://developer.salesforce.com/docs/platform/lightning-component-reference/guide/lightning-record-edit-form.html
  - https://developer.salesforce.com/docs/platform/lwc/guide/data-get-user-input-intro.html
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/record-page-patterns.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/lwc/dynamic-record-fields.md`
- Questions Codex should answer:
  - When should forms use base record form components, LDS, UI API, or custom Apex?
  - How should field errors, validation, compound fields, and FLS be handled?
  - What dynamic field rendering rules should be added?
- Expected output types: guide update, example pattern, checklist, anti-pattern

### 13. LWC Testing/Jest

- Priority: P1
- Official source URLs:
  - https://developer.salesforce.com/docs/platform/lwc/guide/unit-testing
  - https://developer.salesforce.com/docs/platform/lwc/guide/unit-testing-using-wire-utility
  - https://github.com/salesforce/sfdx-lwc-jest
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/COMMANDS/LWC_TEST_COMMAND_MAP.md`
  - `SALESFORCE_KNOWLEDGE/PARAMETERS/LWC_JEST_PARAMETERS.md`
  - `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/LWC_QUALITY_STRATEGY.md`
- Questions Codex should answer:
  - What official Jest setup, mocking, wire testing, and command behavior should be documented?
  - What should Codex verify before claiming LWC tests passed?
  - Which test examples are safe and generic enough to add?
- Expected output types: command map, parameter map, validation flow, example pattern

### 14. Aura

- Priority: P2
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.lightning.meta/lightning/intro_framework.htm
  - https://developer.salesforce.com/docs/platform/lightning-component-reference/guide/aura-lightning.html
  - https://developer.salesforce.com/docs/platform/lwc/guide/migrate-introduction
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_AURA_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/aura/aura-template-region-contracts.md`
  - `SALESFORCE_KNOWLEDGE/INDEX.md`
- Questions Codex should answer:
  - Which Aura guidance remains important for templates, regions, legacy components, and LWC interop?
  - What should Codex avoid when modernizing Aura?
  - What official migration guidance belongs in repo docs?
- Expected output types: guide update, checklist, anti-pattern

### 15. Visualforce

- Priority: P2
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.pages.meta/pages/pages_intro.htm
  - https://developer.salesforce.com/docs/platform/sfvscode-extensions/guide/visualforce-writing.html
  - https://developer.salesforce.com/docs/platform/lwc/guide/use-visualforce
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_VISUALFORCE_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/visualforce/pdf-maintenance.md`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/anti_patterns/metadata-anti-patterns.md`
- Questions Codex should answer:
  - What Visualforce controller, extension, component, and static resource rules should be preserved?
  - What are safe modernization boundaries?
  - How should Visualforce be retrieved and deployed?
- Expected output types: guide update, checklist, anti-pattern

### 16. Visualforce PDF

- Priority: P1
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.pages.meta/pages/pages_output_pdf_considerations.htm
  - https://developer.salesforce.com/docs/atlas.en-us.pages.meta/pages/pages_compref_page.htm
  - https://developer.salesforce.com/docs/atlas.en-us.pages.meta/pages/pages_intro.htm
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_VISUALFORCE_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/visualforce/pdf-maintenance.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_FILE_HANDLING_GUIDE.md`
- Questions Codex should answer:
  - What official PDF rendering limitations affect CSS, fonts, images, page breaks, and generated output?
  - What belongs in a PDF output comparison checklist?
  - How should generated PDFs be handed off to Files or mobile?
- Expected output types: guide update, checklist, anti-pattern, example pattern

### 17. Metadata API/Source Format

- Priority: P0
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_intro.htm
  - https://developer.salesforce.com/docs/success/metadata-coverage-report/references/metadata-types/v66.0/metadata-types.html
  - https://resources.docs.salesforce.com/latest/latest/en-us/sfdc/pdf/api_meta.pdf
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/EXAMPLES/metadata/package-xml-notes.md`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/metadata-safe-deployment-structure.md`
- Questions Codex should answer:
  - Which metadata types require special path, dependency, coverage, or deploy handling?
  - What should be checked before editing high-risk metadata?
  - How should source format and metadata format differences be described?
- Expected output types: guide update, checklist, example pattern, anti-pattern

### 18. Salesforce DX Project Structure

- Priority: P0
- Official source URLs:
  - https://resources.docs.salesforce.com/latest/latest/en-us/sfdc/pdf/sfdx_dev.pdf
  - https://developer.salesforce.com/docs/platform/sfvscode-extensions/guide/project-setup.html
  - https://developer.salesforce.com/docs/platform/sfvscode-extensions/guide/source-format.html
- Repo files likely affected:
  - `FORCE_APP_DIRECTORY/README.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/CHECKLISTS/project-discovery.md`
- Questions Codex should answer:
  - What is the official project shape Codex should expect?
  - How should multiple package directories be discovered?
  - What local state should never be committed?
- Expected output types: guide update, checklist, prompt rule

### 19. Salesforce CLI Commands

- Priority: P0
- Official source URLs:
  - https://developer.salesforce.com/tools/salesforcecli
  - https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/
  - https://resources.docs.salesforce.com/latest/latest/en-us/sfdc/pdf/sfdx_cli_reference.pdf
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/COMMANDS/SALESFORCE_CLI_COMMAND_MAP.md`
  - `SALESFORCE_KNOWLEDGE/REFERENCE/salesforce-cli-command-reference.md`
  - `SALESFORCE_KNOWLEDGE/PARAMETERS/LOCAL_AUTOMATION_PARAMETERS.md`
- Questions Codex should answer:
  - Which `sf` commands should replace legacy `sfdx` examples?
  - Which flags should be documented for deploy, retrieve, test, data, org, and project commands?
  - What Windows quoting and command-discovery guidance is needed?
- Expected output types: command map, parameter map, checklist

### 20. Package.xml and Destructive Deployments

- Priority: P0
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_deploy_deleting_files.htm
  - https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/manifest_samples.htm
  - https://resources.docs.salesforce.com/latest/latest/en-us/sfdc/pdf/api_meta.pdf
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/TOPICS/deployment/destructive-deployment-safety.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_DEPLOYMENT_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/metadata-safe-deployment-structure.md`
- Questions Codex should answer:
  - What are the official manifest and destructiveChanges rules?
  - What validation, rollback, and dependency checks are required before deletion?
  - How should destructive changes be separated from feature deploys?
- Expected output types: guide update, validation flow, checklist, anti-pattern

### 21. Permission Sets/Profiles

- Priority: P1
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_permissionset.htm
  - https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_profile.htm
  - https://help.salesforce.com/s/articleView?id=sf.users_profiles.htm&type=5
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/CHECKLISTS/production-safety.md`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/anti_patterns/metadata-anti-patterns.md`
- Questions Codex should answer:
  - What official metadata behavior makes profiles high-risk?
  - When should permission sets be preferred?
  - How should object, field, class, tab, and custom permission access be reviewed?
- Expected output types: guide update, checklist, anti-pattern

### 22. FlexiPages/Lightning App Builder

- Priority: P1
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_flexipage.htm
  - https://help.salesforce.com/s/articleView?id=platform.lightning_app_builder.htm&type=5
  - https://developer.salesforce.com/docs/platform/lwc/guide/use-config-for-app-builder.html
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_RECORD_PAGE_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/metadata/flexipage-and-action-activation.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/metadata/quick-action-visibility-matrix.md`
- Questions Codex should answer:
  - How do FlexiPage metadata, component targets, form factors, and visibility rules interact?
  - What should Codex inspect before editing record pages?
  - Which Lightning App Builder concepts should be linked from repo docs?
- Expected output types: guide update, checklist, example pattern

### 23. Quick Actions/Actions/Buttons

- Priority: P1
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_quickaction.htm
  - https://developer.salesforce.com/docs/platform/lwc/guide/use-quick-actions.html
  - https://developer.salesforce.com/docs/platform/lwc/guide/migrate-quick-actions.html
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/TOPICS/metadata/quick-action-visibility-matrix.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_RECORD_PAGE_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/troubleshooting/record-page-actions.md`
- Questions Codex should answer:
  - What official metadata controls quick action target, placement, visibility, and LWC support?
  - How do Dynamic Actions, layout actions, Highlights Panel, and mobile overflow affect visibility?
  - What belongs in a troubleshooting matrix?
- Expected output types: guide update, checklist, anti-pattern, prompt rule

### 24. Salesforce Files: ContentDocument/ContentVersion/ContentDocumentLink

- Priority: P0
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_contentdocument.htm
  - https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_contentversion.htm
  - https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_contentdocumentlink.htm
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_FILE_HANDLING_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/files/contentdocument-lifecycle.md`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/file-upload-and-rollup.md`
- Questions Codex should answer:
  - What object relationships and field constraints govern Salesforce Files?
  - How should latest-version, link, visibility, delete, and preview behavior be documented?
  - What File object limitations affect Apex tests and mobile UI?
- Expected output types: guide update, checklist, example pattern, anti-pattern

### 25. Email Templates/Email Services/Email Logging

- Priority: P2
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_email_outbound.htm
  - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_email_inbound.htm
  - https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_emailtemplate.htm
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/TOPICS/communication/chatter-email-activity-patterns.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/CHECKLISTS/before-communication-automation.md`
- Questions Codex should answer:
  - What official Apex and metadata rules govern outbound email, inbound email, templates, and logging?
  - How should idempotency, threading, and privacy be documented?
  - What should never be copied from real email records?
- Expected output types: guide update, checklist, prompt rule, anti-pattern

### 26. Chatter/ConnectApi

- Priority: P2
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_namespace_ConnectApi.htm
  - https://developer.salesforce.com/docs/atlas.en-us.chatterapi.meta/chatterapi/intro_what_is_chatter_connect.htm
  - https://trailhead.salesforce.com/content/learn/modules/chatter_basics
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/TOPICS/communication/chatter-email-activity-patterns.md`
  - `SALESFORCE_KNOWLEDGE/CHECKLISTS/before-communication-automation.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md`
- Questions Codex should answer:
  - What official APIs should be used for feed posts, mentions, and Chatter data?
  - What permissions and actor-context risks matter?
  - How should mobile mention range behavior be documented without private text?
- Expected output types: guide update, checklist, anti-pattern, example pattern

### 27. Reports/Dashboards Metadata

- Priority: P2
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_report.htm
  - https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_dashboard.htm
  - https://developer.salesforce.com/docs/success/metadata-coverage-report/references/metadata-types/v66.0/metadata-types.html
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/PUBLIC_REPO_SAFETY_CHECK.md`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/anti_patterns/metadata-anti-patterns.md`
- Questions Codex should answer:
  - What dependencies and folder rules apply to reports and dashboards?
  - How should running user, filters, private names, and folder metadata be reviewed?
  - What public-safety scans are needed before publishing report metadata examples?
- Expected output types: guide update, checklist, anti-pattern

### 28. Experience Cloud/Portals

- Priority: P2
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.communities_dev.meta/communities_dev/communities_dev_intro.htm
  - https://developer.salesforce.com/docs/atlas.en-us.exp_cloud_lwr.meta/exp_cloud_lwr/intro.htm
  - https://developer.salesforce.com/docs/platform/lwc/guide/use-experience-builder.html
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_FILE_HANDLING_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/CHECKLISTS/production-safety.md`
- Questions Codex should answer:
  - What official differences affect LWC, Files, navigation, guest users, and permissions in Experience Cloud?
  - What should Codex check before assuming internal Lightning behavior applies to portals?
  - Which security checks are mandatory for guest or external users?
- Expected output types: guide update, checklist, prompt rule, anti-pattern

### 29. Mobile Salesforce App

- Priority: P1
- Official source URLs:
  - https://developer.salesforce.com/docs/platform/lwc/guide/mobile.html
  - https://developer.salesforce.com/docs/platform/mobile-sdk/guide/intro.html
  - https://help.salesforce.com/s/articleView?id=sf.salesforce_app.htm&type=5
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_MOBILE_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/mobile/mobile-camera-and-file-handoff.md`
  - `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/MOBILE_QUALITY_STRATEGY.md`
- Questions Codex should answer:
  - What official mobile runtime constraints affect LWC, Files, actions, navigation, and media?
  - What should be tested in real mobile or mobile simulator contexts?
  - What mobile claims should Codex avoid unless validated?
- Expected output types: guide update, checklist, validation flow, prompt rule

### 30. Offline/Mobile Considerations

- Priority: P2
- Official source URLs:
  - https://developer.salesforce.com/docs/platform/mobile-sdk/guide/offline-intro.html
  - https://developer.salesforce.com/docs/platform/lwc/guide/mobile.html
  - https://developer.salesforce.com/docs/platform/graphql/guide/graphql-wire-lwc.html
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_MOBILE_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/REFERENCE/EXTERNAL_INTELLIGENCE/LWC_MOBILE_STRATEGY.md`
  - `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/MOBILE_QUALITY_STRATEGY.md`
- Questions Codex should answer:
  - What official offline, priming, sync, GraphQL, and mobile data guidance should be captured?
  - What tasks require mobile lint or graph analysis?
  - How should offline constraints be separated from ordinary responsive UI?
- Expected output types: guide update, validation flow, checklist

### 31. Code Analyzer

- Priority: P0
- Official source URLs:
  - https://developer.salesforce.com/docs/platform/salesforce-code-analyzer/guide/code-analyzer.html
  - https://developer.salesforce.com/docs/platform/salesforce-code-analyzer/guide/analyze.html
  - https://developer.salesforce.com/docs/platform/salesforce-code-analyzer/guide/rules.html
- Repo files likely affected:
  - `TOOLS/SALESFORCE_CODE_ANALYZER.md`
  - `QUALITY_GATES/CODE_ANALYZER_RULES.md`
  - `SALESFORCE_KNOWLEDGE/PARAMETERS/CODE_ANALYZER_PARAMETERS.md`
- Questions Codex should answer:
  - What are the current install, run, rules, engine, output, and exit-code behaviors?
  - What parameter map needs updating for Code Analyzer v5?
  - How should Codex interpret findings and skipped engines?
- Expected output types: command map, parameter map, validation flow, checklist

### 32. Deployment Validation

- Priority: P0
- Official source URLs:
  - https://developer.salesforce.com/docs/platform/sfvscode-extensions/guide/deploy-changes.html
  - https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_project_commands_unified.htm
  - https://resources.docs.salesforce.com/latest/latest/en-us/sfdc/pdf/sfdx_dev.pdf
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_DEPLOYMENT_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/FIX_DEPLOYMENT_FLOW.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/deployment/test-selection-guide.md`
- Questions Codex should answer:
  - What official validation and deploy commands should be preferred?
  - What test levels and deploy-result evidence should Codex record?
  - How should narrow deploys, source tracking, and quick deploy be described?
- Expected output types: validation flow, command map, guide update, checklist

### 33. Debug Logs

- Priority: P1
- Official source URLs:
  - https://help.salesforce.com/s/articleView?id=sf.code_debug_log.htm&type=5
  - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_debugging_debug_log.htm
  - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_debugging_system_log_console.htm
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_DEBUGGING_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/troubleshooting/debug-log-triage.md`
  - `SALESFORCE_KNOWLEDGE/DOCS/public-sanitization-policy.md`
- Questions Codex should answer:
  - How should trace flags, log levels, and log retrieval be used safely?
  - What public-safe log summarization format should be documented?
  - What raw log data must never be published?
- Expected output types: guide update, checklist, prompt rule, anti-pattern

### 34. Governor Limits

- Priority: P0
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_gov_limits.htm
  - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_limits_intro.htm
  - https://trailhead.salesforce.com/content/learn/modules/apex_triggers/apex_triggers_bulk
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_PLATFORM_LIMITATIONS.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md`
- Questions Codex should answer:
  - Which limits should be in concise public-safe guidance instead of copied tables?
  - How should limit-aware code review differ for triggers, tests, async, and Files?
  - What governor-limit anti-patterns should be added?
- Expected output types: guide update, anti-pattern, checklist, prompt rule

### 35. Custom Metadata/Custom Settings

- Priority: P2
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_custommetadata.htm
  - https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_custommetadata.htm
  - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_customsettings.htm
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/metadata-safe-deployment-structure.md`
- Questions Codex should answer:
  - When should config be custom metadata, custom settings, custom labels, named credentials, or protected secrets?
  - What deploy/test behavior differs?
  - What should never be stored in custom metadata?
- Expected output types: guide update, checklist, anti-pattern, example pattern

### 36. Named Credentials/External Credentials

- Priority: P1
- Official source URLs:
  - https://developer.salesforce.com/docs/platform/named-credentials/guide/nc-about.html
  - https://developer.salesforce.com/docs/platform/named-credentials/guide/nc-use-oauth-cred-in-callout.html
  - https://help.salesforce.com/s/articleView?id=sf.nc_named_credentials.htm&type=5
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/CHECKLISTS/production-safety.md`
  - `SALESFORCE_KNOWLEDGE/DOCS/public-sanitization-policy.md`
- Questions Codex should answer:
  - What official model governs named credentials, external credentials, principals, and permissions?
  - How should callout code avoid storing or exposing secrets?
  - What deployment and public-safety caveats belong in repo docs?
- Expected output types: guide update, checklist, anti-pattern, prompt rule

### 37. Flow Interaction With Apex/LWC

- Priority: P1
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_annotation_InvocableMethod.htm
  - https://developer.salesforce.com/docs/platform/lwc/guide/use-flow.html
  - https://help.salesforce.com/s/articleView?id=sf.flow.htm&type=5
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_ARCHITECTURE_GUIDE.md`
- Questions Codex should answer:
  - What official invocable Apex and LWC-in-Flow constraints should Codex know?
  - How does Flow interact with trigger order of execution and recursion?
  - What should Codex check before changing Apex used by Flow?
- Expected output types: guide update, checklist, anti-pattern

### 38. Static Resources

- Priority: P2
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_staticresource.htm
  - https://developer.salesforce.com/docs/platform/lwc/guide/js-third-party-library.html
  - https://developer.salesforce.com/docs/platform/lwc/guide/create-resources.html
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/PUBLIC_REPO_SAFETY_CHECK.md`
- Questions Codex should answer:
  - What static resource metadata, loading, cache, and packaging rules matter?
  - How should third-party libraries be loaded and attributed?
  - What screenshots, images, generated files, or private assets should be blocked from public docs?
- Expected output types: guide update, checklist, anti-pattern, example pattern

### 39. Custom Labels/Translations

- Priority: P3
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_customlabels.htm
  - https://developer.salesforce.com/docs/platform/lwc/guide/create-labels
  - https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/meta_translations.htm
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/REFERENCE/glossary.md`
- Questions Codex should answer:
  - When should UI text be a label instead of hardcoded component text?
  - How are labels and translations represented in metadata?
  - What public-safe naming guidance should be added?
- Expected output types: guide update, checklist, example pattern

### 40. Platform Events

- Priority: P2
- Official source URLs:
  - https://developer.salesforce.com/docs/atlas.en-us.platform_events.meta/platform_events/platform_events_intro.htm
  - https://developer.salesforce.com/docs/atlas.en-us.platform_events.meta/platform_events/platform_events_subscribe_apex.htm
  - https://trailhead.salesforce.com/content/learn/modules/platform_events_basics
- Repo files likely affected:
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_ARCHITECTURE_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
  - `SALESFORCE_KNOWLEDGE/TOPICS/apex/async-dml-patterns.md`
- Questions Codex should answer:
  - When are Platform Events relevant versus queueable, batch, Flow, or direct DML?
  - What publish, subscribe, transaction, testing, and retry semantics should be documented?
  - What public-safe event naming and payload rules are needed?
- Expected output types: guide update, checklist, anti-pattern, example pattern

## Research Execution Plan

### P0 First Pass

1. Research Apex, triggers, tests, security, LWC, metadata, DX project structure, CLI, package/destructive deployments, Files, Code Analyzer, deployment validation, and governor limits.
2. Draft `WORKSPACE`-only proposed updates for the most affected guides and command maps.
3. Validate every normative statement against official docs.
4. Run public-safety scan before any repo knowledge update.

### P1 Second Pass

1. Research async Apex, batch/queueable/scheduled Apex, SOQL/SOSL, detailed LWC data/navigation/form/testing topics, Visualforce PDF, permissions, FlexiPages, actions, mobile, debug logs, named credentials, and Flow interactions.
2. Convert findings into targeted topic files, checklists, anti-patterns, and prompt rules.
3. Cross-link new topic files from `INDEX.md` only after approved content exists.

### P2 Third Pass

1. Research Aura, Visualforce, email, Chatter, reports/dashboards, Experience Cloud, offline/mobile, custom metadata/settings, static resources, and Platform Events.
2. Prioritize context-specific guidance and public-safety warnings.
3. Avoid expanding the repo into unrelated product areas unless there is a clear Codex coding use case.

### P3 Final Pass

1. Research custom labels and translations.
2. Add concise naming, translation, and LWC usage guidance only if it fills a real repo gap.

## Recommended Next Prompt

Using `WORKSPACE/OFFICIAL_SALESFORCE_WEB_RESEARCH_PLAN.md` and `WORKSPACE/OFFICIAL_SALESFORCE_WEB_RESEARCH_PLAN.json`, research only the P0 official Salesforce sources and draft public-safe proposed updates in `WORKSPACE/` first. Do not modify `SALESFORCE_KNOWLEDGE` yet, do not commit, and do not push.
