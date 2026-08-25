---
Document ID: RM-007-VAL-PLAN
Title: RM-007 Runtime Checkpointing and Version History Acceptance Validation Plan
Version: 0.1.0
Status: Ready for Validation Authorization
Owner: Roadmap Manager
Approver: Tony
Created: 2026-08-24
Last Updated: 2026-08-24
Related Roadmap Item: RM-007
---

# RM-007 Runtime Checkpointing and Version History Acceptance Validation Plan

## Purpose

Determine whether the operational Phase 1 checkpointing slice creates deterministic, integrity-checked, recoverable logical checkpoints without overstating completeness or damaging lineage.

## Validation Boundary

This plan validates RM-007 checkpoint creation, persistence, integrity, lineage, concurrency, and RM-008 handoff. It does not validate recovery reconstruction, provider quality, story quality, or a particular storage technology.

## Authorities and Inputs

- `98_Workflow/AI_Runtime/SPEC_RM-007_Runtime_Checkpointing_and_Version_History_v0.1.md`
- `98_Workflow/Reports/REPORT_RM-007_Checkpointed_Runtime_Slice_2026-07-18.md`
- Current approved RM-007 implementation and tests
- RM-008 checkpoint-consumer contract
- RM-010 session identity and startup contract
- RM-017 capability records used by checkpointing

## Preconditions

- Freeze the implementation commit, runtime version, test-data set, and execution environment in an evidence manifest.
- Use an isolated temporary checkpoint store; do not alter source story or Canon artifacts.
- Record all generated checkpoint identifiers, parent identifiers, hashes, completeness levels, diagnostics, and recovery-eligibility outcomes.
- Confirm rollback or cleanup targets before destructive fault injection.

## Acceptance Tests

| AC | Scenario | Expected result |
|---|---|---|
| AC-001 | Create a valid automatic checkpoint from a known session state. | One committed checkpoint is created with stable identity, required contents, valid integrity, and an evidence-backed completeness level. |
| AC-002 | Create a valid manual checkpoint with a label and reason. | The manual request records its type, label, reason, session identity, working set, and deterministic result. |
| AC-003 | Validate completeness levels 0 through 2 against their required contents. | Each checkpoint claims no higher level than its persisted and validated artifacts support. |
| AC-004 | Remove or corrupt one required physical artifact before commit. | The logical checkpoint is rejected or incomplete and is not recovery eligible. |
| AC-005 | Remove an optional artifact while all required artifacts remain valid. | The outcome is a disclosed warning or deterministic downgrade; required state is preserved. |
| AC-006 | Reuse an idempotency key for an identical request. | The same checkpoint result is returned without creating a duplicate committed checkpoint. |
| AC-007 | Submit conflicting or concurrent requests from one parent. | Requests serialize, reject deterministically, or form disclosed sibling branches; identities never collide. |
| AC-008 | Create a parent-child sequence and an authorized branch. | Parent references resolve, branch identity is recorded, and lineage is deterministic. |
| AC-009 | Attempt to delete or supersede a checkpoint required by retained lineage. | The operation blocks or preserves the required lineage according to policy. |
| AC-010 | Tamper with checkpoint contents after commit. | Integrity revalidation detects the change and removes recovery eligibility. |
| AC-011 | Simulate storage or runtime-state persistence failure. | No false committed checkpoint is reported; failed artifacts and retry eligibility are identified. |
| AC-012 | Produce the RM-008 handoff for an eligible checkpoint. | Handoff includes source identity, completeness, integrity, lineage, references, warnings, and recovery eligibility. |
| AC-013 | Repeat the complete suite. | Deterministic inputs produce equivalent normalized outcomes and no unexplained checkpoint duplication. |
| AC-014 | Run checkpointing regression tests. | Existing supported checkpoint paths remain operational with no in-scope regression. |

## Evidence Package

The validator shall return the frozen commit, environment manifest, commands, raw results, generated checkpoint records, before/after store inventory, integrity hashes, AC matrix, defects, limitations, and an overall `PASS`, `FAIL`, or `BLOCKED` disposition. Every failed AC remains visible.

## Pass Rule

RM-007 passes only when AC-001 through AC-014 pass, no Critical or High checkpoint-integrity defect remains open, and no checkpoint is falsely reported as committed or recoverable. A warning may be accepted only when it is explicitly permitted, disclosed, and does not weaken required state.

## Failure Routing

- Implementation defect: Delivery Manager routes a repair package to the assigned implementer.
- Specification ambiguity: return to Roadmap Manager for planning clarification; do not invent policy.
- Repository or evidence-placement issue: route through Tony to Repository Steward when required.
- Approval, destructive scope, or access issue: return to Tony.

## Sign-off

Overall result: [ ] PASS  [ ] FAIL  [ ] BLOCKED

Independent reviewer: ____________________  Date: __________

Tony disposition: [ ] ACCEPT  [ ] RETURN FOR REVISION  [ ] DEFER
