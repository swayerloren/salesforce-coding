# FlexiPage and Action Activation

Record page changes often fail functionally even when metadata deploys successfully. The component exists, but the active page, object action layout, app assignment, or form factor assignment is not the one users are opening.

For a stricter action-specific matrix, use [Quick Action Visibility Matrix](quick-action-visibility-matrix.md).

## Activation Checklist

- Object has the expected Lightning record page assignment.
- App assignment matches the app users open.
- Profile or org-default assignment is correct.
- Phone and desktop form factors are both reviewed.
- The object `View` override points to Lightning Experience where needed.
- Quick actions are on the page action layout or Highlights Panel.
- Component targets include the intended page type.
- Visibility filters do not hide the component for target users.

## Dynamic Forms vs Page Layouts

Dynamic Forms can move field sections onto Lightning pages, but actions and many related lists still depend on object metadata, Highlights Panel configuration, or page layout behavior. Review both systems before assuming the FlexiPage is the only source of truth.

## Quick Action Notes

- Adding a quick action to source does not guarantee it appears to users.
- The action must be assigned in the relevant layout or page action region.
- Mobile action order can differ from desktop.
- Permissions and object access can hide actions.
- Some standard actions behave differently in the mobile app.
- Dynamic Actions can replace the visible action list and apply separate visibility filters by context.
- LWC quick actions must expose the correct target and form factor metadata.

## Debugging Path

1. Confirm the exact record URL and app.
2. Inspect the active Lightning page assignment.
3. Compare desktop and phone form factor assignments.
4. Check the component `.js-meta.xml` targets.
5. Check action layout and Highlights Panel.
6. Check visibility filters and permissions.
7. Only then edit component code.
