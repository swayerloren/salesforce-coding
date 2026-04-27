# Project Discovery Checklist

Use this checklist before broad debugging, architecture review, integration work, or any task where the correct Salesforce project shape is not already known.

- [ ] Locate the real `force-app/main/default` folder.
- [ ] Confirm the Salesforce DX project root and `sfdx-project.json`.
- [ ] Inventory core metadata folders: classes, triggers, LWC, Aura, pages, objects, flows, permission sets, FlexiPages, named credentials, and external credentials.
- [ ] Identify the main functional modules from source evidence.
- [ ] Verify central objects and field API names before recording them.
- [ ] Map Apex trigger, handler, service, controller, async, and test layers for the affected area.
- [ ] Inspect LWC `.js-meta.xml` targets before assuming page placement or form-factor support.
- [ ] Identify integrations from source and metadata without recording credential values.
- [ ] Separate confirmed facts from inferences and unknowns.
- [ ] Record reusable verified facts in `MEMORY/KNOWN_ORG_PATTERNS.md`.
- [ ] Record temporary investigation notes in `WORKSPACE/`.
- [ ] Keep private data, local paths, org IDs, deploy IDs, and credentials out of public docs.

