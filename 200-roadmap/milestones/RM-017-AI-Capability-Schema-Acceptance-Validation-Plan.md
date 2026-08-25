---
Document ID: RM-017-VAL-PLAN
Title: RM-017 AI Capability Schema Acceptance Validation Plan
Version: 0.3.0
Status: Ready for Validation Authorization
Owner: Roadmap Manager
Approver: Tony
Created: 2026-08-24
Last Updated: 2026-08-24
Related Roadmap Item: RM-017
---

# RM-017 AI Capability Schema Acceptance Validation Plan

## Purpose

Determine whether the operational minimum slice represents and evaluates behavioral AI capabilities independently of provider identity and gives RM-007, RM-008, and RM-010 deterministic evidence for pass, warning, degraded, and blocking decisions.

## Validation Boundary

This plan validates the schema contract, records, evaluation logic, freshness, disclosure, and current consumers. It does not certify a provider directory, compare model quality, or authorize RM-022 Ollama integration.

## Authorities and Inputs

- `98_Workflow/AI_Runtime/SPEC_RM-017_AI_Capability_Schema_v0.1.md`
- Current `tools/runtime_capabilities.py` implementation and tests
- RM-007, RM-008, and RM-010 consumer contracts
- Frozen capability fixtures representing available, unavailable, conditional, unknown, not-applicable, stale, alternative, and degraded states

## Preconditions

- Freeze implementation commit, schema/specification version, fixtures, consumers, and environment.
- Define each tested requirement before capability availability is evaluated.
- Record provider metadata separately from capability evidence.
- Include positive, negative, stale-state, and cross-provider-equivalence fixtures.

## Who Does What

- **Tony:** reviews the capability cards in plain language, chooses which capabilities the sample mission requires, and confirms the visible pass/warn/block decisions.
- **Delivery Manager:** creates the governed validation assignment, confirms the consumer and fixture scope, and coordinates blocker routing.
- **Implementation Engineer:** prepares test capability records, runs automated tests, changes timestamps/states in disposable fixtures, and captures consumer results.
- **Independent Reviewer:** checks that provider names never substituted for evidence and verifies the final AC matrix.

Tony is not expected to edit schemas, JSON, timestamps, or provider adapters.

## Step-by-Step Owner Test

### Step 1 — Receive plain-language capability cards

1. The Implementation Engineer supplies a table with one row per test capability and these columns: `What the system can do`, `Required for this mission?`, `Current state`, `Evidence`, `Checked at`, `Limitation`, and `Expected decision`.
2. Tony selects a harmless sample mission and confirms which listed abilities are genuinely required versus optional.
3. The Implementation Engineer records that requirement decision before running availability checks. This prevents the test from changing requirements to force a PASS.

### Step 2 — Run the existing automated tests

The Implementation Engineer runs from the software-repository root:

```powershell
python -m unittest tools.tests.test_runtime_capabilities -v
```

Tony checks the final summary for zero failures and errors. Save the full output as `01-existing-capability-tests.txt`.

### Step 3 — Demonstrate the five capability states

The Implementation Engineer presents five disposable records one at a time:

1. **Available:** Tony verifies that a required capability may pass when current evidence says it works.
2. **Unavailable:** Tony verifies that a required capability blocks unless an approved alternative exists.
3. **Conditional:** Tony verifies that the condition is written plainly and the capability passes only when the condition is true.
4. **Unknown:** Tony verifies that the system does not pretend the capability exists.
5. **Not applicable:** Tony verifies that it closes only an irrelevant check and does not satisfy a required ability.

For every record, save the input card and resulting decision side by side.

### Step 4 — Demonstrate required, optional, alternative, and degraded decisions

1. Mark one available capability Required; confirm PASS.
2. Mark one unavailable capability Required; confirm BLOCK.
3. Mark that same capability Optional; confirm the result is a warning or disclosed omission rather than a false required PASS.
4. Provide two approved alternatives, one unavailable and one available; confirm the result names the alternative that satisfied the need.
5. Run a prepared degraded-path case; confirm that its authority, limitation, scope, and review/expiration condition are visible.

### Step 5 — Prove provider names do not decide capability

1. The Implementation Engineer shows two fixtures with different provider names but identical capability evidence.
2. Tony verifies that the operational decisions are the same.
3. The Implementation Engineer then shows two fixtures with the same provider name but different capability evidence.
4. Tony verifies that the decisions follow the evidence and differ where appropriate.
5. Any result based only on `ChatGPT`, `Claude`, `Ollama`, or another provider name is a FAIL.

### Step 6 — Test stale and changing information

