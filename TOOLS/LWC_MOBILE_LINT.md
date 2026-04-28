# LWC Mobile Lint

## Purpose

LWC mobile linting helps catch Salesforce mobile and offline readiness issues that normal JavaScript checks can miss. It is most useful for Salesforce mobile app, offline GraphQL, LDS, wire adapter, and mobile record-page work.

Upstream references:

- [salesforce/eslint-plugin-lwc-mobile](https://github.com/salesforce/eslint-plugin-lwc-mobile)
- [salesforce/eslint-plugin-lwc-graph-analyzer](https://github.com/salesforce/eslint-plugin-lwc-graph-analyzer)

## Status

| Area | Guidance |
| --- | --- |
| Required for this helper repo | No |
| Recommended for mobile Salesforce projects | Yes |
| Requires Salesforce org login | No |
| Safe for public repos | Yes |
| Codex may install automatically | No, only with user approval |

## What It Helps Catch

| Area | Examples |
| --- | --- |
| Offline Apex risks | Apex imports and data flows that may not work offline. |
| GraphQL mobile constraints | Unsupported GraphQL shapes for offline/mobile use. |
| Wire static analysis | Wires and template dependencies that cannot be statically analyzed. |
| Mobile data priming | Components that cannot participate cleanly in offline-ready data flows. |
| HTML coverage | Graph analyzer checks both JavaScript and HTML where configured. |

## Install In A Real Salesforce DX Project

Run inside the real Salesforce DX project.

```bash
npm install --save-dev @salesforce/eslint-plugin-lwc-mobile
```

Advanced graph analyzer:

```bash
npm install --save-dev @salesforce/eslint-plugin-lwc-graph-analyzer
```

The mobile plugin and graph analyzer may have stricter Node version expectations than older Salesforce DX projects. Codex should inspect the project `package.json`, lockfile, and CI runtime before recommending installation.

## Recommended Scripts

```json
{
  "scripts": {
    "lint:mobile": "eslint \"force-app/main/default/lwc/**/*.{js,html}\""
  }
}
```

The script name can vary by project. Codex should prefer the project's existing script over inventing a new one.

## Codex Usage

For Salesforce mobile work, Codex must:

1. Inspect the target LWC bundle, `js-meta.xml`, related FlexiPages, actions, CSS, Apex controllers, and permissions.
2. Treat mobile behavior as a required review area, not a final optional note.
3. Check whether mobile lint or graph analyzer is already configured.
4. Run the configured mobile lint command when available.
5. If missing, report `SKIPPED` and recommend setup when mobile/offline behavior matters.

## Result Interpretation

| Result | Meaning | Codex Response |
| --- | --- | --- |
| `PASS` | Mobile lint ran and passed. | Report command and result. |
| `FAIL` | Mobile lint found issues. | Summarize findings and do not claim the mobile fix is complete. |
| `SKIPPED` | No mobile lint setup exists. | State what is missing and inspect mobile metadata manually. |
| `MISSING` | Node/npm or ESLint is unavailable. | Recommend setup without treating the skip as success. |

## Mobile Review Rules

- Do not rely on hover-only interactions.
- Keep tap targets, modals, scroll containers, and overflow safe for mobile webviews.
- Verify `js-meta.xml` targets and supported form factors.
- Verify record-page placement, action visibility, and page activation metadata.
- Use getters for template logic and avoid inline JavaScript expressions in LWC HTML.
- Use mobile lint or graph analyzer when available for mobile/offline-sensitive components.
