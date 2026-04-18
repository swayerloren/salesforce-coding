# Salesforce Coding

[![Release](https://img.shields.io/github/v/release/swayerloren/salesforce-coding?sort=semver)](https://github.com/swayerloren/salesforce-coding/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Salesforce](https://img.shields.io/badge/Salesforce-LWC%20%7C%20Apex%20%7C%20Metadata-blue)](INDEX.md)

Public Salesforce coding knowledge base for Codex and developers: LWC, Apex, metadata, debugging, deployment, testing, platform limitations, and production-safe patterns.

This repository turns real Salesforce implementation and debugging lessons into reusable public guidance. Private business details, customer-specific workflows, org identifiers, deploy ids, usernames, sensitive URLs, credentials, and internal-only notes were removed or generalized before publication.

## Start Here

- Read [INDEX.md](INDEX.md) for the full navigation map.
- Use [SALESFORCE_DO_AND_DONT.md](SALESFORCE_DO_AND_DONT.md) before changing Salesforce code.
- Use [SALESFORCE_COMMON_FAILURES_AND_FIXES.md](SALESFORCE_COMMON_FAILURES_AND_FIXES.md) when a deploy, LWC, record page, file flow, or test fails.
- Use [checklists/](checklists/) before writing Apex, LWC, tests, metadata, or deployment changes.
- Use [prompts/](prompts/) when asking Codex or another AI coding agent to work on Salesforce safely.

## Who This Is For

- Salesforce developers building Apex, LWC, Aura, Visualforce, and metadata.
- Admins and architects reviewing Lightning record pages, actions, Dynamic Forms, files, and mobile behavior.
- Code reviewers looking for production-safe Salesforce patterns.
- AI coding agents that need practical Salesforce constraints before editing code.
- Teams that want reusable deployment, debugging, and testing habits.

## What It Includes

- Apex service, trigger, controller, async, SOQL, DML, and test patterns.
- LWC template, getter, navigation, toast, refresh, modal, styling, and mobile patterns.
- Metadata guidance for FlexiPages, record pages, quick actions, layouts, permissions, and activation.
- Deployment runbooks for narrow payloads, test selection, validation, and release safety.
- Salesforce Files guidance for upload, preview, download, latest version, rollups, and mobile quirks.
- Visualforce PDF, Aura template, and legacy platform maintenance guidance.
- Troubleshooting guides, anti-patterns, public-safe examples, reusable prompts, and review checklists.

## Most Useful Docs

- [SALESFORCE_APEX_GUIDE.md](SALESFORCE_APEX_GUIDE.md)
- [SALESFORCE_LWC_GUIDE.md](SALESFORCE_LWC_GUIDE.md)
- [SALESFORCE_DEPLOYMENT_GUIDE.md](SALESFORCE_DEPLOYMENT_GUIDE.md)
- [SALESFORCE_TESTING_GUIDE.md](SALESFORCE_TESTING_GUIDE.md)
- [SALESFORCE_METADATA_GUIDE.md](SALESFORCE_METADATA_GUIDE.md)
- [SALESFORCE_RECORD_PAGE_GUIDE.md](SALESFORCE_RECORD_PAGE_GUIDE.md)
- [SALESFORCE_FILE_HANDLING_GUIDE.md](SALESFORCE_FILE_HANDLING_GUIDE.md)
- [SALESFORCE_PLATFORM_LIMITATIONS.md](SALESFORCE_PLATFORM_LIMITATIONS.md)

## Common Failures And Fixes

Start with [SALESFORCE_COMMON_FAILURES_AND_FIXES.md](SALESFORCE_COMMON_FAILURES_AND_FIXES.md) for practical fixes to repeated Salesforce issues, including:

- production test-level errors,
- selected-test coverage failures,
- LWC template compile errors,
- stale related-list refresh behavior,
- mobile file preview/download problems,
- FlexiPage and quick-action visibility confusion,
- compound address field failures,
- Salesforce Files row-lock problems,
- Visualforce PDF rendering surprises.

## Prompt Library

The [prompts/](prompts/) folder contains reusable prompts for Codex and other AI agents:

- fixing an LWC safely,
- creating production-safe Apex,
- debugging deployments,
- building record-page LWCs,
- analyzing FlexiPages,
- creating mobile-safe components,
- writing deployable tests,
- auditing metadata without leaking private details.

## Examples

The [examples/](examples/) folder includes generic, public-safe Salesforce scaffolds:

- Apex trigger, handler, service, queueable, controller, and tests,
- LWC record action, related file refresh, and getter-based template examples,
- metadata notes for manifests, quick actions, and FlexiPage activation.

These are intentionally generic examples. Adapt object names, fields, sharing, permissions, and tests to your org.

## Contributing

Contributions are welcome when they preserve the public-safety standard of this repo. Start with [CONTRIBUTING.md](CONTRIBUTING.md), then review [CONTRIBUTING_GUIDELINES.md](CONTRIBUTING_GUIDELINES.md) and [docs/public-sanitization-policy.md](docs/public-sanitization-policy.md).

Do not contribute private customer data, org-specific secrets, sensitive URLs, credentials, screenshots from private orgs, raw internal notes, or deploy artifacts.

## License

MIT. See [LICENSE](LICENSE).

