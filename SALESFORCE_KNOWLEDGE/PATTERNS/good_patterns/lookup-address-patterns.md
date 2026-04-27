# Lookup and Address Field Patterns

Lookup and address fields are frequent Salesforce edge cases because display values, stored ids, compound fields, and country/state codes are different concerns.

## Lookup Fields

Store and update lookup ids, but query display fields for the UI.

```apex
SELECT Id, Account__c, Account__r.Name
FROM Project__c
WHERE Id = :recordId
```

Return both values when an LWC needs to show current state and submit updates.

```apex
public class LookupValue {
    @AuraEnabled public Id value;
    @AuraEnabled public String label;
}
```

## Lookup Pitfalls

- Updating the relationship name instead of the lookup id.
- Rendering the id when users expect the related record name.
- Forgetting that a lookup filter can reject values that Apex would otherwise accept.
- Assuming a user can read the related record because they can read the parent.

## Compound Address Fields

Custom compound address fields deploy as one logical field but are read and written through component leaf fields in Apex and metadata contexts.

Typical leaf fields:

- `Address__Street__s`
- `Address__City__s`
- `Address__StateCode__s`
- `Address__PostalCode__s`
- `Address__CountryCode__s`

## Address Rules

- Use state and country codes when the org has state and country picklists enabled.
- Set country code before or with state code.
- Do not assume free-text state names will save.
- Keep null checks around every optional address part.
- Normalize output for display separately from update payloads.

## Safe Address Assignment

```apex
project.Site_Address__Street__s = input.street;
project.Site_Address__City__s = input.city;
project.Site_Address__CountryCode__s = input.countryCode;
project.Site_Address__StateCode__s = input.stateCode;
project.Site_Address__PostalCode__s = input.postalCode;
```

## UI Guidance

Use standard record-edit controls when they satisfy the workflow. Build custom address UIs only when the UX requires composition, validation, or external lookup behavior that standard components cannot provide.

