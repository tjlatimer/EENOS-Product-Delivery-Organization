# EENOS Product Roadmap

**Document ID:** RM-000  
**Version:** 1.10.0
**Status:** Approved  
**Document Owner:** Roadmap Manager  
**Approval Authority:** Tony  
**Approval Source:** Pull Request #13 merged by Tony on 2026-08-02; RM-024 priority and dependency order approved by Tony on 2026-08-04; RM-027 approved by Tony on 2026-08-04; RM-001–RM-005 closeout authorized and accepted by Tony on 2026-08-04; RM-014 closure and RM-024 evidence acceptance directed by Tony on 2026-08-05; RM-025 validation execution approved by Tony, PASS evidence returned, and Validated reconciliation accepted by Tony on 2026-08-06; RM-028–RM-031 UI discovery capture and Medium priorities approved by Tony on 2026-08-11; RM-027 implementation, independent-review disposition, handoff correction, and Implemented-state roadmap reconciliation approved by Tony on 2026-08-12; RM-027 AC-012 runtime synchronization and complete-active-set evaluation approved by Tony and returned PASS on 2026-08-13; RM-026 closure approved by Tony on 2026-08-13; RM-001–RM-006 and RM-011 closure approved by Tony on 2026-08-13
**Last Updated:** 2026-08-13
**Created:** 2026-07-13  
**Scope:** EENOS operating model, workflow improvements, runtime improvements, governance refinements, and future enhancements

---

## Purpose

The EENOS Product Roadmap is the strategic backlog for discoveries, improvements, enhancements, and ideas found during use.

It is not the Review Queue.

The Roadmap answers:

- What should EENOS improve?
- Why does it matter?
- When did this become visible?
- Where was it discovered?
- What release is expected to address it?
- Has it become a formal proposal?
- Has it been implemented, tested, and validated?

The Review Queue, when used, remains the place for formal proposals and approval review.

## Release Focus

### Immediate Release Gate — Complete

- RM-014 - Single Source of Truth for Session Startup closed by Tony after acceptance of the previously supplied evidence

### Validated or Operational Baseline

- RM-001 - Persistent Scene Development Record (SDR)
- RM-002 - SDR Recovery Header
- RM-003 - Deterministic SDR save triggers
- RM-004 - Silent SDR updates and manual save commands
- RM-005 - SDR Runtime Compliance reporting
- RM-006 - Destructive SDR Recovery Test
- RM-007 - Runtime Checkpointing and Version History
- RM-008 - Runtime Recovery and Session Resume
- RM-010 - AI Runtime Startup Manager
- RM-011 - Operational Mode Menu Definitions
- RM-012 - Runtime Artifact Synchronization
- RM-016 - Platform-Neutral Scene Development Record Lifecycle
- RM-017 - AI Capability Schema minimum slice
- RM-024 - Story Architecture
- RM-025 - Governed Character Identity Contract
- RM-026 - Relocate EENOS Development Workspace to H Drive
- RM-027 - Optional Multidimensional Scene Development Prompts

### Implemented Work Requiring Acceptance Reconciliation

- None

### Approved Work Awaiting Delivery Planning

- None

### Next Release

- RM-022 - Ollama Local Model Provider Integration
- RM-015 - Provider-Neutral Writer Profile

### Future Consideration

- RM-009 - Workshop productivity or progress metrics
- RM-013 - EENOS Governance Framework
- RM-018 - Story Rhythm and Pacing Intelligence
- RM-019 - Genre Intelligence Framework
- RM-020 - Structured Revision Framework
- RM-021 - Layered Drafting Pipeline
- RM-023 - Recovery Fidelity Evaluation and Audit
- RM-028 - EENOS Unified Author Workspace
- RM-029 - Visual Story Architecture Workspace
- RM-030 - Scene Development Workspace
- RM-031 - Session History, Checkpoint, and Recovery Interface

## Roadmap vs Review Queue

| Artifact | Purpose |
|---|---|
| Roadmap | Master list of discoveries, improvements, ideas, and future work. |
| Review Queue | Formal proposal review for specific changes. |

Roadmap items may link to Review Queue proposals when a roadmap item becomes formal enough for proposal review.

## Item Types

| Type | Meaning |
|---|---|
| Critical | Risk of data loss, workflow failure, or serious governance/runtime breakage. |
| Major | New capability or significant architectural improvement. |
| Minor | Workflow refinement or quality-of-life improvement. |
| Enhancement | Nice-to-have feature. |
| Technical Debt | Cleanup, consistency work, documentation repair, or refactoring. |

## Lifecycle

```text
Discovered -> Roadmap -> Proposal -> Approved -> Implemented -> Testing -> Validated -> Closed
```

Lifecycle meanings:

| Status | Meaning |
|---|---|
| Discovered | Discovery captured; not yet evaluated. |
| Roadmap | Accepted onto the roadmap as an item worth tracking. |
| Proposal | Formal proposal exists or is being prepared. |
| Approved | Tony approved the change for implementation. |
| Implemented | Change has been made but not yet tested. |
| Testing | Change is being tested in real use. |
| Validated | Change has been tested or confirmed in use. |
| Closed | Item is complete or intentionally retired. |

## Discovery Capture Rule

When Tony identifies a possible EENOS discovery, improvement, or future change during active work, EENOS shall ask:

```text
Add this to the EENOS Roadmap?
```

If Tony answers yes, create a new roadmap item with status `Discovered`.

This applies to statements such as:

- "This isn't working."
- "We lost work."
- "This is awkward."
- "We should remember this."
- "This needs to be easier."
- "This should be automatic."

Do not interrupt creative flow for minor remarks unless the statement clearly identifies a process discovery, failure mode, or improvement candidate.

## Roadmap

