# Salesforce Code Analyzer Strategy

Source reference: https://github.com/forcedotcom/code-analyzer

Salesforce Code Analyzer is the preferred static-analysis quality gate when it is available in a real Salesforce DX project.

## Codex Goals

- Use static analysis as evidence after Salesforce source changes.
- Keep workspace and target separate.
- Use recommended rules for normal validation.
- Use severity thresholds and machine-readable outputs for CI or release gates.
- Report skipped status when the tool is unavailable.

## Command Strategy

| Need | Command pattern | Status |
| --- | --- | --- |
| Basic run | `sf code-analyzer run` | Verify against installed CLI help. |
| Target metadata | `sf code-analyzer run --target force-app/main/default --view table` | Verify against installed CLI help. |
| Full workspace plus target | `sf code-analyzer run --workspace . --target force-app/main/default --view table` | Verify against installed CLI help. |
| Preview rules | `sf code-analyzer rules --rule-selector Recommended` | Verify against installed CLI help. |
| CI threshold | `sf code-analyzer run --severity-threshold 3` | Verify policy and installed tool first. |
| SARIF/JSON output | `sf code-analyzer run --output-file results.sarif` | Ensure output folder exists and is not metadata source. |

## Result Interpretation

| Result | Codex response |
| --- | --- |
| Pass | Report command, target, and zero blocking findings. |
| Findings | Summarize severity and affected files; do not auto-fix broadly. |
| Error | Report the command error and do not claim static analysis passed. |
| Missing | Mark `SKIPPED` and recommend installation or setup. |
| Not applicable | Explain why the gate did not apply. |

## Safety Rules

- Do not run analyzer against optional vendor clones or external sample repos as if they are the user's source.
- Do not write analyzer reports into `force-app/main/default`.
- Do not use suppressions to hide real issues without owner approval.
- Do not treat missing analyzer as success.
