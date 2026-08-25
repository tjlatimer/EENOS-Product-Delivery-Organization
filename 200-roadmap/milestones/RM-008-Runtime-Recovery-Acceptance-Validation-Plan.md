---
Document ID: RM-008-VAL-PLAN
Title: RM-008 Runtime Recovery and Session Resume Acceptance Validation Plan
Version: 0.1.0
Status: Ready for Validation Authorization
Owner: Roadmap Manager
Approver: Tony
Created: 2026-08-24
Last Updated: 2026-08-24
Related Roadmap Item: RM-008
---

# RM-008 Runtime Recovery and Session Resume Acceptance Validation Plan

## Purpose

Determine whether the operational Phase 1 recovery slice reconstructs verified runtime state from eligible RM-007 checkpoints, resumes through the RM-010 entry contract, and blocks ambiguous, corrupt, or unsafe recovery.

## Validation Boundary

This plan validates deterministic selection, eligibility, reconstruction, verification, warning/block behavior, non-destructive failure, retry handling, and control transfer. It does not replace RM-006 destructive-recovery validation or future RM-023 fidelity scoring and audit.

## Authorities and Inputs

- `98_Workflow/AI_Runtime/SPEC_RM-008_Runtime_Recovery_and_Session_Resume_v0.1.md`
- `98_Workflow/Reports/REPORT_RM-008_Recovery_Runtime_Slice_2026-07-18.md`
- RM-007 checkpoint contract and eligible test fixtures
- RM-010 Session Header and control-transfer contract
- RM-017 capability schema
- Current approved recovery implementation and tests

## Preconditions

- Freeze implementation, runtime, fixture, and environment versions in an evidence manifest.
- Prepare valid, incomplete, corrupt, ambiguous, stale-dependency, stale-capability, and fallback checkpoint fixtures.
- Run in an isolated recovery target that cannot mutate source checkpoints, Canon, or production working artifacts.
- Ensure each attempt receives a unique recovery identifier and preserves the selected source-checkpoint identity.

## Acceptance Tests

| AC | Scenario | Expected result |
|---|---|---|
| AC-001 | Explicitly recover from one valid eligible checkpoint. | Identity, mission, mode, working set, active artifacts, runtime state, and warnings reconstruct and verify before control transfer. |
| AC-002 | Recover using deterministic latest-eligible selection. | The selected source and selection rule are recorded; no equally ranked candidate exists. |
| AC-003 | Present two equally eligible checkpoints. | Recovery blocks or requests explicit selection and never silently chooses. |
| AC-004 | Request a checkpoint below the mode's minimum completeness level. | Recovery blocks or uses an explicitly permitted, disclosed fallback. |
| AC-005 | Corrupt a required artifact or integrity reference. | Eligibility fails before runtime activation; source checkpoint remains unchanged. |
| AC-006 | Remove optional context. | Recovery continues only when permitted, carries a warning into the Session Header, and does not alter required state. |
| AC-007 | Remove a required dependency or capability. | Recovery blocks with the failing eligibility stage and actionable diagnostic. |
| AC-008 | Drift an optional dependency or capability. | A deterministic warning or permitted degraded outcome is recorded and disclosed. |
| AC-009 | Permit fallback to an earlier eligible checkpoint. | Rejected and selected checkpoints, reason, policy, and warning are recorded; mission, mode, and working set do not silently change. |
| AC-010 | Fail reconstruction after eligibility. | Outcome identifies reconstruction failure; partial state does not become active. |
| AC-011 | Fail verification after reconstruction. | Recovery fails, runtime remains inactive or suspended, and the source checkpoint is preserved. |
| AC-012 | Fail control transfer after successful verification. | Handoff failure is distinguished from reconstruction failure; no ambiguous active runtime remains. |
| AC-013 | Retry the same unchanged recovery request with an idempotency key. | The deterministic result is reused or equivalently reproduced without duplicate active sessions. |
| AC-014 | Recover while the same session is already active. | Recovery blocks, uses governed re-entry, or requests explicit direction; it never creates an unauthorized second active runtime. |
| AC-015 | Compare recovered state with a fresh RM-010 boot from equivalent governed inputs. | Governed runtime observations are equivalent, with recovery-specific provenance disclosed. |
| AC-016 | Run recovery and startup regression suites. | Existing RM-006, RM-007, RM-010, and supported recovery behavior remain intact. |

## Evidence Package

Return the frozen commit and environment, commands, fixtures and hashes, selection records, eligibility-stage outcomes, reconstructed-state comparisons, Session Headers or blocking diagnostics, control-transfer records, AC matrix, defects, limitations, and overall disposition.

## Pass Rule

RM-008 passes only when AC-001 through AC-016 pass, no required state is invented, every recovery source is traceable, failed attempts are non-destructive, and no ambiguous active runtime remains. RM-023 fidelity scoring must not be inferred from this result.

## Failure Routing

- Recovery implementation defect: Delivery Manager to assigned implementer.
- Checkpoint-source defect: route to RM-007 owner and preserve the RM-008 result separately.
- Startup handoff defect: route to RM-010 owner and preserve completed recovery evidence.
- Planning ambiguity or access/approval exception: return through Tony to the authorized role.

## Sign-off

Overall result: [ ] PASS  [ ] FAIL  [ ] BLOCKED

Independent reviewer: ____________________  Date: __________

Tony disposition: [ ] ACCEPT  [ ] RETURN FOR REVISION  [ ] DEFER