| ID | Title | Priority | Type | Area | Description | Status | Discovered | Discovered During | Requested By | Target Release | Proposal / Reference | Notes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| RM-001 | Persistent Scene Development Record | Critical | Critical | Story Development | Persistent Scene Development Record (SDR) so scene work survives AI context loss. | Closed | 2026-07-12 | Chapter 1 Scene 1 recovery discussion | Tony | v1.1 | `STD_Scene_Development_Record_v1.0.md`; `STD_Scene_Development_Record_v1.1.md`; `98_Workflow/Reports/REPORT_EENOS_Implementation_Status_Reconciliation_2026-07-25.md`; `98_Workflow/Reports/REPORT_RM-024_Operational_Acceptance_2026-08-04.md`; `300-delivery/validation/REPORT-RM-001-RM-005-Consolidated-SDR-Operational-Revalidation.md`; adjacent `.sha256` | Validated by accepted consolidated operational revalidation: RM-001 PASS; AC-001–AC-003 PASS; fresh isolated recovery achieved 100% agreement across all governed comparison fields. `VAL-EX-002` is resolved. Report SHA-256: `088274B459485462DD00A3BBD9BA372FFA43548E72E9565CD0E897628FF5366C`. Tony approved lifecycle closure on 2026-08-13; validation evidence and limitations remain preserved. |
| RM-002 | SDR Recovery Header | Critical | Critical | Runtime | Recovery header for SDRs so fresh AI sessions can resume without user re-explanation. | Closed | 2026-07-12 | SDR recovery hardening | Tony | v1.1 | `STD_Scene_Development_Record_v1.0.md`; `300-delivery/validation/REPORT-RM-001-RM-005-Consolidated-SDR-Operational-Revalidation.md`; adjacent `.sha256` | Validated by isolated source-controlled recovery: RM-002 PASS; AC-003 and AC-004 PASS; correct SDR and recovery source selected without inherited conversation or narrative re-explanation. `VAL-EX-002` is resolved. Tony approved lifecycle closure on 2026-08-13; validation evidence and limitations remain preserved. |
| RM-003 | Deterministic SDR Save Triggers | High | Minor | Runtime | Deterministic SDR save triggers instead of subjective breakthrough detection. | Closed | 2026-07-12 | SDR save-rule refinement | Tony | v1.1 | `STD_AI_Claude_Runtime_v1.0.md`; `300-delivery/validation/REPORT-RM-001-RM-005-Consolidated-SDR-Operational-Revalidation.md`; adjacent `.sha256` | Validated by two immediate replacement operations plus still-valid historical evidence: RM-003 PASS; AC-005 and AC-006 PASS; reconciliation `8/8`. `VAL-EX-001` is resolved. Tony approved lifecycle closure on 2026-08-13; validation evidence and limitations remain preserved. |
| RM-004 | Silent SDR Updates and Manual Commands | High | Minor | Runtime | Silent automatic SDR updates plus manual `Checkpoint SDR` and `Save SDR Now` commands. | Closed | 2026-07-13 | SDR operation refinement | Tony | v1.1 | `STD_AI_Claude_Runtime_v1.0.md`; `300-delivery/validation/REPORT-RM-001-RM-005-Consolidated-SDR-Operational-Revalidation.md`; adjacent `.sha256` | Repair completed and accepted by Tony. Focused AC-007 revalidation PASS with zero automatic-save narration or interruption; carried-forward AC-008 and AC-009 remain PASS. RM-004 PASS. `DEF-SDR-VAL-001` is resolved. Manual-command visibility remains governed. Tony approved lifecycle closure on 2026-08-13; validation evidence and limitations remain preserved. |
| RM-005 | SDR Runtime Compliance Reporting | High | Minor | Reporting | SDR Runtime Compliance reporting in Session Review. | Closed | 2026-07-13 | SDR audit refinement | Tony | v1.1 | `STD_AI_Claude_Runtime_v1.0.md`; `300-delivery/validation/REPORT-RM-001-RM-005-Consolidated-SDR-Operational-Revalidation.md`; adjacent `.sha256` | RM-005 PASS. Carried-forward AC-010 and AC-011 evidence remains valid: successful automatic operations reconcile `8/8`, manual operations remain excluded, and controlled failure reporting preserves the recovery target without false success. Tony approved lifecycle closure on 2026-08-13; validation evidence and limitations remain preserved. |
| RM-006 | Destructive SDR Recovery Test | Medium | Major | Story Development | Destructive test of SDR recovery across fresh sessions. | Closed | 2026-07-13 | SDR validation planning | Tony | v1.1 | `98_Workflow/Reports/REPORT_RM-006_Destructive_SDR_Recovery_Validation_2026-07-21.md` | Recovery result PASS. Fresh-session recovery reconstructed the authoritative SDR state. Validation exposed a prior RM-016 reconciliation compliance defect and a future stale-authority detection need; neither was a failure of the governed recovery mechanism. Tony approved lifecycle closure on 2026-08-13; validation evidence and limitations remain preserved. |
| RM-007 | Runtime Checkpointing and Version History | High | Major | Runtime / Persistence | Define a provider-neutral and storage-neutral runtime checkpointing architecture that captures deterministic recoverable session state for EENOS AI sessions. SDRs become one checkpoint participant rather than the whole feature. | Operational Phase 1 | 2026-07-12 | SDR failure-mode analysis; RM-010 recovery-interface refinement | Tony | Future | `98_Workflow/AI_Runtime/SPEC_RM-007_Runtime_Checkpointing_and_Version_History_v0.1.md`; `98_Workflow/Reports/REPORT_RM-007_Proposal_Baseline_Review_2026-07-18.md` | Minimum viable checkpoint slice operational. Checkpoint creation and read-back validation are active through `Start-EENOS.ps1` after successful Story Development sessions. RM-007 establishes the persistence authority that RM-008 will consume. It should answer: if an AI session stops unexpectedly, what deterministic state can be reconstructed? Checkpoints preserve session identity, mission, mode, runtime version, working set, canon context references, active SDR, active workshop, current task, runtime state, version references, and integrity information. Git is an implementation option, not the architecture. Logical checkpoints may not claim a higher completeness level than validated physical artifacts support. Runtime behavior remains unchanged until separately approved implementation. |
| RM-008 | Runtime Recovery and Session Resume | High | Major | Runtime / Recovery | Define a provider-neutral recovery architecture that reconstructs valid runtime state from a valid logical checkpoint and resumes the appropriate operational runtime. Workshop resumption becomes one recovery mode rather than the whole feature. | Operational Phase 1 | 2026-07-13 | Roadmap planning; RM-010 recovery interface; RM-007 checkpoint contract | Tony | Future | `98_Workflow/AI_Runtime/SPEC_RM-008_Runtime_Recovery_and_Session_Resume_v0.1.md`; `98_Workflow/Reports/REPORT_RM-008_Proposal_Baseline_Review_2026-07-18.md` | Minimum viable recovery slice operational. Explicit checkpoint resume is active through `Start-EENOS.ps1 -ResumeCheckpoint` with deterministic validation and blocking. RM-008 defines how runtime state is reconstructed. It consumes RM-007 logical checkpoints and hands recovered state back through the RM-010-compatible runtime entry contract. Recovery is mode-agnostic; mode-specific behavior belongs to the runtime that receives control after recovery. Failed control transfer must not leave an ambiguous active runtime. Runtime behavior remains unchanged until separately approved implementation. |
| RM-009 | Workshop Metrics | Low | Enhancement | Reporting | Workshop productivity or progress metrics. | Discovered | 2026-07-13 | Roadmap planning | Tony | Future | - | Nice-to-have; defer. |
| RM-010 | AI Runtime Startup Manager | High | Major | Runtime | Create a provider-neutral, implementation-neutral deterministic EENOS boot authority for AI sessions. The Startup Manager resolves mission, provider capabilities, operational mode, dependencies, context, recovery state, validation outcome, working set, and session header before releasing control to the selected operational runtime. | Operational Phase 1 | 2026-07-13 | Start EENOS activation failure analysis; RM-010 architecture refinement | Tony | v1.2 | `98_Workflow/AI_Runtime/SPEC_RM-010_AI_Runtime_Startup_Manager_v0.1.md`; `98_Workflow/Reports/REPORT_RM-010_Proposal_Baseline_Review_2026-07-18.md`; `98_Workflow/AI_Runtime/PLAN_RM-010_Implementation_v0.1.md`; `98_Workflow/AI_Runtime/PLAN_RM-010_Phase_1_Controlled_Activation_Test_v0.1.md`; `98_Workflow/Reports/REPORT_RM-010_Phase_1_Controlled_Activation_Test_2026-07-18.md`; `98_Workflow/Reports/REPORT_RM-010_Phase_1_Engineering_Review_2026-07-18.md` | Proposal baseline approved. Phase 1 implementation complete; verification passed; controlled activation conformance verdict is `CONFORMANT WITH LIMITATIONS`; engineering review accepted the Phase 1 baseline with no specification or implementation defects. Activation: active through `Start-EENOS.ps1`; rollback available through legacy manual startup. Limitations disclosed. Next action: RM-007 checkpointing vertical slice. RM-010 owns boot; the selected operational mode owns runtime. Components: Mission Parser, Capability Detector, Mode Dispatcher, Context Loader, Recovery Manager, Runtime Validator, and Session Initializer. Dependencies: RM-011 mode definitions, RM-014 startup authority, RM-015 provider-neutral writer profile or equivalent capability schema, and RM-016 platform-neutral SDR lifecycle. RM-008 is downstream: RM-010 defines the recovery interface; RM-008 implements automatic workshop resumption through that interface. Acceptance must answer mission, mode, available and required capabilities, required documents/context, recovery state, dependency satisfaction, pass/warning/block status, authoritative working set, and runtime control transfer. Future enhancement: emit a machine-readable Boot Manifest alongside the human-readable Session Header to support deterministic validation, automation, testing, and software implementations. Runtime behavior remains unchanged until separately approved implementation. |
| RM-011 | Operational Mode Menu Definitions | Critical | Major | Runtime | CR-002 lists modes whose purpose, inputs, outputs, and rules are undefined placeholders. Every displayed mode must have a valid name, purpose, expected user input, delivered output, and governing rules. | Closed | 2026-07-13 | First successful `Start EENOS` activation | Tony | v1.1 hotfix | `98_Workflow/AI_Runtime/STD_AI_Claude_Runtime_v1.1.md`; `98_Workflow/Reports/REPORT_RM-011_Operational_Mode_Definitions_Validation_2026-07-21.md` | Validated 2026-07-21: all 11 modes present and complete; valid selections initialize; CR-002 defines controlled `MODE_UNSUPPORTED` correction; required mode instruction present; development and vault runtime copies synchronized; unchanged contract passed 9/9. Tony approved lifecycle closure on 2026-08-13; validation evidence and limitations remain preserved. |
| RM-012 | Runtime Artifact Synchronization | High | Technical Debt | Runtime | Prevent stale duplicate runtime artifacts across development workspace, generated HTML, and Obsidian vault copies. | Validated | 2026-07-13 | Stale vault runtime caused obsolete Start EENOS menu after workspace runtime was fixed | Tony | v1.1 | `98_Workflow/AI_Runtime/PROC_Runtime_Artifact_Sync_v1.1.md`; `98_Workflow/Reports/REPORT_RM-012_Runtime_Artifact_Synchronization_Revalidation_2026-07-25.md` | Version-aware active-set resolution, SHA-256 distribution verification, generated-artifact provenance, durable failure evidence, recovery targets, exception handling, and release dispositions implemented. Released Claude Runtime v1.2 source-to-vault relationship evaluated PASS. |
| RM-013 | EENOS Governance Framework | Medium | Major | Governance | Define the governance hierarchy among Constitution, governance documents, ADRs, processes, standards, runtime specifications, and implementation artifacts so future modules know where decisions belong. | Discovered | 2026-07-15 | Architecture-to-implementation pipeline review | Tony | Future | `PROC_EENOS_Architecture_to_Implementation_Pipeline_v0.1.md` | Candidate future artifact: `GOV_System_Evolution` or `GOV_Architecture_Governance`. Should be addressed after current Writing Craft Intelligence architecture work is stable. |
| RM-014 | Single Source of Truth for Session Startup | High | Technical Debt | Governance / Runtime | Determine and formalize the authoritative source for session startup by platform so each runtime has one governing startup sequence, launch console, mode selection rule, and initialization authority. | Closed | 2026-07-15 | Claude startup conflict investigation; DEBT-016 report | Tony | v1.1 hotfix or v1.2 | `PROC_AI_Session.md` v0.3; `STD_AI_Claude_Runtime_v1.0.md`; see AR-007; Tony closure direction recorded 2026-08-05 | Linked debt DEBT-016 is closed. The accepted parent/child resolution preserves `PROC_AI_Session.md` as the platform-general protocol and `STD_AI_Claude_Runtime_v1.0.md` as the Claude Cowork specialization governing Claude activation, mandatory mode selection, and its operating-mode menu. Runtime Markdown and generated HTML were synchronized to the Obsidian vault runtime folder. Tony confirmed that the previously supplied evidence is sufficient and directed closure without repeat validation on 2026-08-05. |
| RM-015 | Provider-Neutral Writer Profile | High | Major | AI Runtime / Writer Profile | Create a governed, provider-neutral EENOS Writer Profile so ChatGPT, Claude, Ollama, and future reasoning engines receive the same approved foundational understanding of Tony as a writer without relying on provider-owned conversation memory. | Proposal | 2026-07-17 | ChatGPT Desktop + Remote Writers Room pilot and provider-neutral context discussion | Tony | Future; evaluate with EE-004 | `DEC_EENOS_Writers_Room_Gateway_Architecture_2026-07-17.md`; `SPEC_EE-004_Writers_Room_Gateway_First_Vertical_Slice_v0.1.md` | Proposed layers: Core Author Profile, Evolution Earth Project Profile, Mission-Specific Guidance, and Experimental Observations Pending Approval. The profile is not story canon; Tony remains approval authority; AI systems may propose additions but may not approve them; conversation history must not be silently converted into profile data; sensitive personal information is excluded unless explicitly approved; provider-specific prompts remain separate. Dependencies to evaluate: EE-004 Writers Room Gateway, context-pack specification, AI adapter contract, document-state and approval governance, platform runtime standards, and Ollama adapter planning. Acceptance should verify an approved Core Author Profile, separate project preferences, mission-specific retrieval, substantively equivalent provider context, reported profile version/sections, canon separation, approval-gated profile changes, cross-provider plotting test, and reduced dependence on provider-owned memory. Principle: the chosen AI should change the reasoning engine, not reset the working relationship with the author. |
| RM-016 | Platform-Neutral Scene Development Record Lifecycle | High | Major | Governance / Runtime / Story Development | Define whether SDR lifecycle behavior is universally required across EENOS creative platforms and, if so, move the authoritative lifecycle out of Claude-specific runtime into a platform-neutral standard or procedure. | Validated | 2026-07-17 | ChatGPT Desktop + Remote Writers Room pilot showed successful vault access, startup, mobile continuation, Gabriel scene development, experimental workshop-record save, and no applicable ChatGPT SDR obligation. | Tony | v1.1 governance ratification | `98_Workflow/Review_Queue/PROP_RM-016_Platform_Neutral_SDR_Lifecycle_v0.3.md`; `98_Workflow/Reports/REPORT_RM-016_Ratification_Validation_2026-07-17.md`; `98_Workflow/Reports/MANIFEST_RM-016_SDR_Migration_2026-07-17.json`; `98_Workflow/Reports/MANIFEST_RM-016_SDR_Migration_2026-07-17.csv`; `STD_AI_Claude_Runtime_v1.0.md`; `PROC_AI_Session.md`; `PROC_Story_Intelligence_Runtime.md`; `SPEC_EE-004_Writers_Room_Gateway_First_Vertical_Slice_v0.1.md` | Observed gap plus proposed remediation: SDR persistence obligations currently change by provider because mandatory SDR behavior is defined in Claude-specific runtime and was not imposed by the platform-general ChatGPT path. This was not a ChatGPT runtime violation. Candidate authorities to evaluate include a platform-neutral SDR standard, `PROC_Story_Intelligence_Runtime`, `PROC_AI_Session`, or another approved cross-platform persistence standard. Governance decisions needed: which sessions require SDRs, when SDRs are created or updated, deterministic update triggers, experimental SDR rules, applicable information states, behavior when no scene-specific SDR exists, closeout compliance fields, missed-update reporting, draft-only writeback interaction, and authority when workshop records overlap SDRs. Dependencies to evaluate: RM-014, EE-004 Writers Room Gateway, existing SDR standards and runtime documents, ChatGPT runtime or compatibility-layer decision, Claude runtime alignment, and provider-neutral writeback governance. Acceptance should verify one approved platform-neutral SDR authority, equivalent Claude/ChatGPT/Ollama triggers, provider refinements without contradiction, consistent Session Review reporting, consistent missed-update reporting, no silent canon promotion from experimental sessions, and a cross-provider test with equivalent SDR obligations. Principle: persistence obligations should be determined by EENOS mission and artifact type, not by provider host. |
| RM-017 | AI Capability Schema | High | Major | AI Runtime / Capability Schema | Define a provider-neutral capability schema that standardizes how AI platforms advertise operational capabilities. The schema becomes the authoritative contract consumed by runtime authorities, allowing behavior to be driven by declared and validated capabilities rather than provider identity alone. | Operational Minimum Slice | 2026-07-18 | RM-010 architecture refinement; Boot/runtime capability discussion; RM-007 and RM-008 controlled authority baselines | Tony | Future | `98_Workflow/AI_Runtime/SPEC_RM-017_AI_Capability_Schema_v0.1.md`; future deliverable `STD_AI_Capability_Schema_v1.0.md` | Operational minimum slice implemented through `tools/runtime_capabilities.py`; RM-017 remains a contract authority, not a provider directory. Initial consumers: RM-010 Startup Manager, RM-007 Runtime Checkpointing, and RM-008 Runtime Recovery. Initial dependencies: RM-010, RM-007, RM-008, and RM-015 Provider-Neutral Writer Profile or whichever approved authority defines provider identity. Capabilities must be behavioral, implementation-neutral, and testable; provider identity is metadata and must not imply capability availability. |
| RM-018 | Story Rhythm and Pacing Intelligence | High | Major | Story Intelligence and Author Workflow | Provide evidence-backed, multi-scale analysis of narrative energy, conflict, information, emotion, and scene function without reducing pacing to a prescriptive score. | Proposal | 2026-07-21 | Story Intelligence and author-workflow roadmap planning | Tony | Future | RM-017; existing Story Intelligence runtime, scene analysis, canon, outline, and context-loading capabilities | Advisory and author-controlled. Supports intended pacing targets and distinguishes observation, likely effect, and recommendation. Does not depend on RM-020 or RM-021. |
| RM-019 | Genre Intelligence Framework | High | Major | Story Intelligence and Author Workflow | Provide configurable, inspectable genre and subgenre reference models for reader promises, structural tendencies, beat families, pacing patterns, hybrids, and deliberate subversions. | Proposal | 2026-07-21 | Story Intelligence and author-workflow roadmap planning | Tony | Future | RM-018; RM-017; existing story-structure, scene-analysis, canon, and metadata capabilities | Genre models are analytical references, not mandatory outlines; author-selected targets and deliberate deviations remain authoritative. |
| RM-020 | Structured Revision Framework | High | Major | Story Intelligence and Author Workflow | Define governed, focused revision operations with explicit objectives, scope, protected elements, validation, change records, approval boundaries, and recovery. | Proposal | 2026-07-21 | Story Intelligence and author-workflow roadmap planning | Tony | Future | RM-016; RM-007; RM-008; RM-010; RM-017; existing canon-authority and approval rules | Reuses existing SDR, checkpointing, recovery, capability, and canon mechanisms; analysis remains separate from modification. |
| RM-021 | Layered Drafting Pipeline | Medium-High | Major | Story Intelligence and Author Workflow | Organize story development and drafting into configurable, checkpointed layers with explicit transitions, protected decisions, unresolved-question handling, and author approval. | Proposal | 2026-07-21 | Story Intelligence and author-workflow roadmap planning | Tony | Future | RM-020; RM-016; RM-007; RM-008; RM-010; RM-017; Writers Room structure-only governance; canon promotion and approval rules | Optional and provider-neutral; direct drafting and skipped layers remain available, and structure-only modes do not produce prose without authorization. |
| RM-022 | Ollama Local Model Provider Integration | Medium | Major | AI Runtime / Provider Integration | Allow EENOS to detect, validate, select, and use locally hosted Ollama models through the provider-neutral runtime. | Discovered | 2026-07-20 | Product roadmap review and local-model provider planning | Tony | Post-v0.1.0; after SDR release gate | RM-017; RM-010; related: RM-015, RM-012, RM-008 | Renumbered from RM-018 on 2026-07-21 to resolve an ID collision with the Story Intelligence initiative. Minimum viable scope: configurable endpoint; health and availability detection; installed-model discovery; model selection; RM-017 capability reporting; RM-010 startup validation; explicit unavailable, degraded, and blocking outcomes; provider and model identity in the Session Header; timeout and connection-failure handling; no silent provider fallback; mocked tests without Ollama; and controlled tests against a real local installation. Completion requires deterministic reachability and model enumeration, an RM-017-compliant capability record, governed RM-010 start/block behavior, session records containing provider/model/endpoint class/check time, governed connection-loss handling, and passing automated and controlled tests. Later scope: model-specific capability profiles, context-window management, embeddings, streaming, performance and quality comparisons, automated provider selection, local-model recovery, and RM-015 writer-profile injection. |
| RM-023 | Recovery Fidelity Evaluation and Audit | Medium | Major | Runtime / Recovery | Define a provider-neutral framework that evaluates reconstruction quality and records recovery audit findings after externally verified session freshness, without changing the RM-006 binary destructive-recovery gate. | Discovered | 2026-07-21 | RM-006 Codex cold-reconstruction comparison and recovery-quality review | Tony | Future | RM-006; RM-007; RM-008; RM-010; RM-016; RM-017 | Separates Recovery Gate pass/fail, quantitative Recovery Fidelity, and independent Recovery Audit. Audit findings do not contribute to the fidelity score. No formal specification or implementation artifacts yet. |
| RM-024 | Story Architecture | High | Major | Story Architecture | Provide governed Story Architecture authoring, exact-reference persistence, guided Runtime operation, recovery, approval separation, Writers Room handoff, and explicit Canon operations. | Validated | 2026-07-22 | Approved RM-024 specification and implementation planning baseline | Tony | Current Story Architecture baseline | `98_Workflow/AI_Runtime/PLAN_RM-024_Implementation_Roadmap_v0.1.md`; `98_Workflow/Reports/REPORT_EENOS_Implementation_Status_Reconciliation_2026-07-25.md`; `98_Workflow/Reports/REPORT_RM-024_Operational_Acceptance_2026-08-04.md`; Tony acceptance recorded 2026-08-05 | Recovery-defect repair and controlled recovery are accepted. Exit code 0, all 16 exact references resolved, the source checkpoint was preserved, and a structurally located scene recovered. Reported validation: Python compilation passed, 12 focused tests passed, 75 complete `tools/tests` passed, and scoped `git diff --check` passed. Tony accepted the evidence on 2026-08-05. RM-024 is Validated; `COMPLETE_WITH_WARNINGS` and the recorded Exploring state are preserved, so Closed is not inferred. |
| RM-025 | Governed Character Identity Contract | High | Major | Story Architecture / Character Identity | Govern character identity so Story Architecture records can reference the same character deterministically across names, aliases, versions, and story scopes. | Validated | 2026-07-24 | Character Arc authoring exposed the missing persisted identity authority | Tony | Current Story Architecture baseline | `tools/story_architecture/character_arc.py`; `tools/story_architecture/authoring.py`; Character Identity tests; `REPORT-RM-025-Governed-Character-Identity-Acceptance-Validation.md`; evidence manifest SHA-256 `85011088e3069f45363f662b99189a6758ac0bc2c374720496e232bfa911657b` | Acceptance validation PASS: AC-001–AC-015 PASS; 21/21 tests passed with no failures or skips; deterministic creation, alias and rename continuity, exact scope handling, ambiguity rejection, retirement, atomic merge/split lineage, failed-operation preservation, downstream Character Arc integrity, authority separation, persistence/reload, regression safety, and repository isolation were demonstrated. Report SHA-256: `c782ce4e3eb0525b69e7854c2e9f89c05723700b909915a635ef3fe189917208`. The implementation remains untracked relative to examined HEAD and is identified by the frozen manifest and hashes. Checkpoint-specific identity-state serialization was evidence-proved not applicable; ordinary persistence/reload passed. Closed is not inferred. |
| RM-026 | Relocate EENOS Development Workspace to H Drive | Critical | Technical Debt | Development Infrastructure | Move EENOS development work, source files, tests, local development repositories, generated development artifacts, and development configuration off the operating-system C drive and establish `H:\Development\EENOS` as the authoritative development root. | Closed | 2026-07-25 | Current-state reconciliation and owner storage policy | Tony | Current baseline | `98_Workflow/Reports/REPORT_RM-026_Workspace_Relocation_Validation_2026-07-25.md` | The active workspace, dirty Git state, and untracked records were copied to H and hash-verified. The active Codex workspace is now `H:\Development\EENOS`, completing the recorded interface cutover. Tests: 310 passed from H. RM-012, startup, checkpoint, and recovery validation passed from H. Tony approved closure on 2026-08-13. The retained C workspace and any deletion decision remain outside RM-026 scope; closure neither authorizes nor requires deletion. |
| RM-027 | Optional Multidimensional Scene Development Prompts | Unprioritized | Minor | Story Development / Scene Development Record | Add seven optional free-form prompts to the Scene Development Record so writers can consider a scene's story function, plot progression, character progression, reader emotional journey, living-world detail, thematic reinforcement, and concrete scene outcome without turning those dimensions into a mandatory checklist. | Validated | 2026-08-04 | Delivery Manager handoff requesting optional Scene Development Record fields | Tony | Future | Software PR #2; software merge `13973c6a724796ec7b77c27f0ce73e22a16571b7`; `98_Workflow/Reports/REPORT_RM-027_Implementation_2026-08-04.md`; corrected Implementation Handoff Package v1.0.1, SHA-256 `997CA16D33E40C4969B0828E15374AB6148DB0B69E958E29F926813F0066469C`; Product Delivery PR #24; merge `52154ba5591f24305925f04b8a6069c01f851a00`; `98_Workflow/AI_Runtime/MANIFEST_RM-012_RM-027_AC-012.json`; `98_Workflow/Reports/EVIDENCE_RM-012_RM-027_AC-012_2026-08-13.json`; RM-001; RM-012; RM-016 | Validated 2026-08-13. Tony-authorized AC-012 reconciliation passed: the active SDR v1.2 development and vault copies are byte-identical at SHA-256 `1A7456EBD3AC421DED7BA63E9F4E90742A0B08CD49D3FEA6DE5CD2DC1C4D2D00`; all four governed Claude v1.3 and stable-alias copies are byte-identical at SHA-256 `686495BEE8575CC9B68FA8FD4D18D31E997F949F950E78E1C6D92740339DEB30`; and the RM-012 complete-active-set evaluation returned `PASS` with `RELEASE_ELIGIBLE`, no affected artifacts, and no recovery required. The seven prompts remain optional and non-gating, and released Claude v1.3 behavior is preserved. The missing `pytest` dependency did not prevent the production evaluator and direct artifact/hash validations from passing. Closed is not inferred. |
| RM-028 | EENOS Unified Author Workspace | Medium | Major | User Experience / Author Workspace | Provide one coherent user-facing workspace for project selection, session start or resume, operational-mode selection, current-context visibility, status communication, and navigation to EENOS capabilities. | Discovered | 2026-08-11 | Tony identified missing user-interface roadmap coverage during roadmap review | Tony | Future | RM-010; RM-011; RM-014; RM-017; related RM-029–RM-031 | Capture only; no delivery approval or technical platform is implied. This item owns the shared interaction shell and should include consistent status language, accessibility, responsive behavior, and common design patterns. It must preserve the authority and behavior of the underlying runtime capabilities rather than redefine them. |
| RM-029 | Visual Story Architecture Workspace | Medium | Major | User Experience / Story Architecture | Provide a visual workspace for navigating and authoring relationships among story, book, act, chapter, narrative thread, character, and scene structures. | Discovered | 2026-08-11 | Tony identified missing user-interface roadmap coverage during roadmap review | Tony | Future | RM-024; RM-025; RM-028 | Capture only; no delivery approval or visualization technology is implied. The workspace should expose governed Story Architecture relationships and approval states without weakening exact-reference persistence, canon boundaries, recovery behavior, or author control. |
| RM-030 | Scene Development Workspace | Medium | Major | User Experience / Scene Development | Provide a user-facing scene-development workspace for governed SDR content, optional prompts, save and recovery state, compliance visibility, and scene-specific workflow without requiring direct Markdown editing. | Discovered | 2026-08-11 | Tony identified missing user-interface roadmap coverage during roadmap review | Tony | Future | RM-001–RM-005; RM-016; RM-027; RM-028; related RM-029 | Capture only; no delivery approval or form technology is implied. Optional RM-027 prompts must remain optional, multiline, and non-gating. The interface must preserve deterministic save, recovery, validation, and information-state rules. |
| RM-031 | Session History, Checkpoint, and Recovery Interface | Medium | Major | User Experience / Runtime Recovery | Provide a user-facing interface for browsing sessions and checkpoints, understanding recovery readiness and warnings, selecting a valid recovery source, and resuming work safely. | Discovered | 2026-08-11 | Tony identified missing user-interface roadmap coverage during roadmap review | Tony | Future | RM-007; RM-008; RM-010; RM-023; RM-028 | Capture only; no delivery approval or storage design is implied. The interface must expose validation and blocking outcomes, preserve source checkpoints, avoid ambiguous active-runtime state, and distinguish binary recovery success from future fidelity or audit findings. |

