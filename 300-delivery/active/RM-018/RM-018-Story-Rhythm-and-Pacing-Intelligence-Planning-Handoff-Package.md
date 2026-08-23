# RM-018 Story Rhythm and Pacing Intelligence — Planning Handoff Package

**Document Type:** Planning Handoff Package  
**Version:** 1.0.0  
**Status:** Approved for Delivery Manager orchestration  
**Document Owner:** Roadmap Manager  
**Approval Authority:** Tony  
**Approval Source:** Tony explicitly approved RM-018 for delivery on 2026-08-23  
**Last Updated:** 2026-08-23  
**Related Roadmap Item:** RM-018

## 1. Planning Objective

Deliver evidence-backed, multi-scale Story Rhythm and Pacing Intelligence that helps Tony understand how narrative energy, conflict, information, emotion, recovery, revelation, mystery, prose mode, and scene function move across scenes, chapters, acts, viewpoints, plotlines, and a manuscript.

The capability must explain observations and likely reader effects without reducing pacing to one mandatory score, treating common patterns as rules, or silently modifying story material.

## 2. Expected Product Outcome

Tony can request pacing analysis at one or more narrative scales and receive:

- evidence-cited observations;
- the analyzed scale, source set, and information boundaries;
- intended pacing targets supplied or approved by Tony;
- distinctions among observation, interpretation, likely reader effect, risk, and recommendation;
- cumulative patterns that are not visible from one scene alone;
- recognition of deliberate slowness, repetition, intensity, interruption, contrast, or recovery;
- uncertainty and missing-evidence disclosure; and
- optional recommendations that remain subject to Tony's creative authority.

## 3. Authorized Scope

### In scope

- Analysis at scene, sequence, chapter, act, viewpoint, plotline, and manuscript scales where source evidence supports the requested scale.
- Dimensions including tension, action density, emotional intensity and recovery, revelation cadence, mystery progression, scene-function repetition, escalation, transitions, stagnation, reader-fatigue risk, prose-mode balance, and cross-viewpoint or cross-plotline differences.
- Author-defined pacing intentions, targets, exceptions, and protected choices.
- Exact source citations or stable provenance references for material observations.
- Comparison between intended and observed pacing where intent evidence exists.
- Explicit confidence, ambiguity, missing evidence, and conflicting evidence.
- Human-readable analysis output and any governed machine-readable representation needed for repeatability or validation.
- Reuse of approved RM-017 capability disclosure and RM-032 scene-knowledge/provenance capabilities where applicable.
- Validation with controlled scene, chapter, and multi-scale samples whose expected observations are documented before evaluation.

### Out of scope

- Silent edits, rewrites, canon promotion, approval-state changes, or source-document mutation.
- A universal pacing score, mandatory target, commercial formula, or pass/fail judgment about artistic quality.
- Automatic override of Tony's stated intent.
- Genre-specific prescriptive behavior owned by RM-019.
- Revision execution or revision workflow owned by RM-020.
- Layered drafting behavior owned by RM-021.
- New Ollama or provider integration under RM-022.
- Treating absent context as evidence of a pacing defect.

## 4. Product Principles

1. Tony's declared creative intent is authoritative.
2. Every material observation must be traceable to source evidence.
3. Observation, interpretation, effect, risk, and recommendation must remain distinguishable.
4. Deliberate pacing choices must not be normalized away.
5. Analysis must disclose its source set, narrative scale, information boundaries, uncertainty, and capability limitations.
6. Local patterns must not be generalized to manuscript-wide conclusions without sufficient evidence.
7. Recommendations are optional and may not authorize prose generation or revision.
8. Reader-effect statements are reasoned predictions, not objective facts.

## 5. Dependencies and Governing Evidence

The Delivery Manager shall verify and apply:

- `200-roadmap/current/001-EENOS-Product-Roadmap.md`, RM-018 and its approval history.
- RM-017 AI Capability Schema for capability disclosure.
- RM-032 EENOS Scene Knowledge and Provenance Layer for stable identity and provenance where applicable.
- Existing Story Intelligence runtime, scene-analysis, canon, outline, and context-loading capabilities in the software repository.
- `700-ai-organization/Delivery-Lead/001-Delivery-Lead-Role-Specification.md`.
- `000-standards/002-Task-Package-Specification.md`.
- `100-governance/003-Artifact-Lifecycle.md`.
- `600-repository/repository-specifications/006-Software-Repository-Contract.md`.
- Approved information-state, canon, source-authority, and repository-boundary rules found during delivery preparation.

RM-019 depends on RM-018. RM-018 does not depend on RM-019, RM-020, RM-021, RM-022, or RM-015.

## 6. Required Delivery Manager Work

The Delivery Manager shall:

1. Inspect current repository truth and identify reusable analysis, provenance, context-loading, and capability surfaces.
2. Define an implementation-ready minimum vertical slice that proves at least scene, chapter, and cross-scene analysis without implying unsupported manuscript-wide completeness.
3. Identify exact authoritative test fixtures and record Tony's intended pacing targets or fixture expectations before evaluation.
4. Define the output contract and keep observation, interpretation, effect, risk, recommendation, confidence, and evidence separate.
5. Define evidence and provenance requirements for every material claim.
6. Define behavior for missing, contradictory, stale, unauthorized, or insufficient source evidence.
7. Preserve information-state and reader-access boundaries.
8. Map each acceptance criterion to executable validation or an exact evidence inspection.
9. Prepare implementation-ready Task Package(s), repository targets, isolation requirements, stop conditions, and the STD-002 Completion Record requirements.
10. Return the complete Implementation Handoff Package to Tony for orchestration.

