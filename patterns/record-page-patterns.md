# Record Page Patterns

## Standard Record Page

Use for simple records:

- Highlights Panel,
- Dynamic Forms or Record Detail,
- Path if status-driven,
- standard Activity/Chatter,
- standard related lists.

## Custom Workspace Page

Use when users need a task-focused operating surface:

- host LWC,
- server-shaped DTO,
- filters and actions,
- explicit refresh,
- dedicated permissions.

## Custom Tabbed Record Page

Use carefully. If custom Aura or LWC tabs are needed:

- preserve region contracts,
- lazy-render heavy tabs,
- keep App Builder usable,
- persist tab state only when helpful,
- test mobile separately.

## Field Rendering Modes

Do not mix these casually:

- page layout detail,
- Dynamic Forms,
- custom field viewer,
- editable LWC form,
- standard `lightning-record-form`.

Pick the mode based on whether admins or developers should own the field set.

