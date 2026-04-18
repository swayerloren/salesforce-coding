# Salesforce Architecture Guide

## Architecture Posture

Production Salesforce systems often become a mix of custom objects, Apex, LWC, Aura, Visualforce, Flow, standard components, and admin metadata. Treat them as a connected system, not as isolated files.

Before changing code, identify:

- user entry point: record page, quick action, app tab, automation, integration, batch, email service, or API;
- server entry point: controller, trigger, invocable, queueable, scheduler, batch, REST, or email handler;
- metadata entry point: FlexiPage, object action override, quick action, layout, custom tab, permission set, CMDT, named credential;
- storage model: custom records, platform objects, Salesforce Files, external storage, or public/community token state;
- runtime context: desktop Lightning, Salesforce mobile, Experience Cloud, guest user, async Apex, or deploy validation.

## Common Layering That Works

```text
UI / Automation Entry
  -> Apex controller, trigger handler, or service facade
       -> domain service
            -> selector / settings / integration helper
                 -> DML, SOQL, callout, async enqueue, or DTO result
```

Keep triggers thin and route real behavior into handlers and services. Keep LWC clients focused on UI state and server calls. Keep integration and credential logic on the server.

## Direct Required Logic vs Optional Dynamic Logic

Many Salesforce systems have both required behavior that must fail loudly if missing and optional behavior that can no-op when a package, integration, or feature is absent.

Use direct static calls for required behavior. Use dynamic `Type.forName`, `System.Callable`, or reflection-like patterns only when a missing dependency is genuinely optional and the no-op is documented.

Do not convert required logic into a dynamic optional call just to make a deploy easier. Silent no-ops are one of the fastest ways to create production data drift.

## Record Page Architecture

Record pages are not just LWCs. A complete record page can include:

- object `View` overrides by form factor,
- Lightning page activation assignments,
- compact layout fields,
- Highlights Panel actions,
- page layout detail panels,
- Dynamic Forms field sections,
- Dynamic Related Lists,
- standard Activities, Chatter, Path, and related-list components,
- custom Aura templates,
- custom LWCs,
- mobile-specific page variants.

When rebuilding or debugging a record page, inventory all of those surfaces before assuming the LWC is the source of truth.

## Metadata-Driven Settings

Custom Metadata Types work well for feature flags, action definitions, file type mappings, storage provider configuration, integration choices, layout defaults, and org-level tuning values.

Guard metadata-driven logic with clear defaults and admin-facing error states. A missing metadata record should not produce a misleading UI.

## Safe Architecture Biases

- Prefer backend enforcement for data integrity. UI-only guards are bypassable.
- Prefer metadata-driven configuration for admin-controlled behavior.
- Prefer focused Apex DTOs over leaking raw SObjects to complex UIs.
- Prefer explicit source-of-truth fields over duplicated values.
- Prefer idempotent services for sync, backfill, and retry paths.
- Prefer narrow features with clear ownership over broad helper classes that know every domain.

