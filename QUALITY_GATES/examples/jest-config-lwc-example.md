# Example Jest Config For LWC

This is an optional example. It is not automatically active and should be adapted to the real Salesforce DX project's existing test setup.

## Minimal `jest.config.js`

```js
const { jestConfig } = require('@salesforce/sfdx-lwc-jest/config');

module.exports = {
  ...jestConfig
};
```

## Common Package Scripts

```json
{
  "scripts": {
    "test:unit": "sfdx-lwc-jest",
    "test:unit:watch": "sfdx-lwc-jest --watch",
    "test:unit:debug": "sfdx-lwc-jest --debug",
    "test:unit:coverage": "sfdx-lwc-jest --coverage"
  }
}
```

## Codex Rules

- Inspect existing Jest config and mocks before editing.
- Do not replace established project test conventions without user approval.
- Keep tests focused on the changed component behavior.
- Mock wire adapters, Apex calls, navigation, and toast behavior using the project's existing test style where present.
- Do not claim Jest passed unless `npm run test:unit` or the project-specific Jest command actually ran and passed.
