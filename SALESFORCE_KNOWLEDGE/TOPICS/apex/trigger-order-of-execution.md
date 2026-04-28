# Trigger Order Of Execution

Use this when editing triggers, trigger handlers, invocable Apex, Flow-adjacent logic, validation-sensitive saves, file-trigger side effects, or communication automation.

Official anchors:

- Apex Developer Guide: Apex Triggers
- Salesforce Architects: Order of Execution
- Trailhead: Apex Triggers and Bulk Apex Triggers

## Core Rule

A trigger is only one participant in a Salesforce record transaction. A visible symptom can come from validation rules, duplicate rules, before-save Flow, after-save Flow, assignment behavior, rollup behavior, workflow-like automation, process migration leftovers, async work, file link creation, or code in another trigger.

Codex must inspect automation around the record before changing trigger logic.

## Handler Shape

Good trigger handlers separate:

- before insert normalization,
- before update changed-field handling,
- before delete validation,
- after insert side effects,
- after update cross-object work,
- after delete and undelete recompute,
- async handoff,
- file, Chatter, email, and generated-document side effects.

Pass enough context into the handler to know operation, old values, new values, and affected IDs. Do not hide operation checks deep inside unrelated helpers.

## Recursion Guards

Use narrow guards tied to operation and record IDs. A global Boolean can skip legitimate later work in the same transaction.

Safer guard questions:

- Which operation is guarded?
- Which records were already processed?
- Can Flow or Process-style automation re-enter the trigger?
- Should delete, undelete, and update use separate guard state?
- Is recompute idempotent enough that a guard is unnecessary?

## Bulk And Limit Rules

- Collect IDs first.
- Query once per object shape.
- Build maps before loops.
- Dedupe DML rows by Id.
- Do not enqueue one async job per record.
- Do not perform per-record file, email, Chatter, or callout setup without a bulk plan.
- Prefer recomputing derived state from current source records when deletes, relinks, or version changes are possible.

## Flow-Aware Review

Before changing trigger code, search source for:

- record-triggered Flows on the same object,
- invocable Apex called by Flow,
- Flow screen components that call the same Apex,
- validation rules and duplicate rules,
- field updates that can alter trigger conditions,
- async paths that update the same records later.

If Flow changes the same fields as Apex, define the winning source and test unchanged-record behavior.

## File And Communication Side Effects

Triggers that react to Files, email, Chatter, or generated documents need special tolerance:

- `ContentDocumentLink` creation can be delayed relative to upload behavior.
- Latest file version and document link are different records.
- Automated posts or emails must be idempotent.
- Retries should use durable keys or source identifiers.
- Failures should be logged without exposing message bodies or private file names.

## Test Expectations

At minimum, tests should cover:

- one-record and multi-record inputs,
- before and after behavior where both exist,
- changed and unchanged fields,
- delete or undelete when derived state depends on related rows,
- recursion or re-entry shape when automation can update the same records,
- async side effects after `Test.stopTest()`,
- denied or missing configuration paths where relevant.

Do not rely on org data, profile IDs, record type IDs, or private metadata names.
