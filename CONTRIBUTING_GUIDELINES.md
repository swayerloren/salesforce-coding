# Contributing Guidelines

This repo is meant to stay public-safe, practical, and Salesforce-specific.

## Contribution Rules

- Preserve reusable lessons, not private org history.
- Generalize private object names, customer names, domains, IDs, record examples, and business details.
- Do not add credentials, tokens, named credential secrets, real URLs, usernames, customer records, claim numbers, addresses, or internal-only paths.
- Prefer precise "why this fails" explanations over vague best practices.
- Include deploy and test implications when a pattern touches Apex or metadata.
- Keep examples realistic but generic.

## Documentation Style

Good entries include:

- symptom,
- likely root cause,
- exact fix pattern,
- why the fix works,
- what to test,
- what not to reintroduce.

Avoid:

- raw internal notes,
- org-specific business process dumps,
- long deploy histories,
- unreviewed screenshots or HTML exports,
- source code copied from a private repo without generalization.

## Adding Examples

Examples should use neutral names such as:

- `Project__c`
- `Work_Order__c`
- `Document_Request__c`
- `External_File__c`
- `RecordActionController`
- `ExampleService`

Use placeholders for URLs, credentials, and IDs.

## Public Safety Review

Before publishing a change:

1. Run a text search for private terms.
2. Search for Salesforce IDs with patterns like `00`, `005`, `006`, `068`, `069`, `0Af`, and `707`.
3. Search for email addresses and real domains.
4. Search for `http`, `token`, `secret`, `password`, `credential`, and `key`.
5. Confirm examples are generic and reusable.

