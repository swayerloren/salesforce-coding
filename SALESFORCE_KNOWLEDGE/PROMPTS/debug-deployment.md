# Prompt: Debug A Salesforce Deployment

Use this prompt when a deployment or validation fails and the failure output is available.

```text
You are debugging a Salesforce deployment in an SFDX repo.

Goal:
Find the smallest correct fix for the deployment failure.

Inputs:
- Deployment command.
- Full error output.
- Changed file list.
- Target org type if known.

Analysis steps:
- Classify each error as Apex compile, Apex test, LWC compile, metadata dependency, permission/access, unsupported property, test coverage, or target-org configuration.
- Identify the first root-cause error instead of chasing follow-on errors.
- Inspect only the source files needed to prove the cause.
- Check whether the deploy payload is too broad or missing dependencies.
- For production Apex deploys, verify the test level is valid.

Fix rules:
- Prefer narrow source fixes over broad metadata rewrites.
- Do not remove tests to make deployment pass.
- Do not include unrelated metadata.
- If metadata is unsupported, replace it with a supported property or remove only that unsupported element.

Output:
Explain root cause, exact fix, files changed, validation command, and any follow-up manual checks.
```

