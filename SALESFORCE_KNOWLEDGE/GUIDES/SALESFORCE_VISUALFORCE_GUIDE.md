# Salesforce Visualforce Guide

## Visualforce PDF Posture

Working Visualforce PDF pages are output contracts. Preserve current PDF output before improving code style.

Do not rewrite a working page from scratch unless the task explicitly requires a redesign.

Focused topics:

- [Visualforce PDF Maintenance](../TOPICS/visualforce/pdf-maintenance.md)
- [Photo Capture, Annotation, Viewer, And Generated File Patterns](../TOPICS/files/photo-capture-annotation-viewer.md)
- [Mobile Camera And File Handoff](../TOPICS/mobile/mobile-camera-and-file-handoff.md)

## Why PDF Pages Look Old

Visualforce PDF rendering is not a modern browser. Stable pages often use:

- tables,
- inline styles,
- explicit widths,
- simple fonts,
- conservative page breaks,
- `rendered` conditions,
- standard controllers,
- controller extension DTOs.

Those choices can be correct for PDF stability.

## Safe Workflow

1. Identify the exact page.
2. List field, relationship, static resource, and controller dependencies.
3. Identify whether the page uses a standard controller, extension, or launcher behavior.
4. Make the smallest change.
5. Test populated and blank optional fields.
6. Compare the resulting PDF visually.

## Page And Controller Contract

Before changing a Visualforce page or controller:

- identify the controller type: standard controller, extension, custom controller, or launcher page;
- list every queried object, field, relationship, and static resource;
- verify sharing, CRUD/FLS handling, and user context expectations;
- identify whether the page renders HTML, PDF, both, or redirects to another resource;
- preserve URL parameters, return behavior, and action status messages unless the task explicitly changes them.

Do not convert a stable PDF page to a modern component model as a cleanup step. Visualforce PDF stability often depends on conservative markup.

## Static Resources

Resource access patterns vary:

```xml
{!URLFOR($Resource.MyLogo)}
```

```html
<img src="/resource/MyLogo" />
```

```xml
{!URLFOR($Resource[record.Dynamic_Logo__c])}
```

Do not normalize them blindly. Each pattern has different packaging and runtime assumptions.

## `escape="false"`

`escape="false"` is useful for trusted rich text but dangerous for untrusted content. If a field renders with `escape="false"`:

- verify the source is controlled,
- check whether HTML formatting is required,
- consider sanitization before output,
- test long and malformed content.

## Conditional Rows

When conditionally rendering table rows, use markup that does not break the table structure. `apex:outputPanel layout="none"` can be appropriate for conditional `tr` groups.

## Launcher Pages

Visualforce launcher pages that open a PDF in a new tab can fail because of popup blockers, Lightning modal context, mobile container behavior, and browser security policy.

Preserve fallback messages and test inside the real Lightning action context.

## PDF Rendering Limits

Visualforce PDF is not a modern browser runtime.

Avoid relying on:

- JavaScript execution;
- complex modern CSS layout;
- external images that are not reliably accessible;
- giant inline base64 assets;
- unbounded controller queries;
- browser-only download behavior.

Use simple tables, static resources, explicit widths, conservative page breaks, and rendered guards for optional sections.

## Generated File Handoff

If a Visualforce PDF is part of a larger file workflow, identify whether the output is:

- previewed immediately;
- attached as a Salesforce File;
- distributed externally;
- opened from a mobile action;
- used by a report, photo, or annotation workflow.

When users need later access, create a durable file and refresh the parent file list instead of treating a popup or tab as the final artifact.

## Failure Modes To Check

- blank optional fields leave broken table rows;
- long text or images overflow page boundaries;
- static resources work in HTML preview but fail in PDF rendering;
- launcher works on desktop but fails in Salesforce mobile;
- generated PDF runs before latest photo or annotation files are available;
- controller queries or generated payloads hit limits during render;
- fallback messaging was removed, leaving users with a blank page.
