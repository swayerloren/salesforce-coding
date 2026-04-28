# Public Sanitization Policy

This repo should never expose private implementation data.

## Remove

- customer names,
- org names,
- user names,
- emails,
- phone numbers,
- street addresses,
- claim/job/invoice identifiers,
- deploy IDs and test run IDs,
- OAuth/client secrets,
- named credential secrets,
- external credential secrets,
- private domains and URLs,
- source paths tied to private systems,
- screenshots or HTML exports from private orgs.
- raw debug logs,
- email bodies,
- Chatter post bodies,
- generated document contents,
- private file names,
- generated browser-test reports,
- local Salesforce state folders.

## Generalize

Replace private details with neutral examples:

- `Private_Customer__c` becomes `Project__c`.
- Real users become `current user`, `record owner`, or `service user`.
- Real integrations become `external provider`.
- Real business cases become `document workflow`, `field workflow`, or `approval workflow`.

## Preserve

Keep reusable lessons:

- platform limitation,
- failure mode,
- root cause,
- safe fix,
- test strategy,
- metadata relationship,
- deployment guardrail.

## Private-Derived Lessons

Local private references can be used only as evidence for generic lessons. Rewrite them as:

- platform rule,
- failure pattern,
- checklist item,
- validation flow,
- anti-pattern,
- public-safe pseudocode.

Do not move private names, message text, file names, screenshots, raw logs, local paths, org IDs, or source snippets into public docs.
