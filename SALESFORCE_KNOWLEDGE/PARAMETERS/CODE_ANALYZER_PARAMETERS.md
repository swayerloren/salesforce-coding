# Code Analyzer Parameters

Official source references:

- https://developer.salesforce.com/docs/platform/salesforce-code-analyzer/guide/code-analyzer.html
- https://developer.salesforce.com/docs/platform/salesforce-code-analyzer/guide/analyze.html
- https://developer.salesforce.com/docs/platform/salesforce-code-analyzer/guide/rules.html

Implementation source reference: https://github.com/forcedotcom/code-analyzer

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

## V5 Alignment Rules

- Prefer `sf code-analyzer ...` command families for current guidance.
- Do not add retired Salesforce Scanner command shapes to new guidance.
- Check `sf code-analyzer run --help` before using mutating CI scripts or strict thresholds.
- Record selected engine/rule behavior only after confirming it exists in the installed plugin.
- Do not copy upstream rule messages or source code into this repo.

## Result Logging

Record command, workspace, target, rule selector, threshold, output file, result, and skipped reason if any.
