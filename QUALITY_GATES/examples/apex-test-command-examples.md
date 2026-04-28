# Example Apex Test Commands

These are optional examples. Adapt them to the real Salesforce DX project's org aliases, package strategy, test class names, and deployment policy.

## Focused Test Class

```bash
sf apex run test --class-names MyServiceTest --result-format human --wait 10
```

Legacy CLI shape:

```bash
sfdx force:apex:test:run -n MyServiceTest -r human -w 10
```

## Multiple Focused Test Classes

```bash
sf apex run test --class-names MyServiceTest,MyTriggerHandlerTest --result-format human --wait 10
```

## Tests For Deployment Validation

```bash
sf project deploy validate --source-dir force-app/main/default/classes --test-level RunSpecifiedTests --tests MyServiceTest --target-org my-sandbox
```

## Query Recent Test Results

```bash
sf apex get test --test-run-id 707000000000000 --target-org my-sandbox --result-format human
```

## Codex Rules

- Verify the real test class names before running commands.
- Do not invent org aliases.
- Do not run org-backed tests unless an org is configured and the user expects that validation.
- Do not claim tests passed unless the command actually ran and passed.
- Tests must create their own data and include meaningful assertions.
