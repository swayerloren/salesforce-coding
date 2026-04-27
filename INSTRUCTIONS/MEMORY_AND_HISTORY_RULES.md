# Memory And History Rules

Codex must update memory and history after meaningful work.

## Purpose

| Folder | Purpose | Do not use for |
| --- | --- | --- |
| `MEMORY/` | Reusable lessons, stable facts, durable decisions, assumptions that future sessions should inherit. | Chronological run logs, noisy command output, temporary notes. |
| `HISTORY/` | Chronological task logs, change summaries, validation records, residual risks. | Canonical instructions, stable architecture docs, repeated lessons. |
| `WORKSPACE/` | Active task notes, audits, temporary plans. | Durable memory unless promoted later. |

## Files To Update

After each meaningful task, update:

| File | Required when | What to write |
| --- | --- | --- |
| `MEMORY/PROJECT_MEMORY.md` | A stable fact, rule, decision, or reusable lesson changed. | Durable bullets organized by topic. |
| `MEMORY/FIX_HISTORY.md` | A fix produces a reusable future pattern. | Date, area, problem, root cause, fix pattern, files, lesson. |
| `MEMORY/FAILURE_HISTORY.md` | A failure reveals a reusable prevention rule. | Failed deploy/test/LWC/metadata symptom, root cause, prevention rule. |
| `MEMORY/DECISION_LOG.md` | A durable architecture or workflow decision is made. | Decision, rationale, alternatives, future impact. |
| `MEMORY/PROJECT_NOTES.md` | Stable context does not fit another memory file. | Topic note, why it matters, related files/folders. |
| `MEMORY/KNOWN_ORG_PATTERNS.md` | Verified org/project API names or patterns should be remembered. | Verified names/paths, source of verification, usage notes. |
| `HISTORY/TASK_HISTORY.md` | Any meaningful work was completed. | Date, task, files changed, validation, outcome, residual risk. |
| `HISTORY/CODEX_RUN_LOG.md` | Codex completes a meaningful run. | Request, files inspected, knowledge docs read, changed files, result. |
| `HISTORY/DEPLOYMENT_LOG.md` | Codex runs or analyzes deployment/validation commands. | Command, org alias, test level, tests run, result, failure notes. |
| `HISTORY/TEST_RESULTS_LOG.md` | Codex runs or analyzes Apex tests. | Test class, command, pass/fail, coverage, failure reason. |
| `HISTORY/CHANGE_ARCHIVE.md` | A larger completed change should be summarized. | Summary, scope, key files/folders, validation, outcome. |

If no durable lesson changed, still update `HISTORY/TASK_HISTORY.md` or `HISTORY/CODEX_RUN_LOG.md` for meaningful work.

If the task was tiny and produced no change, mention in the final answer that memory/history did not need updates.

## Meaningful Work

Meaningful work includes:

- changing code,
- changing metadata,
- restructuring folders,
- moving docs,
- creating or replacing instructions,
- diagnosing root cause,
- running validation that reveals useful results,
- changing public navigation,
- adding or revising Salesforce knowledge,
- discovering project placement or repo assumptions.

## `MEMORY/PROJECT_MEMORY.md` Format

Use stable sections:

```markdown
# Project Memory

## Repo Structure

- Stable facts about where things live.

## Salesforce Project Placement

- Stable facts about how to find the real project.

## Codex Operating Rules

- Durable rules future sessions must remember.

## Reusable Salesforce Lessons

- Lessons extracted from actual work.
```

Memory entries should be:

- durable,
- concise,
- reusable,
- not tied to one command run,
- public-safe.

Do not add:

- secrets,
- local absolute paths,
- raw logs,
- private org data,
- deploy IDs,
- email addresses,
- customer or claim data.

## `HISTORY/TASK_HISTORY.md` Format

Use reverse chronological entries:

```markdown
# Task History

## 2026-04-27 - Short Task Name

- Request:
- Work completed:
- Files changed:
- Validation:
- Result:
- Residual risks:
```

History entries should be factual and concise.

## Update Decision Matrix

| Situation | Update memory? | Update history? |
| --- | --- | --- |
| Created a new instruction system | Yes | Yes |
| Moved repo folders | Yes | Yes |
| Fixed one Apex bug | Only if reusable lesson changed | Yes |
| Ran tests only | Only if result changes future behavior | Yes |
| Answered a question without changes | Usually no | Usually no |
| Investigated and found root cause | Yes if reusable | Yes |
| Failed due missing context | Maybe | Yes if work was substantial |

## Specialized Memory Files

Use:

- `FIX_HISTORY.md` for reusable fix patterns.
- `FAILURE_HISTORY.md` for reusable failure prevention rules.
- `DECISION_LOG.md` for decisions and alternatives.
- `PROJECT_NOTES.md` for stable project context.
- `KNOWN_ORG_PATTERNS.md` for verified Salesforce API names, folder paths, and project-specific patterns.

## Specialized History Files

Use:

- `CODEX_RUN_LOG.md` for normal chronological Codex runs.
- `DEPLOYMENT_LOG.md` for deploy and validation attempts.
- `TEST_RESULTS_LOG.md` for test runs.
- `CHANGE_ARCHIVE.md` for larger completed changes.

## Relationship To Final Answer

The final answer should mention memory/history updates when they were made.

If validation or task status is recorded in history, summarize it in the final response rather than pasting long logs.
