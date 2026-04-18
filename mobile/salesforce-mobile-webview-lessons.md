# Salesforce Mobile Webview Lessons

The Salesforce mobile app is not just a smaller desktop browser. It runs Lightning in a mobile shell with different file handling, navigation, viewport, keyboard, and media behavior.

## Lessons That Repeatedly Matter

- Test on the real Salesforce mobile app, not only browser responsive mode.
- Keep tap targets large enough for touch.
- Avoid hover-only controls.
- Use `env(safe-area-inset-*)` for fixed UI.
- Keep overlays scrollable and closeable.
- Avoid assuming blob URLs will preview or download reliably.
- Prefer durable file URLs or standard file navigation for mobile preview.
- Instrument mobile flows with visible status when browser devtools are unavailable.

## File Preview

Desktop patterns often use generated blobs or object URLs. Mobile shells may not handle those consistently. For durable file actions:

- Save the file as `ContentVersion`.
- Query or receive the resulting `ContentDocumentId`.
- Navigate to the file or expose a server-backed URL.
- Avoid huge base64 strings in one Apex response.

## Camera and Upload

- Keep camera/upload controls outside fragile nested scroll containers.
- Expect permission prompts and cancellation.
- Show upload progress or at least a busy state.
- Refresh the file list after upload completes.
- Recompute parent file counts asynchronously when needed.

## Debugging Mobile UI

Add temporary, removable instrumentation:

- Current record id.
- Current phase, such as `loading`, `saving`, `previewing`, `complete`.
- Last caught error message.
- Whether a child component mounted.
- Whether the latest server call returned data.

Remove or hide the instrumentation before public release unless it is part of admin diagnostics.