## Current Recommendation

### RM-015 — Provider-Neutral Writer Profile

- **Priority:** High; Proposal status.
- **Current status:** Proposed; ready for Tony to approve refinement or defer.
- **Objective:** Establish a governed provider-neutral writer profile so changing AI providers does not reset the working relationship with the author.
- **Why this comes next:** RM-027 validation is complete, while RM-015 has clear cross-provider product value and an existing proposal baseline.
- **Scope boundary:** Keep author profile, project profile, mission-specific guidance, story canon, and provider-specific prompts distinct; all profile changes remain approval-gated.
- **Material alternative:** RM-022 remains available when Tony identifies a concrete Ollama use case that justifies provider-integration planning.
## RM-001–RM-005 Validation Closeout Disposition

- **Disposition:** RM-001, RM-002, RM-003, RM-004, and RM-005 are `Validated` based on the accepted consolidated revalidation PASS evidence. No release, operational, or `Closed` status is inferred.
- **Accepted evidence:** `300-delivery/validation/REPORT-RM-001-RM-005-Consolidated-SDR-Operational-Revalidation.md` and adjacent detached checksum.
- **Verified report SHA-256:** `088274B459485462DD00A3BBD9BA372FFA43548E72E9565CD0E897628FF5366C`.
- **Acceptance coverage:** RM-001–RM-005 PASS and AC-001–AC-014 PASS.
- **RM-004 repair:** Completed; focused AC-007 PASS evidence accepted by Tony; the repaired behavior preserves silent successful automatic writes, visible governed manual commands, and visible failed/blocked writes.
- **Finding dispositions:** `DEF-SDR-VAL-001`, `VAL-EX-001`, and `VAL-EX-002` are resolved by the accepted replacement evidence. Their identifiers and historical failure context remain preserved.
- **Historical evidence:** `300-delivery/validation/REPORT-RM-001-RM-005-Consolidated-SDR-Operational-Validation.md` remains unchanged with verified SHA-256 `9578F3BD67BFF8F139A39427D48D17DA50652F68CFC7EA145D65EB8669D1AD26`. The accepted revalidation report supersedes its failed disposition; it does not replace or alter the historical report.
- **Remaining boundary:** `ENH-SDR-001` remains out of scope and unimplemented. Reported provider host-cache, provider-session-identifier, desktop-runtime-version, Prologue-heading, and canon-source limitations do not invalidate the accepted PASS disposition and do not support a stronger lifecycle claim.

