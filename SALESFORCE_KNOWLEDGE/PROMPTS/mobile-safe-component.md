# Prompt: Build A Mobile-Safe Salesforce Component

Use this prompt when building or fixing a component that must work in the Salesforce mobile app.

```text
You are working on a Salesforce UI component that must support mobile.

Goal:
Make the component usable in the Salesforce mobile app and desktop Lightning.

Before editing:
- Inspect supported form factors in metadata.
- Identify overlays, file preview/download, camera/upload, navigation, and scroll behavior.
- Check parent containers and record-page placement.
- Determine whether the issue happens in mobile app, mobile browser, desktop, or all contexts.

Implementation rules:
- Avoid hover-only interactions.
- Keep touch targets usable.
- Respect safe-area insets for fixed UI.
- Keep modal content scrollable and close controls reachable.
- Avoid relying on blob URLs for mobile file preview.
- Use standard navigation when possible.
- Add visible diagnostics only when needed and remove or hide them before release.

Validation:
- Test desktop and phone form factors.
- Check keyboard behavior, rotation, scrolling, upload/cancel, and close paths.
- Summarize any mobile-only limitations.
```

