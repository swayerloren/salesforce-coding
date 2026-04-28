# LWC Mobile Strategy

Sources:

- https://github.com/salesforce/eslint-plugin-lwc-mobile
- https://github.com/salesforce/eslint-plugin-lwc-graph-analyzer

Mobile and offline Salesforce behavior requires checks beyond desktop LWC validation.

## What Codex Should Learn

| Area | Risk |
| --- | --- |
| Form factor | Component may deploy but not appear or behave on mobile. |
| GraphQL/offline | Queries can exceed offline/mobile analyzability limits. |
| Apex imports | Server-dependent behavior may not work for offline expectations. |
| Template analyzability | Dynamic templates and getters can block static analysis. |
| CSS/layout | Modals, scroll containers, overflow, and tap targets behave differently in mobile webviews. |

## Mobile Review Checklist

- [ ] `js-meta.xml` targets and form factors inspected.
- [ ] FlexiPage/action placement inspected.
- [ ] Permission and object restrictions inspected.
- [ ] HTML and JavaScript reviewed together.
- [ ] Mobile CSS and overflow behavior considered.
- [ ] LWC mobile lint or graph analyzer run when configured.
- [ ] If mobile runtime testing is unavailable, static checks are clearly reported.

## Optional Gate Decision

| Project type | Recommended gate |
| --- | --- |
| Desktop-only LWC | Standard LWC ESLint/Jest; mobile lint optional. |
| Salesforce mobile app | Mobile checklist plus LWC mobile lint if available. |
| Offline/data priming | Mobile lint plus graph analyzer if available. |
| Unknown target | Inspect metadata and ask if mobile behavior is in scope. |

## Do Not

- Do not assume desktop validation proves mobile safety.
- Do not ignore `.html` files for graph analyzer use cases.
- Do not claim mobile lint passed unless it ran and passed.
