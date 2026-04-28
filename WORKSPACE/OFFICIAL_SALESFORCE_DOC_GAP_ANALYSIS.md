# Official Salesforce Documentation Gap Analysis

Generated: 2026-04-28

Scope: P0 and P1 topics from the official research plan, compared against the current repo knowledge surface. This report is public-safe and summarizes gaps in original wording.

## Executive Summary

The repo already has good broad coverage for Apex, LWC, metadata, deployment, testing, Files, mobile, Visualforce, and public safety. The official-source review shows the next improvements should be more precise in areas where Salesforce behavior is nuanced:

- Security needs clearer differentiation between sharing, CRUD/FLS, user mode, system mode, LDS/UI API, and exposed Apex.
- LWC data guidance needs explicit wire-service, imperative Apex, form, and cache invalidation rules.
- Metadata guidance needs deeper source-format, coverage, package, destructive deployment, FlexiPage, quick action, permission, and profile warnings.
- Code Analyzer guidance should be updated to official v5 docs first, with the upstream GitHub repo as secondary implementation context.
- Files guidance should become more object-model precise around ContentDocument, ContentVersion, and ContentDocumentLink.
- Debug logs need a public-safe triage topic because raw logs can expose sensitive data.
- Flow needs to be treated as a first-class automation layer when changing Apex, triggers, LWC, and order-of-execution-sensitive behavior.

## Highest-Priority Missing Guidance

### P0

1. Security model matrix:
   - Missing: a compact matrix for record sharing, object access, field access, user-mode operations, system mode, `stripInaccessible`, and LDS/UI API.
   - Update:
     - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
     - `SALESFORCE_KNOWLEDGE/CHECKLISTS/production-safety.md`
     - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_PLATFORM_LIMITATIONS.md`

2. Order of execution and Flow-aware trigger warnings:
   - Missing: an official-source-backed warning that Flow, validation rules, duplicate rules, assignment, workflow-like automation, and async behavior can all affect trigger results.
   - Update:
     - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
     - `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/apex-service-controller-trigger.md`
     - New focused topic under `SALESFORCE_KNOWLEDGE/TOPICS/apex/`

3. Destructive deployment safety:
   - Missing: a dedicated runbook for `package.xml`, destructive changes, deletion validation, dependencies, rollback, and separation from feature deploys.
   - Update/create:
     - `SALESFORCE_KNOWLEDGE/TOPICS/deployment/destructive-deployment-safety.md`
     - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_DEPLOYMENT_GUIDE.md`
     - `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/metadata-safe-deployment-structure.md`

4. Code Analyzer v5 alignment:
   - Missing: official Code Analyzer v5 command and parameter alignment. Current repo heavily references upstream GitHub and should cite official docs first.
   - Update:
     - `TOOLS/SALESFORCE_CODE_ANALYZER.md`
     - `QUALITY_GATES/CODE_ANALYZER_RULES.md`
     - `SALESFORCE_KNOWLEDGE/PARAMETERS/CODE_ANALYZER_PARAMETERS.md`

5. Salesforce Files object lifecycle:
   - Missing: a dedicated topic that explains logical document, version, and link behavior without treating a file as one row.
   - Update/create:
     - `SALESFORCE_KNOWLEDGE/TOPICS/files/contentdocument-lifecycle.md`
     - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_FILE_HANDLING_GUIDE.md`
     - `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/file-upload-and-rollup.md`

6. Salesforce CLI command verification:
   - Missing: a stronger official-source queue for verifying `sf` command flags locally before using them.
   - Update:
     - `SALESFORCE_KNOWLEDGE/COMMANDS/SALESFORCE_CLI_COMMAND_MAP.md`
     - `SALESFORCE_KNOWLEDGE/REFERENCE/salesforce-cli-command-reference.md`
     - `SALESFORCE_KNOWLEDGE/PARAMETERS/LOCAL_AUTOMATION_PARAMETERS.md`

7. Governor-limit warning model:
   - Missing: concise limit-risk guidance tied to triggers, async, tests, Files, callouts, and dynamic SOQL. Avoid copying numeric tables.
   - Update:
     - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_PLATFORM_LIMITATIONS.md`
     - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
     - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md`

### P1

1. LWC wire-service and cache behavior:
   - Missing: explicit wire-service guidance for immutable data, undefined config values, reactive variables, UI API security behavior, compound fields, and async timing.
   - Update:
     - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md`
     - `SALESFORCE_KNOWLEDGE/TOPICS/lwc/navigation-toast-refresh.md`
     - `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/LWC_QUALITY_STRATEGY.md`

