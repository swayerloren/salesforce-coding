# Prompt: Fix An LWC Safely

Use this prompt with Codex or another AI agent when an existing Lightning Web Component is failing or needs a narrow change.

```text
You are working in a Salesforce SFDX repo.

Goal:
Fix the target LWC safely without changing unrelated metadata.

Before editing:
- Inspect the full LWC bundle, including HTML, JS, CSS, and `.js-meta.xml`.
- Inspect parent and child LWCs if the component is composed.
- Inspect imported Apex controllers and wired data sources.
- Inspect FlexiPage placement, target configs, and supported form factors when page behavior matters.
- Identify whether the failure is template compile, data loading, refresh, permissions, mobile layout, or metadata activation.

Implementation rules:
- Keep the change narrow and follow the existing component style.
- Move template expressions into getters.
- Do not use unsupported DOM hacks.
- Preserve desktop and mobile behavior.
- Use `refreshApex`, `notifyRecordUpdateAvailable`, `RefreshEvent`, or a parent event when server data changes.
- Keep loading, empty, and error states explicit.
- Update Apex tests only if Apex behavior changes.

Validation:
- Run the relevant local checks or Salesforce validation command available in the repo.
- Summarize root cause, changed files, validation, and residual risk.
```

