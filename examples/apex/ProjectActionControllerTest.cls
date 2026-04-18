@IsTest
private class ProjectActionControllerTest {
    @IsTest
    static void runActionMarksProjectComplete() {
        Account account = TestDataFactory.createAccount();
        Project__c project = TestDataFactory.createProject(account.Id);

        Test.startTest();
        ProjectActionController.ActionResult result = ProjectActionController.runAction(project.Id);
        Test.stopTest();

        System.assertEquals(true, result.success);

        Project__c saved = [
            SELECT Status__c
            FROM Project__c
            WHERE Id = :project.Id
        ];
        System.assertEquals('Complete', saved.Status__c);
    }

    @IsTest
    static void getFilesReturnsRows() {
        Account account = TestDataFactory.createAccount();
        Project__c project = TestDataFactory.createProject(account.Id);

        ContentVersion version = new ContentVersion(
            Title = 'Example File',
            PathOnClient = 'example.txt',
            VersionData = Blob.valueOf('example')
        );
        insert version;

        Id documentId = [
            SELECT ContentDocumentId
            FROM ContentVersion
            WHERE Id = :version.Id
        ].ContentDocumentId;

        insert new ContentDocumentLink(
            LinkedEntityId = project.Id,
            ContentDocumentId = documentId,
            ShareType = 'V',
            Visibility = 'AllUsers'
        );

        Test.startTest();
        List<ProjectActionController.FileRow> rows = ProjectActionController.getFiles(project.Id);
        Test.stopTest();

        System.assertEquals(1, rows.size());
        System.assertEquals(documentId, rows[0].contentDocumentId);
    }
}

