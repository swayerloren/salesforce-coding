# Project Discovery Template

Use this template after Codex has located the user's real Salesforce DX project.

The goal is to build a fast, evidence-based map of the project before making risky Apex, LWC, metadata, deployment, or architecture changes.

Do not invent object names, field names, class names, component names, permission names, or integration names. Verify them in the real `force-app/main/default` source before recording them.

## Safe Use

- Keep private data out of public docs.
- Use placeholders for customer, user, org, URL, and credential details.
- Record verified reusable facts in `MEMORY/KNOWN_ORG_PATTERNS.md`.
- Record temporary discovery notes in `WORKSPACE/`.
- If the user wants a project-specific architecture map, keep it generic enough for the repo or store it only where the user approves.

## Evidence And Confidence

Use this section in any project map.

```markdown
## Evidence And Confidence

### Confirmed From Source

- <Fact directly verified in force-app/main/default>

### Inferred From Source Shape

- <Likely relationship inferred from naming, callers, metadata, or tests>

### Unknown Or Not Yet Verified

- <Question that still needs source, org, or user confirmation>
```

## Discovery Commands

Run commands from the real Salesforce DX project root or pass the project path explicitly.

```powershell
rg --files -g sfdx-project.json
rg --files -g package.xml
rg --files force-app/main/default/classes
rg --files force-app/main/default/triggers
rg --files force-app/main/default/lwc
rg --files force-app/main/default/aura
rg --files force-app/main/default/pages
rg --files force-app/main/default/objects
rg --files force-app/main/default/flows
rg --files force-app/main/default/permissionsets
rg --files force-app/main/default/flexipages
rg --files force-app/main/default/namedCredentials
rg --files force-app/main/default/externalCredentials
```

Useful targeted searches:

```powershell
rg "with sharing|without sharing|inherited sharing" force-app/main/default/classes
rg "@AuraEnabled|@InvocableMethod|Queueable|Schedulable|Database.Batchable|future\(" force-app/main/default/classes
rg "lightning__RecordPage|lightning__RecordAction|lightningCommunity__" force-app/main/default/lwc
rg "Type\.forName|System\.Callable|NamedCredential|callout:" force-app/main/default/classes
```

## Project Overview Template

```markdown
# Project Overview

## Metadata Root

- Confirmed Salesforce DX source root:

## Main Business Or Functional Domains

| Domain | Purpose | Primary metadata | Confidence |
| --- | --- | --- | --- |
| <Domain> | <What it does> | <Objects/classes/LWCs/flows> | Confirmed/Inferred |

## Most Connected Records Or Metadata

| Name | Type | Why it matters | Verified references |
| --- | --- | --- | --- |
| <Object__c> | Object | <Lifecycle role> | <Trigger, LWC, tests, metadata> |

## Highest-Risk Areas

| Area | Risk | Why | Validation needed |
| --- | --- | --- | --- |
| <Area> | <Failure mode> | <Evidence> | <Test/deploy/manual check> |
```

## Module Index Template

Group the project by functional area, not only by metadata type.

```markdown
## Module Index

| Module | What it does | Main objects | Apex entry points | UI entry points | Best tests | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| <Module> | <Purpose> | <Object__c> | <Trigger/class/service> | <LWC/Aura/VF/page> | <Test class> | <Risks or gaps> |
```

## Object Model Template

Use this structure to map the data model after verifying names in source.

| Object | Role | Key relationships | Important fields | Automations | UI surfaces |
| --- | --- | --- | --- | --- | --- |
| `<Object__c>` | Central/supporting/config | Lookup or master-detail relationships | Verified API names | Trigger, flow, process, or async logic | LWC, page, layout, or action |

Lifecycle sketch:

```text
<Intake record>
  -> <Operating record>
       -> <Analysis/document/approval/financial records>
```

When using this template, keep object and field names verified. If uncertain, write `unknown` and inspect source.

## Apex Architecture Template

```markdown
## Apex Architecture

| Layer | Files | Pattern | Notes |
| --- | --- | --- | --- |
| Triggers | <Trigger names> | Thin trigger / handler / service | <Before/after behavior> |
| Handlers | <Handler classes> | Dispatcher and orchestration | <Required vs optional calls> |
| Services | <Service classes> | Business logic | <Shared behavior> |
| Controllers | <Controller classes> | LWC/Aura/VF/API entry | <Access and DTO notes> |
| Async | <Queueable/batch/scheduler/future> | Deferred work | <Callout/DML limits> |
| Tests | <Test classes> | Coverage and behavior | <Stable tests and gaps> |

## Required Vs Optional Dependencies

| Dependency | Called from | Required or optional | Behavior if missing | Verification |
| --- | --- | --- | --- | --- |
| <Class or metadata> | <Caller> | Required/Optional | <Fail loud/no-op/degraded> | <Source evidence> |
```

Use direct calls for required behavior. Treat dynamic `Type.forName` or `System.Callable` paths as optional only when absence is an intentional, documented contract.

## LWC Architecture Template

```markdown
## LWC Architecture

| Bundle | Surface | Parent/child role | Apex dependencies | Metadata targets | Mobile notes |
| --- | --- | --- | --- | --- | --- |
| <bundleName> | Record page/action/app/community | Host/child/modal/widget | <Controller methods> | <Targets from js-meta.xml> | <Form factors> |

## UI Patterns

- Host components:
- Modal components:
- Record actions:
- LDS or `lightning/uiRecordApi` usage:
- Apex-backed aggregation:
- Navigation and toast behavior:
- Mobile constraints:
```

Always inspect `.html`, `.js`, `.css`, and `.js-meta.xml` before changing a bundle.

## Integration Inventory Template

```markdown
## Integration Inventory

| Integration | Business purpose | Metadata/config | Apex entry points | UI entry points | Data leaves Salesforce | Data enters Salesforce | Failure modes | Safe test strategy |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| <External provider> | <Purpose> | <Named/external credential/custom metadata placeholder> | <Classes> | <Components> | <Outbound data category> | <Inbound data category> | <Expected failures> | <Mocks/feature flags/manual validation> |
```

Rules:

- Never record credential values.
- Verify named credential and external credential names in source before mentioning them.
- For public or portal access, document the server-side access check and avoid relying on client-side record IDs alone.
- For off-platform workers, document only the Salesforce-side contract unless the external worker source is also available and safe to inspect.

## Deployment And Testing Runbook Template

Use this structure when planning validation.

```markdown
## Deployment And Testing Runbook

### Changed Metadata

- <Exact deployable paths>

### Test Strategy

| Change area | Tests to run | Why | Confidence |
| --- | --- | --- | --- |
| <Area> | <Test class or command> | <Coverage/behavior reason> | High/Medium/Low |

### Dry-Run Command

sf project deploy start --target-org <alias> --dry-run --source-dir <path> --test-level RunSpecifiedTests --tests <TestClass>

### Real Deploy Command

Use the same command without `--dry-run` only after validation passes and the task requires deployment.

### Results

- Dry run:
- Tests:
- Deploy:
- Follow-up:
```

Do not deploy docs, workspace notes, memory, history, or this helper repo itself.
