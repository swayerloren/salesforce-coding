@IsTest
public class TestDataFactory {
    public static Account createAccount() {
        Account account = new Account(Name = 'Example Account');
        insert account;
        return account;
    }

    public static Project__c createProject(Id accountId) {
        Project__c project = new Project__c(
            Name = 'Example Project',
            Account__c = accountId,
            Status__c = 'New'
        );
        insert project;
        return project;
    }
}

