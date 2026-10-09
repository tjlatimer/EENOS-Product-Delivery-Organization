# Start EENOS Validation Matrix

## Project matrix

| Host project | Exact trigger | Near/non-trigger | Role preservation | Cancellation/block cleanup |
|---|---|---|---|---|
| Delivery Lead | Required | Required | Required | Required |
| Implementation Engineer | Required | Required | Required | Required |
| Repository Committer | Required | Required | Required | Required |
| Roadmap Manager | Required | Required | Required | Required |

For each exact-trigger case, observe one Skill invocation, ordinary-greeting suppression, current RM-011 mode validation, nonblank mission collection, RM-010 handoff or an owned blocker, no recursive delegation, and cleanup. Use fresh tasks for the four host projects.

## Deployment gates

| Criterion | Evidence required |
|---|---|
| DEP-AC-001 | RC-008 was unused at materialization and its text matches the authorized contract. |
| DEP-AC-002 | After deployment, normalized source/distribution manifests match. |
| DEP-AC-003 | Distribution synchronization uses atomic staging and has demonstrated rollback evidence. |
| DEP-AC-004 | OMC review and Tony approval bind to the proposed source-file hashes before publication or deployment. |

## Regression boundary

Confirm zero diff for the five governed PowerShell files identified by the handoff package. Rerun their existing tests during the later validation stage. No PowerShell file, plugin manifest, executable, or runtime distribution is part of repository materialization.
