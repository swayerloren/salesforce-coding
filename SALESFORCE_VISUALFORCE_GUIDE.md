# Salesforce Visualforce Guide

## Visualforce PDF Posture

Working Visualforce PDF pages are output contracts. Preserve current PDF output before improving code style.

Do not rewrite a working page from scratch unless the task explicitly requires a redesign.

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

