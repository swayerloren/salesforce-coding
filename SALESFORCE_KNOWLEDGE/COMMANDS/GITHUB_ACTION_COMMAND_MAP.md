# GitHub Action Command Map

Use this map when designing or reviewing GitHub Actions for this repo or a real Salesforce DX project.

## Trigger Patterns

| Trigger | Use |
| --- | --- |
| `pull_request` | Validate proposed changes before merge. |
| `push` to `main` | Validate protected branch updates. |
| `workflow_dispatch` | Manual validation. |

## Quality Gate Ideas

| Gate | Command or action idea | Notes |
| --- | --- | --- |
| Markdown links | Markdown link checker | Allow transient external failures where possible. |
| Public safety | Secret/path pattern scan | Never print secret values. |
| Code Analyzer | `sf code-analyzer run` | Skip cleanly if no Salesforce DX source exists. |
| LWC tests | `npm run test:unit` | Only when package scripts and dependencies exist. |
| LWC lint | `npm run lint` or `npm run lint:lwc` | Prefer project scripts. |
| Apex formatting | `npm run prettier:check` | Do not write files in CI. |

## PR Scan Ideas

- Prefer current Salesforce Code Analyzer when available.
- Use severity thresholds for fail conditions.
- Use check runs or SARIF for structured reporting.
- Avoid requiring org secrets for static checks.
- Pin third-party actions or review updates before use.
