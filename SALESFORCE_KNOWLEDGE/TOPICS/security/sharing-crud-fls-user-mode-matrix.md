# Sharing, CRUD/FLS, And User Mode Matrix

Use this when Apex, LWC, Flow, or metadata exposes records to a user. Sharing, object access, field access, and execution mode are separate concerns. Passing one check does not prove the others are safe.

Official anchors:

- LWC Developer Guide: Secure Apex Classes
- Apex Developer Guide: Enforce User Mode
- Apex Developer Guide: `WITH SECURITY_ENFORCED`
- Trailhead: Secure Server-Side Development

## Decision Matrix

| Mechanism | Covers | Does not cover | Codex rule |
| --- | --- | --- | --- |
| `with sharing` | Record sharing for most record queries and DML behavior in that class. | Object permissions, field permissions, all system operations, all called classes. | Use for user-facing services unless a system-level reason is documented. |
| `inherited sharing` | Caller-controlled sharing posture. | CRUD/FLS by itself. | Good default for shared service classes when callers define context deliberately. |
| `without sharing` | Intentional system-level record access. | User record access expectations. | Require a documented reason and narrower public method surface. |
| User-mode SOQL/DML | User object, field, and sharing enforcement for supported operations. | Business authorization rules, every legacy API path, every unsupported edge. | Prefer where it matches the intended user-visible behavior. |
| `stripInaccessible` | Removes inaccessible fields from records before DML or after query. | Record sharing and object-level intent by itself. | Use when partial field filtering is acceptable and the caller can handle missing fields. |
| `WITH SECURITY_ENFORCED` | Query-time object and field access checks for selected fields. | Graceful partial output, DML checks, every dynamic query shape. | Use when failing fast is better than silently dropping fields. |
| Describe checks | Custom object/field readable, creatable, updateable, deletable decisions. | Record sharing and row-level business rules. | Use for dynamic field, dynamic object, and metadata-driven code. |
| LDS/UI API | Platform-enforced record access, CRUD/FLS, validation, and field errors for supported UI operations. | Multi-object policy, custom authorization, external integration rules. | Prefer for simple LWC record read/edit flows. |
| Apex authorization checks | Business-specific access rules in code. | Platform CRUD/FLS/sharing unless explicitly combined. | Add when platform access is necessary but not sufficient. |

## Required Review For Exposed Apex

For every `@AuraEnabled`, Visualforce controller, invocable method, REST method, or external-facing service, document:

- class sharing keyword,
- expected caller type,
- record-sharing expectation,
- object and field access enforcement,
- DML mode,
- whether failed access throws an error or returns filtered data,
- tests proving allowed and denied behavior when practical.

## User Mode Versus System Mode

Use user mode when the operation should behave like the current user performing the action. Use system mode only when the code owns an administrative operation and has its own narrow authorization checks.

System mode still needs guardrails:

- validate the entry point,
- check the target record or parent record,
- avoid broad queries,
- expose only needed fields,
- do not leak inaccessible data through DTOs, errors, debug output, Chatter, email, or files.

## LWC Data Access Rule

Prefer LDS/UI API for straightforward record forms and record reads. Move to Apex when the feature requires:

- multiple objects in one transaction,
- server-owned policy,
- external callouts,
- custom DTO shaping,
- async orchestration,
- generated documents,
- file authorization,
- communication automation.

When moving from LDS/UI API to Apex, add an explicit security review because the platform-enforced behavior is no longer automatic in the same way.

## Test Expectations

Tests should not only run as the default test context. For meaningful security behavior:

- create generic users in test setup when practical,
- use `System.runAs()` for record-sharing-sensitive paths,
- assert denied behavior, not just allowed behavior,
- avoid real profile names, permission set IDs, record type IDs, or usernames,
- keep permission metadata assumptions verified in source before relying on them.

## Anti-Patterns

- Assuming `with sharing` enforces FLS.
- Returning full queried records from system-mode Apex to LWC without filtering.
- Removing security checks to make tests easier.
- Using profile names as authorization logic.
- Hiding denied access as a blank UI with no actionable error.
- Publishing examples that include real permission set, profile, user, or org identifiers.