## RM-027 Planning Handoff Package

### Authorization

- **Roadmap item:** RM-027 — Optional Multidimensional Scene Development Prompts
- **Approval authority:** Tony
- **Approval source:** Tony's recorded approval in the Roadmap Manager session on 2026-08-04
- **Planning state:** Approved for Delivery Lead handoff
- **Priority state:** Unprioritized; this approval does not displace the current RM-001 through RM-005 critical release gate

### Planning Objective

Extend the Scene Development Record with seven optional prompts that help writers consider how a scene contributes across multiple dimensions of the novel while preserving writer flexibility and avoiding a mandatory checklist.

### Expected Product Outcome

Writers can record whichever multidimensional scene-development considerations are useful, leave any or all of them blank, or skip the section entirely without affecting record creation, completion, approval, or export.

### Required Prompts

1. **Story Function — Optional:** Why does this scene exist in the larger design of the novel? Consider setup, escalation, revelation, contrast, transition, payoff, or another narrative purpose.
2. **Plot Progression — Optional:** What changes in the external situation, conflict, available information, goals, obstacles, or stakes?
3. **Character Progression — Optional:** What choice, realization, emotional movement, relationship shift, or change in self-understanding occurs?
4. **Reader Emotional Journey — Optional:** What should the reader feel when entering the scene, during its development, and when leaving it?
5. **Living World Detail — Optional:** What sensory, cultural, social, historical, environmental, occupational, or material detail makes the world feel inhabited?
6. **Thematic Reinforcement — Optional:** What thematic question, tension, image, value, or contradiction does the scene embody, complicate, echo, or challenge?
7. **Scene Outcome — Optional:** What is concretely different when the scene ends? Consider changed circumstances, knowledge, commitments, relationships, power, risk, or direction.

