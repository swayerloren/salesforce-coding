# LWC Patterns

## Host Plus Child Composition

Use a host component when several children share context:

- record id,
- resolved album/list/context id,
- token,
- loaded settings,
- cache,
- active tab,
- shared refresh.

The host should own orchestration. Children should own focused rendering and actions.

## Modal-Shell-Aware Child

When a child is shown in `LightningModal`, make it aware of that mode:

- modal host owns overlay and background scroll freeze,
- child owns visible fullscreen surface,
- child cleanup releases only its own interaction state,
- close returns a structured result to the opener.

## Refreshable Related List

Use a wired Apex method for the list and store the wire result. After upload/edit/delete:

- call the server mutation,
- call `notifyRecordUpdateAvailable`,
- call `refreshApex`,
- update local optimistic state only if the server returned the final row shape.

## Template Getter

Keep template expressions simple. Anything with conditions, fallback values, class calculations, labels, or array length should be a getter.

## Admin Misconfiguration State

When custom metadata or App Builder properties are missing, render a clear admin-facing warning. Do not show a blank card.