The Delivery Manager chooses implementation methods. This planning package does not prescribe language, storage technology, interface framework, model provider, or algorithm.

## 7. Minimum Acceptance Criteria

| ID | Requirement |
|---|---|
| AC-001 | Every analysis identifies its requested scale, actual supported scale, source set, source versions or hashes where available, and analysis time. |
| AC-002 | Every material observation cites exact evidence or a stable governed provenance reference. |
| AC-003 | Output distinguishes observation, interpretation, likely reader effect, risk, and recommendation. |
| AC-004 | Tony-defined intent and pacing targets are represented separately from system observations and remain authoritative. |
| AC-005 | Deliberate slowness, repetition, intensity, contrast, interruption, and recovery can be recorded as intentional rather than automatically classified as defects. |
| AC-006 | Scene-level evidence is not generalized to chapter, act, plotline, viewpoint, or manuscript conclusions without sufficient source coverage. |
| AC-007 | The capability analyzes tension, action density, emotional intensity/recovery, revelation cadence, mystery progression, scene-function repetition, escalation, transitions, stagnation, reader-fatigue risk, and prose-mode balance when applicable evidence exists. |
| AC-008 | Cross-scene, cross-viewpoint, or cross-plotline comparisons disclose mismatched coverage and do not manufacture comparability. |
| AC-009 | Missing, ambiguous, conflicting, stale, or unauthorized evidence produces explicit limitations rather than invented conclusions. |
| AC-010 | Author-only, viewpoint-accessible, and reader-accessible information boundaries remain distinguishable and pass leakage tests. |
| AC-011 | Recommendations are optional, evidence-linked, and do not modify story, canon, approval state, or source artifacts. |
| AC-012 | No universal or mandatory pacing score is required for analysis, completion, approval, export, or downstream use. |
| AC-013 | RM-017 capability disclosure reports relevant model or tool limitations before analysis claims exceed available capability. |
| AC-014 | RM-032 identity and provenance are reused where applicable without changing RM-032 source-preservation or approval boundaries. |
| AC-015 | Controlled fixtures demonstrate scene, chapter, and multi-scene analysis with expected observations defined before execution. |
| AC-016 | Repeated analysis of unchanged governed inputs is materially reproducible, with nondeterministic interpretation differences disclosed where exact byte identity is not achievable. |
| AC-017 | Negative tests cover unsupported scale, missing intent, conflicting evidence, insufficient coverage, leakage attempts, stale provenance, and unauthorized modification requests. |
| AC-018 | The implementation result includes exact commands, changed paths, generated paths, hashes where applicable, test results, limitations, unresolved findings, and a complete STD-002 Completion Record. |

## 8. Validation Expectations

Validation shall include:

- unit tests for output classification, evidence linkage, scale controls, intent separation, and safeguards;
- integration tests using governed context and provenance inputs;
- controlled scene, chapter, and multi-scene fixtures;
- deliberate-slow and deliberate-high-intensity examples;
- insufficient-evidence and contradictory-evidence cases;
- information-boundary leakage tests;
- reproducibility checks on unchanged inputs;
- regression checks against affected runtime, context, canon, and RM-032 behavior; and
- an independent review before any Validated or Closed roadmap claim.

## 9. Stop Conditions

Stop the affected stage and return an evidence-backed exception when:

- authoritative source or intent evidence cannot be identified;
- the proposed implementation would mutate story, canon, approval state, or source material;
- information-state boundaries cannot be preserved;
- implementation requires unapproved RM-019, RM-020, RM-021, RM-022, or RM-015 scope;
- repository isolation cannot preserve existing user work;
- required acceptance behavior cannot be tested or traced; or
- implementation would present artistic judgment or reader response as objective fact.

Continue unaffected delivery work where safe.

## 10. Required Return Package

The Delivery Manager shall return:

- implementation-ready Task Package(s);
- verified repository and implementation targets;
- source and fixture manifest;
- output-contract definition;
- AC-001 through AC-018 traceability matrix;
- test and independent-review plan;
- access requirements and stop conditions;
- Implementation Engineer copy-and-paste instruction; and
- confirmation that implementation has not begun merely because delivery preparation is complete.

## 11. Delivery Orchestration Instruction

Use this package as the planning authority for RM-018. Prepare and orchestrate implementation-ready work only within its authorized scope. Preserve Tony's creative authority, evidence provenance, information boundaries, and source immutability. Do not introduce Ollama integration, genre prescriptions, revision execution, layered drafting, silent story changes, mandatory pacing scores, or unsupported manuscript-wide claims. Require AC-001 through AC-018 evidence, independent review, repository publication evidence, and a complete STD-002 Completion Record. Return implementation and validation evidence to Tony, who will route it to the Roadmap Manager for lifecycle reconciliation.

## 12. Return Route

Delivery Manager returns the implementation-ready package and orchestration result to Tony. Implementation evidence returns through Tony to the Roadmap Manager for the highest evidence-supported lifecycle status. Tony retains approval and merge authority.