2. LWC imperative Apex:
   - Missing: a clear decision table for wired Apex, imperative Apex, LDS, UI API, and custom Apex.
   - Update:
     - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md`
     - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
     - `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/lwc-patterns.md`

3. LWC navigation:
   - Missing: PageReference-centered guidance and stronger hardcoded URL anti-patterns.
   - Update:
     - `SALESFORCE_KNOWLEDGE/TOPICS/lwc/navigation-toast-refresh.md`
     - `SALESFORCE_KNOWLEDGE/PATTERNS/anti_patterns/lwc-anti-patterns.md`

4. LWC forms:
   - Missing: base form versus custom form decision points, field error handling, compound field behavior, and dynamic field rendering.
   - Update/create:
     - `SALESFORCE_KNOWLEDGE/TOPICS/lwc/dynamic-record-fields.md`
     - `SALESFORCE_KNOWLEDGE/PATTERNS/good_patterns/record-page-patterns.md`

5. LWC Jest:
   - Missing: official docs and Salesforce-maintained package alignment for wire adapter tests, mocks, setup, command maps, and validation claims.
   - Update:
     - `SALESFORCE_KNOWLEDGE/COMMANDS/LWC_TEST_COMMAND_MAP.md`
     - `SALESFORCE_KNOWLEDGE/PARAMETERS/LWC_JEST_PARAMETERS.md`
     - `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/LWC_QUALITY_STRATEGY.md`

6. Visualforce PDF:
   - Missing: official PDF rendering limitations, generated output comparison checklist, and mobile/File handoff warnings.
   - Update:
     - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_VISUALFORCE_GUIDE.md`
     - `SALESFORCE_KNOWLEDGE/TOPICS/visualforce/pdf-maintenance.md`
     - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_FILE_HANDLING_GUIDE.md`

7. Permission sets and profiles:
   - Missing: official metadata-backed explanation of why profiles are high risk and how permission sets should be preferred where possible.
   - Update:
     - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md`
     - `SALESFORCE_KNOWLEDGE/PATTERNS/anti_patterns/metadata-anti-patterns.md`

8. FlexiPages and quick actions:
   - Missing: dedicated quick action visibility matrix with FlexiPage activation, component metadata, Dynamic Actions, layout actions, Highlights Panel, form factor, and permissions.
   - Update/create:
     - `SALESFORCE_KNOWLEDGE/TOPICS/metadata/quick-action-visibility-matrix.md`
     - `SALESFORCE_KNOWLEDGE/TOPICS/metadata/flexipage-and-action-activation.md`
     - `SALESFORCE_KNOWLEDGE/TOPICS/troubleshooting/record-page-actions.md`

9. Mobile Salesforce app:
   - Missing: stronger distinction between mobile app runtime, Mobile SDK, desktop responsive testing, and actual mobile verification.
   - Update:
     - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_MOBILE_GUIDE.md`
     - `SALESFORCE_KNOWLEDGE/TOPICS/mobile/mobile-camera-and-file-handoff.md`
     - `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/MOBILE_QUALITY_STRATEGY.md`

10. Debug logs:
   - Missing: public-safe debug log triage and sanitization process.
   - Update/create:
     - `SALESFORCE_KNOWLEDGE/TOPICS/troubleshooting/debug-log-triage.md`
     - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_DEBUGGING_GUIDE.md`
     - `SALESFORCE_KNOWLEDGE/DOCS/public-sanitization-policy.md`

11. Named credentials and external credentials:
   - Missing: official model for endpoint, external credential, principal, permission mapping, secret non-publication, and packaging caveats.
   - Update:
     - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
     - `SALESFORCE_KNOWLEDGE/CHECKLISTS/production-safety.md`
     - `SALESFORCE_KNOWLEDGE/DOCS/public-sanitization-policy.md`

