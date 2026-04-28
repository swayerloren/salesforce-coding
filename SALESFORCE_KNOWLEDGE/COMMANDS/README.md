# Command Maps

These command maps tell Codex what commands may be useful for Salesforce validation, testing, linting, formatting, and CI.

Commands are not proof by themselves. Codex must verify the real project context, installed tools, package scripts, and user approval before running commands that deploy, create orgs, import data, install dependencies, or change files.

## Map Files

| File | Use |
| --- | --- |
| [SALESFORCE_CLI_COMMAND_MAP.md](SALESFORCE_CLI_COMMAND_MAP.md) | Salesforce CLI validation and setup command patterns. |
| [NPM_SCRIPT_COMMAND_MAP.md](NPM_SCRIPT_COMMAND_MAP.md) | Project `package.json` script discovery and use. |
| [LWC_TEST_COMMAND_MAP.md](LWC_TEST_COMMAND_MAP.md) | LWC Jest command patterns. |
| [APEX_VALIDATION_COMMAND_MAP.md](APEX_VALIDATION_COMMAND_MAP.md) | Apex tests, Code Analyzer, and Apex formatting checks. |
| [GITHUB_ACTION_COMMAND_MAP.md](GITHUB_ACTION_COMMAND_MAP.md) | CI workflow command patterns and trigger ideas. |

## Codex Rule

Prefer existing project scripts over invented commands. Mark uncertain commands as `verify against upstream docs` or `verify against installed help`.

For Salesforce CLI commands, command help availability is preflight evidence only. A help check does not prove tests, deploys, retrieves, or analyzer gates passed.
