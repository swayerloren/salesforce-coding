# Chatter, Email, And Activity Automation

Use this when Apex, Flow, LWC, email services, templates, Chatter posts, mentions, tasks, events, notifications, or logging create visible communication side effects.

Official anchors:

- Apex Developer Guide for Apex, tests, async, and email behavior
- ConnectApi documentation for Chatter and feed operations
- Salesforce Help and Metadata API docs for email templates and activity-related metadata

## Core Rule

Communication automation is user-visible and often permission-sensitive. Treat it as a business side effect, not just a DML insert.

Every feature should define:

- actor context,
- target record,
- audience,
- body or template source,
- merge data requirements,
- permission model,
- idempotency key,
- failure logging,
- retry behavior,
- public-safety handling for message content.

## Chatter And Mentions

For Chatter work:

- separate body text from mention metadata,
- preserve mention ranges and selected user IDs together,
- handle mobile caret and selection timing carefully,
- verify the actor can post to the target record,
- avoid duplicate posts after owner/status/retry changes,
- provide a fallback when mentions cannot be resolved.

Do not log Chatter body text into public docs or reusable examples.

## Email

For template or email-service work:

- verify template folder and metadata references,
- test missing merge data,
- avoid environment-specific base URL assumptions,
- use durable threading or external identifiers for replies,
- avoid duplicate sends on retries,
- log parse failures without storing private message bodies in public docs.

## Activity Records

For tasks, events, or email logging:

- define the parent or related record link,
- avoid using display text as the only relationship key,
- preserve idempotency across retries,
- check record access for the actor and target,
- make automated ownership or status changes explicit.

## Async And Transaction Boundaries

Use async when communication depends on callouts, generated files, or post-commit state. Use durable identifiers so retries do not duplicate records, posts, or emails.

Tests should use `Test.startTest()` and `Test.stopTest()` for async paths and assert durable results after the async boundary.

## Public-Safety Rules

Never publish:

- raw email bodies,
- Chatter post bodies,
- customer-facing template copy,
- private recipient addresses,
- private file names,
- private URLs,
- generated document text,
- raw debug logs containing communication content.

Rewrite lessons as generic failure patterns and checklists.

## Test Expectations

Cover:

- happy path,
- missing template or configuration,
- missing merge data,
- denied target access when practical,
- retry duplicate prevention,
- async completion,
- parse failure logging without message-body leakage,
- mobile mention text/range behavior when applicable.
