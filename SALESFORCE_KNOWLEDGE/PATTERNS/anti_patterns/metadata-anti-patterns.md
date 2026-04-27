# Metadata Anti-Patterns

Metadata can deploy successfully and still fail functionally. These are common causes.

## Broad Metadata Dumps

Large source pulls or deploys include unrelated profile, layout, object, and page changes. They make reviews noisy and failures harder to isolate.

Use narrow deploys for focused changes and widen only when a real dependency requires it.

## Assuming FlexiPage Is The Whole UI

Record-page behavior can also depend on:

- object `View` overrides,
- app and profile activation,
- phone versus desktop form factor assignment,
- page layouts,
- Highlights Panel action configuration,
- Dynamic Forms sections,
- compact layouts,
- permissions and visibility filters.

## Unsupported Properties

Metadata XML copied from another API version or org can include properties the target org does not support. Remove or replace the unsupported element instead of changing unrelated metadata.

## Profile Noise

Profiles are large and easy to churn. Prefer permission sets for intentional access changes when the org architecture allows it.

## Action Created But Not Activated

A quick action can exist in source but not appear to users because it is not placed on the relevant action layout, page region, or mobile assignment.

## Private Names In Public Docs

Do not publish raw page names, app names, field names, or object names when they reveal customer-specific workflows. Generalize the lesson.

