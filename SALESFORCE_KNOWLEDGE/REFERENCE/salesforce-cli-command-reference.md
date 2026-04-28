# Salesforce CLI Command Reference

Use placeholders and adapt to the real Salesforce DX project. Verify exact flags with installed help before running commands that mutate an org or overwrite local source.

Primary command map: [../COMMANDS/SALESFORCE_CLI_COMMAND_MAP.md](../COMMANDS/SALESFORCE_CLI_COMMAND_MAP.md)

## Verify Installed Help

```powershell
sf project deploy start --help
sf project deploy validate --help
sf project deploy report --help
sf project deploy quick --help
sf project retrieve start --help
sf apex run test --help
sf code-analyzer run --help
```

## Run Focused Tests

```powershell
sf apex run test --target-org <alias> --test-level RunSpecifiedTests --tests MyControllerTest --result-format human --wait 30
```

## Dry-Run Narrow Deploy For Sandbox Or Development Validation

```powershell
sf project deploy start --target-org <alias> --dry-run --source-dir force-app/main/default/classes/MyController.cls --source-dir force-app/main/default/classes/MyControllerTest.cls --test-level RunSpecifiedTests --tests MyControllerTest
```

## Production-Style Validation And Quick Deploy

```powershell
sf project deploy validate --target-org <alias> --source-dir force-app/main/default/classes/MyController.cls --source-dir force-app/main/default/classes/MyControllerTest.cls --test-level RunSpecifiedTests --tests MyControllerTest --wait 30
```

```powershell
sf project deploy report --target-org <alias> --job-id <validated-job-id> --wait 30
```

```powershell
sf project deploy quick --target-org <alias> --job-id <validated-job-id> --wait 30
```

## Real Narrow Deploy After Dry Run

```powershell
sf project deploy start --target-org <alias> --source-dir force-app/main/default/classes/MyController.cls --source-dir force-app/main/default/classes/MyControllerTest.cls --test-level RunSpecifiedTests --tests MyControllerTest
```

## Retrieve Visualforce Page

```powershell
sf project retrieve start --target-org <alias> --metadata ApexPage:MyPdfPage
```

## Retrieve By Manifest

```powershell
sf project retrieve start --target-org <alias> --manifest manifest/package.xml
```

Inspect every retrieved file before committing. Broad retrieves can pull unrelated org state into source.

## Query Org-Wide Coverage

```powershell
sf data query --target-org <alias> --use-tooling-api --query "SELECT PercentCovered FROM ApexOrgWideCoverage"
```

## Run Code Analyzer

```powershell
sf code-analyzer rules --rule-selector Recommended --workspace . --target force-app/main/default --view table
sf code-analyzer run --rule-selector Recommended --workspace . --target force-app/main/default --view table
```

## Destructive Validation Pattern

Use only after explicit approval and after reading [../TOPICS/deployment/destructive-deployment-safety.md](../TOPICS/deployment/destructive-deployment-safety.md).

```powershell
sf project deploy start --target-org <alias> --dry-run --manifest manifest/package.xml --post-destructive-changes manifest/destructiveChangesPost.xml --test-level RunSpecifiedTests --tests MyDeletionSafetyTest
```

Do not use wildcard destructive members. Do not combine destructive cleanup with unrelated feature deployment.
