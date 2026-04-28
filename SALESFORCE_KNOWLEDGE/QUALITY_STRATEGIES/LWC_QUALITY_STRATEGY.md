# LWC Quality Strategy

LWC quality requires checking component code, metadata, server dependencies, page placement, tests, lint, and mobile behavior when relevant.

## Quality Priorities

| Priority | Requirement |
| --- | --- |
| Template safety | Keep templates declarative; use JavaScript getters for computed state. |
| Data correctness | Wire and imperative Apex paths handle data, error, loading, and refresh. |
| Contracts | Public `@api`, events, Apex method names, and DTO shapes are verified. |
| Metadata | `js-meta.xml`, targets, form factors, FlexiPages, actions, and permissions are inspected. |
| Tests/lint | LWC Jest and ESLint run when available. |
| Mobile | Mobile layout and form factor behavior reviewed when in scope. |

## Gate Decision Table

| LWC change | Required review | Validation |
| --- | --- | --- |
| JavaScript | Imports, state, events, wire/Apex, errors. | LWC ESLint and Jest if available. |
| HTML | Template syntax, getters, conditional rendering, accessibility. | Lint/static review and Jest if behavior changed. |
| CSS | Scope, responsiveness, mobile webview behavior. | Static/mobile review. |
| Metadata | Targets, form factors, object restrictions. | Metadata inspection and deploy dry run if possible. |
| Apex-backed UI | Apex controller, tests, DTOs, permissions. | Apex tests plus LWC Jest if available. |

## Codex Checklist

- [ ] Full bundle inspected.
- [ ] Parent/child contracts inspected.
- [ ] Apex and metadata dependencies verified.
- [ ] LWC Recipes used only as a reference.
- [ ] LWC Jest/ESLint/mobile lint run or skipped with reason.
