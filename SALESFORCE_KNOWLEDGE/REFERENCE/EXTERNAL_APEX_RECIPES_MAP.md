# External Apex Recipes Map

This map tells Codex how to use the public Apex Recipes repository as a pattern reference.

External source:

| Repo | URL | License signal | Use in this repo |
| --- | --- | --- | --- |
| Apex Recipes | https://github.com/trailheadapps/apex-recipes | CC0-1.0 | Pattern reference only. Do not vendor or copy wholesale. |

## What Apex Recipes Is Useful For

Apex Recipes is useful for understanding concise Salesforce Apex implementation patterns across data access, DML, async Apex, integrations, platform events, security, triggers, and tests.

Codex should use it to recognize good shapes and questions to ask, not as a replacement for inspecting the user's real Salesforce DX project.

## Codex Usage Rules

- Treat Apex Recipes as a public pattern reference, not a source to paste into a user's project.
- Verify the user's actual objects, fields, record types, permission sets, triggers, classes, and metadata before adapting any pattern.
- Do not invent `Account`, `Contact`, custom object, custom metadata, or field names from the recipes.
- Preserve the user's existing trigger framework, service boundaries, sharing model, and testing conventions unless the root cause requires a narrow change.
- If any external code is copied, preserve attribution and license context. Prefer paraphrasing patterns instead of copying source.

## Where To Look

Use these relative paths in the external Apex Recipes repository:

| Pattern area | External paths to inspect | What Codex should learn |
| --- | --- | --- |
| SOQL | `force-app/main/default/classes/Data Recipes/SOQLRecipes.cls`, `force-app/tests/Data Recipes/SOQLRecipes_Tests.cls` | Query methods, user-mode querying, test coverage for query behavior, and large-data handling examples. |
| Dynamic SOQL | `force-app/main/default/classes/Data Recipes/DynamicSOQLRecipes.cls`, `force-app/tests/Data Recipes/DynamicSOQLRecipes_Tests.cls` | Dynamic query structure and the need to bind/validate inputs rather than concatenate untrusted strings. |
| DML | `force-app/main/default/classes/Data Recipes/DMLRecipes.cls`, `force-app/tests/Data Recipes/DMLRecipes_Tests.cls` | `Database` method patterns, access-level choices, bulk operations, and DML error handling. |
| Services | `force-app/main/default/classes/Shared Code/AccountServiceLayer.cls`, `force-app/main/default/classes/Integration Recipes/ApiServiceRecipes.cls`, `force-app/main/default/classes/Shared Code/RestClient.cls` | Service-layer boundaries, integration wrappers, and keeping business logic out of triggers/controllers. |
| Async Apex | `force-app/main/default/classes/Async Apex Recipes/`, `force-app/tests/Async Apex Recipes/` | Future, queueable, queueable chaining, queueable callouts, scheduled Apex, and batch Apex shapes. |
| Large data volume | `force-app/main/default/classes/LDV Recipes/LDVRecipes.cls`, `force-app/tests/LDV Recipes/LDVRecipes_Tests.cls` | Chunking and queueable patterns for processing large data sets. |
| Platform events | `force-app/main/default/classes/Platform Event Recipes/`, `force-app/main/default/triggers/PlatformEventRecipesTrigger.trigger`, `force-app/main/default/objects/Event_Recipes_Demo__e/`, `force-app/tests/Platform Event Recipes/` | Publishing events, trigger handlers for events, callbacks, and platform-event test patterns. |
| Security and sharing | `force-app/main/default/classes/Security Recipes/`, `force-app/tests/Security Recipes/`, `force-app/main/default/permissionsets/` | User-mode operations, `stripInaccessible`, permission checks, and testing under constrained access. |
| Trigger patterns | `force-app/main/default/triggers/`, `force-app/main/default/classes/Trigger Recipes/`, `force-app/main/default/classes/Shared Code/TriggerHandler.cls`, `force-app/tests/Trigger Recipes/` | Thin trigger entry points, trigger handlers, metadata-driven trigger controls, and event sequencing. |
| Testing | `force-app/tests/`, `force-app/tests/Shared Code/TestFactory.cls`, `force-app/tests/Shared Code/TestDataHelpers.cls`, `force-app/tests/Shared Code/HttpCalloutMockFactory.cls` | Focused test class organization, data factories, callout mocks, `Test.startTest()`/`Test.stopTest()`, and permission/user-mode coverage. |
| Salesforce Files | `force-app/main/default/classes/Files Recipes/FilesRecipes.cls`, `force-app/tests/Files Recipes/FilesRecipes_Tests.cls` | `ContentVersion`, `ContentDocumentLink`, file publish/share patterns, and file-specific test coverage. |
| Custom metadata | `force-app/main/default/classes/Custom Metadata Recipes/`, `force-app/tests/Custom Metadata Recipes/` | Reading and testing custom metadata without assuming org-specific metadata names. |
| Invocable Apex | `force-app/main/default/classes/Invocable Recipes/InvocableMethodRecipes.cls`, `force-app/tests/Invocable Recipes/InvocableMethodRecipes_Tests.cls` | Invocable method shape for Flow-facing Apex. |

## Patterns Codex Should Learn

| Pattern | Lesson |
| --- | --- |
| Separate trigger, handler, and service responsibilities | Keep trigger entry points thin and route behavior into testable classes. |
| Prefer focused classes by concern | Data access, async work, security checks, and integrations are easier to test when separated. |
| Test the behavior, not only coverage | Recipe tests show targeted setup, action, assertion, and async flushing. |
| Use user-mode/security-aware data operations where relevant | Verify whether the user's project already uses `WITH USER_MODE`, `AccessLevel.USER_MODE`, explicit permission checks, or inherited sharing. |
| Keep async work narrow and observable | Queueable, batch, and scheduled patterns should have clear input, limits handling, and focused tests. |
| Mock boundaries | Callouts and external boundaries should be mocked in tests instead of relying on live services. |

## Apex Output Requirements For Codex

When adapting an Apex pattern, Codex must preserve these requirements:

- Bulk-safe logic for all trigger, service, controller, invocable, and async entry points.
- No SOQL or DML inside loops.
- No hard-coded Salesforce IDs, record type IDs, profile IDs, permission set IDs, queue IDs, or org-specific names.
- Null-safe relationship, map, query, DTO, and custom metadata handling.
- Explicit sharing/security intent on changed classes.
- CRUD/FLS or user-mode review for UI-facing, external-facing, and invocable Apex.
- Test data created inside tests or through verified project factories.
- Real assertions that prove behavior, not coverage-only execution.
- Salesforce Code Analyzer run or skipped with a specific reason.
- Apex formatting checked only when configured or requested.

Use Apex Recipes to identify useful implementation shapes such as service boundaries, test factory organization, async flushing, and security-aware data access. Do not copy recipe classes, object names, field names, permissions, metadata, or test data directly into a user's project.

## Attribution Notes

When mentioning this reference in docs or comments, use:

```text
Pattern reference: Trailhead Apps Apex Recipes, https://github.com/trailheadapps/apex-recipes, CC0-1.0.
```

Do not copy large source blocks into this repo or a user's Salesforce DX project. If a user explicitly asks to adapt external code, keep the adapted code narrow, verify it against the user's actual org metadata, and preserve attribution.
