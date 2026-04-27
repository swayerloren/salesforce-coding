# New User Usability Review

Date: 2026-04-27

## Review Perspective

This review treats the repo as if it was freshly downloaded from GitHub by a user who has no prior context.

Reviewed:

- `README.md`
- `START_HERE.md`
- `INSTRUCTIONS/`
- `FORCE_APP_DIRECTORY/`
- `SALESFORCE_KNOWLEDGE/INDEX.md`
- `WIKI_DRAFTS/Home.md`

## Summary Verdict

The repo is understandable for a brand-new user.

The main purpose, Salesforce DX project placement, Codex reading order, Salesforce knowledge base, Memory, and History are clear. The only usability gap was that task-specific prompts for Apex, LWC, and deployment/test failures were present but not prominent enough for a first-time user. That was fixed during this review.

## Questions And Answers

| Question | Answer | Notes |
| --- | --- | --- |
| 1. Is it immediately clear what this repo does? | Yes | `README.md` and `START_HERE.md` state that this is a Codex-ready Salesforce coding engine for real Salesforce DX projects. |
| 2. Is it clear where to put a Salesforce DX project? | Yes | `README.md`, `START_HERE.md`, `FORCE_APP_DIRECTORY/README.md`, and `INSTRUCTIONS/SALESFORCE_PROJECT_PLACEMENT.md` all point to `FORCE_APP_DIRECTORY/` or an external path. |
| 3. Is it clear what Codex must read first? | Yes | `START_HERE.md` is clearly identified as the first read, followed by `INSTRUCTIONS/`. |
| 4. Is it clear where Salesforce knowledge lives? | Yes | `SALESFORCE_KNOWLEDGE/` is consistently described as the Salesforce knowledge base. |
| 5. Is it clear what Memory and History are for? | Yes | `README.md`, `MEMORY/README.md`, and `HISTORY/README.md` explain reusable lessons versus chronological records. |
| 6. Is it clear how to ask Codex to fix Apex? | Yes after polish | Added more prominent Apex fix prompt guidance in `README.md` and `START_HERE.md`; `SALESFORCE_KNOWLEDGE/INDEX.md` now links directly to the Apex prompt pack file. |
| 7. Is it clear how to ask Codex to fix LWC? | Yes after polish | Added more prominent LWC fix prompt guidance in `README.md` and `START_HERE.md`; `SALESFORCE_KNOWLEDGE/INDEX.md` links directly to the LWC prompt pack file. |
| 8. Is it clear how to handle deployment/test failures? | Yes after polish | Added a deployment/test failure prompt in `README.md` and `START_HERE.md`; `SALESFORCE_KNOWLEDGE/INDEX.md` links directly to deployment and Apex test prompts. |
| 9. Are there any confusing folder names? | Mostly no | `FORCE_APP_DIRECTORY/` is a little literal, but it is consistently explained. `WORKSPACE/` and `WIKI_DRAFTS/` are clear from their README or surrounding docs. |
| 10. Are there any broken assumptions? | No blocking assumptions | The docs correctly say the repo does not include a Salesforce DX project by default. Remaining assumptions are manual release items: final GitHub repo URL, whether to publish `WORKSPACE/`, and GitHub Mermaid rendering. |
| 11. What should be improved before GitHub release? | See below | Remaining items are owner checks, not documentation blockers. |

## Issues Found

| Issue | Impact | Fix |
| --- | --- | --- |
| Task-specific prompts were findable but not prominent enough for a brand-new user. | A new user might understand the repo but still hesitate on the exact prompt to ask Codex for Apex, LWC, or deployment/test failures. | Added common-task prompt tables to `README.md` and `START_HERE.md`; added prompt pack shortcuts to `SALESFORCE_KNOWLEDGE/INDEX.md`; added common starting points to `WIKI_DRAFTS/Home.md`. |

## Docs Changed During This Review

| File | Change |
| --- | --- |
| `README.md` | Added a common-task prompt table for Apex, LWC, deployment/test failures, and metadata review. |
| `START_HERE.md` | Added common task prompts for Apex, LWC, and deployment/test failures. |
| `SALESFORCE_KNOWLEDGE/INDEX.md` | Added prompt pack shortcuts for starting tasks, fixing LWC, Apex, Apex tests, deployment failures, metadata/record pages, and pre-push review. |
| `WIKI_DRAFTS/Home.md` | Added common starting points for first run, Apex, LWC, deployment/test failures, metadata, and Memory/History. |

## Remaining Manual Improvements Before GitHub Release

- Confirm the README badge and release URLs match the final GitHub repository owner/name.
- Decide whether `WORKSPACE/` review reports should be included in the public repository.
- Verify Mermaid diagrams render correctly on GitHub.
- Run GitHub secret scanning after push or before public release.
- If a real Salesforce DX project is added later, rerun the public release safety review before pushing.

## Final Assessment

A new user should be able to understand the repo purpose, place or reference a Salesforce DX project, tell Codex what to read first, find Salesforce knowledge, and start common Apex, LWC, deployment, and test-failure workflows.

The repo is usable for GitHub release after the remaining owner checks.
