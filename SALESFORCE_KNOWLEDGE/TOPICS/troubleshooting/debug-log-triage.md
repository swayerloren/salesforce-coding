# Debug Log Triage

Use this when Salesforce debug logs, trace flags, anonymous Apex probes, or runtime logs are needed to diagnose behavior.

Official anchors:

- Salesforce Help: Debug Logs
- Apex Developer Guide: Debug Logs
- Apex Developer Guide: Developer Console System Log

## Public-Safety Rule

Debug logs are evidence, not public documentation content. Summarize the symptom, execution path, error category, and fix. Do not paste raw logs into public repo docs.

Raw logs can expose:

- record IDs,
- user names,
- field values,
- query filters,
- request payloads,
- email or Chatter content,
- generated document text,
- private object and field names,
- timing and integration details.

## Triage Steps

1. Identify the entry point: UI action, trigger, Flow, Apex, API, file upload, email service, async job, or deployment validation.
2. Confirm the running user or automation actor.
3. Set the narrowest trace scope and useful log levels.
4. Reproduce once with minimal noise.
5. Classify the failure layer.
6. Extract only public-safe facts.
7. Fix the source or metadata root cause.
8. Validate with a focused test, runtime check, or deployment validation.

For deployment or validation failures, capture the command family, source or manifest scope, test level, async/wait behavior, and deploy status report. Do not paste the raw output into public docs.

## Failure Categories

Classify before fixing:

- compile failure,
- missing metadata,
- permission or FLS failure,
- sharing or record access failure,
- validation rule or duplicate rule failure,
- Flow side effect,
- SOQL no rows or too many rows,
- SOQL or DML governor limit,
- callout ordering or mock failure,
- async timing,
- file link or latest-version issue,
- row lock,
- Visualforce/PDF rendering issue,
- mobile runtime issue.

## Summarization Template

Use this shape in public docs or final reports:

```text
Debug log summary:
- Entry point:
- Actor context:
- Failing layer:
- Public-safe error category:
- Root cause:
- Fix:
- Validation:
- Private data omitted:
```

Do not include raw IDs, queries with private filters, message bodies, file names, endpoint values, or local paths.

## CLI Probe Warning

A failed terminal query or anonymous Apex probe can be caused by command shape, shell quoting, permissions, API behavior, or target org context. Do not rewrite working runtime code solely because one local probe failed.

Before relying on a CLI probe:

- check installed command help;
- confirm the target org alias;
- quote Windows paths and SOQL deliberately;
- use report commands for async deploy or test jobs;
- summarize only non-sensitive evidence.

## Deployment Debug Summary

Use this shape when debugging deploy/test failures:

```text
Deployment/debug summary:
- Command family:
- Scope type:
- Test level:
- Result category:
- Failing layer:
- Public-safe root cause:
- Fix:
- Evidence:
- Private output omitted:
```
