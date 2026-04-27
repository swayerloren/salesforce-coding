# Project Notes

## Purpose

`PROJECT_NOTES.md` stores durable project notes that do not fit fix history, failure history, architecture decisions, or known org patterns.

Use it for stable context Codex should remember across sessions.

## When Codex Should Update It

Update this file when:

- a stable repo convention is discovered,
- a user preference affects future work,
- a non-sensitive setup detail should be remembered,
- a recurring task workflow needs a short note,
- a temporary workspace note becomes durable.

Do not include:

- credentials,
- tokens,
- private customer data,
- local absolute paths,
- raw logs,
- private org exports.

## Entry Template

```markdown
## YYYY-MM-DD - <Topic>

- Date:
- Note:
- Why it matters:
- Related files or folders:
- Review date:
```

## Example Entry

```markdown
## 2026-04-27 - Public-Safe Examples

- Date: 2026-04-27
- Note: Example Apex and LWC files should use generic names such as `Project__c`, `ExampleService`, and `safeRecordAction`.
- Why it matters: The repo is intended for public reuse and should not expose org-specific implementation names.
- Related files or folders: `SALESFORCE_KNOWLEDGE/EXAMPLES/`
- Review date: Recheck before publishing a release.
```

