# Link And Path Review

Date: 2026-04-27

## Scope

This pass reviewed repo-local Markdown and root metadata text files for stale links and old post-restructure path references.

## Files Scanned

Scanned 152 repo-local files matching:

```text
*.md
.gitignore
.gitattributes
```

Primary public documentation areas scanned:

- `README.md`
- `START_HERE.md`
- `INSTRUCTIONS/`
- `SALESFORCE_KNOWLEDGE/`
- `WIKI_DRAFTS/`
- `FORCE_APP_DIRECTORY/`
- `MEMORY/`
- `HISTORY/`
- `SOURCE_MAPPING.md`
- `RELEASE_NOTES_v1.0.0.md`
- `PUBLIC_REPO_REVIEW_CHECKLIST.md`
- `SECURITY.md`
- `CONTRIBUTING.md`
- `CONTRIBUTING_GUIDELINES.md`

Workspace audit files were also scanned and treated as historical records rather than canonical public instructions.

## Links Updated

| File | Update |
| --- | --- |
| `RELEASE_NOTES_v1.0.0.md` | Updated old root folder descriptions such as `patterns/`, `examples/`, `troubleshooting/`, `prompts/`, `checklists/`, and `anti_patterns/` to the current `SALESFORCE_KNOWLEDGE/...` paths. |
| `WIKI_DRAFTS/Common-Failures-Codex-Must-Check.md` | Updated bare guide references such as `SALESFORCE_LWC_GUIDE.md`, `SALESFORCE_APEX_GUIDE.md`, and `SALESFORCE_DEPLOYMENT_GUIDE.md` to `SALESFORCE_KNOWLEDGE/GUIDES/...` paths. |

## Old Paths Still Found

No stale old-root links were found in final public docs after updates.

Remaining matches fall into these safe categories:

| Category | Explanation |
| --- | --- |
| Current knowledge paths | References such as `SALESFORCE_KNOWLEDGE/GUIDES/SALESFORCE_APEX_GUIDE.md`, `SALESFORCE_KNOWLEDGE/TOPICS/lwc/`, `SALESFORCE_KNOWLEDGE/PROMPTS/`, and `SALESFORCE_KNOWLEDGE/CHECKLISTS/` are the desired new paths. |
| Relative links inside `SALESFORCE_KNOWLEDGE/INDEX.md` | Links such as `GUIDES/SALESFORCE_APEX_GUIDE.md` and `TOPICS/apex/` are valid relative links from the index file inside `SALESFORCE_KNOWLEDGE/`. |
| Salesforce DX examples | Paths such as `force-app/main/default/lwc/` and `force-app/main/default/aura/` intentionally describe real Salesforce DX metadata structure, not old repo knowledge folders. |
| Tree diagrams | Folder names such as `apex/`, `lwc/`, `aura/`, and `anti_patterns/` appear inside tree diagrams that are already nested under `SALESFORCE_KNOWLEDGE/TOPICS/` or `SALESFORCE_KNOWLEDGE/PATTERNS/`. |
| Historical audit file | `WORKSPACE/REPO_AUDIT_BEFORE_RESTRUCTURE.md` intentionally records the old pre-restructure layout and was not rewritten. |

## Temporary Folder References Still Found

No exact references to the user-specified temporary reference path were found in:

- `README.md`
- `START_HERE.md`
- `INSTRUCTIONS/`
- `SALESFORCE_KNOWLEDGE/`
- `WIKI_DRAFTS/`
- `FORCE_APP_DIRECTORY/`
- `MEMORY/`
- `HISTORY/`
- `WORKSPACE/`

No final public docs depend on the temporary reference folder.

## Validation Performed

- Searched for old guide filenames and old root folder references.
- Searched for temporary reference folder names and local path fragments.
- Checked Markdown links across repo Markdown files with a stricter single-line Markdown-link matcher.
- Re-ran targeted scans after path updates.

Validation result:

```text
All markdown links passed.
No temporary reference path matches found.
```

## Recommended Manual Checks

- Review `WORKSPACE/REPO_AUDIT_BEFORE_RESTRUCTURE.md` before public release if workspace audit files will be published; it intentionally contains historical old-path references.
- Review release badges and GitHub URLs in `README.md` if the public repository name changes.
- If future moves happen under `SALESFORCE_KNOWLEDGE/`, rerun the Markdown link check and update `SALESFORCE_KNOWLEDGE/INDEX.md`, `SOURCE_MAPPING.md`, and `WIKI_DRAFTS/`.
- Before pushing to GitHub, run the strict public-safety checklist at `SALESFORCE_KNOWLEDGE/CHECKLISTS/CODEX_ENGINE_CHECKLISTS/PUBLIC_REPO_SAFETY_CHECK.md`.

