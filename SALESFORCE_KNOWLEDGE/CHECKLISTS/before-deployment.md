# Before Deployment Checklist

- [ ] Confirm exact changed metadata files.
- [ ] Remove unrelated metadata from deploy scope.
- [ ] Confirm no documentation folder is included.
- [ ] Verify official metadata type names for package or destructive manifests.
- [ ] Check installed Salesforce CLI help for the command family.
- [ ] Inspect high-risk metadata separately: profiles, permission sets, FlexiPages, layouts, quick actions, reports, dashboards, email, static resources.
- [ ] Identify affected tests.
- [ ] Run focused Apex tests if applicable.
- [ ] Choose evidence path: dry run, production validation, deploy report, quick deploy, real deploy, or static review only.
- [ ] Run dry-run deploy first for ordinary validation, or `project deploy validate` for production quick-deploy flow.
- [ ] For destructive changes, use a separate destructive manifest, run validation-only first, document rollback, and get explicit approval before real deletion.
- [ ] If dry run passes, run matching real deploy.
- [ ] If validation returns a job ID, use deploy report before claiming final status.
- [ ] Run Code Analyzer for changed Salesforce source or document skipped reason.
- [ ] Record commands and results.
- [ ] If deploy fails, document symptom, root cause, fix, and lesson.
- [ ] Final status says exactly what passed: static review, local validation, dry run, tests, or real deploy.
