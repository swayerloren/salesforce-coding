# Navigation, Toast, and Refresh Patterns

Salesforce UI behavior often breaks because a component updates data but does not tell the page, related lists, or sibling components to refresh.

## Navigation

Use `NavigationMixin` for record, object, and file navigation. Avoid manually composing Lightning URLs unless there is no standard page reference.

```js
this[NavigationMixin.Navigate]({
  type: 'standard__recordPage',
  attributes: {
    recordId: this.recordId,
    objectApiName: 'Project__c',
    actionName: 'view'
  }
});
```

Choose PageReference types deliberately:

| Target | Typical PageReference | Review notes |
| --- | --- | --- |
| Record view/edit/clone | `standard__recordPage` | Verify record ID, object API name when needed, and supported action. |
| Object list or home | `standard__objectPage` | Verify object access and list view needs. |
| File preview | Platform-supported file navigation when available | Validate desktop, mobile, and Experience Cloud separately. |
| Named app/page | `standard__navItemPage` or site-supported route | Avoid assuming Lightning Experience routes work in Experience Cloud. |
| External web handoff | `standard__webPage` | Do not place private data or secrets in URL state. |

URL state must be minimal and public-safe. Do not place tokens, raw payloads, private notes, customer data, or sensitive IDs in query parameters unless a server-side access model explicitly protects them.

## Toasts

Use toasts for completion and recoverable errors. Keep messages specific enough that the user knows what changed.

```js
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

showToast(title, message, variant = 'info') {
  this.dispatchEvent(new ShowToastEvent({ title, message, variant }));
}
```

Toast rules:

- show success only after the operation that matters has completed;
- show warning when the user can continue but should know about partial behavior;
- show error when the action failed or produced no durable result;
- keep raw Apex errors, debug logs, IDs, and private data out of the toast;
- do not use a toast as proof that related data, file lists, or page regions refreshed.

## Refresh After DML

Use the right refresh mechanism for the data source:

- `refreshApex(wiredResult)` for wired Apex.
- `notifyRecordUpdateAvailable([{ recordId }])` for LDS record consumers.
- `RefreshEvent` from `lightning/refresh` for page-level refresh when supported.
- A custom event to tell a parent component to reload child data.
- A durable status check or follow-up refresh when async file generation, annotation, or PDF creation is involved.

## Save Flow

```js
async handleSave() {
  this.isSaving = true;
  try {
    await saveRecord({ recordId: this.recordId, payload: this.payload });
    this.showToast('Saved', 'The record was updated.', 'success');
    await notifyRecordUpdateAvailable([{ recordId: this.recordId }]);
    this.dispatchEvent(new CustomEvent('refreshrequested', { bubbles: true, composed: true }));
  } catch (error) {
    this.showToast('Save failed', this.reduceError(error), 'error');
  } finally {
    this.isSaving = false;
  }
}
```

## Common Pitfalls

- Updating a related record and expecting the parent page to refresh automatically.
- Refreshing only the parent record when a wired Apex list is stale.
- Dispatching a refresh event before the Apex transaction finishes.
- Showing a success toast before the operation is actually complete.
- Navigating with hardcoded Lightning URLs that fail in mobile, console, or Experience Cloud.
- Passing sensitive state through navigation URL parameters.
- Refreshing file metadata but not refreshing the parent record state that summarizes it.
