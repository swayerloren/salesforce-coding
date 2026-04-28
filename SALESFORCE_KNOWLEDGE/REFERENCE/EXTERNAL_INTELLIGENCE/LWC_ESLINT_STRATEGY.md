# LWC ESLint Strategy

Sources:

- https://github.com/salesforce/eslint-plugin-lwc
- https://github.com/salesforce/eslint-config-lwc

LWC ESLint guidance helps Codex avoid common LWC JavaScript and template mistakes.

## Rule Families Codex Should Respect

| Rule family | Risk prevented |
| --- | --- |
| `@api` rules | Reassigning public API or creating invalid public contracts. |
| `@wire` rules | Invalid adapters, unknown adapters, and incorrect callback shapes. |
| DOM rules | Unsafe `document` queries, template child manipulation, and `innerHTML`. |
| Async rules | Unsupported async patterns in LWC lifecycle or rendering paths. |
| Event rules | Leaky listeners and weak custom event usage. |
| SSR/compat rules | Browser globals or imports that are unsafe for specialized rendering contexts. |

## Config Decision Table

| Project state | Codex action |
| --- | --- |
| Existing ESLint config | Preserve it; recommend project script. |
| No config but package has ESLint | Recommend adding config only with user approval. |
| ESLint 9 or later | Flat config may be appropriate; verify package docs. |
| Older ESLint | Use compatible package versions; verify upstream docs. |
| TypeScript LWC | Verify project support before recommending TypeScript config. |

## Validation Flow

1. Inspect `package.json`.
2. Detect `npm run lint`, `lint:lwc`, or similar scripts.
3. Run the project script if safe and requested/appropriate.
4. If no script exists, recommend `npx eslint force-app/main/default/lwc` only when config and dependencies are present.
5. Report missing config or dependencies as skipped.

## Codex Rules

- Keep LWC template logic in JavaScript getters.
- Do not ignore HTML templates when linting template-sensitive rules.
- Do not claim ESLint passed unless the command actually ran and passed.
