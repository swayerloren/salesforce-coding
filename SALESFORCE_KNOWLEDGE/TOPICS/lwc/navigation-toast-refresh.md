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

## Toasts

Use toasts for completion and recoverable errors. Keep messages specific enough that the user knows what changed.

```js
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

showToast(title, message, variant = 'info') {
  this.dispatchEvent(new ShowToastEvent({ title, message, variant }));
}
```

## Refresh After DML

Use the right refresh mechanism for the data source:

- `refreshApex(wiredResult)` for wired Apex.
- `notifyRecordUpdateAvailable([{ recordId }])` for LDS record consumers.
- `RefreshEvent` from `lightning/refresh` for page-level refresh when supported.
- A custom event to tell a parent component to reload child data.

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

