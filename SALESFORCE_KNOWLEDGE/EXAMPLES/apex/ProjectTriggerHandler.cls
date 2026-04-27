public with sharing class ProjectTriggerHandler {
    public static void handle(
        System.TriggerOperation operationType,
        List<Project__c> newRows,
        Map<Id, Project__c> oldRowsById
    ) {
        if (operationType == System.TriggerOperation.BEFORE_INSERT) {
            ProjectService.defaultStatus(newRows);
        }

        if (operationType == System.TriggerOperation.BEFORE_UPDATE) {
            ProjectService.validateStatusChanges(newRows, oldRowsById);
        }

        if (operationType == System.TriggerOperation.AFTER_INSERT ||
            operationType == System.TriggerOperation.AFTER_UPDATE) {
            ProjectService.enqueueRollup(new Map<Id, Project__c>(newRows).keySet());
        }
    }
}

