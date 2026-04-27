# Engineering Principles

## Production-Safe First

Salesforce code often runs in production-like contexts even during small changes. Optimize for correctness, deployability, and minimal blast radius before elegance.

## Metadata Is Part Of The Code

An LWC is not complete without its `.js-meta.xml`, FlexiPage placement, action metadata, permissions, and target object context.

## UI Is Not Enforcement

Use UI guidance to help users, but enforce data integrity in Apex triggers, services, validation, or platform configuration.

## Debug With Layers

Separate metadata, server logic, browser runtime, mobile runtime, file storage, and deploy validation. A symptom in one layer may be caused by another.

## Document The Lesson

After a failure, preserve:

- what broke,
- what caused it,
- the exact safe pattern,
- the guardrail that prevents recurrence.