### Scope Boundaries

**In scope:**

- A dedicated optional Scene Development Record section containing all seven prompts.
- Free-form, multiline text for every prompt.
- Blank values for every prompt.
- A skippable section and, where the interface supports it, a collapsible section.
- Language communicating that a scene need not contribute equally to every dimension.
- Preservation of the supplied labels and helper-text meaning.

**Out of scope:**

- Required inputs or a minimum number of completed prompts.
- Validation, scoring, completeness indicators, or workflow gates based on these prompts.
- Blocking record creation, completion, approval, or export.
- Requiring every scene to contribute to every dimension.
- Combining Story Function with Scene Outcome: Story Function is the scene's authorial or structural purpose; Scene Outcome is the concrete story change produced by the scene's end.
- Any implementation method, interface technology, storage design, or source-code prescription.

### Dependencies and Governing References

- RM-001 — Persistent Scene Development Record.
- RM-016 — Platform-Neutral Scene Development Record Lifecycle.
- `98_Workflow/AI_Runtime/STD_Scene_Development_Record_v1.0.md` and any current approved successor identified by the Delivery Lead.
- Current Scene Development Record implementation and interface evidence, to be identified by the Delivery Lead without treating planning references as implementation instructions.

### Planning Acceptance Criteria

- All seven fields are present and labeled optional.
- Helper text preserves the meaning of the approved copy.
- Every field accepts blank values and free-form multiline text.
- A Scene Development Record can be created, completed, approved, and exported without populating any of these fields.
- No validation, scoring, completeness indicator, or workflow rule treats the fields as required.
- The interface communicates that scenes do not need to contribute equally to every dimension.
- Story Function and Scene Outcome remain separate and retain their distinct meanings.

