# ESLint LWC Parameters

Sources:

- https://github.com/salesforce/eslint-plugin-lwc
- https://github.com/salesforce/eslint-config-lwc
- https://github.com/salesforce/eslint-plugin-lwc-mobile
- https://github.com/salesforce/eslint-plugin-lwc-graph-analyzer

## Config Profiles

| Profile or concept | Use |
| --- | --- |
| `configs.base` | LWC-specific baseline checks. |
| `configs.recommended` | General recommended LWC rules. |
| `configs.extended` | Stronger compatibility/performance checks. |
| `configs.i18n` | Internationalization-specific checks. |
| `configs.ssr` | SSR-specific LWC checks. |
| TypeScript variants | Only when project supports TypeScript LWC. |
| Mobile recommended config | Salesforce mobile/offline LWC work. |
| Graph analyzer recommended config | Static analyzability/data priming/offline work. |

## Codex Rules

- Verify ESLint major version before recommending config changes.
- Preserve existing project config.
- Do not ignore LWC HTML templates for graph analyzer scenarios.
- Prefer `npm run lint` or project-specific lint scripts.
