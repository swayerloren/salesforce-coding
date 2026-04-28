# Install Tooling

Use this guide only after Codex has located the real Salesforce DX project.

Codex may recommend install commands, but it must not install packages, change dependencies, or create config files unless the user asks for that change.

## Before Installing Anything

- [ ] Confirm the real project root.
- [ ] Confirm `force-app/main/default` exists.
- [ ] Check `sfdx-project.json`.
- [ ] Check `package.json`.
- [ ] Run the local validation helper.
- [ ] Check existing `eslint`, `jest`, `prettier`, `sf`, `sfdx`, and Code Analyzer setup.
- [ ] Ask the user before changing dependencies or config.

## Local Validation First

Windows PowerShell:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\AUTOMATION\local-quality-check.ps1
```

Linux/macOS shell:

```bash
bash ./AUTOMATION/local-quality-check.sh
```

Codex should use the output to decide which tools already exist. Missing optional tools are not automatic failures, but they limit validation evidence.

## Common Optional Installs

Run commands from the real Salesforce DX project root, not from this helper repo.

| Need | Example command | Required? |
| --- | --- | --- |
| LWC Jest | `npm install --save-dev @salesforce/sfdx-lwc-jest` | Optional, recommended for LWC projects. |
| LWC ESLint plugin | `npm install --save-dev @lwc/eslint-plugin-lwc` | Optional, recommended for LWC projects. |
| LWC ESLint config | `npm install --save-dev @salesforce/eslint-config-lwc` | Optional, recommended for LWC projects. |
| Mobile LWC lint | `npm install --save-dev @salesforce/eslint-plugin-lwc-mobile` | Optional, useful for mobile-heavy projects. |
| LWC graph analyzer | `npm install --save-dev @salesforce/eslint-plugin-lwc-graph-analyzer` | Advanced, useful for offline/static analyzability checks. |
| Apex formatter | `npm install --save-dev prettier prettier-plugin-apex` | Optional, useful for formatting checks. |

Salesforce Code Analyzer is commonly used through Salesforce CLI tooling. Check the current upstream docs before installing or upgrading it:

https://github.com/forcedotcom/code-analyzer

## Package Scripts To Prefer

If the real project already has scripts, prefer them:

```json
{
  "scripts": {
    "lint": "eslint force-app/main/default/lwc",
    "lint:lwc": "eslint \"force-app/main/default/lwc/**/*.{js,html}\"",
    "lint:mobile": "eslint \"force-app/main/default/lwc/**/*.{js,html}\"",
    "test:unit": "sfdx-lwc-jest",
    "test:unit:coverage": "sfdx-lwc-jest --coverage",
    "prettier:check": "prettier --check \"force-app/main/default/**/*.{cls,trigger,js,html,css,xml,json}\""
  }
}
```

This is an example shape, not a file to copy blindly.

## Salesforce Code Analyzer

If detected, the helper prints one of these commands:

```bash
sf code-analyzer run --target force-app/main/default
```

```bash
sf scanner run --target force-app/main/default
```

```bash
sfdx scanner:run --target force-app/main/default
```

Use the command that matches the tool actually installed in the real project environment.

## Codex Usage

Codex should:

1. run the validator,
2. inspect `package.json`,
3. prefer existing scripts,
4. recommend missing tools only when they materially improve validation,
5. avoid adding dependencies without user approval.