### Delivery Lead Expected Output

Prepare an internally consistent Implementation Handoff Package meeting ROLE-001 Section 6, including verified governing documents, scope, implementation evidence, dependencies, repository targets, acceptance criteria, open questions, validation expectations, and the downstream Completion Record requirements. Do not modify implementation artifacts or prescribe implementation as part of planning interpretation.

## Runtime / Recovery Future Capabilities

### RM-023 — Recovery Fidelity Evaluation and Audit

- **Classification:** Major
- **Priority:** Medium
- **Status:** Discovered
- **Problem / rationale:** RM-006 validates whether destructive SDR recovery succeeds, but it does not measure how completely, accurately, or transparently EENOS reconstructs operational state. A minimum-contract recovery may omit lower-priority information, weaken traceability, or miss ambiguities. Source defects and recovery accuracy are separate concerns.
- **Purpose:** Define a provider-neutral evaluation framework for measuring recovery fidelity and recording recovery audit findings after session freshness has been established externally.
- **Recovery Gate:** RM-006 remains the binary destructive-recovery validation gate. It determines whether the test is valid and whether recovery passes or fails after externally verified session freshness. RM-023 consumes valid RM-006-style evidence but does not replace, redefine, or modify RM-006 purpose or acceptance criteria.
- **Recovery Fidelity:** Quantitatively measures reconstruction completeness, accuracy, unsupported-invention avoidance, operational readiness, governance understanding, and traceability.
- **Recovery Audit:** Independently records governance, metadata, contradiction, authority, source-reference, propagation, duplication, recovery-header, supersession, and link-integrity findings in the evaluated artifacts.
- **Freshness prerequisite:** Fidelity evaluation is valid only when session freshness is verified outside the recovering AI; prior conversation context is unavailable; provider memory is disabled or excluded; the allowed source set is recorded; and the recovering AI receives no hidden summaries or prior recovery output. The AI may report its observable context but may not independently certify platform-level freshness.
- **Fidelity dimensions:**

| Dimension | Weight |
|---|---:|
| Scene identity and context | 10 |
| Canon accuracy | 15 |
| Development-state accuracy | 15 |
| Unsupported-invention avoidance | 20 |
| Missing or ambiguous information detection | 10 |
| Correct current task and next action | 10 |
| Governance understanding | 10 |
| Source traceability | 10 |
| **Total** | **100** |

- **Source traceability:** Recovered claims should be attributable to governed sources such as the active SDR, source workshop records, canon artifacts, runtime or governance standards, and checkpoint or recovery records. A factually correct claim may receive reduced fidelity credit when its source cannot be established.
- **Independent audit rule:** Audit findings are reported separately and do not contribute to, increase, or reduce the fidelity score. A defective source set must not create additional opportunities to earn fidelity points.
- **Expected outputs:** Recovery Gate Result (`PASS` or `FAIL`); Recovery Fidelity (`<number>/100`); and Recovery Audit findings by severity, affected artifact, supporting evidence, and recommended remediation.
- **Dependencies:** RM-006 Destructive SDR Recovery Test; RM-007 Runtime Checkpointing and Version History; RM-008 Runtime Recovery and Session Resume; RM-010 AI Runtime Startup Manager; RM-016 Platform-Neutral Scene Development Record Lifecycle; RM-017 AI Capability Schema.
- **Recommended next step:** RM-006 is validated. Investigate and resolve the RM-016 reconciliation compliance defect before moving RM-023 toward a formal proposal. Do not prepare a formal specification or implementation artifacts at discovery stage.

## Story Intelligence and Author Workflow

These proposed capabilities sit above the runtime and canon foundations. Runtime capabilities determine whether EENOS can operate reliably; canon capabilities determine whether story information is authoritative and consistent; Story Intelligence evaluates whether the story is functioning effectively; and Author Workflow reduces unnecessary work and cognitive load.

All four capabilities are advisory, evidence-backed, intent-aware, provider-neutral, and author-controlled. They must not silently modify canon, overwrite drafts, force a commercial formula, or treat analysis as authorization to create or revise story material. Governance routing and artifact classification must remain deterministic, and existing checkpoint, recovery, SDR, startup, capability, canon-promotion, and approval infrastructure must be reused.

### RM-018 — Story Rhythm and Pacing Intelligence

- **Classification:** Major Enhancement
- **Priority:** High
- **Status:** Proposal
- **Problem / rationale:** Pacing is currently assessed informally in isolated sessions, making repeated or cumulative patterns across scenes, chapters, acts, viewpoints, plotlines, and manuscripts difficult to identify.
- **Intended outcome:** Multi-scale analysis of tension, action density, emotional intensity and recovery, revelation cadence, mystery progression, prose-mode balance, scene-function repetition, escalation, transitions, stagnation, reader-fatigue risk, and pacing differences across viewpoints or plotlines.
- **Scope:** Cite supporting story evidence; distinguish observation from recommendation; identify local and cumulative issues; support author-defined pacing targets; recognize deliberate slowness, repetition, or intensity; explain likely effects; remain advisory; avoid a single reductive pacing score.
- **Non-goals:** Silent story changes, mandatory pacing targets, prescriptive scoring, or dependence on RM-020 or RM-021.
- **Dependencies:** Existing Story Intelligence runtime and scene-analysis capabilities; canon and outline context loading; RM-017 AI Capability Schema.
- **Recommended next step:** Draft a proposal covering analysis dimensions and scales, evidence and output models, author-defined targets, advisory safeguards, and validation with known scene and chapter samples.

### RM-019 — Genre Intelligence Framework

