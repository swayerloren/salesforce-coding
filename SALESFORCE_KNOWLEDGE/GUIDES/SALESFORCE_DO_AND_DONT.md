# Salesforce Do And Don't

## Do

- Read metadata before changing code.
- Keep triggers thin and handlers/services testable.
- Use direct calls for required business behavior.
- Use dynamic optional calls only when absence is acceptable.
- Use LDS/UI API for focused record edits.
- Use Apex for aggregation, security, tokens, callouts, and complex state.
- Use getters for LWC template conditions and classes.
- Use `NavigationMixin` for supported navigation.
- Use stored wires plus `refreshApex` for refreshable lists.
- Use SLDS global hooks for theme-aware custom surfaces.
- Validate production deploys with dry-run first.
- Use narrow specified tests for narrow deploys.
- Test mobile when behavior depends on file, camera, overlay, focus, or popup APIs.
- Recompute file rollups from current source-of-truth rows.
- Preserve working Visualforce PDF output unless the task changes it.

## Don't

- Do not deploy unrelated metadata.
- Do not use `NoTestRun` as a production habit.
- Do not put private keys, tokens, or real URLs into public examples.
- Do not write arbitrary JS expressions in LWC templates.
- Do not hardcode Lightning URLs when supported navigation exists.
- Do not rely on UI-only validation for data integrity.
- Do not treat camera permission success as proof of preview rendering.
- Do not use `body.position = fixed` scroll lock casually in mobile overlays.
- Do not push huge generated PDFs through one Apex call.
- Do not reconstruct huge files in Apex heap if an external handoff is required.
- Do not overwrite populated related-record values with blanks by accident.
- Do not change Aura template region names without checking FlexiPage placement.
- Do not remove `rendered` guards from PDF pages to simplify markup.
- Do not assume desktop record page behavior matches mobile.

