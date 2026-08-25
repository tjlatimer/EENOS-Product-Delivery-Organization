---
Document ID: RM-010-VAL-PLAN
Title: RM-010 AI Runtime Startup Manager Acceptance Validation Plan
Version: 0.2.0
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

## Who Does What

- **Tony:** types the ordinary startup phrases, answers mission/mode questions, confirms what appears, and decides acceptance.
- **Validation Facilitator:** opens clean sessions on each required surface, prepares missing-capability/dependency simulations, runs technical regressions, and records evidence.
- **Independent Reviewer:** checks the completed matrix and confirms that failures were not hidden or repaired during review.

Tony does not install files, edit prompts, remove real dependencies, or interpret Python/PowerShell diagnostics.

## Step-by-Step Owner Test

### Step 1 — Confirm deployment before testing

1. The facilitator gives Tony a one-page deployment table naming every required project/surface, deployed artifact version, and hash.
2. Each required row must say `DEPLOYED` and match the approved Start EENOS package.
3. The Organization Model Consultant disposition and Tony approval must be attached.
4. If any row is missing, proposed-only, or hash-mismatched, record `BLOCKED — deployment incomplete`; do not claim RM-010 validation.

### Step 2 — Run the technical baseline

The facilitator runs from the software-repository root:

```powershell
python -m unittest tools.tests.test_runtime_startup_manager -v
```

If the supported environment uses PowerShell startup regression scripts, the facilitator also runs the approved repository command and records it verbatim. Tony checks only that the summary contains zero failures or errors.

### Step 3 — Perform a clean ordinary start on every required surface

For each row of the four-project matrix:

1. The facilitator opens a new clean chat/session with no inherited EENOS mission or mode.
2. Tony types `START EENOS`.
3. The expected response begins governed startup or asks for the required mission/mode information. It must not route the request to Delivery Manager or another unrelated role.
4. Tony supplies a harmless mission: `Validate EENOS startup without changing story files.`
5. When asked, Tony selects a supported mode listed by the runtime.
6. Tony confirms that the resulting header clearly states mission, mode, capabilities, dependencies, context, recovery decision, warnings, validation result, working set, and destination runtime.
7. The facilitator saves the entire transcript and marks that surface PASS or FAIL.

### Step 4 — Test missing or invalid information

In separate clean sessions Tony performs these simple tests:

1. Type `START EENOS`, then provide an incomplete mission. The system must ask for missing information or block rather than guess silently.
2. Request a made-up mode such as `MODE: NOT-A-REAL-MODE`. The system must explain the valid correction or block.
3. Ask to begin a mission for which the facilitator has made one required test dependency unavailable in the sandbox. The system must block before handoff and name what is missing.
4. Repeat with an optional dependency unavailable. The system may continue only if the limitation is visibly disclosed.

The facilitator, not Tony, creates the safe missing-dependency conditions.

### Step 5 — Test recovery routing

1. Start a clean mission that does not need recovery. Tony verifies that the header says recovery is not required or not selected.
2. Start the prepared recovery-required scenario. The system must use RM-008 and must not begin normal runtime work if recovery fails.
3. Capture both transcripts.

### Step 6 — Test controlled changes after startup

Using a disposable active session:

1. Tony changes the mission. The current runtime should pause while startup checks the new mission and issues a revised header or blocking message.
2. Tony requests a different valid mode. The system should recheck what the new mode requires before transferring control.
3. The facilitator simulates loss of a required capability. Tony verifies that work stops or follows an explicitly approved degraded path; it must not continue silently.
4. The facilitator simulates a failed re-entry. Tony verifies that the result explains whether the old valid session can resume or must remain suspended.

### Step 7 — Record the decision

The facilitator completes one AC-001 through AC-018 sheet per required surface plus one combined matrix. RM-010 cannot pass unless every required surface passes and `DEF-RM-010-001` has no unresolved blocking finding.

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
