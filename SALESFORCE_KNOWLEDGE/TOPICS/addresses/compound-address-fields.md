# Compound Address Fields

Use this when Apex, LWC, Visualforce, Flow, import, validation, map, directions, or street-view behavior touches Salesforce compound address fields.

Official anchors:

- Salesforce Object Reference and field reference pages for compound address fields
- LWC Developer Guide: record edit forms and UI API data access
- Apex Developer Guide: field access and DML behavior

## Core Rule

In Apex DML, write constituent address fields instead of the compound root field. Treat structured leaf fields as the source of truth. Parsed display text is a fallback, not authoritative data.

Common leaf concepts:

- street,
- city,
- state or province,
- state or province code,
- postal code,
- country,
- country code,
- latitude,
- longitude,
- geocode accuracy.

Exact API names depend on the object and field. Codex must inspect real source or describe metadata before writing code.

## State And Country Picklists

When state and country picklists are enabled, code-style fields and label-style fields can behave differently. If setting a state or province code, ensure the corresponding country code is present and valid for that state value.

Do not mix a state label with a country code unless the object metadata supports that shape.

## Apex Rules

- Query every leaf field that mapper or DTO code reads.
- Write only verified leaf API names.
- Preserve populated structured values when parsing text fails.
- Surface validation failures per missing or inconsistent leaf field.
- Avoid hardcoded country/state assumptions unless project metadata confirms them.

## LWC Rules

For record forms:

- prefer base record form components when they satisfy the requirement,
- include leaf fields needed for save and validation,
- display field-level errors clearly,
- do not rely only on the formatted root field for edits,
- refresh after save when derived map, distance, or normalized address state is shown.

For custom forms:

- validate required leaf fields before Apex calls,
- send a structured payload,
- keep user-entered text separate from normalized values,
- handle partial addresses without crashing map or preview features.

## Map And External Link Behavior

Address-derived actions should tolerate partial data:

- no street but city/state present,
- no coordinates,
- stale geocode,
- blank postal code,
- country-only records,
- user lacking access to some fields.

Do not hardcode external URLs with private record values. Build public-safe URLs only from validated, encoded, non-sensitive address components when the feature requires it.

## Test Expectations

Cover:

- complete structured address,
- missing optional line,
- missing required country/state combination,
- partial address,
- structured fields winning over parsed text,
- validation error surfaced to the caller,
- no hardcoded IDs or private addresses.
