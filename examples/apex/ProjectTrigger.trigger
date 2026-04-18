trigger ProjectTrigger on Project__c (before insert, before update, after insert, after update) {
    ProjectTriggerHandler.handle(Trigger.operationType, Trigger.new, Trigger.oldMap);
}

