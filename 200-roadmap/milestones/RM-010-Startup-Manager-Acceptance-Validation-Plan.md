---
Document ID: RM-010-VAL-PLAN
Title: RM-010 AI Runtime Startup Manager Acceptance Validation Plan
Version: 0.1.0
Status: Ready for Validation Authorization
Owner: Roadmap Manager
Approver: Tony
Created: 2026-08-24
Last Updated: 2026-08-24
Related Roadmap Item: RM-010
---

# RM-010 AI Runtime Startup Manager Acceptance Validation Plan

## Purpose

Determine whether the operational Phase 1 Startup Manager establishes a valid runtime deterministically, blocks missing required inputs, discloses permitted degradation, and preserves the boot/runtime authority boundary across startup and governed re-entry.

## Validation Boundary

This plan validates RM-010 startup and re-entry behavior. The related `DEF-RM-010-001` deployment matrix remains a required input and must not be silently treated as satisfied by local implementation tests.

## Authorities and Inputs

- `98_Workflow/AI_Runtime/SPEC_RM-010_AI_Runtime_Startup_Manager_v0.1.md`
- `98_Workflow/AI_Runtime/PLAN_RM-010_Phase_1_Controlled_Activation_Test_v0.1.md`
- RM-010 implementation and prior Phase 1 reports
- RM-011 mode definitions and RM-014 startup authority
- RM-007, RM-008, RM-016, and RM-017 contracts
- `700-ai-organization/skills/start-eenos/references/validation-matrix.md`
- Approved disposition and deployment evidence for `DEF-RM-010-001`

## Preconditions

- Complete required independent review and Tony approval for the Start EENOS Skill before deployment-dependent tests.
- Freeze deployed artifact versions and hashes for each governed host/project surface.
- Use clean sessions without inherited mission or mode context for cold-start scenarios.
- Record boot identity, trigger, state transitions, dependencies, capabilities, loaded context, warnings, diagnostics, Session Header, and control-transfer result.

## Acceptance Tests

| AC | Scenario | Expected result |
|---|---|---|
| AC-001 | Invoke the approved startup trigger in each governed validation surface. | Startup begins the governed mission/mode sequence through RM-010 authority; no unrelated role intercepts it. |
| AC-002 | Supply a complete explicit mission and valid mode. | Mission, mode, capabilities, dependencies, context, recovery decision, validation result, Session Header, and transfer target are deterministic. |
| AC-003 | Omit mission information that cannot be safely inferred. | Startup requests the missing input or blocks; it does not continue with an unstated assumption. |
| AC-004 | Request an unsupported or ambiguous mode. | Startup provides governed correction or blocks with the applicable RM-011 authority. |
| AC-005 | Remove a required capability. | Startup blocks before runtime transfer and identifies the failed requirement and evidence. |
| AC-006 | Remove an optional capability or activate an approved degraded path. | Startup warns, discloses limitations in the Session Header, and preserves required behavior. |
| AC-007 | Remove a required dependency or required context artifact. | Startup blocks with a diagnostic rather than producing a normal Session Header. |
| AC-008 | Remove optional context. | Startup omits or warns according to authority and does not expand into unbounded context loading. |
| AC-009 | Start without recovery when recovery is not required. | Recovery decision is explicit and startup proceeds normally. |
| AC-010 | Start when recovery is mandatory. | RM-008 is invoked; failed mandatory recovery prevents runtime transfer. |
| AC-011 | Validate Session Header completeness. | Required identity, mission, mode, provider metadata, capability, dependency, context, recovery, warning, validation, working-set, and transfer fields are present and traceable. |
| AC-012 | Confirm control-transfer boundary. | RM-010 hands off once validation succeeds and performs no mode-specific runtime work. |
| AC-013 | Replace the mission during runtime. | Governed re-entry suspends the prior runtime and either transfers under a revised header or emits a blocking diagnostic. |
| AC-014 | Request a mode change. | Required boot subset reruns; preserved state and continuation rules are explicit. |
| AC-015 | Remove a required capability or critical dependency during runtime. | Governed re-entry occurs; runtime blocks or degrades only as authorized, with no silent continuation. |
| AC-016 | Fail re-entry. | Runtime remains suspended, safely resumes the still-valid prior state where permitted, or terminates according to contract; no ambiguous state remains. |
| AC-017 | Repeat deterministic startup inputs. | Normalized outputs and state transitions are equivalent apart from generated attempt identity and timestamps. |
| AC-018 | Execute the four-project deployment matrix and focused regressions. | Every required surface passes; deployment hashes match; PowerShell and supported runtime regressions pass. |

## Evidence Package

Return deployed artifact hashes by surface, clean-session evidence, commands or interaction transcripts, boot-state traces, capability/dependency manifests, context lists, Session Headers and blocking diagnostics, re-entry records, matrix results, regression output, AC matrix, defects, limitations, and overall disposition.

## Pass Rule

RM-010 passes only when AC-001 through AC-018 pass across every required deployed surface, `DEF-RM-010-001` has no unresolved blocking finding, required absences block before transfer, and no operational runtime begins under ambiguous startup authority.

## Failure Routing

- Start EENOS governance or deployment defect: follow the accepted `DEF-RM-010-001` route.
- RM-010 implementation defect: Delivery Manager to assigned implementer.
- RM-011, RM-014, RM-017, or RM-008 authority failure: route to that owner without rewriting RM-010 evidence.
- Approval or access exception: return to Tony.

## Sign-off

Overall result: [ ] PASS  [ ] FAIL  [ ] BLOCKED

Independent reviewer: ____________________  Date: __________

Tony disposition: [ ] ACCEPT  [ ] RETURN FOR REVISION  [ ] DEFER
