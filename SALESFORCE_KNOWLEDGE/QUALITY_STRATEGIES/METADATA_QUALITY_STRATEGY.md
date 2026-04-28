# Metadata Quality Strategy

Salesforce metadata quality depends on path correctness, activation chains, permission visibility, and narrow deployment scope.

## High-Risk Metadata

| Metadata | Risk |
| --- | --- |
| Profiles | Broad access changes and noisy diffs. |
| Permission sets | Access changes that can affect user visibility. |
| FlexiPages | Component visibility and activation complexity. |
| Layouts | Field/button/related list visibility. |
| Record types | Page, layout, picklist, and business process impact. |
| Reports/dashboards | Folder, field, and object dependency risk. |
| Static resources | Packaging and reference risk. |
| `package.xml` | Wide or stale deploy scope. |

## Quality Checks

- [ ] Source-format path is correct.
- [ ] Existing metadata was inspected before editing.
- [ ] API names are verified.
- [ ] Activation and assignment chain is inspected for record-page behavior.
- [ ] Permission sets/profiles are inspected when visibility is involved.
- [ ] Package manifest scope is narrow.
- [ ] Deploy dry run is planned when possible.

## Codex Rule

Do not assume a component appears on a page just because it deploys. Check activation, assignment, permissions, form factor, app/profile/record type context, and layout/action chain.
