# Apex Formatting Gate

## Purpose

This gate tells Codex how to handle optional Apex formatting without turning narrow functional fixes into noisy style rewrites.

Upstream reference: [dangmai/prettier-plugin-apex](https://github.com/dangmai/prettier-plugin-apex)

Tool guide: [../TOOLS/PRETTIER_APEX.md](../TOOLS/PRETTIER_APEX.md)

## Gate Trigger

Consider this gate after changes to:

- Apex classes under `force-app/main/default/classes`
- Apex triggers under `force-app/main/default/triggers`
- Apex tests
- Shared trigger/service/controller code

## Required Preflight

- [ ] Real Salesforce DX project located.
- [ ] Real `force-app/main/default` confirmed.
- [ ] Changed `.cls` or `.trigger` files identified.
- [ ] Existing `package.json`, Prettier config, and package scripts inspected.
- [ ] User approval obtained before adding dependencies or running write formatting.

## Preferred Non-Mutating Commands

Use existing project scripts first:

```bash
npm run prettier:check
```

Direct check:

```bash
npx prettier --plugin=prettier-plugin-apex --check "force-app/main/default/**/*.{cls,trigger}"
```

Parser safety check for first-time adoption:

```bash
npx prettier --plugin=prettier-plugin-apex --debug-check "force-app/main/default/**/*.{cls,trigger}"
```

## Write Formatting

Only run write formatting when the user requested formatting or explicitly approved it.

```bash
npx prettier --plugin=prettier-plugin-apex --write "force-app/main/default/**/*.{cls,trigger}"
```

## Codex Rules

- Do not run broad `--write` formatting during unrelated Apex bug fixes.
- Do not mix large formatting churn with small behavior changes.
- Do not add `prettier` or `prettier-plugin-apex` without user approval.
- Do not claim formatting passed unless `--check`, `--debug-check`, or a project script actually ran and passed.
- If formatting is unavailable, report `SKIPPED` with the missing item: `package.json`, script, dependency, Node/npm, or user approval.

## Result Language

| Status | Use When |
| --- | --- |
| `PASS` | Formatting check ran and exited successfully. |
| `FAIL` | Formatting check ran and found drift or parser errors. |
| `SKIPPED` | Formatting was not configured, not in scope, or not approved. |
| `MISSING` | Required local tool such as Node/npm or Prettier is unavailable. |

## Reporting Template

```text
Apex formatting:
- Command:
- Scope:
- Result: PASS | FAIL | SKIPPED | MISSING
- Notes:
```
