# Vendor References

`VENDOR_REFERENCES/` documents optional external Salesforce repos that users may clone locally for study.

These repos are **not required** to use this Codex-ready Salesforce coding engine. They are local references only and must not be vendored into the public repo.

## Local Clone Location

Optional clones go here:

```text
VENDOR_REFERENCES/_external/
```

That folder is ignored by git.

## Files

| File | Use |
| --- | --- |
| [TOOL_SOURCE_MAP.md](TOOL_SOURCE_MAP.md) | Maps external repos to safe uses, license signals, and local clone folder names. |
| [EXTERNAL_REPOS_TO_CLONE_OPTIONALLY.md](EXTERNAL_REPOS_TO_CLONE_OPTIONALLY.md) | Lists optional upstream repos and clone commands. |
| [LICENSE_AND_ATTRIBUTION_NOTES.md](LICENSE_AND_ATTRIBUTION_NOTES.md) | License and attribution requirements. |
| [clone-reference-repos.ps1](clone-reference-repos.ps1) | Windows PowerShell clone helper. |
| [clone-reference-repos.sh](clone-reference-repos.sh) | Linux/macOS shell clone helper. |

## Quick Start

Windows PowerShell:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\VENDOR_REFERENCES\clone-reference-repos.ps1
```

Linux/macOS:

```bash
bash ./VENDOR_REFERENCES/clone-reference-repos.sh
```

## Codex Rules

- Codex may inspect local optional clones if they exist.
- Codex must not copy external repo source code blindly.
- Codex must inspect the user's real `force-app/main/default` before adapting any pattern.
- Codex must preserve attribution and license context when any external source is copied or closely adapted.
- Codex must not commit `VENDOR_REFERENCES/_external/`.

## Owner Rules

- Do not remove upstream license files from local clones.
- Do not commit cloned third-party repos.
- Do not use cloned sample metadata as facts about a user's org.
- Do not treat a permissive license as permission to ignore attribution.
