# Example ESLint Config For LWC

This is an optional example. It is not automatically active and should be adapted to the real Salesforce DX project's ESLint version, module format, package manager, and CI runtime.

## ESLint 9 Flat Config Example

```js
const lwcConfig = require('@salesforce/eslint-config-lwc');

module.exports = [
  ...lwcConfig.configs.recommended,
  {
    files: ['force-app/main/default/lwc/**/*.{js,html}'],
    rules: {
      // Add project-specific overrides only with a documented reason.
    }
  }
];
```

## Optional Mobile Lint Extension

Only add this when the project intentionally supports the Salesforce mobile app or offline-sensitive LWCs and the package is compatible with the project's Node/ESLint versions.

```js
const lwcMobilePlugin = require('@salesforce/eslint-plugin-lwc-mobile');

module.exports = [
  ...lwcMobilePlugin.recommendedConfigs
];
```

## Optional Graph Analyzer Extension

Only add this when the project needs static analyzability, data priming, or offline readiness checks.

```js
const js = require('@eslint/js');
const lwcGraphAnalyzerPlugin = require('@salesforce/eslint-plugin-lwc-graph-analyzer');

module.exports = [
  { plugins: { '@salesforce/lwc-graph-analyzer': lwcGraphAnalyzerPlugin } },
  js.configs.recommended,
  lwcGraphAnalyzerPlugin.configs.recommended
];
```

## Codex Rules

- Inspect the project's existing ESLint config before suggesting changes.
- Do not mix flat config and legacy `.eslintrc` style without confirming the project's ESLint version.
- Do not ignore LWC HTML files when graph analyzer is configured.
- Do not disable LWC rules just to make a run pass.
- Keep all object, field, component, and Apex names sourced from the real project.