- **Classification:** Major Enhancement
- **Priority:** High
- **Status:** Proposal
- **Problem / rationale:** Genre knowledge is supplied informally rather than through explicit, reusable, inspectable models, producing inconsistent advice and a risk that common patterns will be treated as mandatory formulas.
- **Intended outcome:** Configurable comparison against primary, secondary, and hybrid genre expectations, reader promises, structural tendencies, conflict and progression patterns, beat families, information-release and pacing tendencies, relationship arcs, common failure modes, and deliberate subversions.
- **Scope:** Begin with extensible science fiction, fantasy, thriller, mystery, horror, and romance profiles; show classification evidence; compare multiple selected models; distinguish required facts, common expectations, optional conventions, author targets, deliberate deviations, missing evidence, and structural risks; explain likely reader effects.
- **Non-goals:** A closed genre list, mandatory commercial beat templates, automatic genre selection that overrides the author, or treating popularity as artistic correctness.
- **Dependencies:** RM-018; RM-017; existing story-structure and scene-analysis capabilities; canon and metadata support for genre, subgenre, audience, and author intent.
- **Recommended next step:** Draft a proposal covering genre-profile and beat-family schemas, evidence and confidence, hybrids and subversions, author controls, profile development, and safeguards against formulaic enforcement.

### RM-020 — Structured Revision Framework

- **Classification:** Major Enhancement
- **Priority:** High
- **Status:** Proposal
- **Problem / rationale:** Broad revision prompts combine many dimensions, making changes difficult to evaluate, increasing unintended story changes, and weakening traceability.
- **Intended outcome:** Modular revision operations with a declared objective, authorized scope, protected elements, source inputs, expected output, success criteria, validation, change record, approval boundary, and recovery path.
- **Scope:** Support selectable structural, pacing, continuity, canon, character, emotion, dialogue, description, setting, suspense, viewpoint, voice, exposition, line-editing, copyediting, and proofreading passes; detect conflicting objectives and accidental plot or canon changes; explain material changes; support interrupted-work recovery and author approval.
- **Non-goals:** A mandatory universal sequence, automatic promotion to canon, revision without authorization, or competing checkpoint, recovery, SDR, capability, or approval systems.
- **Dependencies:** RM-016; RM-007; RM-008; RM-010; RM-017; existing canon-authority and approval rules.
- **Recommended next step:** Draft a proposal covering the revision-operation contract and taxonomy, scope and protection controls, artifact/version relationships, material-change reporting, validation, canon and SDR interaction, recovery, approval, and promotion boundaries.

### RM-021 — Layered Drafting Pipeline

- **Classification:** Major Enhancement
- **Priority:** Medium-High
- **Status:** Proposal
- **Problem / rationale:** Single-operation drafting requires simultaneous structural, dramatic, continuity, viewpoint, voice, and prose decisions, increasing cognitive load and encouraging hidden AI decisions.
- **Intended outcome:** Configurable drafting layers with explicit permissions, transitions, completion criteria, protected decisions, unresolved questions, checkpoints, capability disclosure, artifact classification, and author approval.
- **Scope:** Allow optional layers for objectives, scene purpose and outline, beat sheets, workshops, narrative skeletons, action, dialogue, emotion, setting, description, viewpoint, voice, continuity, pacing, revision routing, and approval; configure by project, genre, scene type, or author preference; support provider-neutral dispatch and different capable models by layer.
- **Non-goals:** A fixed pipeline, mandatory layered drafting, forced provider specialization, silent rewriting of approved decisions, invention of unresolved facts, or prose generation in structure-only modes without authorization.
- **Dependencies:** RM-020; RM-016; RM-007; RM-008; RM-010; RM-017; Writers Room structure-only governance; canon promotion and approval rules.
- **Recommended next step:** Draft a proposal covering the drafting-layer contract, configuration, transitions, protected decisions, unresolved questions, prose authorization, provider-neutral dispatch, artifact classification, and checkpoint/recovery integration.

### Initiative relationships

```text
RM-018 Story Rhythm and Pacing Intelligence
    ↓
RM-019 Genre Intelligence Framework

RM-020 Structured Revision Framework
    ↓
RM-021 Layered Drafting Pipeline
```

RM-018 supplies general pacing analysis; RM-019 adds genre-aware expectations and comparison models. RM-020 defines controlled revision operations; RM-021 organizes story development and drafting into configurable layers and may route completed material into RM-020 operations. All four should share evidence, intent, capability, artifact-classification, and author-approval concepts where appropriate.

## Capture Template

Use this template for new items:

```text
| RM-### | <Title> | <Priority> | <Type> | <Area> | <Description> | Discovered | <YYYY-MM-DD> | <Discovery Context> | <Requester> | <Target Release> | - | <Notes> |
```

## Revision History

