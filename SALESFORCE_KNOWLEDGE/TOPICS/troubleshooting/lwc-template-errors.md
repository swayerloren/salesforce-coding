# LWC Template Errors

## Template Expression Fails

Symptom:

```text
Invalid expression
```

Cause:

- LWC templates do not allow arbitrary JavaScript.

Fix:

- move the expression into a getter.

Bad:

```html
<template if:true={rows.length > 0}></template>
```

Good:

```html
<template if:true={hasRows}></template>
```

```js
get hasRows() {
  return Array.isArray(this.rows) && this.rows.length > 0;
}
```

## Class Binding Fails

Bad:

```html
<div class={isSelected ? 'selected' : ''}></div>
```

Good:

```html
<div class={rowClass}></div>
```

```js
get rowClass() {
  return this.isSelected ? 'selected' : '';
}
```

