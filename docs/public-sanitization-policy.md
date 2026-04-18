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
- private domains and URLs,
- source paths tied to private systems,
- screenshots or HTML exports from private orgs.

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

