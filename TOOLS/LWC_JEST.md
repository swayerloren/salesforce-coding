# LWC Jest

## Purpose

LWC Jest gives Codex and human developers a local way to validate Lightning Web Component behavior without requiring a Salesforce org login, deployment, or browser session.

Use it after changes to:

- `force-app/main/default/lwc/**`
- Apex-backed LWC controller behavior that has Jest mocks
- Component events, slots, rendering conditions, navigation, toast behavior, and data refresh logic
- Public `@api` properties or methods used by parent components

Upstream reference: [salesforce/sfdx-lwc-jest](https://github.com/salesforce/sfdx-lwc-jest)

## Status

| Area | Guidance |
| --- | --- |
| Required for this helper repo | No |
| Recommended for real Salesforce DX projects | Yes, when LWCs exist |
| Requires Salesforce org login | No |
| Safe for public repos | Yes |
| Codex may install automatically | No, only with user approval |

## Install In A Real Salesforce DX Project

Run this inside the real Salesforce DX project, not inside this helper repo unless the helper repo is also the real project.

```bash
npm install --save-dev @salesforce/sfdx-lwc-jest
```

Recommended `package.json` scripts:

```json
{
  "scripts": {
    "test:unit": "sfdx-lwc-jest",
    "test:unit:watch": "sfdx-lwc-jest --watch",
    "test:unit:debug": "sfdx-lwc-jest --debug",
    "test:unit:coverage": "sfdx-lwc-jest --coverage"
  }
}
```

## Optional Jest Config

Most Salesforce DX projects can start without a custom Jest config. If a project needs one, use a small config that extends the Salesforce LWC Jest defaults.

See [../QUALITY_GATES/examples/jest-config-lwc-example.md](../QUALITY_GATES/examples/jest-config-lwc-example.md).

## Codex Usage

After editing LWC code, Codex should:

1. Locate the real Salesforce DX project and confirm `force-app/main/default/lwc`.
2. Check whether `package.json` exists in the project root.
3. Check whether `test:unit` or another LWC Jest script exists.
4. Run the focused Jest command when available.
5. If Jest is unavailable, report `SKIPPED` and state whether `package.json`, the script, or the dependency was missing.

Preferred command:

```bash
npm run test:unit
```

Coverage command when the project supports it:

```bash
npm run test:unit -- --coverage
```

## Result Interpretation

| Result | Meaning | Codex Response |
| --- | --- | --- |
| `PASS` | Jest ran and tests passed. | Report the exact command and result. |
| `FAIL` | Jest ran and one or more tests failed. | Do not claim the fix is complete; summarize failures and next action. |
| `SKIPPED` | Jest could not run because setup is missing or no package script exists. | State exactly what was missing and recommend setup. |
| `MISSING` | Required Node/npm tooling is unavailable. | Recommend installation; do not treat missing optional tooling as proof of success. |

## Rules For Codex

- Do not claim Jest passed unless the command actually ran and exited successfully.
- Do not create a new `package.json`, Jest config, or dependency installation without user approval.
- Do not rewrite existing tests broadly to make a failing component pass.
- Keep tests focused on the changed component behavior.
- Mock Apex and wire adapters using existing project patterns when present.
- Verify component public APIs before changing tests or parent component expectations.
