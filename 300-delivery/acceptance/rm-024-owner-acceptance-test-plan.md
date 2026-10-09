---
Document ID: RM-024-ACCEPTANCE-TEST
Title: RM-024 Story Architecture Owner Acceptance Test Plan
Version: 0.1.0
Status: Ready for Owner Test
Owner: Delivery Lead
Approver: Tony
Created: 2026-08-11
Last Updated: 2026-08-11
Related Roadmap Item: RM-024
---

# RM-024 Story Architecture Owner Acceptance Test Plan

## Purpose

Validate that RM-024 supports Tony's real top-down story-development workflow well enough to move from Story Vision and Story Questions through Narrative Threads, story/book structure, acts, chapters, and structural scene placement without requiring scene prose, detailed scene development, Canon promotion, or unapproved implementation changes.

## Test Owner

Tony

## Test Facilitator

Delivery Lead

## Preconditions

- Use the current approved RM-024 implementation/runtime.
- Use real Evolution Earth creative material already approved or actively being developed by Tony.
- Do not invent Canon or silently promote working material to Canon.
- Do not require scene prose.
- Record any defect, ambiguity, missing capability, or workflow friction that prevents completion.

## Acceptance Test

### 1. Start from Story Vision

Action: Open the Story Architecture workflow and load or identify the current Book 1 Story Vision.

Expected result: The workflow can identify and work from the existing story-level vision without forcing Tony to recreate it.

Result: [ ] PASS  [ ] FAIL
Notes:

### 2. Capture or Review Story Questions

Action: Identify the major unresolved story questions that shape Book 1.

Expected result: Story Questions can be represented and related to the overall story architecture without being treated as scene-level work.

Result: [ ] PASS  [ ] FAIL
Notes:

### 3. Map Narrative Threads

Action: Identify the major narrative threads already present in Book 1 and connect them to the story architecture.

Expected result: Multiple threads can coexist and remain distinguishable while contributing to the same book structure.

Result: [ ] PASS  [ ] FAIL
Notes:

### 4. Map Book Structure

Action: Represent the Book 1 structure at the book/act level using the current known architecture.

Expected result: The workflow supports top-down structure before requiring detailed scene planning.

Result: [ ] PASS  [ ] FAIL
Notes:

### 5. Locate Chapters Within Acts

Action: Place known or intended chapters into the appropriate act/structural region where evidence exists.

Expected result: Chapters can be positioned without requiring every chapter or scene to be fully designed.

Result: [ ] PASS  [ ] FAIL
Notes:

### 6. Structurally Locate a Real Scene

Action: Select one legitimate existing or planned Evolution Earth scene and locate it within the story → book → act → chapter hierarchy.

Expected result: The scene receives a clear structural location and can be handed off to Scene Development without requiring scene prose.

Result: [ ] PASS  [ ] FAIL
Notes:

### 7. Verify Persistence / Recovery of the Architecture State

Action: Save/checkpoint the Story Architecture state and recover/reopen it using the supported RM-024 workflow.

Expected result: The structural relationships and exact references survive recovery without Tony re-explaining the architecture.

Result: [ ] PASS  [ ] FAIL
Notes:

### 8. Verify Writers Room / Downstream Handoff

Action: Use the supported handoff mechanism for the structurally located scene or related story-development work.

Expected result: The next creative workflow receives enough context to continue without losing the structural location or approved boundaries.

Result: [ ] PASS  [ ] FAIL
Notes:

## Acceptance Criteria

RM-024 passes owner acceptance when all of the following are true:

- Tony can work top-down from story vision toward scene placement.
- Existing story material can be reused rather than recreated.
- Story Questions and Narrative Threads can be represented without collapsing into scene detail.
- Book/act/chapter structure can be built incrementally.
- At least one legitimate scene is structurally located.
- Architecture state survives the supported save/recovery path.
- The structurally located scene can be handed to downstream Scene Development with its context intact.
- No blocking defect forces Tony to use an undocumented workaround or manually reconstruct state.

## Failure Handling

If any blocking step fails:

1. Record the failed step and actual result.
2. Record reproduction details and relevant evidence.
3. Return RM-024 to Active or Blocked as appropriate.
4. Route the failure to the Implementation Engineer if it is an implementation defect.
5. Route ambiguity about repository placement or artifact authority to the Repository Steward only when actually required.
6. Do not mark Tony sign-off complete.

## Sign-off

Overall result: [ ] PASS  [ ] FAIL

Tony sign-off: [ ] ACCEPTED  [ ] REJECTED / REVISION REQUIRED

Acceptance notes:
