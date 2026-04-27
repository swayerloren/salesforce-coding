public with sharing class ProjectActionController {
    public class ActionResult {
        @AuraEnabled public Boolean success;
        @AuraEnabled public String message;
    }

    public class FileRow {
        @AuraEnabled public Id contentDocumentId;
        @AuraEnabled public String title;
    }

    @AuraEnabled
    public static ActionResult runAction(Id recordId) {
        if (recordId == null) {
            throw new AuraHandledException('A record id is required.');
        }

        ProjectService.markComplete(new Set<Id>{ recordId });

        ActionResult result = new ActionResult();
        result.success = true;
        result.message = 'Project marked complete.';
        return result;
    }

    @AuraEnabled(cacheable=true)
    public static List<FileRow> getFiles(Id recordId) {
        if (recordId == null) {
            return new List<FileRow>();
        }

        List<FileRow> rows = new List<FileRow>();
        for (ContentDocumentLink link : [
            SELECT ContentDocumentId, ContentDocument.Title
            FROM ContentDocumentLink
            WHERE LinkedEntityId = :recordId
            ORDER BY ContentDocument.LastModifiedDate DESC
            LIMIT 50
        ]) {
            FileRow row = new FileRow();
            row.contentDocumentId = link.ContentDocumentId;
            row.title = link.ContentDocument.Title;
            rows.add(row);
        }
        return rows;
    }
}

