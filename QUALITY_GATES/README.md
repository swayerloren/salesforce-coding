# Quality Gates

`QUALITY_GATES/` defines validation checks Codex should consider after changing a real Salesforce DX project.

Quality gates are evidence-based. Codex should run what is available, skip what is unavailable, and never claim success without reporting the command or inspection result.

Use [SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/](../SALESFORCE_KNOWLEDGE/VALIDATION_FLOWS/) for the sequence to follow, [SALESFORCE_KNOWLEDGE/COMMANDS/](../SALESFORCE_KNOWLEDGE/COMMANDS/) for command choices, and [SALESFORCE_KNOWLEDGE/PARAMETERS/](../SALESFORCE_KNOWLEDGE/PARAMETERS/) for option meanings.

## Gate Map

| Gate | Use |
| --- | --- |
| [CODE_ANALYZER_RULES.md](CODE_ANALYZER_RULES.md) | Salesforce Code Analyzer and static-analysis expectations. |
| [LWC_LINT_RULES.md](LWC_LINT_RULES.md) | LWC ESLint checks and rule areas. |
| [APEX_FORMATTING.md](APEX_FORMATTING.md) | Apex formatting checks and guardrails. |
| [TESTING_GATE.md](TESTING_GATE.md) | Apex and LWC test expectations. |
| [RELEASE_GATE.md](RELEASE_GATE.md) | Final release/deployment readiness checks. |

## Minimum Local Gate

Run the automation helper from this repo root:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\AUTOMATION\local-quality-check.ps1
```

```bash
bash ./AUTOMATION/local-quality-check.sh
```

The helper checks:

- Salesforce DX project discovery.
- `force-app/main/default` presence.
- `classes/`, `lwc/`, and `objects/` when relevant metadata exists.
- Available tools: `sf`, `sfdx`, `node`, `npm`, `npx`, and `git`.
- Existing `package.json` scripts for `lint`, `lint:lwc`, `lint:mobile`, `test`, `test:unit`, `test:unit:coverage`, `prettier`, and `prettier:check`.
- Whether Salesforce Code Analyzer, LWC Jest, LWC ESLint, LWC mobile lint, graph analyzer, and Prettier appear available.

## Running Project Scripts

By default, the helper recommends project commands instead of running them. To run detected safe scripts:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\AUTOMATION\local-quality-check.ps1 -RunProjectScripts
```

```bash
bash ./AUTOMATION/local-quality-check.sh --run-project-scripts
```

The helper can run:

- `npm run lint`
- `npm run lint:lwc`
- `npm run lint:mobile`
- `npm run test:unit`
- `npm run test`
- `npm run prettier:check`

It does not run deployment commands and does not require Salesforce org login.

## Optional Example Configs

These examples are inactive documentation. They are not automatically applied to any project:

- [examples/package-json-lwc-quality-scripts.md](examples/package-json-lwc-quality-scripts.md)
- [examples/eslint-config-lwc-example.md](examples/eslint-config-lwc-example.md)
- [examples/jest-config-lwc-example.md](examples/jest-config-lwc-example.md)
- [examples/prettier-apex-config-example.md](examples/prettier-apex-config-example.md)
- [examples/apex-test-command-examples.md](examples/apex-test-command-examples.md)

## Codex Rule

After code changes, Codex should:

1. identify available quality gates,
2. run focused gates when practical,
3. report command output or static inspection,
4. mark missing optional tools as `MISSING` or `SKIPPED`,
5. avoid claiming success without evidence.

For task-specific quality posture, read [SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/](../SALESFORCE_KNOWLEDGE/QUALITY_STRATEGIES/) before deciding which gate is enough.
