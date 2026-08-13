# EENOS Product Roadmap

**Document ID:** RM-000  
**Version:** 1.8.0
**Status:** Approved  
**Document Owner:** Roadmap Manager  
**Approval Authority:** Tony  
**Approval Source:** Pull Request #13 merged by Tony on 2026-08-02; RM-024 priority and dependency order approved by Tony on 2026-08-04; RM-027 approved by Tony on 2026-08-04; RM-001–RM-005 closeout authorized and accepted by Tony on 2026-08-04; RM-014 closure and RM-024 evidence acceptance directed by Tony on 2026-08-05; RM-025 validation execution approved by Tony, PASS evidence returned, and Validated reconciliation accepted by Tony on 2026-08-06; RM-028–RM-031 UI discovery capture and Medium priorities approved by Tony on 2026-08-11; RM-027 implementation, independent-review disposition, handoff correction, and Implemented-state roadmap reconciliation approved by Tony on 2026-08-12; RM-027 AC-012 runtime synchronization and complete-active-set evaluation approved by Tony and returned PASS on 2026-08-13
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
| RM-001 | Persistent Scene Development Record | Critical | Critical | Story Development | Persistent Scene Development Record (SDR) so scene work survives AI context loss. | Validated | 2026-07-12 | Chapter 1 Scene 1 recovery discussion | Tony | v1.1 | `STD_Scene_Development_Record_v1.0.md`; `STD_Scene_Development_Record_v1.1.md`; `98_Workflow/Reports/REPORT_EENOS_Implementation_Status_Reconciliation_2026-07-25.md`; `98_Workflow/Reports/REPORT_RM-024_Operational_Acceptance_2026-08-04.md`; `300-delivery/validation/REPORT-RM-001-RM-005-Consolidated-SDR-Operational-Revalidation.md`; adjacent `.sha256` | Validated by accepted consolidated operational revalidation: RM-001 PASS; AC-001–AC-003 PASS; fresh isolated recovery achieved 100% agreement across all governed comparison fields. `VAL-EX-002` is resolved. Report SHA-256: `088274B459485462DD00A3BBD9BA372FFA43548E72E9565CD0E897628FF5366C`. |
| RM-002 | SDR Recovery Header | Critical | Critical | Runtime | Recovery header for SDRs so fresh AI sessions can resume without user re-explanation. | Validated | 2026-07-12 | SDR recovery hardening | Tony | v1.1 | `STD_Scene_Development_Record_v1.0.md`; `300-delivery/validation/REPORT-RM-001-RM-005-Consolidated-SDR-Operational-Revalidation.md`; adjacent `.sha256` | Validated by isolated source-controlled recovery: RM-002 PASS; AC-003 and AC-004 PASS; correct SDR and recovery source selected without inherited conversation or narrative re-explanation. `VAL-EX-002` is resolved. |
| RM-003 | Deterministic SDR Save Triggers | High | Minor | Runtime | Deterministic SDR save triggers instead of subjective breakthrough detection. | Validated | 2026-07-12 | SDR save-rule refinement | Tony | v1.1 | `STD_AI_Claude_Runtime_v1.0.md`; `300-delivery/validation/REPORT-RM-001-RM-005-Consolidated-SDR-Operational-Revalidation.md`; adjacent `.sha256` | Validated by two immediate replacement operations plus still-valid historical evidence: RM-003 PASS; AC-005 and AC-006 PASS; reconciliation `8/8`. `VAL-EX-001` is resolved. |
| RM-004 | Silent SDR Updates and Manual Commands | High | Minor | Runtime | Silent automatic SDR updates plus manual `Checkpoint SDR` and `Save SDR Now` commands. | Validated | 2026-07-13 | SDR operation refinement | Tony | v1.1 | `STD_AI_Claude_Runtime_v1.0.md`; `300-delivery/validation/REPORT-RM-001-RM-005-Consolidated-SDR-Operational-Revalidation.md`; adjacent `.sha256` | Repair completed and accepted by Tony. Focused AC-007 revalidation PASS with zero automatic-save narration or interruption; carried-forward AC-008 and AC-009 remain PASS. RM-004 PASS. `DEF-SDR-VAL-001` is resolved. Manual-command visibility remains governed. |
| RM-005 | SDR Runtime Compliance Reporting | High | Minor | Reporting | SDR Runtime Compliance reporting in Session Review. | Validated | 2026-07-13 | SDR audit refinement | Tony | v1.1 | `STD_AI_Claude_Runtime_v1.0.md`; `300-delivery/validation/REPORT-RM-001-RM-005-Consolidated-SDR-Operational-Revalidation.md`; adjacent `.sha256` | RM-005 PASS. Carried-forward AC-010 and AC-011 evidence remains valid: successful automatic operations reconcile `8/8`, manual operations remain excluded, and controlled failure reporting preserves the recovery target without false success. |
| RM-006 | Destructive SDR Recovery Test | Medium | Major | Story Development | Destructive test of SDR recovery across fresh sessions. | Validated | 2026-07-13 | SDR validation planning | Tony | v1.1 | `98_Workflow/Reports/REPORT_RM-006_Destructive_SDR_Recovery_Validation_2026-07-21.md` | Recovery result PASS. Fresh-session recovery reconstructed the authoritative SDR state. Validation exposed a prior RM-016 reconciliation compliance defect and a future stale-authority detection need; neither was a failure of the governed recovery mechanism. |
| RM-007 | Runtime Checkpointing and Version History | High | Major | Runtime / Persistence | Define a provider-neutral and storage-neutral runtime checkpointing architecture that captures deterministic recoverable session state for EENOS AI sessions. SDRs become one checkpoint participant rather than the whole feature. | Operational Phase 1 | 2026-07-12 | SDR failure-mode analysis; RM-010 recovery-interface refinement | Tony | Future | `98_Workflow/AI_Runtime/SPEC_RM-007_Runtime_Checkpointing_and_Version_History_v0.1.md`; `98_Workflow/Reports/REPORT_RM-007_Proposal_Baseline_Review_2026-07-18.md` | Minimum viable checkpoint slice operational. Checkpoint creation and read-back validation are active through `Start-EENOS.ps1` after successful Story Development sessions. RM-007 establishes the persistence authority that RM-008 will consume. It should answer: if an AI session stops unexpectedly, what deterministic state can be reconstructed? Checkpoints preserve session identity, mission, mode, runtime version, working set, canon context references, active SDR, active workshop, current task, runtime state, version references, and integrity information. Git is an implementation option, not the architecture. Logical checkpoints may not claim a higher completeness level than validated physical artifacts support. Runtime behavior remains unchanged until separately approved implementation. |
| RM-008 | Runtime Recovery and Session Resume | High | Major | Runtime / Recovery | Define a provider-neutral recovery architecture that reconstructs valid runtime state from a valid logical checkpoint and resumes the appropriate operational runtime. Workshop resumption becomes one recovery mode rather than the whole feature. | Operational Phase 1 | 2026-07-13 | Roadmap planning; RM-010 recovery interface; RM-007 checkpoint contract | Tony | Future | `98_Workflow/AI_Runtime/SPEC_RM-008_Runtime_Recovery_and_Session_Resume_v0.1.md`; `98_Workflow/Reports/REPORT_RM-008_Proposal_Baseline_Review_2026-07-18.md` | Minimum viable recovery slice operational. Explicit checkpoint resume is active through `Start-EENOS.ps1 -ResumeCheckpoint` with deterministic validation and blocking. RM-008 defines how runtime state is reconstructed. It consumes RM-007 logical checkpoints and hands recovered state back through the RM-010-compatible runtime entry contract. Recovery is mode-agnostic; mode-specific behavior belongs to the runtime that receives control after recovery. Failed control transfer must not leave an ambiguous active runtime. Runtime behavior remains unchanged until separately approved implementation. |
| RM-009 | Workshop Metrics | Low | Enhancement | Reporting | Workshop productivity or progress metrics. | Discovered | 2026-07-13 | Roadmap planning | Tony | Future | - | Nice-to-have; defer. |
| RM-010 | AI Runtime Startup Manager | High | Major | Runtime | Create a provider-neutral, implementation-neutral deterministic EENOS boot authority for AI sessions. The Startup Manager resolves mission, provider capabilities, operational mode, dependencies, context, recovery state, validation outcome, working set, and session header before releasing control to the selected operational runtime. | Operational Phase 1 | 2026-07-13 | Start EENOS activation failure analysis; RM-010 architecture refinement | Tony | v1.2 | `98_Workflow/AI_Runtime/SPEC_RM-010_AI_Runtime_Startup_Manager_v0.1.md`; `98_Workflow/Reports/REPORT_RM-010_Proposal_Baseline_Review_2026-07-18.md`; `98_Workflow/AI_Runtime/PLAN_RM-010_Implementation_v0.1.md`; `98_Workflow/AI_Runtime/PLAN_RM-010_Phase_1_Controlled_Activation_Test_v0.1.md`; `98_Workflow/Reports/REPORT_RM-010_Phase_1_Controlled_Activation_Test_2026-07-18.md`; `98_Workflow/Reports/REPORT_RM-010_Phase_1_Engineering_Review_2026-07-18.md` | Proposal baseline approved. Phase 1 implementation complete; verification passed; controlled activation conformance verdict is `CONFORMANT WITH LIMITATIONS`; engineering review accepted the Phase 1 baseline with no specification or implementation defects. Activation: active through `Start-EENOS.ps1`; rollback available through legacy manual startup. Limitations disclosed. Next action: RM-007 checkpointing vertical slice. RM-010 owns boot; the selected operational mode owns runtime. Components: Mission Parser, Capability Detector, Mode Dispatcher, Context Loader, Recovery Manager, Runtime Validator, and Session Initializer. Dependencies: RM-011 mode definitions, RM-014 startup authority, RM-015 provider-neutral writer profile or equivalent capability schema, and RM-016 platform-neutral SDR lifecycle. RM-008 is downstream: RM-010 defines the recovery interface; RM-008 implements automatic workshop resumption through that interface. Acceptance must answer mission, mode, available and required capabilities, required documents/context, recovery state, dependency satisfaction, pass/warning/block status, authoritative working set, and runtime control transfer. Future enhancement: emit a machine-readable Boot Manifest alongside the human-readable Session Header to support deterministic validation, automation, testing, and software implementations. Runtime behavior remains unchanged until separately approved implementation. |
| RM-011 | Operational Mode Menu Definitions | Critical | Major | Runtime | CR-002 lists modes whose purpose, inputs, outputs, and rules are undefined placeholders. Every displayed mode must have a valid name, purpose, expected user input, delivered output, and governing rules. | Validated | 2026-07-13 | First successful `Start EENOS` activation | Tony | v1.1 hotfix | `98_Workflow/AI_Runtime/STD_AI_Claude_Runtime_v1.1.md`; `98_Workflow/Reports/REPORT_RM-011_Operational_Mode_Definitions_Validation_2026-07-21.md` | Validated 2026-07-21: all 11 modes present and complete; valid selections initialize; CR-002 defines controlled `MODE_UNSUPPORTED` correction; required mode instruction present; development and vault runtime copies synchronized; unchanged contract passed 9/9. |
| RM-012 | Runtime Artifact Synchronization | High | Technical Debt | Runtime | Prevent stale duplicate runtime artifacts across development workspace, generated HTML, and Obsidian vault copies. | Validated | 2026-07-13 | Stale vault runtime caused obsolete Start EENOS menu after workspace runtime was fixed | Tony | v1.1 | `98_Workflow/AI_Runtime/PROC_Runtime_Artifact_Sync_v1.1.md`; `98_Workflow/Reports/REPORT_RM-012_Runtime_Artifact_Synchronization_Revalidation_2026-07-25.md` | Version-aware active-set resolution, SHA-256 distribution verification, generated-artifact provenance, durable failure evidence, recovery targets, exception handling, and release dispositions implemented. Released Claude Runtime v1.2 source-to-vault relationship evaluated PASS. |
| RM-013 | EENOS Governance Framework | Medium | Major | Governance | Define the governance hierarchy among Constitution, governance documents, ADRs, processes, standards, runtime specifications, and implementation artifacts so future modules know where decisions belong. | Discovered | 2026-07-15 | Architecture-to-implementation pipeline review | Tony | Future | `PROC_EENOS_Architecture_to_Implementation_Pipeline_v0.1.md` | Candidate future artifact: `GOV_System_Evolution` or `GOV_Architecture_Governance`. Should be addressed after current Writing Craft Intelligence architecture work is stable. |
| RM-014 | Single Source of Truth for Session Startup | High | Technical Debt | Governance / Runtime | Determine and formalize the authoritative source for session startup by platform so each runtime has one governing startup sequence, launch console, mode selection rule, and initialization authority. | Closed | 2026-07-15 | Claude startup conflict investigation; DEBT-016 report | Tony | v1.1 hotfix or v1.2 | `PROC_AI_Session.md` v0.3; `STD_AI_Claude_Runtime_v1.0.md`; see AR-007; Tony closure direction recorded 2026-08-05 | Linked debt DEBT-016 is closed. The accepted parent/child resolution preserves `PROC_AI_Session.md` as the platform-general protocol and `STD_AI_Claude_Runtime_v1.0.md` as the Claude Cowork specialization governing Claude activation, mandatory mode selection, and its operating-mode menu. Runtime Markdown and generated HTML were synchronized to the Obsidian vault runtime folder. Tony confirmed that the previously supplied evidence is sufficient and directed closure without repeat validation on 2026-08-05. |
| RM-015 | Provider-Neutral Writer Profile | High | Major | AI Runtime / Writer Profile | Create a governed, provider-neutral EENOS Writer Profile so ChatGPT, Claude, Ollama, and future reasoning engines receive the same approved foundational understanding of Tony as a writer without relying on provider-owned conversation memory. | Proposal | 2026-07-17 | ChatGPT Desktop + Remote Writers Room pilot and provider-neutral context discussion | Tony | Future; evaluate with EE-004 | `DEC_EENOS_Writers_Room_Gateway_Architecture_2026-07-17.md`; `SPEC_EE-004_Writers_Room_Gateway_First_Vertical_Slice_v0.1.md` | Proposed layers: Core Author Profile, Evolution Earth Project Profile, Mission-Specific Guidance, and Experimental Observations Pending Approval. The profile is not story canon; Tony remains approval authority; AI systems may propose additions but may not approve them; conversation history must not be silently converted into profile data; sensitive personal information is excluded unless explicitly approved; provider-specific prompts remain separate. Dependencies to evaluate: EE-004 Writers Room Gateway, context-pack specification, AI adapter contract, document-state and approval governance, platform runtime standards, and Ollama adapter planning. Acceptance should verify an approved Core Author Profile, separate project preferences, mission-specific retrieval, substantively equivalent provider context, reported profile version/sections, canon separation, approval-gated profile changes, cross-provider plotting test, and reduced dependence on provider-owned memory. Principle: the chosen AI should change the reasoning engine, not reset the working relationship with the author. |
| RM-016 | Platform-Neutral Scene Development Record Lifecycle | High | Major | Governance / Runtime / Story Development | Define whether SDR lifecycle behavior is universally required across EENOS creative platforms and, if so, move the authoritative lifecycle o…6575 tokens truncated…eive reduced fidelity credit when its source cannot be established.
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
