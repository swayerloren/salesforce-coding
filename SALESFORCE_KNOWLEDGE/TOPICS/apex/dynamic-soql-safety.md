# Dynamic SOQL Safety

Dynamic SOQL is useful for generic search, reporting, optional filters, and reusable services. It is also a common source of injection risk and deployment bugs.

## Prefer Static SOQL First

Use static SOQL when the object, fields, and filters are known.

```apex
List<Project__c> projects = [
    SELECT Id, Name, Status__c
    FROM Project__c
    WHERE Account__c = :accountId
    ORDER BY CreatedDate DESC
    LIMIT 50
];
```

## Safe Dynamic Pattern

```apex
public with sharing class ProjectSearchService {
    private static final Set<String> ALLOWED_SORT_FIELDS = new Set<String>{
        'Name',
        'CreatedDate',
        'LastModifiedDate'
    };

    public static List<Project__c> search(String searchText, String sortField) {
        String normalizedSort = ALLOWED_SORT_FIELDS.contains(sortField) ? sortField : 'CreatedDate';
        String likeText = '%' + String.escapeSingleQuotes(String.valueOf(searchText).trim()) + '%';

        String query =
            'SELECT Id, Name, Status__c ' +
            'FROM Project__c ' +
            'WHERE Name LIKE :likeText ' +
            'ORDER BY ' + normalizedSort + ' DESC ' +
            'LIMIT 50';

        return Database.query(query);
    }
}
```

## Guardrails

- Whitelist object names, field names, sort fields, and sort directions.
- Bind values instead of concatenating them.
- Use `String.escapeSingleQuotes` for unavoidable text interpolation.
- Keep limits explicit.
- Use `WITH SECURITY_ENFORCED` when appropriate and test the behavior.
- Do not allow user input to become raw SOQL fragments.

## Red Flags

```apex
Database.query('SELECT Id FROM ' + objectName + ' WHERE Name LIKE \'%' + input + '%\'');
```

```apex
Database.query('SELECT Id FROM Project__c ORDER BY ' + userSort);
```

