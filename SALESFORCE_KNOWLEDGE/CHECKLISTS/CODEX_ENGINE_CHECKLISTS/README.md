# Codex Engine Checklists

These checklists are strict preflight gates for using this repo as a Codex-ready Salesforce coding engine.

Use them before Codex edits, validates, deploys, or prepares the repo for GitHub.

## Checklist Map

| Checklist | Use before |
| --- | --- |
| [BEFORE_EVERY_CODEX_TASK.md](BEFORE_EVERY_CODEX_TASK.md) | Any Codex task in this repo. |
| [BEFORE_EDITING_APEX.md](BEFORE_EDITING_APEX.md) | Apex class, trigger, service, controller, async, or test changes. |
| [BEFORE_EDITING_LWC.md](BEFORE_EDITING_LWC.md) | LWC bundle, Apex-backed UI, styling, refresh, navigation, or record action changes. |
| [BEFORE_EDITING_METADATA.md](BEFORE_EDITING_METADATA.md) | Objects, fields, layouts, FlexiPages, permissions, tabs, actions, custom metadata, and record pages. |
| [BEFORE_DEPLOYMENT.md](BEFORE_DEPLOYMENT.md) | Salesforce validation, deploy dry run, or real deployment. |
| [BEFORE_GITHUB_PUSH.md](BEFORE_GITHUB_PUSH.md) | Publishing or pushing the helper repo. |
| [PUBLIC_REPO_SAFETY_CHECK.md](PUBLIC_REPO_SAFETY_CHECK.md) | Strict public-safety review for leakage risk. |

## Operating Rule

Do not treat a checkbox as complete unless it is supported by evidence from files, commands, or explicit user instructions.

If a check cannot be completed, Codex must state the blocker and avoid risky edits or claims.

