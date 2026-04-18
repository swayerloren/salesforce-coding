# Salesforce CLI Command Reference

Use placeholders and adapt to your repo.

## Run Focused Tests

```powershell
sf apex run test --target-org <alias> --test-level RunSpecifiedTests --tests MyControllerTest --result-format human --wait 30
```

## Dry-Run Narrow Deploy

```powershell
sf project deploy start --target-org <alias> --dry-run --source-dir force-app/main/default/classes/MyController.cls --source-dir force-app/main/default/classes/MyControllerTest.cls --test-level RunSpecifiedTests --tests MyControllerTest
```

## Real Narrow Deploy

```powershell
sf project deploy start --target-org <alias> --source-dir force-app/main/default/classes/MyController.cls --source-dir force-app/main/default/classes/MyControllerTest.cls --test-level RunSpecifiedTests --tests MyControllerTest
```

## Retrieve Visualforce Page

```powershell
sf project retrieve start --target-org <alias> --metadata ApexPage:MyPdfPage
```

## Query Org-Wide Coverage

```powershell
sf data query --target-org <alias> --use-tooling-api --query "SELECT PercentCovered FROM ApexOrgWideCoverage"
```

