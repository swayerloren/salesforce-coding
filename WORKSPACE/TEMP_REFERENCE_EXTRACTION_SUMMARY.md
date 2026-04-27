# Temporary Reference Extraction Summary

Date: 2026-04-27

## Scope

Reviewed a temporary reference folder outside the final public documentation set. The folder was used only as a source of ideas. No final public document depends on that folder.

## Files Reviewed

Full folder inventory was reviewed for structure, categories, duplication, and public-safety risk. The inventory contained 111 Markdown files and included root-level files plus categorized copies under:

- `00_START_HERE/`
- `01_GLOBAL_RULES/`
- `02_SYSTEMS/`
- `03_SHARED_PATTERNS/`
- `04_DEBUG_LOGS/`
- `05_CHANGE_HISTORY/`
- `06_ACTIVE_WORK/`
- `07_REFERENCE/`

Content-level review focused on these high-value files:

| File | Review purpose |
| --- | --- |
| `RECOMMENDED_DOC_STRUCTURE.md` | Documentation structure, canonical layers, runbook/history separation. |
| `AI_AGENT_DOCS_GAP_ANALYSIS.md` | Missing architecture-map concepts and source-vs-doc authority rules. |
| `README_DOC_PRECEDENCE.md` | Documentation precedence and conflict handling. |
| `README_DOC_UPDATE_RULES.md` | Where new docs and lessons should live. |
| `DEPLOYMENT_AND_TESTING_RUNBOOK.md` | Generic deployment and testing runbook shape. |
| `README_DYNAMIC_INTEGRATIONS.md` | Required-vs-optional dynamic dependency guidance. |
| `ORG_ARCHITECTURE_OVERVIEW.md` | Evidence/confidence pattern for architecture summaries. |
| `CUSTOM_OBJECTS_OVERVIEW.md` | Object model overview pattern. |
| `APEX_ARCHITECTURE.md` | Trigger, handler, service, controller, async, and test-layer mapping pattern. |
| `LWC_ARCHITECTURE.md` | LWC bundle, target, parent/child, Apex dependency, and mobile mapping pattern. |
| `PROJECT_INDEX.md` | Functional module index pattern. |
| `INTEGRATIONS_AND_AGENTS.md` | Integration inventory pattern and off-platform contract cautions. |
| `README_APEX_AND_TRIGGER_STANDARDS.md` | Thin-trigger, handler/service, and dynamic dependency safety concepts. |
| `README_LWC_STYLE_RULES.md` | Generic LWC readability, theme, interaction, and mobile safety concepts. |

## Useful Ideas Extracted

| Useful idea | Public-safe extraction |
| --- | --- |
| Documentation needs precedence rules. | Source is authoritative; docs route and preserve lessons; history and workspace notes are context only. |
| Current behavior must be separated from historical notes. | Added rules for treating history, archive, and workspace files as non-canonical unless reverified. |
| Broad tasks need project discovery before edits. | Added a template for mapping modules, object models, Apex architecture, LWC architecture, integrations, and validation strategy. |
| Architecture docs should distinguish confirmed facts, inferences, and unknowns. | Added an evidence/confidence template. |
| Salesforce projects are easier to navigate by business module, not only metadata type. | Added a functional module index template. |
| Integration docs should catalog metadata, entry points, data direction, failure modes, and test strategy. | Added an integration inventory template without provider names or credentials. |
| Required Apex dependencies should not be hidden behind optional dynamic calls. | Added dynamic dependency guidance in the project discovery template and documentation governance rules. |
| Deployment docs should capture exact changed paths, test strategy, dry-run command, real deploy command, and results. | Added a deployment/testing runbook template. |
| Duplicate docs should be consolidated carefully. | Added duplicate-handling rules that preserve reusable lessons without deleting anything during audit-only work. |

## Where Ideas Were Merged

| Merged location | Content added |
| --- | --- |
| `SALESFORCE_KNOWLEDGE/DOCS/documentation-governance.md` | Documentation precedence, conflict rules, update placement, canonical doc shape, duplicate handling, and public-safety rules. |
| `SALESFORCE_KNOWLEDGE/REFERENCE/project-discovery-template.md` | Evidence/confidence, project overview, module index, object model, Apex, LWC, integration, and deployment/testing templates. |
| `SALESFORCE_KNOWLEDGE/CHECKLISTS/project-discovery.md` | Checklist for mapping an unfamiliar Salesforce DX project before broad work. |
| `INSTRUCTIONS/CODEX_RULES.md` | Documentation authority rule requiring source verification and non-canonical treatment of history/workspace/archive notes. |
| `INSTRUCTIONS/DEVELOPMENT_WORKFLOW.md` | Project discovery guidance for unfamiliar or broad tasks. |
| `SALESFORCE_KNOWLEDGE/README.md` | Links to the new governance, discovery template, and discovery checklist. |
| `SALESFORCE_KNOWLEDGE/INDEX.md` | Task map entries for project discovery, integration review, and documentation updates. |
| `SALESFORCE_KNOWLEDGE/DOCS/README.md` | Link to documentation governance. |
| `SALESFORCE_KNOWLEDGE/REFERENCE/README.md` | Link to project discovery template. |
| `SALESFORCE_KNOWLEDGE/CHECKLISTS/README.md` | Link to project discovery checklist. |

## Items Skipped And Why

| Skipped content | Reason |
| --- | --- |
| Customer-specific object names, field names, component names, and workflows | They are not generic public-safe knowledge for this helper repo. |
| Integration provider names, credential names, org aliases, and external service details | These can expose private implementation details and must be verified in a user's real project instead. |
| Deploy IDs, test run IDs, coverage percentages, and org-specific failure history | These are point-in-time private operational data. |
| Local machine paths and folder references | Final public docs must not depend on local-only paths. |
| Duplicated root-level copies of categorized reference docs | Duplication itself was noted, but duplicate content was not copied. |
| Historical active-work, debug-log, and change-history notes | They are useful as examples of note categories, but not reliable current architecture for a public helper repo. |
| Placeholder deployable Apex, LWC, object, layout, or metadata examples in `FORCE_APP_DIRECTORY/` | The folder must remain a placeholder and instruction area only. |

## Public Safety Confirmation

- No credentials, tokens, usernames, org IDs, deploy IDs, customer names, private URLs, or local machine paths were copied.
- Extracted content was generalized into public-safe governance, templates, and checklists.
- Final public docs do not link to or depend on the temporary reference folder.
- The repo remains usable if the temporary reference folder is deleted.
