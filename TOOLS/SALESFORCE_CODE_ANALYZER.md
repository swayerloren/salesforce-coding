# Salesforce Code Analyzer

Upstream reference: https://github.com/forcedotcom/code-analyzer

License signal: BSD-3-Clause.

Salesforce Code Analyzer is a Salesforce CLI plugin that analyzes Salesforce source for security, quality, maintainability, and best-practice issues. It can analyze Apex, JavaScript, HTML, CSS, Salesforce metadata such as Flows, and dependency/static-resource risk areas depending on installed version and configuration.

Use this repo's Code Analyzer guidance as a reference only. Do not copy source, rule engines, messages, tests, workflows, or package code from the upstream repo into this repo.

## Why Codex Should Use It

Codex should use Salesforce Code Analyzer after meaningful Apex, LWC, Aura, metadata, Flow, static resource, or deployment-scope changes because it provides static-analysis evidence that tests and visual inspection may miss.

| Change type | Why run Code Analyzer |
| --- | --- |
| Apex classes or triggers | Finds security, sharing, injection, complexity, and maintainability concerns. |
| LWC or JavaScript | Catches lint, DOM, dependency, and JavaScript quality problems when configured. |
| Metadata or Flow | Can surface metadata and Flow analysis findings in supported versions. |
| Static resources or bundled JavaScript | Can help identify dependency or client-side risk areas. |
| Deployment/release prep | Gives a repeatable quality gate before claiming readiness. |

Codex must not claim static analysis passed unless Code Analyzer actually ran and passed.

## Install

Check the official upstream docs before changing a user's project or CI setup:

```bash
sf plugins install @salesforce/plugin-code-analyzer
```

Confirm availability:

```bash
sf code-analyzer --help
sf code-analyzer run --help
sf code-analyzer rules --help
```

Older projects may use Salesforce Scanner commands instead:

```bash
sf scanner run --help
sfdx scanner:run --help
```

Codex may recommend installation, but must not install tools or modify dependencies unless the user asks.

## Run From A Salesforce DX Project

Run from the real Salesforce DX project root. Do not run from this helper repo unless the helper repo itself contains the real `force-app/main/default` source.

Recommended default:

```bash
sf code-analyzer run --target force-app/main/default --view table
```

Recommended rule preview:

```bash
sf code-analyzer rules --rule-selector Recommended --target force-app/main/default --view table
```

Recommended focused targets:

```bash
sf code-analyzer run --target force-app/main/default/classes --view table
sf code-analyzer run --target force-app/main/default/triggers --view table
sf code-analyzer run --target force-app/main/default/lwc --view table
sf code-analyzer run --target force-app/main/default/flows --view table
```

If a project has a `code-analyzer.yml`, use it from the project root or pass it explicitly:

```bash
sf code-analyzer run --config-file code-analyzer.yml --target force-app/main/default --view table
```

## Path Examples

If the real project is under `FORCE_APP_DIRECTORY/`:

```bash
cd FORCE_APP_DIRECTORY/your-project
sf code-analyzer run --target force-app/main/default --view table
```

If the real project is at repo root:

```bash
cd <repo-root>
sf code-analyzer run --target force-app/main/default --view table
```

If using the local automation helper:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\AUTOMATION\local-quality-check.ps1 -RunCodeAnalyzer
```

```bash
bash ./AUTOMATION/local-quality-check.sh --run-code-analyzer
```

## Missing Installation

If Code Analyzer is missing, Codex should report:

```text
SKIPPED: Salesforce Code Analyzer was not run because sf code-analyzer was not installed or not available on PATH.
Recommended install: sf plugins install @salesforce/plugin-code-analyzer
```

Missing Code Analyzer is not proof that the code is good. It is a validation limitation.

## Interpret Results

| Result | Codex interpretation |
| --- | --- |
| Pass | The command ran and exited successfully. Report command, target, and whether findings were zero or below configured threshold. |
| Warnings/findings | Do not ignore. Map findings to changed files first, then identify unrelated backlog findings separately. |
| Errors/nonzero exit | Treat as a failed static-analysis gate. Fix relevant findings or explain why they are unrelated and require owner review. |
| Skipped because missing tool | State the exact missing command and recommended install. Do not claim static analysis passed. |
| Skipped because no `force-app/main/default` | State that no real Salesforce DX project was found. This is expected for the helper repo before a user adds a project. |

## History Logging

When Code Analyzer runs, record it in History:

| File | What to write |
| --- | --- |
| `HISTORY/CODEX_RUN_LOG.md` | Command, target, pass/fail/skipped, relevant findings, and limitations. |
| `HISTORY/TEST_RESULTS_LOG.md` | Use when Code Analyzer is part of a broader validation/test pass. Include command, result, coverage/test context if relevant, and failure reason. |
| `HISTORY/CHANGE_ARCHIVE.md` | Summarize Code Analyzer evidence for larger completed changes. |

## Codex Rule

After Salesforce code or metadata changes, Codex should run Code Analyzer when available. If it cannot run, Codex must state why and recommend the command or installation step needed.
