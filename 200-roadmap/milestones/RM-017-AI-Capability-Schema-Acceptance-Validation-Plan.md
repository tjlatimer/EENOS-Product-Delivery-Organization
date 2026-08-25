---
Document ID: RM-017-VAL-PLAN
Title: RM-017 AI Capability Schema Acceptance Validation Plan
Version: 0.1.0
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
