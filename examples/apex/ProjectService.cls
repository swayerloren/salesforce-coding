public with sharing class ProjectService {
    public static void defaultStatus(List<Project__c> projects) {
        for (Project__c project : projects) {
            if (String.isBlank(project.Status__c)) {
                project.Status__c = 'New';
            }
        }
    }

    public static void validateStatusChanges(
        List<Project__c> newRows,
        Map<Id, Project__c> oldRowsById
    ) {
        for (Project__c project : newRows) {
            Project__c oldRow = oldRowsById == null ? null : oldRowsById.get(project.Id);
            if (oldRow != null &&
                oldRow.Status__c == 'Complete' &&
                project.Status__c != 'Complete') {
                project.Status__c.addError('Completed projects cannot be reopened.');
            }
        }
    }

    public static void markComplete(Set<Id> projectIds) {
        if (projectIds == null || projectIds.isEmpty()) {
            return;
        }

        List<Project__c> updates = new List<Project__c>();
        for (Project__c project : [
            SELECT Id, Status__c
            FROM Project__c
            WHERE Id IN :projectIds
        ]) {
            if (project.Status__c != 'Complete') {
                project.Status__c = 'Complete';
                updates.add(project);
            }
        }

        if (!updates.isEmpty()) {
            update updates;
        }
    }

    public static void enqueueRollup(Set<Id> projectIds) {
        if (projectIds == null || projectIds.isEmpty()) {
            return;
        }
        System.enqueueJob(new ProjectRollupQueueable(projectIds));
    }
}
