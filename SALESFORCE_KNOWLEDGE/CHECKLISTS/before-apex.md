# Before Writing Apex Checklist

- [ ] Identify entry point.
- [ ] Identify required vs optional behavior.
- [ ] Confirm object and field API names.
- [ ] Confirm sharing, CRUD/FLS, user-mode/system-mode, and business authorization expectations separately.
- [ ] Plan bulk behavior.
- [ ] Identify governor-limit risks: SOQL, DML, CPU, heap, callouts, async enqueue, files/PDFs.
- [ ] Query outside loops.
- [ ] Dedupe DML.
- [ ] For triggers, inspect order of execution, Flow callers, recursion risk, changed fields, delete, and undelete.
- [ ] For Files, identify `ContentVersion`, `ContentDocument`, `ContentDocumentLink`, latest-version, and parent refresh behavior.
- [ ] For communication automation, identify actor, target, idempotency key, template/body source, and sanitized failure logging.
- [ ] Mock callouts.
- [ ] Add tests for happy, negative, and bulk paths.
- [ ] Include required-field, missing-config, permission, async, file, or communication tests when relevant.
- [ ] Plan deploy test list.
- [ ] Plan Code Analyzer or document why it is skipped.
