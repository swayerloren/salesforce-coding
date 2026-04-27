# Salesforce Debugging Guide

## Root-Cause Discipline

For every bug, write down:

- symptom,
- reproduction context,
- exact entry point,
- root cause,
- fix,
- test/deploy result,
- lesson to prevent recurrence.

Do not stop at the first visible failure. In Salesforce, UI symptoms often come from metadata, permissions, cached Lightning runtime, async side effects, or tests.

## Debugging Order

1. Reproduce and capture exact context.
2. Identify the entry point.
3. Inspect metadata wiring.
4. Inspect server code path.
5. Inspect permissions and FLS.
6. Inspect async, callout, and file side effects.
7. Add narrow instrumentation if terminal reasoning is no longer decisive.
8. Validate with targeted tests and real runtime where needed.

## Visible Instrumentation

For mobile and webview failures, console logs may not be enough. Add temporary visible state inside the component when:

- the latest bundle might not be mounting,
- a child component might not render,
- camera/media state differs from UI state,
- user screenshots are the only runtime evidence.

Expose stage names like:

- mounted,
- connected,
- rendered,
- requesting-camera,
- waiting-visible,
- attaching-preview,
- waiting-first-frame,
- ready,
- error.

Remove or minimize proof banners after the root cause is fixed.

## Separate Failure Layers

Do not collapse distinct problems into one generic issue. For example, a camera feature can fail at:

- button tap,
- parent state,
- child mount,
- shell visibility,
- permission,
- media acquisition,
- preview paint,
- save/upload,
- close cleanup.

Each layer needs different evidence and a different fix.

## Salesforce CLI Probes

CLI probes are useful but not always authoritative. A failed CLI field query can be caused by the command shape, permission, API behavior, or quoting. If runtime Apex already proves a field is usable, do not let one bad terminal query drive a rewrite.

## Tests As Debug Evidence

When a test fails:

- confirm whether the failing class is in the changed subsystem,
- identify if failure is compile, coverage, logic, row lock, SOQL limit, or org-state dependency,
- compare expected behavior to current product contract,
- avoid weakening tests that are correctly exposing a regression.

