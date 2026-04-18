import { LightningElement, api } from 'lwc';

export default class TemplateGetterExample extends LightningElement {
  @api rows = [];

  get hasRows() {
    return Array.isArray(this.rows) && this.rows.length > 0;
  }

  get decoratedRows() {
    return (this.rows || []).map((row, index) => {
      const isComplete = row.Status__c === 'Complete';
      return {
        key: row.Id || `row-${index}`,
        displayName: row.Name || 'Untitled',
        statusLabel: isComplete ? 'Complete' : 'Open',
        cssClass: isComplete ? 'row complete' : 'row'
      };
    });
  }
}

