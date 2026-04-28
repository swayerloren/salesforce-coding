# Apex Formatting Strategy

Source reference: https://github.com/dangmai/prettier-plugin-apex

Apex formatting is useful, but it should not be mixed into unrelated behavior fixes without intent.

## Codex Strategy

- Prefer formatter checks over formatter writes during validation.
- Scope formatting to changed Apex files or explicit project patterns.
- Avoid mass formatting during bug fixes.
- Treat formatting as style evidence, not functional validation.
- Verify plugin availability and command compatibility in the real project.

## Command Decision Table

| Need | Command pattern | Codex rule |
| --- | --- | --- |
| Check formatting | `prettier --plugin=prettier-plugin-apex --check "<project>/**/*.{trigger,cls}"` | Verify against project setup. |
| Write formatting | `prettier --plugin=prettier-plugin-apex --write "<project>/**/*.{trigger,cls}"` | Only when requested or explicitly scoped. |
| Stability check | `prettier --plugin=prettier-plugin-apex --debug-check "<project>/**/*.{trigger,cls}"` | Use before broad adoption. |
| Existing script | `npm run prettier:check` or project equivalent | Prefer project scripts. |

## Safety Rules

- Do not run broad `--write` during unrelated Apex fixes.
- Do not format generated, vendored, or external reference files.
- Do not claim formatting passed unless a check command ran and passed.
- Do not install formatter dependencies without user approval.
