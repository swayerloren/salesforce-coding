# Code Analyzer Parameters

Source reference: https://github.com/forcedotcom/code-analyzer

Verify these options against the installed Salesforce CLI and Code Analyzer help before execution.

| Parameter | Meaning | Codex use |
| --- | --- | --- |
| `--workspace` | Files/folders that provide full analysis context. | Use project root when engines need whole-project context. |
| `--target` | Files/folders/globs to analyze. | Use `force-app/main/default` or changed folders. |
| `--rule-selector` | Filters rules by engine, tag, severity, or rule name. | Start with `Recommended`; use focused selectors deliberately. |
| `--config-file` | Analyzer config path. | Use existing config; do not create config without approval. |
| `--view table` | Concise terminal output. | Good default for local validation. |
| `--view detail` | Detailed findings. | Use for triage. |
| `--output-file` | Writes results to file. | Use JSON/SARIF/CSV/HTML/XML only outside metadata source. |
| `--severity-threshold` | Fails command at or above severity. | Use in CI/release gates when policy is defined. |
| `--include-fixes` | Includes fix data when available. | Review manually; do not auto-apply blindly. |
| `--include-suggestions` | Includes suggestion data. | Treat as triage hints. |
| `--no-suppressions` | Ignores suppression markers. | Useful for strict review. |

## Result Logging

Record command, workspace, target, rule selector, threshold, output file, result, and skipped reason if any.