12. Flow interaction:
   - Missing: Flow as a first-class Apex/LWC caller and order-of-execution actor.
   - Update:
     - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_ARCHITECTURE_GUIDE.md`
     - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`
     - `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_LWC_GUIDE.md`

## Nuanced Salesforce Behavior That Needs Warnings

- Apex security: sharing keywords do not enforce field and object permissions by themselves.
- LWC security: LDS/UI API and Apex do not have identical security behavior.
- Wire service: data timing is not lifecycle-sequential, config values cannot be undefined, and returned data should not be mutated directly.
- Compound fields: read and write patterns differ for compound fields and constituent fields.
- Quick actions: metadata can be correct while visibility still fails because of activation, layout, Dynamic Actions, overflow, form factor, or permission state.
- Visualforce PDF: stable PDF rendering can require older-looking markup and conservative styling.
- Files: latest version, logical document, and record link are distinct objects.
- Code Analyzer: v5 command shape differs from retired v4 scanner guidance.
- CLI: official docs and local installed help can differ; Codex should verify the installed command before running mutating commands.
- Debug logs: raw logs can contain private records, query values, user data, and IDs.
- Named credentials: metadata does not mean secrets are safe to publish.
- Flow: Flow can change the transaction behavior of Apex and trigger logic.

## Commands And Parameters To Verify Against Official Docs

- `sf project deploy start`
  - Verify: dry run flag, source directory, manifest, test level, selected tests, wait, JSON output, result display.
- `sf project retrieve start`
  - Verify: source directory, manifest, metadata type/name retrieval, output behavior.
- `sf apex test run`
  - Verify: tests list, suite support, test level support, coverage flags, result format, wait, synchronous/asynchronous behavior.
- `sf code-analyzer run`
  - Verify: `--target`, `--workspace`, `--rule-selector`, `--config-file`, `--view`, output file support, severity threshold, exit behavior, engine dependencies.
- `sf code-analyzer rules`
  - Verify: rule selector syntax, recommended rule behavior, engine filtering.
- LWC Jest commands
  - Verify: actual npm scripts in the target project, installed `sfdx-lwc-jest` version, wire adapter test utilities, and transform config.
- Destructive deployment files
  - Verify: package and destructive manifest names, placement, validation-only behavior, rollback strategy, and command flags.
- Metadata retrieve/deploy for high-risk types
  - Verify: FlexiPage, QuickAction, Profile, PermissionSet, Report, Dashboard, StaticResource, and source-format paths.

## Topics Covered

P0/P1 topics covered by the registry:

- Apex
- Apex triggers
- Apex tests
- Async Apex
- Batch/Queueable/Scheduled Apex
- SOQL/SOSL
- Security: sharing/FLS/CRUD/user mode/system mode
- LWC
- LWC wire adapters
- LWC imperative Apex
- LWC navigation
- LWC forms
- LWC testing/Jest
- Visualforce PDF
- Metadata API/source format
- Salesforce DX project structure
- Salesforce CLI commands
- Package.xml and destructive deployments
- Permission sets/profiles
- FlexiPages/Lightning App Builder
- Quick actions/actions/buttons
- Salesforce Files: ContentDocument/ContentVersion/ContentDocumentLink
- Mobile Salesforce app
- Code Analyzer
- Deployment validation
- Debug logs
- Governor limits
- Named Credentials/external credentials
- Flow interaction with Apex/LWC

## Topics Still Missing Sources

None for the P0/P1 pass.

Manual review remains needed for:

- The original VS Code project setup URL from the planning file, which did not produce usable content in this browser session.
- Any exact numeric governor limit or command flag before it is promoted from planning guidance into repo knowledge.

## Recommended Update Order

1. Code Analyzer v5 command and parameter alignment.
2. Security matrix for Apex/LWC data access.
3. Destructive deployment safety topic.
4. LWC wire/imperative/forms/navigation guidance.
5. Files lifecycle topic.
6. Quick action visibility matrix.
7. Debug log triage topic.
8. Flow interaction and order-of-execution warnings.
9. Governor-limit and deploy-validation refinements.
