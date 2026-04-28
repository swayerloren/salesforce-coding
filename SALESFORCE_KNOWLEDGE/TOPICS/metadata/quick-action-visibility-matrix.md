# Quick Action Visibility Matrix

Use this when an LWC, Aura component, Flow, Visualforce page, or standard action should appear on a record page or in Salesforce mobile.

## Visibility Chain

An action is visible only when every required layer agrees.

| Layer | What to inspect |
| --- | --- |
| Component target | LWC `js-meta.xml` target such as `lightning__RecordAction`, supported form factors, and target object restrictions. |
| Action metadata | Object action file, action type, target component/page/flow, label, icon, and subtype. |
| Layout actions | Page layout Salesforce Mobile and Lightning Experience Actions section when Dynamic Actions are not controlling the page. |
| Dynamic Actions | FlexiPage action configuration, visibility filters, form factors, and activation. |
| FlexiPage activation | Object, app, record type, profile, and org default activation chain. |
| Permissions | Object CRUD, field access, Apex class access, custom permissions, component access, and record access. |
| Runtime | Desktop Lightning, console, Salesforce mobile, Experience Cloud, and offline constraints. |

Do not stop after finding the source file. A source action that deploys successfully can still be hidden by activation, permissions, form factor, or Dynamic Actions.

## LWC Quick Action Rules

- Confirm whether the component is a screen action or headless action.
- Screen actions must own loading, cancel, validation, and completion state.
- Headless actions should guard duplicate execution and report recoverable errors.
- Do not assume a record ID is available before the action context initializes.
- Keep desktop and mobile modal sizing explicit.
- Use `NavigationMixin` and refresh mechanisms instead of hardcoded URLs after completion.

## Mobile-Specific Checks

- Supported form factor includes phone when required.
- The action is placed where Salesforce mobile renders it.
- Dynamic Actions visibility rules do not exclude phone.
- The label and icon are understandable in compact mobile UI.
- The action does not depend on popup windows, hover, drag-only controls, or desktop-width layout.

## Fix Strategy

1. Identify the intended surface and user population.
2. Inspect component metadata and action metadata.
3. Inspect layout actions and Dynamic Actions.
4. Inspect FlexiPage activation and profile/app/record type scope.
5. Inspect object, field, Apex, and custom permissions.
6. Make the smallest metadata or component change.
7. Validate with a deploy dry run when possible.
8. Report any runtime path that could not be tested.

## Common Failures

- LWC bundle exists but does not expose `lightning__RecordAction`.
- Action metadata points to a renamed or missing component.
- Action is on the layout but Dynamic Actions replaced the visible action list.
- FlexiPage activation uses a different record type, app, or profile than the user expects.
- Mobile excludes the action because form factor or placement was not configured.
- User lacks Apex class access or field access needed by the action.
