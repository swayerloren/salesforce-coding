# Modal Edit Form Pattern

Use modal edit forms when the user needs to complete a focused record action without leaving the current record page. Keep the modal responsible for UI state and keep save behavior in Apex or Lightning Data Service.

## LWC Structure

- Parent owns whether the modal is open.
- Child modal owns form state.
- Server save returns a clear result.
- Parent refreshes record/page/list state after close.

## HTML Skeleton

```html
<template>
  <template if:true={isOpen}>
    <section class="modalShell" role="dialog" aria-modal="true" aria-label="Edit record">
      <div class="modalPanel">
        <header class="slds-modal__header">
          <h2>Edit Record</h2>
        </header>

        <div class="slds-modal__content slds-p-around_medium">
          <lightning-input label="Name" value={draft.Name} onchange={handleNameChange}></lightning-input>
        </div>

        <footer class="slds-modal__footer">
          <lightning-button label="Cancel" onclick={handleCancel}></lightning-button>
          <lightning-button label="Save" variant="brand" disabled={isSaveDisabled} onclick={handleSave}></lightning-button>
        </footer>
      </div>
    </section>
  </template>
</template>
```

## JavaScript Rules

- Clone input data into a draft object before editing.
- Use getters for disabled states.
- Disable save while saving.
- Surface Apex errors with a toast and keep the modal open.
- Dispatch a completion event only after save succeeds.

```js
get isSaveDisabled() {
  return this.isSaving || !this.draft?.Name;
}
```

## Mobile Rules

- Keep modal content scrollable.
- Do not rely on hover or tiny close icons.
- Confirm the keyboard does not hide required buttons.
- Use safe-area padding for fixed overlays.

