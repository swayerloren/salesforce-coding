import { LightningElement, api, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { refreshApex } from '@salesforce/apex';
import getFiles from '@salesforce/apex/ProjectActionController.getFiles';

export default class RefreshableRelatedFiles extends NavigationMixin(LightningElement) {
  @api recordId;

  wiredFilesResult;
  files = [];
  isRefreshing = false;

  @wire(getFiles, { recordId: '$recordId' })
  wiredFiles(result) {
    this.wiredFilesResult = result;
    if (result.data) {
      this.files = result.data;
    } else if (result.error) {
      this.files = [];
    }
  }

  get hasFiles() {
    return this.files.length > 0;
  }

  async handleRefresh() {
    if (!this.wiredFilesResult) {
      return;
    }
    this.isRefreshing = true;
    try {
      await refreshApex(this.wiredFilesResult);
    } finally {
      this.isRefreshing = false;
    }
  }

  handleOpenFile(event) {
    const contentDocumentId = event.currentTarget.dataset.id;
    this[NavigationMixin.Navigate]({
      type: 'standard__recordPage',
      attributes: {
        recordId: contentDocumentId,
        objectApiName: 'ContentDocument',
        actionName: 'view'
      }
    });
  }
}

