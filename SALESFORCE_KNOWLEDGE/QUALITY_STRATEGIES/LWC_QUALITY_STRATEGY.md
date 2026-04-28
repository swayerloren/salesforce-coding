# LWC Quality Strategy

LWC quality requires checking component code, metadata, server dependencies, page placement, tests, lint, and mobile behavior when relevant.

## Quality Priorities

| Priority | Requirement |
| --- | --- |
| Template safety | Keep templates declarative; use JavaScript getters for computed state. |
| Data correctness | Wire, LDS, record form, and imperative Apex paths handle data, error, loading, cache, and refresh. |
| Contracts | Public `@api`, events, Apex method names, and DTO shapes are verified. |
| Metadata | `js-meta.xml`, targets, form factors, FlexiPages, actions, and permissions are inspected. |
| Navigation/toasts | `NavigationMixin`, `ShowToastEvent`, and refresh mechanisms are used in the right order. |
| Files/mobile | Upload, preview, generated PDF, Chatter-like actions, and mobile action behavior are reviewed when in scope. |
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
| Wired Apex or UI API | Reactive params, cacheability, stored wire result, loading/error states. | Jest/static review and `refreshApex` path check. |
| Imperative Apex | Mutations, disabled controls, awaited completion, post-DML refresh. | Apex tests if server changed and UI static/Jest checks. |
| Record form or dynamic fields | `lightning-record-edit-form`, metadata, field access, required fields, compound fields. | Metadata/security review and form error-state test. |
| Navigation or toast | PageReference support, URL state safety, toast timing, refresh target. | Static review and runtime notes for mobile/portal if relevant. |
| Files, photos, PDFs | Files object model, latest version, preview/download, generated artifact refresh. | Files guide review plus Apex/UI validation as applicable. |

## Codex Checklist

- [ ] Full bundle inspected.
- [ ] Parent/child contracts inspected.
- [ ] Apex and metadata dependencies verified.
- [ ] Wire versus imperative Apex choice is justified.
- [ ] Navigation, toast, and refresh order is correct.
- [ ] Record form or dynamic field metadata/security is verified when present.
- [ ] Mobile, file preview/download, generated PDF, or Chatter-like action behavior is reviewed when in scope.
- [ ] LWC Recipes used only as a reference.
- [ ] LWC Jest/ESLint/mobile lint run or skipped with reason.
