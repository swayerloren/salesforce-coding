# Prettier Apex Parameters

Source reference: https://github.com/dangmai/prettier-plugin-apex

Verify options against the installed Prettier and plugin versions before execution.

| Parameter | Meaning | Codex use |
| --- | --- | --- |
| `--plugin=prettier-plugin-apex` | Loads Apex formatter plugin. | Required for direct Apex formatting commands. |
| `--check` | Reports formatting differences without writing. | Preferred validation gate. |
| `--write` | Writes formatting changes. | Only when requested or explicitly scoped. |
| `--debug-check` | Checks formatting stability. | Useful before broad adoption. |
| `--parser apex-anonymous` | Parses anonymous Apex. | Only for intentional anonymous Apex formatting. |
| `--apex-standalone-parser` | Selects standalone parser mode. | Verify current plugin support. |
| `--apex-standalone-host` | Parser host option. | Advanced; verify before use. |
| `--apex-standalone-port` | Parser port option. | Advanced; verify before use. |

## Safety Rule

Do not run broad `--write` formatting during unrelated fixes.
