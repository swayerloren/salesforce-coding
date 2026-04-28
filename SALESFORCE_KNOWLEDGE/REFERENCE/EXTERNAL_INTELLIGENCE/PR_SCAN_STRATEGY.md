# Pull Request Scan Strategy

Source reference: https://github.com/mitchspano/sfdx-scan-pull-request

Pull request scanning is useful as a concept: scan changed source, report findings, and fail on high-severity issues when policy requires it. Current projects should verify whether Salesforce Code Analyzer or another maintained workflow is the best implementation.

## Strategy

| Need | Recommended approach |
| --- | --- |
| Scan changed Salesforce source | Prefer current Salesforce Code Analyzer workflow if available. |
| Report findings | Use check runs or SARIF when possible; comments can be noisy. |
| Enforce severity | Use explicit threshold policy. |
| Keep CI safe | Do not require org secrets for static checks. |
| Avoid stale tooling | Verify legacy scanner commands against current upstream docs. |

## PR Gate Checklist

- [ ] Workflow runs on pull request.
- [ ] Workflow targets only real Salesforce DX source.
- [ ] Optional tools fail with clear setup guidance.
- [ ] Findings are summarized without leaking secrets.
- [ ] Threshold policy is documented.
- [ ] External actions are pinned or reviewed before use.

## Do Not

- Do not copy action source or generated `dist` files.
- Do not require org login for static PR checks by default.
- Do not use PR comments for every low-value finding.
- Do not treat legacy scanner guidance as current without verification.
