# Apex Service / Controller / Trigger Pattern

## Shape

```text
Trigger
  -> TriggerHandler
       -> DomainService
            -> Selector / Settings / Integration helper
```

```text
LWC
  -> AuraEnabled Controller
       -> DomainService
            -> DTO
```

## Trigger Handler Rules

- One trigger per object.
- Handler receives operation type and trigger records.
- Handler delegates to services.
- Required behavior is direct.
- Optional integration behavior is explicitly optional.

## Controller Rules

- Validate inputs.
- Return DTOs, not raw implementation details.
- Keep mutation methods non-cacheable.
- Keep read methods cacheable only when safe.
- Convert internal exceptions into user-safe `AuraHandledException` messages.

## Service Rules

- Own business logic.
- Be bulk-safe.
- Query through selectors or small helper methods.
- Keep DML centralized.
- Make idempotency explicit for retries.

