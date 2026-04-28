# Mobile Quality Strategy

Salesforce mobile work must be reviewed as a first-class target, not a final note.

## Mobile Quality Areas

| Area | Check |
| --- | --- |
| Form factor | `js-meta.xml`, FlexiPage, quick action, and page visibility. |
| Layout | Tap targets, scrolling, modal sizing, overflow, responsive CSS. |
| Data | Offline/mobile-safe wire, GraphQL, Apex, and refresh behavior. |
| Files | Preview, download, upload, and navigation behavior. |
| Permissions | Object, field, Apex, custom permission, action access. |
| Validation | LWC mobile lint and graph analyzer when configured. |

## Decision Table

| Scope | Minimum validation |
| --- | --- |
| Mobile UI only | Static bundle review, CSS review, metadata form factor check. |
| Mobile data behavior | LWC Jest and data-path inspection. |
| Offline behavior | Mobile lint or graph analyzer if available. |
| Record action | Quick action metadata, FlexiPage/action placement, permissions. |

## Codex Rule

If runtime mobile testing cannot be performed, state that limitation and list static checks completed.
