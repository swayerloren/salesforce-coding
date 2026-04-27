# Failure History

## Purpose

`FAILURE_HISTORY.md` stores reusable lessons from failures.

Track failed deploys, failed tests, broken LWC behavior, metadata errors, root causes, and prevention rules that Codex should remember for future tasks.

This is not a raw log. Summarize the failure only after the cause or prevention rule is understood.

## When Codex Should Update It

Update this file when:

- a deploy fails and the failure teaches a reusable rule,
- an Apex test fails for a recurring project pattern,
- LWC behavior breaks due to a platform/runtime constraint,
- metadata deployment fails due to naming, dependencies, visibility, or packaging,
- a failure reveals a prevention checklist item.

Do not include:

- deploy IDs,
- org IDs,
- private data,
- credentials,
- raw stack traces with private object data,
- customer information.

## Entry Template

```markdown
## YYYY-MM-DD - <Failure Type>

- Date:
- Failure type:
- Area:
- Failed command or symptom:
- Root cause:
- Prevention rule:
- Related files:
- Follow-up:
```

## Example Entry

```markdown
## 2026-04-27 - Metadata Deploy Failure

- Date: 2026-04-27
- Failure type: Metadata deploy
- Area: Quick action activation
- Failed command or symptom: Dry-run deploy failed because the FlexiPage referenced an action that was not included in the deployment payload.
- Root cause: The deploy package included page activation metadata without the dependent action metadata.
- Prevention rule: When moving record-page actions, include the action definition, target component, permissions, and FlexiPage/page-layout references together.
- Related files: `force-app/main/default/flexipages/Example_Record_Page.flexipage-meta.xml`, `force-app/main/default/quickActions/Example__c.Example_Action.quickAction-meta.xml`
- Follow-up: Use a narrow deploy manifest that includes direct dependencies.
```

