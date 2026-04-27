# Fix History

## Purpose

`FIX_HISTORY.md` stores reusable fix patterns Codex should remember for future Salesforce tasks.

This is memory, not a run log. Add entries only when a fix teaches a pattern that can help future work.

## When Codex Should Update It

Update this file when:

- a bug is fixed and the fix pattern is reusable,
- a Salesforce platform constraint explains the fix,
- a root cause is likely to recur,
- a test or deploy failure leads to a durable correction pattern,
- a code or metadata change reveals a project-specific convention.

Do not update this file for:

- one-off command output,
- failed experiments without a reusable lesson,
- private org details,
- credentials or secret material.

## Entry Template

```markdown
## YYYY-MM-DD - <Area>

- Date:
- Area:
- Problem:
- Root cause:
- Fix pattern:
- Files involved:
- Lesson learned:
```

## Example Entry

```markdown
## 2026-04-27 - LWC Template Rendering

- Date: 2026-04-27
- Area: LWC
- Problem: Component failed to deploy after a conditional class expression was added in the template.
- Root cause: LWC templates do not allow arbitrary JavaScript expressions.
- Fix pattern: Move expression logic into a JavaScript getter and bind the template to the getter.
- Files involved: `force-app/main/default/lwc/exampleCard/exampleCard.html`, `force-app/main/default/lwc/exampleCard/exampleCard.js`
- Lesson learned: Keep LWC templates declarative and move computed state into getters.
```