| Date | Change | Approved By |
|---|---|---|
| 2026-07-13 | Initial EENOS Product Roadmap created. | Tony |
| 2026-07-13 | Added discovery metadata, Testing status, release focus sections, and discovery terminology. | Tony |
| 2026-07-13 | Added RM-010 Startup Manager discovery. | Tony |
| 2026-07-13 | Added RM-011 Operational Mode Menu Definitions discovery. | Tony |
| 2026-07-13 | Updated RM-011 status to Implemented pending validation. | Tony |
| 2026-07-13 | Refined RM-010 Startup Manager as a dependency manager with Pass, Warning, and Blocking outcomes. | Tony |
| 2026-07-13 | Added RM-012 Runtime Artifact Synchronization and created sync procedure. | Tony |
| 2026-07-15 | Added RM-013 EENOS Governance Framework discovery. | Tony |
| 2026-07-15 | Added RM-014 Single Source of Truth for Session Startup discovery. | Tony |
| 2026-07-15 | Refined RM-014 as platform-general startup authority and document-precedence governance issue. | Tony |
| 2026-07-15 | Added applicability-before-precedence distinction and deterministic startup-sequence acceptance criterion to RM-014. | Tony |
| 2026-07-15 | Added DEBT-016 conflict details to RM-014 and reclassified it as Technical Debt. | Tony |
| 2026-07-15 | Added Evolution Earth vault path for `PROC_AI_Session.md` to DEBT-016. | Tony |
| 2026-07-15 | Implemented DEBT-016 parent/child governance fix and synchronized Claude runtime artifacts. | Tony |
| 2026-07-17 | Added RM-015 Provider-Neutral Writer Profile and RM-016 Platform-Neutral Scene Development Record Lifecycle from the ChatGPT Desktop + Remote Writers Room pilot. | Tony |
| 2026-07-17 | Updated RM-016 proposal reference to v0.2 after integrating Tony's approved architectural decisions. | Tony |
| 2026-07-17 | Updated RM-016 proposal reference to v0.3 after integrating Tony's final publication and migration decisions. | Tony |
| 2026-07-17 | Ratified and executed RM-016: published platform-neutral SDR standard v1.1, aligned Claude runtime and protocols, migrated confirmed SDR metadata, and recorded validation evidence. | Tony |
| 2026-07-18 | Promoted RM-010 to AI Runtime Startup Manager proposal, added dependencies and acceptance criteria, and created v0.1 specification reference. | Tony |
| 2026-07-18 | Added RM-017 AI Capability Schema and recorded Boot Manifest as deferred RM-010 enhancement. | Tony |
| 2026-07-18 | Marked RM-010 proposal baseline approved after formal review record; implementation deferred pending planning. | Tony |
| 2026-07-18 | Reframed RM-007 from SDR-specific version history to Runtime Checkpointing and Version History and created v0.1 specification reference. | Tony |
| 2026-07-18 | Marked RM-007 proposal baseline approved after formal review record; implementation deferred pending planning. | Tony |
| 2026-07-18 | Reframed RM-008 from Automatic Workshop Resume to Runtime Recovery and Session Resume and created v0.1 specification reference. | Tony |
| 2026-07-18 | Marked RM-008 proposal baseline approved after formal review record; implementation deferred pending planning. | Tony |
| 2026-07-18 | Created RM-017 AI Capability Schema v0.1 specification and moved RM-017 to proposal status. | Tony |
| 2026-07-18 | Moved RM-010 to Implementation Planned after Phase 1 implementation plan gate. | Tony |
| 2026-07-18 | Moved RM-010 to Implementing for Phase 1 source and test implementation. | Tony |
| 2026-07-18 | Created RM-010 Phase 1 controlled activation conformance test plan; RM-010 remains Implementing pending controlled activation conformance testing. | Tony |
| 2026-07-18 | Completed RM-010 Phase 1 controlled activation conformance testing with verdict `CONFORMANT WITH LIMITATIONS`; RM-010 remains Implementing pending review and validation planning. | Tony |
| 2026-07-18 | Completed RM-010 Phase 1 engineering review; accepted baseline with no specification or implementation defects and set next action to RM-007 implementation work. | Tony |
| 2026-07-18 | Marked RM-010 Operational Phase 1 after integrated `Start-EENOS.ps1` activation and checkpointed runtime slice. | Tony |
| 2026-07-18 | Froze AI Runtime v0.1.0 operational baseline: RM-010, RM-007, RM-008, and RM-017 minimum slice operational through `Start-EENOS.ps1`. | Tony |
| 2026-07-25 | Activated RM-010 live capability observation and governed file/capability dependency resolution. Required capability or dependency loss now blocks before transfer; optional and explicitly degraded paths remain visible warnings. Full regression: 300 passed. | Tony |
| 2026-07-20 | Normalized duplicated roadmap lines and reconciled release focus with the AI Runtime v0.1.0 operational baseline. | Tony |
| 2026-07-20 | Added RM-018 Ollama Local Model Provider Integration as post-SDR-gate work. | Tony |
| 2026-07-21 | Renumbered Ollama Local Model Provider Integration from RM-018 to RM-022 to resolve an ID collision; added proposed RM-018 through RM-021 under Story Intelligence and Author Workflow, including inventory, future-release focus, detailed scope, dependencies, safeguards, and initiative relationships. | Tony |
| 2026-07-21 | Added RM-023 Recovery Fidelity Evaluation and Audit as a discovered future Runtime / Recovery capability, preserving RM-006 as the unchanged binary recovery gate and separating fidelity scoring from independent audit findings. | Tony |
| 2026-07-21 | Validated RM-006 Destructive SDR Recovery Test with PASS result; recorded fresh-session recovery evidence, the RM-016 reconciliation compliance defect, and the future stale-authority detection need. | Tony |
| 2026-07-21 | Corrected CR-002 invalid-mode handling, synchronized Claude runtime v1.1 development and vault copies, revalidated RM-011 at 9/9 PASS, and promoted RM-011 to Validated. | Tony |
| 2026-07-24 | Added RM-025 Governed Character Identity Contract after Character Arc implementation exposed the need for deterministic identity across aliases, versions, scopes, and downstream Story Architecture records. | Tony |
| 2026-07-25 | Added RM-026 to relocate all EENOS development work from the operating-system C drive to `H:\Development\EENOS` before creating the next controlled baseline. Planning only; no files moved. | Tony |
| 2026-08-02 | Reconciled release-gate status against current implementation evidence, restored existing RM-024 to the master roadmap, marked RM-026 Validated after H-drive interface cutover, and selected RM-001 as the highest-priority ready validation item. | Roadmap Manager |
| 2026-08-04 | Recorded Tony's approved priority and dependency decision: RM-024 top-down narrative mapping and owner operational acceptance is the next roadmap work; a structurally located scene is a blocking creative-workflow prerequisite for RM-001 through RM-005 operational SDR validation. RM-024 remains Testing. | Tony |
| 2026-08-04 | Reconciled the RM-024 recovery-defect repair and controlled-recovery evidence. All 16 exact references resolved and a structurally located scene recovered, unblocking RM-001 through RM-005 consolidated SDR operational validation. RM-024 remains Testing pending owner disposition and finalized completion evidence. | Roadmap Manager |
| 2026-08-04 | Added RM-027 Optional Multidimensional Scene Development Prompts from Tony's Delivery Manager handoff. Captured as Discovered and unprioritized; no implementation approval is implied. | Tony |
| 2026-08-04 | Recorded Tony's approval of RM-027, moved it to Approved without changing current delivery sequence, and added the Planning Handoff Package for Delivery Lead interpretation. | Tony |
| 2026-08-04 | Reconciled the accepted RM-001–RM-005 consolidated operational revalidation. Promoted RM-001 through RM-005 from Testing to Validated after RM-001–RM-005 and AC-001–AC-014 PASS; recorded RM-004's completed repair; resolved `DEF-SDR-VAL-001`, `VAL-EX-001`, and `VAL-EX-002` while preserving history; cited the revalidation report and checksum; retained the unchanged failed historical report; and identified RM-014 as the sole remaining immediate release-gate item. | Roadmap Manager |
| 2026-08-04 | Tony accepted the RM-001–RM-005 roadmap reconciliation and closed the planning activity. Repository publication was not performed as part of closeout. | Tony |
| 2026-08-05 | Closed RM-014 on Tony's direction using the previously supplied and accepted startup-authority evidence; no repeat validation was required. The immediate release gate is complete. | Tony |
| 2026-08-05 | Reconciled Tony's acceptance of RM-024 operational evidence and promoted RM-024 from Testing to Validated. Preserved the `COMPLETE_WITH_WARNINGS` and Exploring-state limitations; Closed was not inferred. | Roadmap Manager |
| 2026-08-05 | Created the RM-025 acceptance-validation plan and selected RM-025 as the next unresolved acceptance-reconciliation item. No implementation or test result is inferred. | Roadmap Manager |
| 2026-08-06 | Reconciled Tony-authorized RM-025 acceptance-validation evidence. Promoted RM-025 from Implemented to Validated after AC-001–AC-015 and 21/21 tests passed; recorded verified report and manifest hashes, the untracked frozen-baseline limitation, and checkpoint-specific serialization as evidence-proved not applicable. Closed was not inferred. | Roadmap Manager |
| 2026-08-06 | Tony accepted the RM-025 Validated reconciliation and closed the planning activity. The roadmap item remains Validated; lifecycle status Closed was not directed or inferred. | Tony |
| 2026-08-11 | Added RM-028 through RM-031 as Medium-priority Discovered user-interface roadmap items after Tony identified missing UI coverage: Unified Author Workspace, Visual Story Architecture Workspace, Scene Development Workspace, and Session History, Checkpoint, and Recovery Interface. Capture does not approve delivery or select a technical platform. | Tony |
| 2026-08-12 | Reconciled Tony-approved RM-027 implementation and publication evidence. Promoted RM-027 from Approved to Implemented after software PR #2 merged the independently reviewed implementation and Product Delivery PR #24 published corrected handoff v1.0.1. Removed RM-027 from work awaiting delivery planning and recorded AC-012 runtime-distribution synchronization and RM-012 complete-active-set evaluation as the remaining validation gate. Validated and Closed were not inferred; priority and roadmap sequence remain unchanged. | Roadmap Manager |
| 2026-08-13 | Reconciled Tony-authorized RM-027 AC-012 evidence. Promoted RM-027 from Implemented to Validated after runtime distributions synchronized, source-to-distribution hashes matched, and the RM-012 complete-active-set evaluator returned `PASS` and `RELEASE_ELIGIBLE`. Recorded the missing `pytest` dependency as a non-blocking limitation because the production evaluator and direct artifact/hash validations passed. Closed was not inferred. Updated the stale Current Recommendation to RM-015 without approving delivery or reprioritizing RM-022. | Roadmap Manager |
| 2026-08-13 | Closed RM-026 on Tony's direction after accepting the validated H-drive interface cutover as complete. Preserved the retained C workspace and any deletion decision as outside RM-026 scope; no deletion was authorized or performed. | Tony |
| 2026-08-13 | Closed RM-001 through RM-006 and RM-011 on Tony's direction after accepting their recorded validation evidence. Preserved all acceptance results, dependencies, limitations, and planning history; no implementation work or new validation was inferred or performed. | Tony |
