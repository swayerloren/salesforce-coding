# Before Communication Automation

Use this before changing Apex, Flow, LWC, email, Chatter, activity, notification, or generated-document behavior that sends or records user-visible communication.

## Scope

- [ ] Entry point identified: UI, Flow, trigger, scheduled job, email service, API, or manual action.
- [ ] Actor context identified: current user, record owner, integration user, automated process, or service user.
- [ ] Target record and audience verified in source.
- [ ] Permission model documented for internal, external, guest, or portal users.
- [ ] Body/template/merge source inspected without copying private content.

## Idempotency

- [ ] Durable key or source identifier exists for retries.
- [ ] Duplicate post, email, task, event, or log record behavior is tested.
- [ ] Owner/status changes cannot create repeated side effects unintentionally.
- [ ] Async retry behavior is explicit.

## Chatter

- [ ] Body text and mention ranges are built together.
- [ ] Mention target IDs are verified and authorized.
- [ ] Mobile caret/selection behavior is considered when LWC is involved.
- [ ] Fallback behavior exists when mention resolution fails.

## Email

- [ ] Template or email metadata exists in source or is documented as org-managed.
- [ ] Missing merge data is tested.
- [ ] Reply threading or external identifiers are durable.
- [ ] Environment-specific base URLs are not hardcoded.
- [ ] Raw email bodies are not copied into docs or logs.

## Activity And Logging

- [ ] Parent or related record linkage is durable.
- [ ] Display text is not the only relationship key.
- [ ] Failure logs omit message bodies, private URLs, and private file names.
- [ ] Debug logs are summarized before publication.

## Validation

- [ ] Focused tests cover success, missing config, duplicate prevention, and failure logging.
- [ ] Async paths are wrapped in `Test.startTest()` and `Test.stopTest()`.
- [ ] Code Analyzer runs when available or is skipped with a reason.
- [ ] Final report states what was actually validated.
