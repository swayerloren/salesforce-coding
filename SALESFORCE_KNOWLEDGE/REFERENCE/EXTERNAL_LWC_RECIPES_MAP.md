# External LWC Recipes Map

This map tells Codex how to use the public LWC Recipes repository as a pattern reference.

External source:

| Repo | URL | License signal | Use in this repo |
| --- | --- | --- | --- |
| LWC Recipes | https://github.com/trailheadapps/lwc-recipes | CC0-1.0 | Pattern reference only. Do not vendor or copy wholesale. |

## What LWC Recipes Is Useful For

LWC Recipes is useful for understanding focused Lightning Web Component patterns across wire adapters, imperative Apex, NavigationMixin, toast notifications, Lightning Data Service, record forms, component composition, events, slots, refresh, and Jest tests.

Codex should use it to identify implementation shapes and testing strategies, then adapt only after inspecting the user's real LWC bundle and related metadata.

## Codex Usage Rules

- Treat LWC Recipes as a public pattern reference, not a source to paste into a user's project.
- Inspect the user's actual `force-app/main/default/lwc/` bundle before applying any pattern.
- Verify imported Apex methods, schema imports, object API names, field API names, message channels, quick actions, FlexiPages, and form factors in the user's source.
- Do not invent objects, fields, Apex controllers, custom events, message channels, or static resources from the recipes.
- Preserve existing public `@api` contracts unless every caller is inspected and updated.
- If any external code is copied, preserve attribution and license context. Prefer paraphrasing patterns instead of copying source.

## Where To Look

Use these relative paths in the external LWC Recipes repository:

| Pattern area | External paths to inspect | What Codex should learn |
| --- | --- | --- |
| Wire adapters for Apex | `force-app/main/default/lwc/apexWireMethodToProperty/`, `apexWireMethodToFunction/`, `apexWireMethodWithParams/`, `apexWireMethodWithComplexParams/` | Property wires, function wires, reactive params, complex params, loading/error handling, and Jest wire adapter tests. |
| Imperative Apex | `force-app/main/default/lwc/apexImperativeMethod/`, `apexImperativeMethodWithParams/`, `apexImperativeMethodWithComplexParams/` | Button/action-driven Apex calls, parameter passing, async handling, error handling, and mocked Apex tests. |
| Apex-backed datatable | `force-app/main/default/lwc/datatableInlineEditWithApex/`, `force-app/main/default/classes/ContactController.cls` | LWC-to-Apex save flows and refresh behavior after edits. |
| UI API and LDS wire adapters | `wireGetRecord/`, `wireGetRecords/`, `wireGetObjectInfo/`, `wireGetPicklistValues/`, `wireGetPicklistValuesByRecordType/`, `ldsCreateRecord/`, `ldsDeleteRecord/`, `ldsNotifyRecordUpdateAvailable/` | Schema imports, UI API adapters, record create/delete/update flows, and record refresh notifications. |
| NavigationMixin | `navToRecord/`, `navToNewRecord/`, `navToNewRecordWithDefaults/`, `navToListView/`, `navToRelatedList/`, `navToFilesHome/`, `navToFlow/`, `navigateToRecordHeadlessAction/` | PageReference shapes, generated URLs, console considerations, and navigation tests. |
| ShowToastEvent | `miscToastNotification/`, `datatableInlineEditWithApex/`, `datatableInlineEditWithUiApi/`, `dispatchEventHeadlessAction/`, `editRecordScreenAction/` | User feedback patterns after success/failure and how toast events are tested. |
| `lightning-record-edit-form` | `recordEditFormStaticContact/`, `recordEditFormDynamicContact/` | Static versus dynamic field references, submit/success/error handling, and record-form tests. |
| Record view/form components | `recordViewFormStaticContact/`, `recordViewFormDynamicContact/`, `recordFormStaticContact/`, `recordFormDynamicContact/` | Read-only and edit form structure, schema imports, and metadata-driven form behavior. |
| Component composition | `compositionBasics/`, `compositionContactSearch/`, `compositionIteration/`, `compositionWithAppBuilder/`, `child/`, `contactTile/`, `contactSelector/` | Parent-child boundaries, passing data through `@api`, emitting child events, and repeated child components. |
| Events | `eventSimple/`, `eventWithData/`, `eventBubbling/`, `contactListItemBubbling/`, `dynamicEventListener/` | Event names, `detail` payloads, bubbling/composed behavior, and parent listeners. |
| Slots | `viewSource/` | Simple slot projection pattern. Many recipes also use named slots when embedding `viewSource`; inspect the caller and child contract together. |
| Refresh patterns | `dispatchRefreshEvent/`, `viewToRefresh/`, `graphqlRefresh/`, `ldsNotifyRecordUpdateAvailable/` | Refresh events, refresh handlers, LDS record notification, and test doubles for refresh modules. |
| Jest tests | `force-app/main/default/lwc/**/__tests__/`, `jest.config.js`, `force-app/test/jest-mocks/` | Component creation, DOM queries, event dispatching, wire adapter mocks, Apex mocks, navigation mocks, toast mocks, and accessibility setup. |
| Message service | `lmsPublisherWebComponent/`, `lmsSubscriberWebComponent/`, `force-app/main/default/messageChannels/`, `force-app/test/jest-mocks/lightning/messageService.js` | Lightning Message Service publish/subscribe patterns and Jest stubs. |

## Patterns Codex Should Learn

| Pattern | Lesson |
| --- | --- |
| Keep template logic simple | Complex decisions belong in JavaScript getters or methods, not inline template expressions. |
| Pair every data pattern with an error path | Wires and imperative calls need visible handling for loading, data, and errors. |
| Verify metadata imports | Schema imports and Apex imports must exist in the user's real project before use. |
| Test user-visible behavior | Jest tests should assert rendered DOM, events, Apex calls, wire data/error states, and navigation/toast dispatches. |
| Preserve composition contracts | Parent/child changes must preserve `@api` names, custom event names, and payload shapes unless all callers are changed. |
| Treat quick actions and navigation as metadata-coupled | Inspect quick action metadata, target config, FlexiPages, and object context before changing behavior. |

## Attribution Notes

When mentioning this reference in docs or comments, use:

```text
Pattern reference: Trailhead Apps LWC Recipes, https://github.com/trailheadapps/lwc-recipes, CC0-1.0.
```

Do not copy large source blocks into this repo or a user's Salesforce DX project. If a user explicitly asks to adapt external code, keep the adapted code narrow, verify it against the user's actual org metadata, and preserve attribution.
