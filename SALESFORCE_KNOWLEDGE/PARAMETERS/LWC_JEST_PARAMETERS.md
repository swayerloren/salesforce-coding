# LWC Jest Parameters

Source reference: https://github.com/salesforce/sfdx-lwc-jest

Verify options against the installed package before execution.

| Parameter | Meaning | Codex use |
| --- | --- | --- |
| `--watch` | Re-runs tests on changes. | Developer workflow only, not final validation. |
| `--debug` | Runs tests in debug mode. | Troubleshooting only. |
| `--coverage` | Collects coverage. | Useful when coverage evidence matters. |
| `-u` / `--updateSnapshot` | Updates snapshots. | Do not use without explicit reason. |
| `--` | Passes following args to Jest. | Use for Jest-native flags such as JSON output when needed. |

## Codex Rule

Prefer project scripts such as `npm run test:unit`. Use direct `sfdx-lwc-jest` only when dependencies are present and no better script exists.
