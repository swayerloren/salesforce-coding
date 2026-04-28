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

## Touch and Mention Menus

Mobile blur can fire before click. For menus that insert text:

- start selection on `pointerdown` or `mousedown`,
- guard against duplicate press events,
- delay blur close while selection is in progress,
- explicitly commit textarea value and caret after insertion,
- keep metadata ranges aligned to the exact body text sent to Apex.

## Mobile Lint And Static Checks

When a project has Node tooling, Codex should check for:

- `@salesforce/eslint-plugin-lwc-mobile`
- `@salesforce/eslint-plugin-lwc-graph-analyzer`
- scripts such as `npm run lint:mobile`

Use mobile lint or graph analyzer when the task involves offline behavior, GraphQL wire adapters, Lightning Data Service wire dependencies, or mobile data priming. If these tools are missing, Codex must report the check as skipped and perform static source inspection of the LWC bundle, `js-meta.xml`, FlexiPage placement, actions, CSS, and related Apex.

Do not claim mobile lint passed unless the command actually ran and passed.
