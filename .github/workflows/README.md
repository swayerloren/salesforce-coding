# GitHub Actions Workflows

This folder contains public-safe workflow drafts for this repo and examples users can adapt for their own Salesforce DX projects.

## Workflow Map

| Workflow | Active gate | Secrets required | Purpose |
| --- | --- | --- | --- |
| [markdown-link-check.yml](markdown-link-check.yml) | Yes | No | Checks repository-local Markdown links on pull requests and pushes to `main`. External links are skipped to avoid transient network failures. |
| [public-safety-check.yml](public-safety-check.yml) | Yes | No | Scans for obvious unsafe public content indicators without printing matched secret values. |
| [salesforce-code-analyzer.yml](salesforce-code-analyzer.yml) | Conditional | No | Runs Salesforce Code Analyzer only when `force-app/main/default` is present at repo root or under `FORCE_APP_DIRECTORY/`. |

The Markdown and public-safety workflows skip local-only folders such as `VENDOR_REFERENCES/_external/`, `temp/`, `node_modules/`, and generated build output. Those folders should not be committed.

## Salesforce Code Analyzer Notes

The Salesforce Code Analyzer workflow is safe by default:

- It does not require org login.
- It does not deploy.
- It does not require Salesforce org secrets.
- It skips cleanly when no real Salesforce DX project is present.
- It targets `force-app/main/default` when found.

Users can customize the install step to use the official Salesforce Code Analyzer GitHub Action, pinned internal tooling, or project-specific analyzer config.

## Codex Interpretation Rules

Codex should treat workflow failures as evidence to inspect, not as permission to guess.

- Markdown link failures usually mean a moved file or stale relative link.
- Public safety failures must be handled before pushing.
- Code Analyzer failures should be mapped back to the exact Apex, LWC, metadata, Flow, or config file reported by the analyzer.
- A skipped Code Analyzer workflow means no Salesforce DX metadata was found in the expected locations.

## Secret Policy

These workflows do not require repository secrets by default. Do not add deployment credentials, org auth URLs, session IDs, private keys, or API tokens unless the repo owner explicitly decides to add a separate private deployment workflow.
