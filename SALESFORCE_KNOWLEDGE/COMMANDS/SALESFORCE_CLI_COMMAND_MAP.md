# Salesforce CLI Command Map

Use these command patterns only after locating the real Salesforce DX project and confirming `force-app/main/default`.

## Safe Inspection And Validation

| Command pattern | Use | Notes |
| --- | --- | --- |
| `sf project deploy start --dry-run --source-dir force-app/main/default --target-org <alias>` | Dry-run source deploy. | Verify exact flags with installed CLI. Requires org alias. |
| `sf project deploy start --dry-run --manifest manifest/package.xml --target-org <alias>` | Dry-run manifest deploy. | Inspect manifest first. |
| `sf apex test run --tests <TestClass> --target-org <alias> --result-format human --wait 10` | Focused Apex tests. | Verify flag names with installed CLI. |
| `sf apex test run --test-level RunLocalTests --target-org <alias> --wait 30` | Broader validation. | Use only when scope/risk requires it. |
| `sf code-analyzer run --target force-app/main/default --view table` | Static analysis. | Verify Code Analyzer installation. |

## Setup Commands That Require Approval

| Command pattern | Why approval is required |
| --- | --- |
| `sf org create scratch -d -f config/project-scratch-def.json -a <alias>` | Creates an org. |
| `sf project deploy start` | Deploys source. |
| `sf org assign permset -n <permission-set-name>` | Changes user access in an org. |
| `sf data tree import -p ./data/data-plan.json` | Inserts data. |
| `sf apex run --file <file>` | Executes Apex in an org. |

## Codex Checklist

- [ ] Project root confirmed.
- [ ] Org alias supplied by user or locally verified.
- [ ] Command does not include helper repo folders.
- [ ] Dry-run used before real deploy when possible.
- [ ] Command result recorded in History.
