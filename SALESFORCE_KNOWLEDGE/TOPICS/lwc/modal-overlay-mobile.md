# Modal and Overlay Mobile Lessons

Salesforce mobile runs components inside constrained webviews. Overlays that look fine on desktop can become unusable on phones if scrolling, fixed positioning, and safe areas are not handled carefully.

## Mobile-Safe Overlay Rules

- Lock background scroll only while the modal is open.
- Keep the close button reachable without relying on hover.
- Use viewport-height constraints with internal scrolling.
- Respect safe-area insets.
- Avoid nested full-screen overlays unless absolutely required.
- Test with touch, not only mouse clicks.

## CSS Pattern

```css
.modalShell {
  position: fixed;
  inset: 0;
  z-index: 9000;
  display: flex;
  align-items: stretch;
  justify-content: center;
  background: rgba(0, 0, 0, 0.45);
  padding: max(16px, env(safe-area-inset-top)) 16px max(16px, env(safe-area-inset-bottom));
}

.modalPanel {
  width: min(720px, 100%);
  max-height: 100%;
  overflow: auto;
  background: var(--lwc-colorBackgroundAlt, #fff);
  border-radius: 8px;
}
```

## JavaScript Scroll Lock

```js
connectedCallback() {
  if (this.open) {
    document.body.classList.add('modal-open');
  }
}

disconnectedCallback() {
  document.body.classList.remove('modal-open');
}
```

## Test Cases

- Open and close the modal repeatedly.
- Rotate the device.
- Type into a field near the bottom while the keyboard is open.
- Use file upload or camera controls inside the modal.
- Confirm the page can scroll again after closing.

