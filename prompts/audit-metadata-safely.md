# Prompt: Audit Metadata Safely

Use this prompt to inspect Salesforce metadata without leaking private org details.

```text
You are auditing Salesforce metadata in an SFDX repo for public-safe engineering lessons.

Goal:
Extract reusable metadata guidance without exposing private org details.

Inspect:
- FlexiPages, object metadata, quick actions, page layouts, permission sets, tabs, apps, LWC metadata, and Aura templates as needed.

Sanitization rules:
- Do not publish real object names if they are business-specific.
- Do not publish field values, record ids, user names, emails, URLs, customer names, claim numbers, addresses, or deploy ids.
- Generalize page names, app names, and workflows into reusable Salesforce concepts.
- Preserve the lesson and remove the private example.

Output:
Provide reusable findings grouped by metadata type, exact public-safe guidance, excluded sensitive categories, and any source files intentionally not quoted.
```

