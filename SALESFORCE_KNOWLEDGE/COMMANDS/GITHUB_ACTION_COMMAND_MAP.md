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
| Salesforce deploy validation | `sf project deploy start --dry-run` or `sf project deploy validate` | Requires org auth and secrets; keep out of public helper repo workflows by default. |
| Deploy status report | `sf project deploy report` | Use when deploy/validation runs async or times out. |

## PR Scan Ideas

- Prefer current Salesforce Code Analyzer when available.
- Use severity thresholds for fail conditions.
- Use check runs or SARIF for structured reporting.
- Avoid requiring org secrets for static checks.
- Pin third-party actions or review updates before use.
- Do not claim deploy readiness from static CI checks alone.
- Keep mutating deploy workflows manual and environment-protected.
- Never print org usernames, access tokens, auth URLs, deploy IDs with private context, or raw debug logs in workflow output.

## Code Analyzer CI Notes

Current guidance should use `sf code-analyzer run` and `sf code-analyzer rules`. Retired scanner command shapes should not be introduced into new workflows.

Use output files such as SARIF or JSON only when the repository has a policy for storing or uploading them. Generated analyzer output can contain source paths and findings, so avoid committing it.
