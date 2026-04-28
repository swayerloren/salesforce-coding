# NPM Script Command Map

Codex should inspect the real project's `package.json` before running or recommending Node-based validation commands.

## Preferred Script Discovery

| Script | Typical use | Codex behavior |
| --- | --- | --- |
| `lint` | Project-wide JavaScript/LWC lint. | Prefer this before direct `npx eslint`. |
| `lint:lwc` | LWC-specific lint. | Use after LWC edits if present. |
| `lint:mobile` | Mobile/offline LWC lint. | Use for Salesforce mobile/offline work if present. |
| `test` | Project test suite. | Use only when scope and runtime are appropriate. |
| `test:unit` | LWC Jest unit tests. | Preferred after LWC changes. |
| `test:unit:coverage` | LWC Jest coverage. | Use when coverage evidence is useful. |
| `prettier` | Formatting write. | Do not run by default; may modify files. |
| `prettier:check` | Formatting check. | Safer validation gate. |
| `prettier:apex:check` | Apex-specific formatting check. | Use if project defines it. |

## Decision Table

| Situation | Codex action |
| --- | --- |
| `package.json` missing | Mark Node gates `SKIPPED`; do not invent scripts. |
| Script exists | Prefer the project script. |
| Dependency missing | Mark `MISSING` or recommend setup; do not install without approval. |
| Script writes files | Ask or require explicit scope unless user requested formatting. |
| Script fails | Report failure and inspect output; do not claim validation passed. |

## Safe Default

Run local automation first:

```bash
bash ./AUTOMATION/local-quality-check.sh
```

or:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\AUTOMATION\local-quality-check.ps1
```
