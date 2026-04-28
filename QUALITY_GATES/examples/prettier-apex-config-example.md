# Example Prettier Apex Config

This is an optional example. It is not automatically active and must not be copied into a real Salesforce DX project without reviewing that project's existing formatter setup, Node version, package manager, and CI behavior.

## Example `package.json` Scripts

```json
{
  "scripts": {
    "prettier:apex:check": "prettier --plugin=prettier-plugin-apex --check \"force-app/main/default/**/*.{cls,trigger}\"",
    "prettier:apex:debug-check": "prettier --plugin=prettier-plugin-apex --debug-check \"force-app/main/default/**/*.{cls,trigger}\"",
    "prettier:apex:write": "prettier --plugin=prettier-plugin-apex --write \"force-app/main/default/**/*.{cls,trigger}\""
  },
  "devDependencies": {
    "prettier": "latest",
    "prettier-plugin-apex": "latest"
  }
}
```

## Example `.prettierrc`

```json
{
  "printWidth": 100,
  "tabWidth": 2,
  "useTabs": false
}
```

## Codex Rules

- Prefer existing project scripts over this example.
- Do not add `latest` dependencies to a real project without user approval.
- Pin versions according to the project's dependency policy.
- Use `--check` or `--debug-check` before any `--write` operation.
- Do not mix broad formatting changes with a narrow Apex bug fix.
