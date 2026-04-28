# Local Reference Source Inventory

Generated: 2026-04-28

This is a sanitized private-reference audit artifact. It records source counts, topic coverage, and public-safe extraction value without publishing local absolute paths, private document names, private project names, credentials, customer data, source code, or external repository code.

## Result

| Source type | Listed | Found | Missing |
| --- | ---: | ---: | ---: |
| Local folders | 2 | 2 | 0 |
| Local documents | 56 | 56 | 0 |
| Zip archives | 9 | 9 | 0 |
| Total | 67 | 67 | 0 |

Missing sources: none.

## Scope Notes

- Local absolute paths and private reference filenames are intentionally omitted from this public-safe report.
- The detailed JSON report uses source IDs and redacted path placeholders only.
- The reports do not quote private document content.
- Zip archives were inspected by archive metadata and file manifests only; no external source code was copied into the repo.
- Main repo knowledge files were not modified during the initial inventory task.

## Sanitized Source Groups

| Source group | Status | Inventory facts | Topic coverage |
| --- | --- | --- | --- |
| `folder-001` | Found | 42 files; Markdown and text | Broad coverage across Apex, LWC, Aura, Visualforce, Metadata, Files, Mobile, Email, Chatter, PDFs, Address, Deployment, Debugging, CLI, Reports, Portals, Security, Architecture |
| `folder-002` | Found | 111 Markdown files | Broad coverage across all requested topic categories; highest-value local source group |

## Sanitized Zip Sources

| Source ID | Status | Manifest facts | Main topic fit | Extraction value |
| --- | --- | --- | --- | --- |
| `zip-001` | Found | 31 entries; docs/assets | General architecture, CLI, Deployment | Low; use only as public reference orientation |
| `zip-002` | Found | 293 entries; many metadata XML files | Apex, LWC, Aura, Metadata, Deployment, CLI, Reports | Medium; useful metadata/package examples |
| `zip-003` | Found | 29 entries; mobile app project files | Mobile, Security, Architecture | Low; mobile/webview orientation |
| `zip-004` | Found | 73 entries; automation framework files | Debugging, Reports, Architecture | Low; testing framework patterns only |
| `zip-005` | Found | 2,496 entries; mostly JavaScript | Architecture, Debugging, Security | Low; Commerce Cloud-specific, keep separate |
| `zip-006` | Found | 194 entries; automation/report assets | Debugging, Reports, Architecture | Low; validation/reporting checklist ideas |
| `zip-007` | Found | 47 entries; SFDX/LWC quickstart-style files | LWC, CLI, Metadata | Medium; small public SFDX/LWC structure reference |
| `zip-008` | Found | 6 entries; automation framework files | Debugging, Architecture | Low; small testing reference |
| `zip-009` | Found | 59 entries; mostly Markdown/docs assets | Apex, Visualforce, Metadata, Deployment, Debugging, Security, Architecture | Medium; structure ideas only |

## Document Topic Classification

The full per-source classification is in `WORKSPACE/LOCAL_REFERENCE_SOURCE_INVENTORY.json` using sanitized source IDs. High-signal document clusters are:

| Cluster | Main topics |
| --- | --- |
| Development rules and architecture | General architecture, Metadata, Deployment, Debugging, Security |
| Apex and metadata workflows | Apex, Metadata, Deployment, Debugging |
| LWC and portal work | LWC, Portals, Metadata, Security |
| Files and camera/photo flows | Files, Mobile, LWC, PDFs, Debugging |
| Email and form ingestion | Email, Apex, Metadata, Security, Debugging |
| Chatter automation | Chatter, Apex, Security, Mobile |
| Address logic | Address/compound fields, Metadata, LWC, Mobile |
| Visualforce and PDFs | Visualforce, PDFs, Apex, Files |
| Deployment and CLI | CLI, Deployment, Metadata, Debugging |
| Reporting and operational dashboards | Reports/dashboards, Apex, Metadata, Security |

## Topic Coverage

| Topic | Coverage | Notes |
| --- | --- | --- |
| Apex | Strong | Many local workflow docs plus public metadata example repos. |
| LWC | Strong | Portal, mobile, dynamic field, files, camera/photo, and official LWC docs. |
| Aura | Moderate | Mostly legacy/reference and a public metadata example archive. |
| Visualforce | Moderate | VF and PDF-focused notes plus official Visualforce/LWC interop references. |
| Metadata | Strong | Object setup, field setup, deployment, package, and metadata example archives. |
| Files | Strong | File type, rollup, upload/photo/viewer/capture flows. |
| Mobile | Strong | Mobile action bar, Chatter, camera/photo, street view, and mobile/webview references. |
| Email | Strong | Campaign, reply ingestion, form submission, out-of-office notes. |
| Chatter | Moderate | Mobile Chatter and automated post/mention notes. |
| PDFs | Moderate | Visualforce/PDF, field-to-PDF, and camera/report PDF notes. |
| Address/compound fields | Moderate | Compound address, validation, street view notes. |
| Deployment | Strong | CLI, destructive deployment, metadata deployment and debug notes. |
| Debugging | Strong | Debug logs, errors, deploy failures, file/mobile errors, and test automation archives. |
| CLI | Moderate | Dedicated CLI notes plus official Salesforce CLI docs. |
| Reports/dashboards | Moderate | Dashboards, rollups, operational reporting, public example report metadata. |
| Portals/Experience Cloud | Moderate | Portal LWC and file-access notes. |
| Security/permissions | Strong | Architecture, portals, files, email, metadata, and official source docs. |
| General architecture | Strong | Architecture indexes, development rules, metadata setup, external examples. |

## Public-Safe Extraction Policy

Use these sources only to extract:

- generic Salesforce patterns,
- public-safe checklists,
- repeated failure modes,
- validation flows,
- anti-patterns,
- pseudocode with placeholder names.

Do not publish:

- private local paths,
- private document names,
- private project names,
- customer data,
- org IDs,
- record IDs,
- credentials or tokens,
- raw logs,
- email or Chatter bodies,
- screenshots or generated reports,
- external source code.
