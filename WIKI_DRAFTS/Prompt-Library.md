# Prompt Library

These prompts are safe starting points. Customize them with the real task, error output, and file paths.

## General Fix Prompt

```text
Read START_HERE.md and INSTRUCTIONS/ first. Locate the real force-app/main/default folder before editing. Read SALESFORCE_KNOWLEDGE/INDEX.md and the relevant guide files for this task. Inspect existing files, identify the root cause, make the smallest safe change, validate if possible, and update MEMORY/ and HISTORY/.
```

## Apex Prompt

```text
Fix the Apex issue in <area>. Read the Apex, testing, deployment, and common failure guides. Inspect the target class, triggers, services, controllers, tests, and metadata references before editing. Do not guess API names or method names. Validate with focused tests or dry-run deploy if possible.
```

## LWC Prompt

```text
Fix the LWC issue in <bundle>. Read the LWC, record page, mobile, metadata, and common failure guides. Inspect the full bundle, Apex controller, parent components, js-meta.xml targets, permissions, and page placement before editing. Validate if possible.
```

## Metadata Prompt

```text
Review this metadata change. Read the metadata and record page guides. Inspect objects, fields, layouts, FlexiPages, actions, permission sets, tabs, and references before editing. Report any activation, visibility, permission, or deployment risks.
```

## Deployment Prompt

```text
Debug this deployment failure. Read the deployment, testing, metadata, and common failure docs. Inspect the exact changed metadata and failure output. Find the root cause before editing. Keep deploy scope narrow and run a dry-run validation if possible.
```

## Review Prompt

```text
Review these changes without editing. Prioritize bugs, regressions, Salesforce platform risks, missing tests, metadata activation gaps, and deployment risks. Provide findings first with file references.
```

## Documentation Prompt

```text
Update the docs for this completed Salesforce change. Keep current behavior separate from historical notes. Do not include private data, org IDs, credentials, deploy IDs, customer names, or local paths. Update MEMORY/ and HISTORY/ if the work created reusable lessons or a chronological record.
```

## Prompt Checklist

- [ ] Say whether Codex may edit files.
- [ ] Include the exact failing command or error text.
- [ ] Include relevant file paths if known.
- [ ] State whether tests may be run.
- [ ] State whether deployment validation may be run.
- [ ] Ask Codex to update memory and history after meaningful work.

