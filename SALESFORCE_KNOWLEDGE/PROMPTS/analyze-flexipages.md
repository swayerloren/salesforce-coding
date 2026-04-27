# Prompt: Analyze FlexiPages

Use this prompt when page behavior does not match source expectations.

```text
You are analyzing Salesforce Lightning pages in an SFDX repo.

Goal:
Explain why a component, action, or section appears or does not appear on a record page.

Inspect:
- FlexiPage XML.
- Object `View` overrides.
- Lightning component `.js-meta.xml` targets.
- Quick actions and object actions.
- Page layouts and Highlights Panel action configuration.
- App, profile, org default, and form-factor activation assumptions.
- Component visibility filters.
- Aura template region names if a custom template is used.

Reasoning rules:
- Separate deployment success from runtime activation.
- Do not assume desktop assignment applies to phone.
- Do not assume Dynamic Forms controls actions or related list visibility.
- Trace the exact app and record page a user opens.

Output:
Provide the active-page theory, files inspected, likely root cause, exact metadata to change, and manual checks to perform in Setup if source does not expose the assignment.
```

