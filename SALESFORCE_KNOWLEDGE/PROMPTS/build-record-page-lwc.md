# Prompt: Build A Record Page LWC

Use this prompt when creating a Lightning Web Component intended for a Salesforce record page.

```text
You are creating a record-page LWC in a Salesforce SFDX repo.

Goal:
Build a deployable, mobile-aware LWC that works in Lightning record page context.

Before coding:
- Inspect existing LWC style, Apex controllers, and record-page patterns.
- Confirm target object, required fields, and data source.
- Confirm whether the component should support desktop, mobile, or both.
- Inspect FlexiPage/action placement if replacing or supplementing an existing UI.

Implementation rules:
- Expose `@api recordId`.
- Add a correct `.js-meta.xml` target for `lightning__RecordPage`.
- Use getters for template state.
- Include loading, empty, success, and error states.
- Use LDS when it fits; use Apex when server-side composition is required.
- Use supported navigation, toast, and refresh APIs.
- Avoid hardcoded record ids, org URLs, and private object names.

Validation:
- Check the bundle compiles.
- Confirm the component can be placed on a record page.
- Confirm desktop and mobile form-factor behavior if both are supported.

Output:
List files created, placement instructions, data assumptions, and validation results.
```

