# Metadata Topic Notes

Use these notes before editing Salesforce metadata under `force-app/main/default`.

## Required Metadata Workflow

1. Locate the real Salesforce DX project.
2. Confirm `force-app/main/default`.
3. Inspect existing metadata before editing.
4. Verify API names from source.
5. Identify the activation, assignment, permission, and dependency chain.
6. Make the smallest source-format-safe change.
7. Validate with static inspection, Salesforce Code Analyzer, and narrow deploy validation when available.

## Common Paths

| Area | Path |
| --- | --- |
| Objects | `force-app/main/default/objects/` |
| Fields | `force-app/main/default/objects/<Object>/fields/` |
| Validation rules | `force-app/main/default/objects/<Object>/validationRules/` |
| Record types | `force-app/main/default/objects/<Object>/recordTypes/` |
| Compact layouts | `force-app/main/default/objects/<Object>/compactLayouts/` |
| Layouts | `force-app/main/default/layouts/` |
| FlexiPages | `force-app/main/default/flexipages/` |
| Quick actions | `force-app/main/default/quickActions/` |
| Permission sets | `force-app/main/default/permissionsets/` |
| Profiles | `force-app/main/default/profiles/` |
| Tabs | `force-app/main/default/tabs/` |
| Applications | `force-app/main/default/applications/` |
| Custom metadata | `force-app/main/default/customMetadata/` |
| Custom permissions | `force-app/main/default/customPermissions/` |
| Static resources | `force-app/main/default/staticresources/` |
| Email | `force-app/main/default/email/` |
| Reports | `force-app/main/default/reports/` |
| Dashboards | `force-app/main/default/dashboards/` |

## High-Risk Metadata

Treat these as high blast radius:

- profiles,
- layouts,
- FlexiPages,
- applications,
- record types,
- permission sets,
- package manifests,
- dashboards and reports with business-specific names,
- static resources that may contain private files.

## Record Page Root Causes

For page visibility issues, check:

- component target and form factor,
- FlexiPage component placement,
- object action override,
- app/profile/record type activation,
- layout assignment,
- quick action placement,
- Dynamic Actions visibility,
- object and field permissions,
- Apex class access,
- mobile vs desktop page differences.

## Package Manifest Safety

Use a narrow `package.xml` when validation or deployment needs a manifest. Include changed metadata and required dependencies only. Avoid wildcard deployments for profiles, layouts, FlexiPages, permission sets, and applications unless the owner explicitly approves the risk.

## Codex Rules

- Do not guess metadata names.
- Do not blindly edit profiles.
- Do not assume deployment equals visibility.
- Do not deploy wide metadata payloads.
- Do not add private URLs, credentials, or customer data to metadata examples.
