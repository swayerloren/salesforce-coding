# Record Page Action Troubleshooting

## Action Missing From Header

Check:

1. quick action metadata exists,
2. action is in the page or layout action list,
3. active FlexiPage is the page you edited,
4. form factor matches the page you edited,
5. `numVisibleActions` is not hiding it in overflow,
6. user has object, field, Apex class, and LWC access,
7. Dynamic Actions rules do not hide it,
8. app/profile assignment is not selecting another page.

## LWC Quick Action Opens But Fails

Check:

- `recordId` is present,
- Apex method access is granted,
- required fields have FLS,
- target object required fields are populated,
- server error is surfaced in toast/logs,
- navigation uses `NavigationMixin`.

## Action Works Desktop But Not Mobile

Check:

- Small form factor page assignment,
- mobile Highlights Panel/native action support,
- component `.js-meta.xml` form factors,
- mobile-specific layout and overflow,
- popup/navigation behavior.

