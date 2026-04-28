# Visualforce PDF Maintenance

Visualforce PDF remains useful for printable documents, but it has strict rendering behavior. Treat PDFs as constrained server-rendered documents, not as browser pages.

## Stable PDF Rules

- Prefer simple tables for layout.
- Keep CSS conservative and inline when needed.
- Use static resources for images.
- Avoid JavaScript-dependent rendering.
- Use `rendered` guards for optional sections.
- Keep controller queries explicit and small.
- Test with realistic long text, missing values, and page breaks.
- Preserve working launcher behavior, fallback messages, and URL parameter contracts.

## Controller And Page Review

Before editing, identify:

- standard controller, extension, custom controller, or launcher page;
- fields, relationships, and static resources the page depends on;
- whether the page renders HTML, PDF, or both;
- user context, sharing expectations, and permission checks;
- whether output is only displayed or also saved as a Salesforce File.

Do not rewrite a stable PDF page because it looks old. Stable PDF output often relies on conservative Visualforce markup.

## Safe Optional Output

```xml
<apex:outputPanel rendered="{!NOT(ISBLANK(project.Description__c))}">
    <h2>Description</h2>
    <apex:outputText value="{!project.Description__c}" escape="true"/>
</apex:outputPanel>
```

## HTML-Rich Fields

Only use unescaped output when the content is trusted and sanitized by the application.

```xml
<apex:outputText value="{!safeHtml}" escape="false"/>
```

## Page Break Pattern

```css
.page-break {
  page-break-before: always;
}

.avoid-break {
  page-break-inside: avoid;
}
```

## File And Mobile Handoff

When a PDF is generated for later use, prefer a durable Salesforce File or intentional distribution artifact over a transient popup.

Check:

- `ContentVersion`, `ContentDocument`, and `ContentDocumentLink` responsibilities;
- latest-version behavior when photos or annotations feed the PDF;
- mobile behavior from the real action context;
- Experience Cloud or external user access when relevant;
- preview, download, and refresh behavior after generation.

## Common Failures

- Desktop CSS that does not render in the PDF engine.
- Images that work locally but are not accessible as static resources.
- Large controller queries that hit limits during PDF generation.
- Conditional sections that leave empty borders or blank pages.
- Long strings that overflow because the PDF renderer does not wrap like modern browsers.
- Launcher pages that work on desktop but fail inside mobile or modal contexts.
- Generated output that is shown in a tab but never attached as a durable file.
- PDF generation that starts before related file processing finishes.
