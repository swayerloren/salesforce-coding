# Mobile File, Preview, And PDF Issues

## Desktop Works, Mobile Fails

Likely causes:

- blob URL handoff does not work well in Salesforce mobile,
- popup/new tab is blocked,
- browser REST upload lacks a usable mobile session,
- final artifact is an HTML wrapper instead of a real PDF,
- file preview URL is not durable or accessible from mobile context.

Fix patterns:

- use durable HTTPS URLs for final mobile PDF handoff;
- keep client-side rendering if fidelity requires it;
- avoid one-shot base64 upload to Apex for large documents;
- avoid Apex heap-heavy file reconstruction;
- validate CSP, CORS, named credentials, and external provider config together.

## Camera Active But Blank Preview

Cause:

- camera acquisition succeeded, but visible component shell or preview surface did not paint.

Debug order:

1. prove parent state,
2. prove child mount,
3. prove shell visibility,
4. prove permission and stream,
5. prove preview first frame,
6. prove close cleanup.

## Page Frozen After Close

Cause:

- scroll/touch blockers or media tracks outlive the visible overlay.

Fix:

- close path should stop tracks, clear media source, release blockers, and only then dispatch close to parent.

