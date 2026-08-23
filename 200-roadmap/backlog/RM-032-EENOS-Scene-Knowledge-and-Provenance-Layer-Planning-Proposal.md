# RM-032 — EENOS Scene Knowledge and Provenance Layer

**Artifact Type:** Roadmap Planning Proposal

**Roadmap ID:** RM-032

**Status:** Approved

**Priority:** High

**Type:** Major

**Area:** Story Intelligence / Scene Development / Information Management

**Prepared By:** Roadmap Manager

**Prepared Date:** 2026-08-22

**Approval Source:** Tony approved proposal capture and governance review, then explicitly authorized delivery and implementation on 2026-08-22

**Implementation Authority:** Granted by Tony on 2026-08-22, subject to the scope, repository contracts, authority gates, and stop conditions in the RM-032 Planning Handoff Package

## Planning Determination

RM-032 is a new roadmap item. RM-001 and RM-016 govern the Scene Development Record; RM-024 governs Story Architecture; RM-025 governs character identity; and RM-030 governs a scene-development interface. None owns cross-document scene identity, source provenance, lossless aggregation, conflict review, derived querying, or deterministic rebuilds.

## Objective

Provide a local, reproducible, scene-centered knowledge layer that discovers and associates scene-development evidence, preserves exact source provenance and information boundaries, proposes stable scene identities for author confirmation, reports ambiguity and conflict without silently resolving them, and generates traceable Scene Hubs without modifying or replacing original source documents.

## Initial Scope

- Read-only inventory and hashing of approved G1 and N2 source manifests.
- Candidate scene clustering and alias resolution.
- Tony-confirmed permanent scene identities for the pilot scenes.
- Provenance-linked fragments preserving exact source wording and separate normalized interpretations.
- Independent information-state, canon-state, truth/visibility, review, and retention metadata under approved governance.
- Supersedes relationships, rejected alternatives, historical material, contradictions, orphaned sources, and unresolved-overlap reporting.
- Traceable generated Scene Hubs for confirmed G1 and N2 identities.
- Local derived querying, change detection, interruption safety, idempotent rescanning, and deterministic rebuilds.

## Exclusions

- Source deletion, movement, renaming, rewriting, or correction.
- Automatic canon or approval-state promotion.
- Automatic conflict, precedence, merge, or split decisions.
- Full-vault migration, NovelCrafter synchronization, external hosting, multi-user editing, or prose generation.
- Replacement of SDRs, workshop records, Scene Anatomy, Story Architecture, or the Narrative Development Registry.
- Approval of SQLite, a permanent scene-ID format, source writeback, or exact repository paths.

## Governance and Standards Required Before Delivery

1. A scene identity and provenance standard covering stable identity, aliases, merge/split lineage, source registration, fragments, ambiguity, and rebuild guarantees.
2. Artifact classification for Scene Hubs, manifests, registries, review queues, derived query stores, logs, reports, and tests.
3. Repository Steward confirmation of repository contracts, ownership, and exact destinations.
4. An approved mapping between fragment semantics and `GOV_EENOS_Information_State_Governance.md`. Proposed fragment labels must not silently redefine the approved states Observed, Proposed, Approved, Implemented, and Historical.
5. Reconciliation of the accessible software checkout's SDR v1.0 copy with the released runtime set's platform-neutral SDR v1.2 authority.

No SDR, Scene Anatomy, or runtime amendment is justified solely for read-only indexing. An amendment is required only if approved design changes fields, lifecycle behavior, context-loading authority, or persistence rules.

## Authority Boundaries

- Tony approves consequential identity, cluster merge/split, precedence, conflict-disposition, architecture, implementation, and canon decisions.
- Automation may propose identities, clusters, and conflicts but may not approve them.
- Modification time alone does not establish source precedence.
- Scene Hubs are derived views and do not become canon or replace source authority.

## Storage Classification Recommendation

- Product Delivery repository: roadmap, planning, handoff, milestone, and traceability artifacts.
- EENOS software repository: scanner code, schemas, parsers, derived databases or indexes, operational manifests, logs, tests, rebuild tooling, and validation reports, subject to Repository Steward confirmation.
- Obsidian vault: only a separately classified and authorized generated Scene Hub as a novel-development artifact. Software, databases, indexes, logs, test output, and operational reports remain outside the vault.

SQLite is a proposed derived-store candidate, not an approved architecture decision. No irreplaceable information may exist only in a derived store.

## Dependencies

- Tony-approved RM-032 proposal scope.
- RM-001, RM-016, RM-024, and RM-025 authorities and precedents.
- RM-028 and RM-030 for later interface integration, not for the read-only pilot.
- Approved Information State Governance.
- Current Scene Anatomy and Narrative Development Registry definitions.
- Organization Model Consultant governance and artifact-classification disposition.
- Repository Steward placement and contract determination.
- Delivery Lead preparation after governance questions are resolved and Tony authorizes delivery.
- Verified read access to the exact G1 and N2 pilot source manifests.

## Minimum Acceptance Baseline

1. Every approved G1 and N2 source is inventoried with exact path and content hash.
2. Pre/post hashes prove zero source modifications.
3. Every fragment retains exact source path, source anchor where available, original wording, and any separate normalized interpretation.
4. Rejected, superseded, historical, and unresolved material remains discoverable.
5. Conflicts and ambiguous precedence are reported without automatic resolution.
6. G1 and N2 receive Tony-confirmed permanent identities and deterministic alias resolution.
7. Merge/split lineage is approval-gated and preserved.
8. Author-only, POV-accessible, and reader-accessible information remains independently distinguishable and passes leakage tests.
9. Scene Hubs expose current state, complete source history, alternatives, conflicts, open questions, and provenance.
10. Derived state can be deleted and rebuilt without losing irreplaceable information.
11. Unchanged rescans are materially identical; changed sources and stale views are detected.
12. Interrupted scans recover safely, and orphaned/unclassified sources are reported.
13. No content is promoted to canon or another approval-dependent state.
14. No software or operational artifact is written to Obsidian.

## Risk

**Overall:** High.

Critical risks are silent information loss, author/POV/reader leakage, canon or approval-state promotion, and source mutation. High risks include incorrect clustering, false precedence, vault pollution, stale views, governance duplication, and irreplaceable derived-store data.

## Planning Blockers

- RCR-006 and RC-006/RC-009 establish the repository and vault contract baseline; exact RC-006 leaf placement remains a Delivery Lead and Repository Steward determination.
- No approved scene identity and provenance standard was found; the Delivery Lead must prepare the implementation-ready authority/schema package and route any approval required before dependent writes.
- Scene Hub vault publication remains gated by RC-009 write-authority assignment and exact destination approval; this does not block non-vault Stage A implementation.
- The exact G1 and N2 pilot source manifests must be verified before scanning.
- Derived-store technology and permanent scene-ID format remain implementation-design decisions subject to the approved acceptance and authority boundaries.

## Current Disposition

Tony approved RM-032 as a High-priority Major proposal, authorized governance review, and subsequently directed that RM-032 be implemented on 2026-08-22. RM-032 is Approved for delivery. Software implementation may proceed through the Delivery Lead under RC-006. No source-document mutation, canon promotion, automatic conflict resolution, or vault write is authorized. Scene Hub vault publication remains a separately gated stage under RC-009 until Tony assigns write authority and approves the exact destination.
