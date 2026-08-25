---
Document ID: RM-007-VAL-PLAN
Title: RM-007 Runtime Checkpointing and Version History Acceptance Validation Plan
Version: 0.2.0
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

## Who Does What

- **Tony:** authorizes the run, supplies one harmless sample mission, watches the demonstration, and accepts or rejects the result.
- **Validation Facilitator:** prepares the disposable test folder, runs every command, creates damaged or competing test records, captures screenshots and logs, and explains results in ordinary language.
- **Independent Reviewer:** checks the evidence after the facilitator finishes. The reviewer does not repair failures.

Tony is not expected to edit JSON, run Python, create simultaneous requests, corrupt files, calculate hashes, or interpret stack traces.

## Step-by-Step Owner Test

### Step 1 — Receive the safe test kit

1. The facilitator gives Tony a folder named `RM-007-Validation-Run-<date>`.
2. Tony confirms the folder is identified as disposable and does not contain the live Evolution Earth vault or production checkpoints.
3. The facilitator shows the frozen software commit and writes it at the top of the result sheet.
4. If the folder or tested commit is not identified, stop and record `BLOCKED — test environment not controlled`.

### Step 2 — Prove that the existing checkpoint tests work

The facilitator opens PowerShell at the software-repository root and runs:

```powershell
python -m unittest tools.tests.test_runtime_checkpointing -v
```

Tony checks only the final summary. It must report no failures or errors. Save the complete output as `01-existing-checkpoint-tests.txt`.

### Step 3 — Create and inspect one normal checkpoint

1. Tony supplies a harmless sample mission, such as `Validate checkpoint preservation`.
2. The facilitator uses the approved checkpoint workflow to finish that sample session and create a checkpoint in the disposable folder.
3. The facilitator opens the resulting checkpoint record read-only and points out:
   - one unique checkpoint ID;
   - the sample mission and session ID;
   - the recorded checkpoint level;
   - `recovery_eligible` status;
   - integrity/hash information;
   - creation reason and parent ID, if any.
4. Tony confirms that the displayed mission matches the mission supplied and that the system did not label missing information as saved.
5. Save the checkpoint record and screenshot as `02-normal-checkpoint` evidence.

### Step 4 — Demonstrate damage detection

1. The facilitator copies the normal checkpoint; the original is never edited.
2. In the copy only, the facilitator changes the saved mission text after the checkpoint was created.
3. The facilitator runs the approved validation/read-back operation against the altered copy.
4. Tony verifies that the altered copy is rejected or marked not recoverable.
5. Tony verifies that the unchanged original still validates.
6. Save before/after copies and output as `03-damage-detection` evidence.

### Step 5 — Demonstrate duplicate and simultaneous-request safety

Tony does **not** submit conflicting requests manually.

1. The facilitator runs a prepared automated test that sends two requests using the same request key.
2. The result must show one checkpoint outcome, not two independently committed duplicates.
3. The facilitator then runs a prepared automated test that releases two requests from the same parent at the same time.
4. The result must show one of these permitted outcomes: ordered parent/child checkpoints, two clearly identified sibling branches, or one accepted request plus one explicit conflict rejection.
5. The result fails if two checkpoints share an ID, lineage is missing, or the program silently overwrites a checkpoint.
6. Save the command, timestamps, request inputs, and resulting checkpoint list as `04-request-safety` evidence.

### Step 6 — Demonstrate lineage protection and handoff

1. The facilitator creates a parent checkpoint and a child checkpoint.
2. The facilitator attempts, in the disposable store only, to remove or supersede the parent while the child still depends on it.
3. Tony verifies that the system blocks the unsafe action or preserves enough lineage for recovery.
4. The facilitator displays the RM-008 handoff record for the eligible checkpoint.
5. Tony confirms that it names the checkpoint, integrity result, checkpoint level, parent/branch information, warnings, and whether recovery is allowed.

### Step 7 — Record the decision

1. The facilitator completes AC-001 through AC-014 using the evidence collected above and any additional automated cases.
2. Tony does not accept a summary that hides a failed AC.
3. Overall PASS requires every AC to pass. Otherwise record FAIL or BLOCKED and route the evidence without attempting an informal repair.

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
