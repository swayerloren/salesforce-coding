# Example Package Scripts For LWC Quality Gates

This is an optional example. It is not automatically active and must not be copied into a real Salesforce DX project without reviewing the project's existing scripts, dependencies, CI behavior, and Node version.

## Example

```json
{
  "scripts": {
    "lint": "eslint \"force-app/main/default/lwc/**/*.{js,html}\"",
    "lint:lwc": "eslint \"force-app/main/default/lwc/**/*.{js,html}\"",
    "lint:mobile": "eslint \"force-app/main/default/lwc/**/*.{js,html}\"",
    "test:unit": "sfdx-lwc-jest",
    "test:unit:watch": "sfdx-lwc-jest --watch",
    "test:unit:debug": "sfdx-lwc-jest --debug",
    "test:unit:coverage": "sfdx-lwc-jest --coverage",
    "prettier:check": "prettier --check \"force-app/main/default/**/*.{cls,trigger,js,html,css,json,xml}\""
  },
  "devDependencies": {
    "@salesforce/sfdx-lwc-jest": "latest",
    "@salesforce/eslint-config-lwc": "latest",
    "@lwc/eslint-plugin-lwc": "latest",
    "eslint": "latest",
    "prettier": "latest"
  }
}
```

## Codex Rules

- Prefer existing project scripts over this example.
- Do not add `latest` dependencies to a real project without user approval.
- Pin versions according to the project's existing package policy.
- Do not create `package.json` in a project that does not already use Node tooling unless the user asks for it.
- For mobile or offline projects, consider `@salesforce/eslint-plugin-lwc-mobile` and `@salesforce/eslint-plugin-lwc-graph-analyzer` only after checking Node and ESLint compatibility.