1. The Implementation Engineer changes the check time on a required capability so it is older than the permitted freshness window.
2. Tony verifies that the system rechecks it or warns/blocks; it must not silently accept stale evidence.
3. In a disposable active session, the Implementation Engineer changes a required capability from Available to Unavailable.
4. Tony verifies that the proper startup re-entry, checkpoint, or recovery behavior occurs and the change is visible.

### Step 7 — Show the same evidence to all three consumers

1. The Implementation Engineer submits the same frozen capability record to RM-007, RM-008, and RM-010 test harnesses.
2. Tony receives a three-column comparison explaining the checkpoint, recovery, and startup decisions.
3. Differences are permitted only when each consumer's requirement is different and that requirement is shown.

### Step 8 — Record the decision

The Implementation Engineer maps the demonstrations and automated results to AC-001 through AC-018. Every row names its evidence file. RM-017 fails if provider identity substitutes for evidence or if an unknown, unavailable, invalid, or stale required capability silently passes.

## Acceptance Tests

| AC | Scenario | Expected result |
|---|---|---|
| AC-001 | Validate a complete capability record. | Stable capability identity, behavioral name, state, evidence, freshness, limitations, source, and schema version are represented. |
| AC-002 | Evaluate AVAILABLE against REQUIRED. | Outcome passes with traceable evidence. |
| AC-003 | Evaluate UNAVAILABLE against REQUIRED. | Outcome blocks unless an explicit approved alternative or degraded path applies. |
| AC-004 | Evaluate UNKNOWN against REQUIRED. | Outcome blocks; unknown is never silently treated as available. |
| AC-005 | Evaluate CONDITIONAL with its condition true and false. | The capability satisfies the requirement only when the recorded condition is met; otherwise the result is deterministic. |
| AC-006 | Evaluate NOT_APPLICABLE. | It closes only the applicable non-required check and never satisfies a required capability. |
| AC-007 | Evaluate OPTIONAL capability absence. | Outcome warns or passes with disclosed omission according to the consumer contract. |
| AC-008 | Evaluate ALTERNATIVE capability sets. | A valid available alternative passes and records which alternative satisfied the requirement. |
| AC-009 | Exercise an approved degraded path. | Authority, scope, limitation, disclosure, and expiration/review condition are recorded; no undeclared degradation passes. |
| AC-010 | Change provider identity while holding capability evidence constant. | Operational capability outcome remains equivalent; provider identity is diagnostic metadata only. |
| AC-011 | Hold provider identity constant while changing capability evidence. | Operational outcome follows the changed capability evidence, not provider reputation or name. |
| AC-012 | Supply stale required capability evidence. | Capability is revalidated or deterministically downgraded to warning/block according to consumer authority. |
| AC-013 | Change a required capability during an active session. | The applicable RM-010 re-entry, RM-007 checkpoint, or RM-008 recovery behavior is triggered and disclosed. |
| AC-014 | Consume the same capability record through RM-007. | Checkpoint eligibility and completeness decisions use the schema without provider-specific inference. |
| AC-015 | Consume the same capability record through RM-008. | Recovery eligibility and drift outcomes are deterministic and traceable. |
| AC-016 | Consume the same capability record through RM-010. | Startup pass, warning, or block matches requirement level and evidence. |
| AC-017 | Reject malformed, contradictory, or unsupported records. | Invalid schema/state/evidence combinations do not satisfy a requirement and produce actionable diagnostics. |
| AC-018 | Run focused and consumer regression suites. | Existing RM-007, RM-008, and RM-010 supported behavior remains intact. |

## Evidence Package

Return the frozen manifest, schema fixtures and hashes, requirement definitions, capability-check records, consumer outcomes, commands, raw test output, normalized comparison results, AC matrix, defects, limitations, and overall disposition.

## Pass Rule

RM-017 passes only when AC-001 through AC-018 pass, provider identity never substitutes for capability evidence, required unknown/unavailable/stale states cannot silently pass, and all three current consumers produce contract-consistent outcomes.

## Failure Routing

- Schema or evaluator implementation defect: Delivery Manager to assigned implementer.
- Consumer-specific defect: route to RM-007, RM-008, or RM-010 owner while preserving the RM-017 result.
- Authority ambiguity over degraded paths or disclosure: return through Tony to the appropriate governance owner.
- Access or approval exception: return to Tony.

## Sign-off

Overall result: [ ] PASS  [ ] FAIL  [ ] BLOCKED

Independent reviewer: ____________________  Date: __________

Tony disposition: [ ] ACCEPT  [ ] RETURN FOR REVISION  [ ] DEFER
