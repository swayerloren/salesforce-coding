# Salesforce Copy-Paste-Safe Patterns

These are intentionally generic starter patterns. Rename classes, objects, and fields for your org.

## LWC Getter For Template Logic

```js
get hasRows() {
  return Array.isArray(this.rows) && this.rows.length > 0;
}

get saveDisabled() {
  return this.isSaving || !this.recordId;
}
```

## Refreshable Wire

```js
import { LightningElement, api, wire } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import getRows from '@salesforce/apex/ExampleController.getRows';

export default class ExampleList extends LightningElement {
  @api recordId;
  rows = [];
  wiredRowsResult;

  @wire(getRows, { recordId: '$recordId' })
  wiredRows(result) {
    this.wiredRowsResult = result;
    if (result.data) {
      this.rows = result.data;
    } else if (result.error) {
      this.error = result.error;
    }
  }

  async refreshRows() {
    if (this.wiredRowsResult) {
      await refreshApex(this.wiredRowsResult);
    }
  }
}
```

## Apex Controller Facade

```apex
public with sharing class ExampleController {
    @AuraEnabled(cacheable=true)
    public static ExampleDTO getState(Id recordId) {
        if (recordId == null) {
            throw new AuraHandledException('Record Id is required.');
        }
        return ExampleService.buildState(recordId);
    }
}
```

## Bulk Trigger Skeleton

```apex
trigger ProjectTrigger on Project__c (
    before insert, before update,
    after insert, after update, after delete, after undelete
) {
    ProjectTriggerHandler.run(Trigger.operationType, Trigger.new, Trigger.oldMap);
}
```

## Safe Partial DML

```apex
Database.SaveResult[] results = Database.update(recordsToUpdate, false);
for (Integer i = 0; i < results.size(); i++) {
    if (!results[i].isSuccess()) {
        // Log recordsToUpdate[i].Id and results[i].getErrors().
    }
}
```

