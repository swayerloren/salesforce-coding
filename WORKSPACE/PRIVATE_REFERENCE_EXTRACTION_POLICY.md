# Private Reference Extraction Policy

This policy controls how private local Salesforce notes and zipped example repositories may be used to improve the public Codex-ready Salesforce coding repo.

## Core Rule

Private sources are evidence for lessons, not content to copy. Extract only generic Salesforce development patterns, failure modes, checklists, validation steps, and architecture guidance that can be safely reused in any org.

## Allowed To Preserve

- Generic platform limitation or behavior.
- Reusable failure symptom.
- Root cause category.
- Safe fix pattern.
- Test strategy.
- Deployment or retrieval guardrail.
- Metadata relationship.
- Permission or sharing consideration expressed without private actors.
- Public Salesforce documentation link.
- Public example repo structure observation, without copied code.

## Must Remove Or Rewrite

- Customer, company, employee, user, vendor, or project-specific names.
- Emails, phone numbers, usernames, street addresses, domains, URLs, and local file paths.
- Salesforce org IDs, record IDs, deploy IDs, test run IDs, session IDs, package IDs, and named private page/object identifiers.
- Credentials, secrets, tokens, client IDs, client secrets, authorization headers, certificates, keys, connected app details, and named credential values.
- Raw business records, claim/job/invoice/payroll data, screenshots, HTML exports, debug logs, and copied stack traces that include private IDs.
- Private object, field, page, component, report, dashboard, flow, and permission set names unless rewritten to neutral placeholders.
- External repository source code or long copied prose from public archives.

## Required Rewrites

| Private reference shape | Public-safe rewrite |
| --- | --- |
| Real object names | `Project__c`, `Document__c`, `Work_Item__c`, `Request__c` |
| Real field names | `Status__c`, `Type__c`, `External_Id__c`, `Processed_At__c` |
| Real users or employees | `current user`, `record owner`, `integration user`, `service user` |
| Real customer or vendor | `external party`, `customer account`, `third-party provider` |
| Real URL or domain | `https://example.invalid/path` |
| Real org alias | `dev-org`, `qa-org`, `prod-org` |
| Real IDs | `001000000000000AAA`, `a00000000000000AAA`, or `<record-id>` |
| Real file path | `force-app/main/default/...` or `<local-reference-path>` |
| Raw debug log | Summarized symptom, exception family, root cause, and fix |

## Extraction Workflow

1. Identify the topic and target repo document before reading private content deeply.
2. Read the private source for reusable lessons only.
3. Write a sanitized lesson in `WORKSPACE/` first.
4. Strip all private nouns, IDs, URLs, local paths, data values, and screenshots.
5. Replace business-specific workflow details with generic Salesforce workflow language.
6. Cross-check technical claims against official Salesforce documentation.
7. Add a short source note such as `local private reference, sanitized` without naming private records.
8. Run a sensitivity scan before moving any material into repo knowledge files.
9. Review the proposed diff manually for accidental leakage.
10. Only then update public repo knowledge files in a separate approved pass.

## Topic Guardrails

- Apex: preserve bulkification, transaction, limit, sharing, async, and test lessons. Do not preserve private SOQL filters, object names, IDs, or business rules.
- LWC and Aura: preserve component lifecycle, data loading, target, mobile, and template constraints. Do not preserve private component names or private UI copy.
- Visualforce and PDFs: preserve rendering constraints, controller patterns, and PDF limitations. Do not preserve private page layouts, logo assets, or customer-facing document text.
- Metadata: preserve package, object, field, layout, FlexiPage, permission, and deployment dependency rules. Rewrite every private metadata API name.
- Files: preserve ContentDocument, ContentVersion, upload, preview, rollup, and file-type lessons. Do not preserve file names, document titles, storage URLs, or uploaded content.
- Mobile: preserve Salesforce mobile app limitations, viewport/action behavior, camera/webview lessons, and offline considerations. Do not preserve device owner data or location details.
- Email: preserve template, ingestion, threading, bounce/error, and automation patterns. Do not preserve real email addresses, headers, message bodies, or subject lines.
- Chatter: preserve FeedItem, mention, automated-process, and notification lessons. Do not preserve real user names, group names, or post bodies.
- Address and compound fields: preserve compound field behavior, validation approach, geocode/street-view constraints, and deployment notes. Do not preserve real addresses or map URLs.
- Reports and dashboards: preserve metadata/deployment and dashboard dependency lessons. Do not preserve real report names, metrics, users, or financial values.
- Portals and Experience Cloud: preserve guest-user, sharing, navigation, file, and LWR/Aura-site differences. Do not preserve site names, domains, or private guest-user configuration.
- Security and permissions: preserve CRUD/FLS, sharing, guest access, CSP, named credential, and connected-app guardrails. Never preserve secret values or private integration endpoints.

## Official Documentation Rule

Local notes can identify what matters, but official Salesforce documentation decides what becomes normative guidance. Any statement phrased as "must", "required", "supported", "unsupported", "limit", or "recommended" should be checked against current Salesforce documentation before publication.

Useful official anchors for this extraction pass:

- Lightning Web Components Developer Guide: https://developer.salesforce.com/docs/platform/lwc/guide/get-started-introduction
- LWC component versioning: https://developer.salesforce.com/docs/platform/lwc/guide/create-version-components.html
- LWC calling Apex: https://developer.salesforce.com/docs/platform/lwc/guide/apex
- Mobile-ready LWC guidance: https://developer.salesforce.com/docs/platform/lwc/guide/mobile.html
- Lightning Component Reference: https://developer.salesforce.com/docs/platform/lightning-component-reference/guide/get-started.html
- Metadata Coverage Report: https://developer.salesforce.com/docs/success/metadata-coverage-report/references/metadata-types/v66.0/metadata-types.html
- Salesforce CLI: https://developer.salesforce.com/tools/salesforcecli
- Deploy and retrieve workflow: https://developer.salesforce.com/docs/platform/sfvscode-extensions/guide/deploy-changes.html

## Sensitivity Scan Checklist

Before any extracted lesson leaves `WORKSPACE/`, search for:

- Email-like strings.
- Phone-like strings.
- Salesforce 15-character and 18-character IDs.
- `password`, `secret`, `token`, `client_id`, `client_secret`, `Authorization`, `Bearer`, `credential`, `certificate`, and `private key`.
- `http://` or `https://` links that are not official public documentation or neutral placeholders.
- Local absolute paths.
- Private object, field, component, report, dashboard, flow, permission set, and page names.
- Raw logs, stack traces, screenshots, generated HTML, and CSV/XLSX data.

## Acceptance Criteria

A lesson is safe to publish only when all of these are true:

- It is useful outside the original org.
- It contains no private identifiers or private operational data.
- It is rewritten in neutral Salesforce terms.
- It is technically checked against current official Salesforce documentation when it makes a platform claim.
- It includes no copied external source code.
- It is reviewed as a diff before being added to repo knowledge files.
