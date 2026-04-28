# License And Attribution Notes

This repo can reference external public tooling and sample repos, but it must not silently copy their source.

Optional clones under `VENDOR_REFERENCES/_external/` are local working references only. They are not part of the public repo.

## Required Attribution Fields

When adding a derived guide or reference map, record:

- upstream repo name,
- upstream URL,
- license signal,
- what was used,
- whether source files were copied,
- whether the use is reference-only, optional dependency, quality gate, or GitHub Action.

## License Signals

| License | Sources reviewed |
| --- | --- |
| CC0-1.0 | `trailheadapps/lwc-recipes`, `trailheadapps/apex-recipes` |
| BSD-3-Clause | `forcedotcom/code-analyzer`, `forcedotcom/salesforcedx-vscode` |
| MIT | `salesforce/sfdx-lwc-jest`, `salesforce/eslint-plugin-lwc`, `salesforce/eslint-config-lwc`, `salesforce/eslint-plugin-lwc-mobile`, `salesforce/eslint-plugin-lwc-graph-analyzer`, `dangmai/prettier-plugin-apex` |
| Apache-2.0 | `mitchspano/sfdx-scan-pull-request` |

## No Blind Copying

Even permissive licenses require care. Prefer:

- links,
- paraphrased lessons,
- tool command guidance,
- optional install instructions,
- attribution tables.

Avoid:

- copied source files,
- copied workflow files,
- copied generated bundles,
- copied sample app metadata,
- copied package internals.

## When Code Is Copied Or Closely Adapted

Only copy or closely adapt external code with owner approval. When that happens:

1. Confirm the license allows the intended use.
2. Preserve the upstream license and attribution context.
3. Keep the copied/adapted material narrow.
4. Document what was copied and why.
5. Verify the code against the user's real Salesforce DX project before use.

## Codex Attribution Rule

Codex should cite the upstream repo in implementation notes, pull request text, or project documentation when external source code is materially copied or closely adapted. Do not add attribution comments inside production code unless the license or owner requires it.
