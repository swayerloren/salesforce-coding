# Mobile Quality Strategy

Salesforce mobile work must be reviewed as a first-class target, not a final note.

## Mobile Quality Areas

| Area | Check |
| --- | --- |
| Form factor | `js-meta.xml`, FlexiPage, quick action, and page visibility. |
| Action bar | Quick action metadata, layout actions, Dynamic Actions, activation, and permissions. |
| Layout | Tap targets, scrolling, modal sizing, overflow, responsive CSS. |
| Data | Offline/mobile-safe wire, GraphQL, Apex, and refresh behavior. |
| Files | Preview, download, upload, and navigation behavior. |
| Camera/media | Permission prompt, first frame, capture, cleanup, and retake behavior. |
| PDFs/reports | Durable generated artifact, preview/download handoff, and refresh path. |
| Chatter/action UX | Touch selection, mention metadata, attachment progress, and duplicate submit guards. |
| Permissions | Object, field, Apex, custom permission, action access. |
| Validation | LWC mobile lint and graph analyzer when configured. |

## Decision Table

| Scope | Minimum validation |
| --- | --- |
| Mobile UI only | Static bundle review, CSS review, metadata form factor check. |
| Mobile data behavior | LWC Jest and data-path inspection. |
| Offline behavior | Mobile lint or graph analyzer if available. |
| Record action | Quick action metadata, FlexiPage/action placement, permissions. |
| Camera or file capture | Static lifecycle review plus real mobile test when possible. |
| File preview/download | Validate upload, preview, download, and latest-version behavior separately. |
| Visualforce PDF or generated report | Test from the actual mobile action context or report as untested. |
| Chatter-like action | Pointer/focus behavior, upload progress, and duplicate-submit review. |

## Codex Rule

If runtime mobile testing cannot be performed, state that limitation and list static checks completed.

Static checks should include component metadata, action visibility chain, CSS viewport behavior, Apex/file access, refresh behavior, and any unsupported mobile handoff assumptions.
