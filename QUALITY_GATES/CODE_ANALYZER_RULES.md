# Code Analyzer Rules

Salesforce Code Analyzer is the preferred static-analysis gate for Apex, LWC, Aura, metadata, Flow, static resource, and release-prep changes when available.

Tool guide: [../TOOLS/SALESFORCE_CODE_ANALYZER.md](../TOOLS/SALESFORCE_CODE_ANALYZER.md)

Official references:

- https://developer.salesforce.com/docs/platform/salesforce-code-analyzer/guide/code-analyzer.html
- https://developer.salesforce.com/docs/platform/salesforce-code-analyzer/guide/analyze.html
- https://developer.salesforce.com/docs/platform/salesforce-code-analyzer/guide/rules.html

Implementation source reference: https://github.com/forcedotcom/code-analyzer

## Gate Scope

| Change | Suggested target |
| --- | --- |
| Apex classes | `force-app/main/default/classes` |
| Apex triggers | `force-app/main/default/triggers` |
| LWC | `force-app/main/default/lwc` |
| Aura | `force-app/main/default/aura` |
| Flow or metadata | `force-app/main/default/flows` or `force-app/main/default` |
| Broad project check | `force-app/main/default` |

## Required Preflight

- [ ] Real Salesforce DX project root located.
- [ ] Real `force-app/main/default` path confirmed.
- [ ] Changed files identified.
- [ ] Existing `code-analyzer.yml` checked if present.
- [ ] `sf code-analyzer run --help` checked, or missing tool documented.
- [ ] Current `sf code-analyzer` command shape is used for new guidance.
- [ ] Retired scanner command shapes are not introduced into new workflows.
- [ ] Output files, if any, are written outside deployable Salesforce metadata folders.

## Command Patterns

Check help first:

```bash
sf code-analyzer --help
sf code-analyzer run --help
sf code-analyzer rules --help
```

Run the default local-source gate:

```bash
sf code-analyzer run --target force-app/main/default --view table
```

Run a focused target:

```bash
sf code-analyzer run --target force-app/main/default/classes --view table
sf code-analyzer run --target force-app/main/default/lwc --view table
```

Use a project config when present:

```bash
sf code-analyzer run --config-file code-analyzer.yml --target force-app/main/default --view table
```

Do not add retired Salesforce Scanner commands to new CI or release docs. If a legacy project still uses them, record that as project-specific legacy behavior and prefer migration to current `sf code-analyzer` commands.

## Findings Codex Must Treat Seriously

- Apex CRUD/FLS or sharing concerns.
- SOQL injection or unsafe dynamic query construction.
- Unsafe DML, unbulkified patterns, or high-complexity Apex.
- SOQL or DML inside loops.
- Hard-coded Salesforce IDs, record type IDs, profile names, or permission assumptions.
- Missing null checks around optional relationships, query results, maps, and DTO fields.
- Apex test classes with no meaningful assertions.
- Apex classes with unclear `with sharing`, `without sharing`, or `inherited sharing` intent.
- Apex that exposes records without clear user-mode/system-mode and CRUD/FLS behavior.
- Trigger code that ignores order of execution, Flow re-entry, recursion, or bulk side effects.
- File logic that treats `ContentVersion`, `ContentDocument`, and `ContentDocumentLink` as one object.
- Communication automation that can duplicate posts, emails, activities, or logs.
- XSS, unsafe DOM manipulation, or open redirect warnings.
- LWC lint failures related to wire adapters, DOM, lifecycle, or public API contracts.
- Flow, metadata, or static-resource findings that touch changed deploy scope.
- RetireJS or dependency warnings when deployment includes static resources or JavaScript dependencies.

## Apex-Focused Rule Selection

When investigating Apex quality, Codex may inspect applicable rules before running the analyzer:

```bash
sf code-analyzer rules --rule-selector "pmd:(Performance,Security):2,3" --target force-app/main/default/classes --view table
sf code-analyzer rules --rule-selector "pmd:(Performance,Security):2,3" --target force-app/main/default/triggers --view table
```

Focused Apex runs can use the class or trigger folder:

```bash
sf code-analyzer run --target force-app/main/default/classes --view table
sf code-analyzer run --target force-app/main/default/triggers --view table
```

Some engines, including graph-style analysis, may need the broader workspace to understand cross-file behavior. If a focused target gives incomplete context, run against `force-app/main/default` and triage findings related to changed files first.

## Result Interpretation

| Result | Meaning | Codex response |
| --- | --- | --- |
| `PASS` | Analyzer ran and exited successfully. | Report command, target, and summary. |
| Warnings/findings | Analyzer completed but reported issues. | Triage findings related to changed files first. Do not hide unrelated findings; mark them deferred. |
| `FAIL` or nonzero exit | Analyzer failed or blocking findings exceeded threshold. | Treat as failed validation until fixed or explicitly accepted by owner. |
| `MISSING` | Analyzer command is not installed or unavailable. | State skipped reason and recommended install. Do not claim static analysis passed. |
| `SKIPPED` | No real Salesforce DX project or no target found. | State exact reason and next setup step. |

## Reporting Template

```text
Salesforce Code Analyzer:
- Command:
- Project root:
- Target:
- Config file:
- Result: PASS | WARNINGS | FAIL | SKIPPED
- Relevant findings:
- Deferred unrelated findings:
- Follow-up:
```

## History Updates

After running or skipping Code Analyzer for a meaningful Salesforce task, update:

- `HISTORY/CODEX_RUN_LOG.md` with command, target, result, and limitation.
- `HISTORY/TEST_RESULTS_LOG.md` when the analyzer is part of a validation/test pass.
- `MEMORY/PROJECT_MEMORY.md` only for reusable lessons, such as a project-specific analyzer config or recurring rule category.
