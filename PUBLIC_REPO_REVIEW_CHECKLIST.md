# Public Repo Review Checklist

Use this checklist before publishing the folder to GitHub.

## Sensitive Data Search

- [ ] Search for customer/company names that should not be public.
- [ ] Search for real user names, usernames, and email addresses.
- [ ] Search for real domains and URLs.
- [ ] Search for Salesforce IDs and deploy/test IDs.
- [ ] Search for `token`, `secret`, `password`, `credential`, `client_id`, `client_secret`, `key`, and `Authorization`.
- [ ] Search for local absolute paths that should not be published.
- [ ] Search for raw claim, customer, job, invoice, or property examples.

## Content Review

- [ ] Examples use generic object names and placeholder values.
- [ ] No raw internal notes were copied without rewriting.
- [ ] No private business-specific workflows are described as-is.
- [ ] Lessons are generalized into reusable Salesforce guidance.
- [ ] Every prompt is safe to reuse in another org.
- [ ] Every checklist is practical and public-safe.

## Technical Review

- [ ] Apex examples compile conceptually and use generic names.
- [ ] LWC examples avoid template expressions and use supported APIs.
- [ ] Deploy examples use placeholders for org aliases and tests.
- [ ] Metadata examples do not reference private page names.
- [ ] File/mobile guidance avoids leaking storage providers or URLs from a private org.

## Publishing Review

- [ ] README explains sanitization.
- [ ] INDEX links all major files and folders.
- [ ] SOURCE_MAPPING explains analyzed categories and exclusions.
- [ ] License choice is added if publishing publicly.
- [ ] Any screenshots or binary assets are reviewed separately before adding.

