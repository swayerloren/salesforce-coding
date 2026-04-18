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

## Common Failures

- Desktop CSS that does not render in the PDF engine.
- Images that work locally but are not accessible as static resources.
- Large controller queries that hit limits during PDF generation.
- Conditional sections that leave empty borders or blank pages.
- Long strings that overflow because the PDF renderer does not wrap like modern browsers.

