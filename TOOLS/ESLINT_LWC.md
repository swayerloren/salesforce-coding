# LWC ESLint

## Purpose

LWC ESLint catches JavaScript and Lightning Web Component mistakes before deployment. It is especially useful for Codex because it flags framework-specific errors that can look valid to a generic JavaScript model.

Use it after changes to:

- LWC JavaScript
- LWC HTML templates
- Apex imports and wire usage
- Event handling
- Browser API usage
- Public `@api`, `@wire`, and tracked state behavior

Upstream references:

- [salesforce/eslint-config-lwc](https://github.com/salesforce/eslint-config-lwc)
- [salesforce/eslint-plugin-lwc](https://github.com/salesforce/eslint-plugin-lwc)
- [salesforce/eslint-plugin-lwc-graph-analyzer](https://github.com/salesforce/eslint-plugin-lwc-graph-analyzer)

## Status

| Area | Guidance |
| --- | --- |
| Required for this helper repo | No |
| Recommended for real Salesforce DX projects | Yes |
| Requires Salesforce org login | No |
| Safe for public repos | Yes |
| Codex may install automatically | No, only with user approval |

## Install In A Real Salesforce DX Project

Run dependency installation inside the real Salesforce DX project.

Recommended Salesforce LWC config packages:

```bash
npm install --save-dev eslint @salesforce/eslint-config-lwc @lwc/eslint-plugin-lwc @salesforce/eslint-plugin-lightning eslint-plugin-import eslint-plugin-jest
```

For projects using direct plugin configuration:

```bash
npm install --save-dev eslint @babel/core @babel/eslint-parser @lwc/eslint-plugin-lwc
```

For advanced static analyzability or offline/mobile data priming checks:

```bash
npm install --save-dev @salesforce/eslint-plugin-lwc-graph-analyzer
```

## Recommended Scripts

```json
{
  "scripts": {
    "lint": "eslint \"force-app/main/default/lwc/**/*.{js,html}\"",
    "lint:lwc": "eslint \"force-app/main/default/lwc/**/*.{js,html}\""
  }
}
```

See [../QUALITY_GATES/examples/eslint-config-lwc-example.md](../QUALITY_GATES/examples/eslint-config-lwc-example.md).

## Rule Areas Codex Should Care About

| Area | Why It Matters |
| --- | --- |
| `@api` validation | Prevents invalid public API usage and accidental reassignment. |
| `@wire` validation | Catches invalid wire adapters, bad reactive config, and unknown adapters. |
| Template validity | Prevents unsupported expressions and missing properties. |
| Browser globals | Helps avoid unsafe `window` and `document` usage in Salesforce contexts. |
| Event practices | Encourages safe custom event patterns. |
| DOM mutation | Flags direct DOM querying and mutation patterns that break LWC assumptions. |
| SSR and portability | Helps when components need broader runtime compatibility. |
| Graph analyzer | Advanced check for static analyzability, wire dependency graphs, and offline readiness. |

## LWC Template Rule

Codex must keep LWC templates declarative. Salesforce LWC HTML does not support arbitrary inline JavaScript expressions.

Use JavaScript getters for template logic:

```js
get hasItems() {
  return Array.isArray(this.items) && this.items.length > 0;
}
```

```html
<template if:true={hasItems}></template>
```

Avoid inline JavaScript expressions in templates:

```html
<!-- Do not use this shape in Salesforce LWC templates. -->
<template if:true={items.length}></template>
```

## Codex Usage

After LWC changes, Codex should:

1. Check for `package.json`.
2. Check for `lint`, `lint:lwc`, or similar scripts.
3. Check whether `eslint`, `@salesforce/eslint-config-lwc`, `@lwc/eslint-plugin-lwc`, or related LWC packages are present.
4. Run the configured lint command when available.
5. If no lint setup exists, report `SKIPPED` and recommend a safe setup rather than creating one without approval.

Preferred commands:

```bash
npm run lint:lwc
npm run lint
```

## Missing Tool Behavior

| Situation | Codex Output |
| --- | --- |
| No `package.json` | `SKIPPED: no package.json found in the real Salesforce DX project.` |
| No lint script | `SKIPPED: package.json exists but no lint script is configured.` |
| No npm/node | `MISSING: Node/npm is not available.` |
| Lint fails | `FAIL: report the command and summarize findings.` |
| Lint passes | `PASS: report the exact command and result.` |

## Rules For Codex

- Do not claim lint passed unless ESLint actually ran and passed.
- Do not add dependencies, create config files, or rewrite project lint strategy without user approval.
- Do not disable LWC rules to hide findings unless the user explicitly approves and the reason is documented.
- Do not invent object, field, Apex, event, or component names from public sample repos.
- Treat graph analyzer as advanced and optional unless the project already uses it or the task involves offline/mobile data priming.
