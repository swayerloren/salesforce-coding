# Package XML Notes

Use package manifests to make deployments reproducible, but keep them scoped to the change. Large manifests make failures harder to diagnose and can move unrelated metadata.

## Example Narrow Manifest

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Package xmlns="http://soap.sforce.com/2006/04/metadata">
    <types>
        <members>ProjectService</members>
        <members>ProjectTriggerHandler</members>
        <members>ProjectRollupQueueable</members>
        <members>ProjectActionController</members>
        <members>ProjectActionControllerTest</members>
        <members>TestDataFactory</members>
        <name>ApexClass</name>
    </types>
    <types>
        <members>ProjectTrigger</members>
        <name>ApexTrigger</name>
    </types>
    <types>
        <members>safeRecordAction</members>
        <name>LightningComponentBundle</name>
    </types>
    <version>60.0</version>
</Package>
```

## Notes

- Match the package version to the org and project policy.
- Include test classes with Apex changes.
- Include dependent metadata only when the target org does not already have it.
- Do not include generated profile noise unless access changes are part of the work.
