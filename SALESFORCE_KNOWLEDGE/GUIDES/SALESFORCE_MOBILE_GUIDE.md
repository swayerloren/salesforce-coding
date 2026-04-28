# Salesforce Mobile Guide

## Mobile Is A Different Runtime

Salesforce mobile is not just a narrow desktop browser. It can differ in:

- webview lifecycle,
- permission prompts,
- focus/blur timing,
- file picker behavior,
- popup behavior,
- media autoplay and `getUserMedia`,
- viewport units,
- scroll lock,
- Lightning action rendering.

Always test real mobile paths for camera, upload, preview, file, Chatter-like editors, and fullscreen overlays.

For Codex tasks, mobile behavior is a required review area whenever the request mentions Salesforce mobile, mobile form factors, offline use, responsive LWC behavior, quick actions on phones, file preview/download behavior, or mobile record-page visibility.

Focused topics:

- [Mobile Camera And File Handoff](../TOPICS/mobile/mobile-camera-and-file-handoff.md)
- [Photo Capture, Annotation, Viewer, And Generated File Patterns](../TOPICS/files/photo-capture-annotation-viewer.md)
- [Quick Action Visibility Matrix](../TOPICS/metadata/quick-action-visibility-matrix.md)
- [Chatter, Email, And Activity Patterns](../TOPICS/communication/chatter-email-activity-patterns.md)

## Mobile Action Bar And Quick Actions

Mobile action visibility is a metadata chain, not a single component setting.

Before changing code, inspect:

- LWC or Aura target metadata and supported form factors;
- quick action metadata and action type;
- page layout actions;
- Dynamic Actions on the FlexiPage;
- FlexiPage activation for app, profile, record type, and org default;
- object, field, Apex, and custom permissions.

Do not claim an action is mobile-ready until this chain is reviewed. A deployed action can still be hidden in the mobile action bar because of placement, activation, form factor, or permissions.

## Overlay Invariants

For fullscreen or modal workflows, define:

- who owns the overlay host,
- who owns the visible fullscreen shell,
- who owns scroll lock,
- what cleanup runs on close,
- what cleanup runs on `disconnectedCallback`,
- what proof shows the latest bundle mounted.

Do not treat these as CSS-only concerns.

## Camera and Media

`getUserMedia()` success proves only camera acquisition. It does not prove:

- the component mounted,
- the visible preview painted,
- the first frame advanced,
- the overlay is topmost,
- close restored interaction.

For mobile camera flows:

- open a visible shell before acquisition,
- avoid starting too early in first render,
- wait for visibility recovery after permission prompts,
- reset media elements between sessions,
- stop tracks and clear `srcObject` on close,
- release scroll/touch blockers before parent unmount is considered complete.

## Mobile File and PDF Handoff

Blob URLs, popup tabs, and browser REST uploads can fail or be poor UX in Salesforce mobile.

For large generated documents:

- generate client-side if fidelity requires it,
- avoid one-shot giant Apex payloads,
- avoid Apex heap-heavy reassembly,
- use durable external URLs when mobile needs a real browser/PDF handoff,
- validate CSP, CORS, named credentials, and trusted sites together.

For Salesforce Files:

- distinguish `ContentVersion`, `ContentDocument`, and `ContentDocumentLink`;
- resolve whether the UI needs latest version or a selected version;
- prefer platform-supported preview/navigation where available;
- refresh file lists and parent record state after upload, annotation, generated PDF, delete, or relink;
- validate preview/download separately from upload success.

For Visualforce PDF launched from mobile:

- test inside the real Lightning or mobile action context;
- preserve fallback messages when popup or new-tab behavior fails;
- create a durable file before claiming completion when users need later preview or download.

## Photo Capture, Viewer, And Report Flows

Photo and report flows should expose visible states: open, permission, preview, capture, annotate, upload, generate, refresh, and cleanup.

Check that:

- media tracks stop on close, cancel, error, and disconnect;
- the first preview frame is visible after permission prompts;
- annotation output is clearly original, new version, or new linked file;
- report/PDF generation waits for required latest file versions;
- the viewer handles unsupported file types, missing previews, and mobile download fallback.

## Touch and Mention Menus

Mobile blur can fire before click. For menus that insert text:

- start selection on `pointerdown` or `mousedown`,
- guard against duplicate press events,
- delay blur close while selection is in progress,
- explicitly commit textarea value and caret after insertion,
- keep metadata ranges aligned to the exact body text sent to Apex.

For Chatter-like mobile actions, disable submit while posting, handle attachment upload progress, avoid double-posts, and keep private message bodies out of reusable docs and debug output.

## Mobile Lint And Static Checks

When a project has Node tooling, Codex should check for:

- `@salesforce/eslint-plugin-lwc-mobile`
- `@salesforce/eslint-plugin-lwc-graph-analyzer`
- scripts such as `npm run lint:mobile`

Use mobile lint or graph analyzer when the task involves offline behavior, GraphQL wire adapters, Lightning Data Service wire dependencies, or mobile data priming. If these tools are missing, Codex must report the check as skipped and perform static source inspection of the LWC bundle, `js-meta.xml`, FlexiPage placement, actions, CSS, and related Apex.

Do not claim mobile lint passed unless the command actually ran and passed.
