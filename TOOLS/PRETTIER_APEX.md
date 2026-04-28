# Prettier Apex

## Purpose

Prettier Apex is an optional Apex formatter built on Prettier. Codex should use it as a formatting quality gate when a real Salesforce DX project already has it installed or the user asks to add Apex formatting.

Upstream reference: [dangmai/prettier-plugin-apex](https://github.com/dangmai/prettier-plugin-apex)

## Status

| Area | Guidance |
| --- | --- |
| Required for this helper repo | No |
| Recommended for real Salesforce DX projects | Optional, useful for teams with Apex style gates |
| Requires Salesforce org login | No |
| Safe for public repos | Yes |
| Codex may install automatically | No, only with user approval |

## What It Helps Codex Do

- Detect Apex formatting drift without changing files.
- Keep style-only changes separate from functional fixes.
- Avoid broad, noisy diffs during bug fixes.
- Give the user a repeatable command for Apex classes and triggers.

## Install In A Real Salesforce DX Project

Run only inside the real Salesforce DX project and only after user approval.

```bash
npm install --save-dev prettier prettier-plugin-apex
```

Prettier Apex currently expects modern Node. Check the real project's `package.json`, lockfile, and CI runtime before recommending installation.

## Safe Check Commands

Use non-mutating checks first:

```bash
npx prettier --plugin=prettier-plugin-apex --check "force-app/main/default/**/*.{cls,trigger}"
```

For first-time adoption or parser confidence:

```bash
npx prettier --plugin=prettier-plugin-apex --debug-check "force-app/main/default/**/*.{cls,trigger}"
```

If the project has a package script, prefer it:

```bash
npm run prettier:check
```

## Write Commands Need Approval

Do not run broad write formatting during a functional fix unless the user asks for it.

```bash
npx prettier --plugin=prettier-plugin-apex --write "force-app/main/default/**/*.{cls,trigger}"
```

## Recommended Package Scripts

See [../QUALITY_GATES/examples/prettier-apex-config-example.md](../QUALITY_GATES/examples/prettier-apex-config-example.md).

## Codex Rules

- Do not install dependencies without user approval.
- Do not create or replace Prettier config without checking existing project config.
- Do not hide functional changes inside formatting churn.
- Do not claim Apex formatting passed unless a check command actually ran and passed.
- Use formatting as evidence only. Formatting does not prove Apex behavior, tests, sharing, CRUD/FLS, or deployment safety.
