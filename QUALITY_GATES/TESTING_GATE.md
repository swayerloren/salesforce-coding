# Testing Gate

## Purpose

This gate defines what Codex should run or recommend before claiming Salesforce code changes are validated.

The gate does not require org login by default. It favors local checks first and only recommends org-backed tests or deployment validation when the task requires it and credentials are available.

## Gate Map

| Change Type | Preferred Validation |
| --- | --- |
| LWC JavaScript/HTML | LWC Jest, LWC ESLint, static source inspection |
| LWC mobile/offline | LWC Jest if available, LWC mobile lint or graph analyzer if configured, metadata inspection |
| Apex class/trigger | Focused Apex tests, Salesforce Code Analyzer, deployment validation when available |
| Apex-backed LWC | LWC Jest plus focused Apex tests when controller behavior changed |
| Metadata/FlexiPage/layout/action | Source inspection, Salesforce Code Analyzer if available, deploy dry run when possible |
| Files behavior | Apex tests if server logic changed, LWC Jest if UI changed, manual runtime limitation notes |

## LWC Jest Gate

Run when a real Salesforce DX project has:

- `package.json`
- `@salesforce/sfdx-lwc-jest` or a project-specific Jest setup
- A script such as `test:unit`

Preferred command:

```bash
npm run test:unit
```

Coverage command when configured:

```bash
npm run test:unit -- --coverage
```

Codex must not claim Jest passed unless the command actually ran and passed.

## LWC Lint Gate

Run when the project has an existing lint setup.

Preferred commands:

```bash
npm run lint:lwc
npm run lint
```

For mobile projects, also check for:

```bash
npm run lint:mobile
```

## Apex Test Gate

Use focused Apex tests when Apex behavior changed.

Examples:

```bash
sf apex run test --class-names MyControllerTest --result-format human --wait 10
sfdx force:apex:test:run -n MyControllerTest -r human -w 10
```

Only run org-backed tests when an org is configured and the user permits or expects org-backed validation.

## Salesforce Code Analyzer Gate

Run Salesforce Code Analyzer after Salesforce source changes when available.

See [CODE_ANALYZER_RULES.md](CODE_ANALYZER_RULES.md).

## Missing Tool Behavior

| Missing Item | Required Codex Behavior |
| --- | --- |
| No real Salesforce DX project | Stop before code changes; ask for or locate the project. |
| No `package.json` | Skip Node-based LWC checks and recommend setup. |
| No Jest script | Skip Jest and report the missing script. |
| No lint script | Skip lint and report the missing script. |
| No org login | Skip deploy/Apex test validation and state that org-backed validation was not run. |
| No Salesforce Code Analyzer | Skip static analysis and recommend install; do not claim it passed. |

## Report Format

Codex final responses and History entries should include:

| Field | Required Content |
| --- | --- |
| Command | Exact command run. |
| Result | `PASS`, `FAIL`, `SKIPPED`, or `MISSING`. |
| Scope | Files, component, class, or metadata targeted. |
| Notes | Failure reason, skipped reason, or limitations. |

## Example

```text
Validation:
- PASS: npm run test:unit
- PASS: npm run lint:lwc
- SKIPPED: npm run lint:mobile because the project has no mobile lint script.
- SKIPPED: Apex tests because no Apex behavior changed.
```
