# Fix LWC Flow

## Sequence

1. Read startup docs.
2. Locate real Salesforce DX project.
3. Read LWC guide, record page guide, mobile guide, LWC quality strategy, commands, and parameters.
4. Inspect full LWC bundle.
5. Inspect Apex controller, parent/child components, metadata, permissions, and page placement.
6. Identify root cause.
7. Make smallest safe fix.
8. Run LWC Jest if configured.
9. Run LWC ESLint if configured.
10. Run mobile lint or graph analyzer if mobile/offline is in scope and configured.
11. Run Apex tests if Apex changed.
12. Record Memory and History.

## Validation Decision Table

| Situation | Action |
| --- | --- |
| `package.json` missing | Mark Node gates `SKIPPED`. |
| `test:unit` exists | Prefer `npm run test:unit`. |
| `lint` or `lint:lwc` exists | Run relevant lint if safe. |
| Mobile in scope | Check mobile metadata and optional mobile lint. |
| Apex controller changed | Run focused Apex tests if possible. |

## Minimum Final Report

- Root cause.
- Full bundle files changed.
- Jest/lint/mobile validation results or skipped reasons.
- Apex validation if server behavior changed.
- Metadata/page placement checks.
