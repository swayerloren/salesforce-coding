# Quick Action and FlexiPage Notes

Creating a quick action and deploying a component does not automatically make the action visible everywhere. Activation is a separate metadata concern.

## Visibility Path

1. The action exists on the object.
2. The user has object and field access.
3. The action is placed on the relevant page layout or Lightning page action region.
4. The active FlexiPage assignment matches the app, profile, and form factor.
5. Mobile users have a phone form factor path that includes the action.

## Review Before Deploying

- Is the action an object action, global action, or LWC screen action?
- Does the LWC `.js-meta.xml` include the correct target?
- Is the action assigned in the same app users open?
- Does Dynamic Forms change where fields appear but not where the action appears?
- Are visibility filters hiding the component?

