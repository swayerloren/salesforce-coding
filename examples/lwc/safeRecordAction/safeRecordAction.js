import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { notifyRecordUpdateAvailable } from 'lightning/uiRecordApi';
import runAction from '@salesforce/apex/ProjectActionController.runAction';

export default class SafeRecordAction extends LightningElement {
  @api recordId;

  isLoading = false;
  lastResult;

  get hasRecordId() {
    return Boolean(this.recordId);
  }

  get statusText() {
    return this.lastResult || 'Ready to run the server action.';
  }

  get isActionDisabled() {
    return this.isLoading || !this.hasRecordId;
  }

  async handleRunAction() {
    this.isLoading = true;
    try {
      const result = await runAction({ recordId: this.recordId });
      this.lastResult = result.message;
      this.showToast('Complete', result.message, 'success');
      await notifyRecordUpdateAvailable([{ recordId: this.recordId }]);
      this.dispatchEvent(new CustomEvent('refreshrequested', { bubbles: true, composed: true }));
    } catch (error) {
      this.showToast('Action failed', this.reduceError(error), 'error');
    } finally {
      this.isLoading = false;
    }
  }

  showToast(title, message, variant) {
    this.dispatchEvent(new ShowToastEvent({ title, message, variant }));
  }

  reduceError(error) {
    if (Array.isArray(error?.body)) {
      return error.body.map((entry) => entry.message).join(', ');
    }
    return error?.body?.message || error?.message || 'Unknown error';
  }
}

