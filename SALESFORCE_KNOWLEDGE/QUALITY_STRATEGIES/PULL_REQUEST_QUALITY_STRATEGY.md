# Pull Request Quality Strategy

Pull request quality gates should catch common issues before merge without requiring private org access by default.

## Recommended Gates

| Gate | Purpose |
| --- | --- |
| Markdown link check | Keeps docs navigable. |
| Public safety scan | Blocks secrets, local paths, org IDs, and temporary references. |
| Salesforce project validation | Confirms real source path when a project is included. |
| Code Analyzer | Static analysis for Apex/LWC/metadata where installed. |
| LWC Jest/ESLint | UI behavior and lint validation when package scripts exist. |
| Apex formatting check | Optional style check without writing files. |

## PR Review Rules

- Prefer changed-source scope for speed.
- Use check runs or structured reports for noisy findings.
- Do not require org secrets for static analysis by default.
- Pin external actions or review them before adoption.
- Report skipped gates clearly.

## Codex Output

For PR review, findings come first, ordered by severity, with file references and evidence.
