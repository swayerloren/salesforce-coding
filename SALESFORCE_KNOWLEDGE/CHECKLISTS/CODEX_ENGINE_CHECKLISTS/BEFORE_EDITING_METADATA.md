# Before Editing Metadata

Use this checklist before editing Salesforce metadata such as objects, fields, layouts, FlexiPages, quick actions, tabs, permission sets, profiles, record types, custom metadata, custom permissions, static resources, email templates, reports, dashboards, named credentials, external credentials, and record pages.

## Required Reads

- [ ] `START_HERE.md`
- [ ] `INSTRUCTIONS/`
- [ ] `SALESFORCE_KNOWLEDGE/INDEX.md`
- [ ] `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_METADATA_GUIDE.md`
- [ ] `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_RECORD_PAGE_GUIDE.md`
- [ ] `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_PLATFORM_LIMITATIONS.md`
- [ ] `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_DEPLOYMENT_GUIDE.md`
- [ ] `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_COMMON_FAILURES_AND_FIXES.md`
- [ ] `SALESFORCE_KNOWLEDGE/TOPICS/metadata/`
- [ ] `SALESFORCE_KNOWLEDGE/CHECKLISTS/metadata-deploy.md`
- [ ] `SALESFORCE_KNOWLEDGE/CHECKLISTS/before-record-page-ui-change.md`
- [ ] `SALESFORCE_KNOWLEDGE/COMMANDS/SALESFORCE_CLI_COMMAND_MAP.md`
- [ ] `SALESFORCE_KNOWLEDGE/PARAMETERS/`
- [ ] `SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/METADATA_QUALITY_STRATEGY.md`
- [ ] `SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/FIX_METADATA_FLOW.md`
- [ ] `QUALITY_GATES/RELEASE_GATE.md`

## Project And Path Checks

- [ ] Real Salesforce DX project located.
- [ ] Real `force-app/main/default` confirmed.
- [ ] `sfdx-project.json` inspected for package directories.
- [ ] Target metadata lives under the correct source-format path.
- [ ] Object-scoped metadata stays under `objects/<Object>/`.
- [ ] Field metadata path is `objects/<Object>/fields/*.field-meta.xml`.
- [ ] Validation rule path is `objects/<Object>/validationRules/*.validationRule-meta.xml`.
- [ ] Record type path is `objects/<Object>/recordTypes/*.recordType-meta.xml`.
- [ ] Compact layout path is `objects/<Object>/compactLayouts/*.compactLayout-meta.xml`.
- [ ] Top-level metadata folders checked when relevant: `layouts/`, `flexipages/`, `quickActions/`, `permissionsets/`, `profiles/`, `tabs/`, `applications/`, `customMetadata/`, `customPermissions/`, `staticresources/`, `email/`, `reports/`, and `dashboards/`.

## Metadata Name Checks

- [ ] Object API names verified in `objects/`.
- [ ] Field API names verified in field metadata.
- [ ] Layout names verified in `layouts/`.
- [ ] FlexiPage names verified in `flexipages/`.
- [ ] Quick action names and targets verified.
- [ ] Permission set names verified in `permissionsets/`.
- [ ] Profiles inspected only if the project uses them and the task requires it.
- [ ] Record types inspected if behavior or page assignment depends on them.
- [ ] Tabs and applications inspected when app navigation is involved.
- [ ] LWC/Aura metadata inspected if a component is involved.

## Record Page Checks

- [ ] Component `.js-meta.xml` targets and form factors inspected.
- [ ] FlexiPage component placement inspected.
- [ ] Object action overrides inspected for relevant action and form factor.
- [ ] Page activation or assignment path inspected.
- [ ] Layout assignment inspected when fields, buttons, related lists, or actions are involved.
- [ ] Dynamic Forms field sections inspected.
- [ ] Dynamic Actions visibility rules inspected.
- [ ] Compact layout and Highlights Panel behavior inspected.
- [ ] Mobile and desktop differences considered.
- [ ] Permissions checked: object, field, Apex class, custom permission, permission set, and profile if required.

## Metadata Safety Checks

- [ ] No metadata name is guessed.
- [ ] No component visibility is assumed from successful deployment alone.
- [ ] No placeholder deployable metadata is created unless explicitly requested and clearly scoped.
- [ ] No profile churn unless explicitly required.
- [ ] Permission sets are preferred over profiles when the project pattern allows it.
- [ ] No broad retrieve noise or unrelated formatting churn.
- [ ] No invented object, field, layout, FlexiPage, quick action, permission, profile, record type, tab, app, report, dashboard, static resource, package, named credential, or external credential name.
- [ ] No wide metadata payload is prepared for deployment.
- [ ] `package.xml` manifest scope is narrow and inspected if used.
- [ ] High-blast-radius files are handled deliberately: layouts, FlexiPages, app pages, profiles, permission sets, record types, reports, dashboards, static resources, and package manifests.
- [ ] Named credential and external credential values are not exposed.
- [ ] No private URLs, credentials, screenshots, exports, customer names, or secrets are added.

## Validation Plan

- [ ] Static XML/source inspection completed.
- [ ] `AUTOMATION/validate-salesforce-project.ps1` or `.sh` run when practical.
- [ ] Metadata validation flow followed.
- [ ] Salesforce Code Analyzer will run if available, or skipped reason will be documented.
- [ ] Narrow deploy dry-run scope identified if possible.
- [ ] Focused tests identified if Apex behavior is affected.
- [ ] XML inspection, project validation, Code Analyzer, deploy dry run, and tests will only be reported as passed when the exact check actually ran and passed.
- [ ] If validation cannot run, the reason will be stated.

## Memory And History

- [ ] Reusable metadata lesson will be recorded in `MEMORY/` if applicable.
- [ ] Verified project-specific metadata patterns will be recorded in `MEMORY/KNOWN_ORG_PATTERNS.md` if useful and public-safe.
- [ ] Chronological result will be recorded in `HISTORY/`.
