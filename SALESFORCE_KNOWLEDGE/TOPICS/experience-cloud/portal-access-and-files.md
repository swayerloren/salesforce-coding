# Experience Cloud Portal Access And Files

Use this when Salesforce Files, generated PDFs, previews, downloads, or LWCs are exposed to Experience Cloud, portal, external, or guest users.

## Access Model

Portal and external file access is a server-side authorization problem. The UI must not rely on obscurity of IDs or URLs.

Verify:

- the running user can access the parent record;
- the file is linked to an accessible record or distribution artifact;
- the intended user type is allowed to preview or download;
- guest user access is explicitly designed and minimized;
- Apex controllers enforce sharing, CRUD/FLS, and file link checks;
- links or distributions can be revoked or expire when required.

See [ContentDocument Lifecycle](../files/contentdocument-lifecycle.md) for core Files object responsibilities.

## LWC Rules

- Do not assume Lightning Experience navigation works in Experience Cloud.
- Use supported navigation patterns for the site type.
- Keep URL state public-safe and minimal.
- Avoid exposing raw implementation IDs unless the server validates access for every request.
- Test empty, unauthorized, and expired-link states.

## File Delivery Rules

| Delivery method | Use when | Risk to check |
| --- | --- | --- |
| Linked Salesforce File | Authenticated users should access files through Salesforce record access. | Record sharing and `ContentDocumentLink` visibility. |
| Content distribution | External or public handoff is intentionally allowed. | Expiration, revocation, download scope, and URL leakage. |
| Server-authorized endpoint | Access policy is custom or time bound. | Token handling, cache headers, and audit logging. |
| External storage URL | Files live outside Salesforce. | Named credentials, CORS/CSP, and revocation. |

## Failure Patterns

- File works for an internal admin but fails for a portal user because parent record sharing was not verified.
- Component returns file IDs to the browser before checking access.
- Generated PDF is attached to the record but not linked in a way the external user can read.
- A public URL is created without expiration, revocation plan, or audit requirement review.
- Experience Cloud page uses a Lightning Experience URL that does not route inside the site.

## Public Safety Rules

Do not publish portal domains, distribution URLs, signed URLs, file names from real customers, screenshots, generated document contents, or access tokens. Rewrite lessons as generic access, link, and lifecycle rules.
