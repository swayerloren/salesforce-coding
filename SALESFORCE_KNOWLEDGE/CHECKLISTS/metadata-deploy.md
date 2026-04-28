# Metadata Deploy Checklist

- [ ] Field metadata includes required permissions plan.
- [ ] Quick action metadata is paired with page/layout placement.
- [ ] FlexiPage change is intentional and form-factor aware.
- [ ] Layout change is required, not accidental metadata churn.
- [ ] CMDT records contain no secrets.
- [ ] Named/external credential metadata does not include secrets.
- [ ] Tab/app changes are intentional.
- [ ] Profiles are avoided unless absolutely required.
- [ ] Permission sets are preferred for access changes.
- [ ] `package.xml` is narrow and inspected.
- [ ] Destructive manifests are separate from ordinary manifests.
- [ ] Destructive changes have validation-only result, rollback note, and explicit approval.
- [ ] Retrieve output is reviewed before keeping it in source.
- [ ] Failure-hiding flags are not used to claim clean success.
