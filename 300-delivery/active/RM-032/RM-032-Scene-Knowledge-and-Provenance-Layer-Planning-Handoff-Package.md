# RM-032 Scene Knowledge and Provenance Layer — Planning Handoff Package

**Document Type:** Planning Handoff Package

**Version:** 1.0.0

**Status:** Approved for Delivery Lead preparation

**Document Owner:** Roadmap Manager

**Approval Authority:** Tony

**Approval Source:** Tony explicitly directed implementation on 2026-08-22

**Related Roadmap Item:** RM-032

**Priority:** High

## 1. Delivery Objective

Deliver a local, reproducible, read-only G1/N2 pilot that inventories and hashes scene-development evidence, resolves or proposes stable scene identities and aliases, extracts provenance-linked fragments without replacing source text, reports ambiguity and conflict without silently resolving them, provides a rebuildable derived query layer, and generates traceable human-readable Scene Hubs.

The implementation must make the capability genuinely executable and testable. Planning documents and repository contracts alone do not satisfy RM-032.

## 2. Authorized Outcome

The pilot shall provide:

1. A command-line or equivalently deterministic execution entry point.
2. A source-document inventory and protected pre-scan hash manifest for the approved G1 and N2 source sets.
3. A stable scene-identity registry supporting aliases, deprecated aliases, and approval-gated merge/split lineage.
4. Provenance-linked fragments preserving exact source wording, normalized interpretation, source path, source anchor when available, and independent governance/development/canon/visibility/access states.
5. A conflict and review queue for ambiguous clustering, precedence, overlap, and contradictions.
6. A local derived query store supporting identity, source, fragment, conflict, character, structure, plot, mystery, revelation, signpost, and continuity queries.
7. Generated G1 and N2 Scene Hubs with exact source traceability.
8. Incremental rescanning, stale-output detection, deterministic rebuild, idempotence, and safe interruption/recovery.
9. Automated and controlled pilot tests with a complete evidence report.

## 3. Two-Stage Delivery Boundary

### Stage A — Authorized immediately

- Implement and test the read-only scanner, schemas, registries, provenance fragments, conflict queue, derived query store, query operations, rebuild tooling, and non-vault generated Scene Hub outputs in the EENOS software repository under RC-006.
- Use an isolated implementation worktree and preserve all existing user changes.
- The Delivery Lead may select implementation technologies, including SQLite or an alternative, only after documenting how the choice satisfies local operation, deterministic rebuild, auditability, portability, and lossless-source requirements.
- The permanent identifier format is an implementation-design decision only within an approved governed scene-identity contract; it must be stable, collision-safe, scope-aware, and independent of filenames and narrative order.

### Stage B — Gated vault publication

- Do not create an Obsidian folder or write Scene Hubs into the vault during Stage A.
- Before Stage B, Tony must assign Allowed Write under RC-009 and approve the exact Scene Hub destination.
- Only generated Scene Hubs classified as novel-development artifacts may enter the vault.
- Software, databases, indexes, manifests, logs, reports, tests, and operational state remain outside Obsidian.

Stage B gating shall not block completion and validation of Stage A.

## 4. Governing Evidence

The Delivery Lead shall use:

- The authoritative RM-032 roadmap entry and planning proposal.
- RC-006 v1.1.0 Software Repository Contract.
- RC-009 v1.0.0 Evolution Earth Obsidian Vault Contract.
- Approved Information State Governance.
- RM-016 ratified platform-neutral SDR v1.1 lifecycle authority; do not depend on unapproved SDR v1.2 extensions.
- Runtime v1.4 storage boundaries.
- Active Scene Anatomy v2.2 at `H:\Obsidian\Evolution Earth\Evolution Earth\99_Templates\SCENE_ANATOMY.md`, SHA-256 `88CFBD451243E533ED6381E8F565E6F6860998BA629476315E470F897ECB6907`.
- RM-024 Story Architecture and RM-025 identity-contract precedent.
- The Organization Model Consultant review and RCR-006 disposition reflected in Product Delivery PR #32.

## 5. Source and Authority Boundaries

- Original vault documents are immutable pilot evidence.
- Modification time alone does not establish precedence.
- Normalized interpretation never replaces source text.
- Automation may propose clusters, identities, aliases, conflicts, and dispositions but may not approve consequential merge, split, precedence, current-intent, or canon decisions.
- Tony confirms ambiguous G1/N2 clusters and consequential conflict dispositions.
- No fragment or Scene Hub statement may silently advance information to Approved, Implemented, Historical, canon, POV-known, or reader-known state.
- Information State Governance lifecycle states remain separate from epistemic, retention, canon, review, visibility, POV-access, reader-access, and precedence axes.

## 6. Required Delivery Lead Work

The Delivery Lead shall produce one or more implementation-ready Task Packages that:

1. Verify the exact G1 and N2 source manifest and access before implementation.
2. Define the scene-identity/provenance schema and authority contract without changing product scope.
3. Select and justify the derived-store technology.
4. Assign exact RC-006-compliant leaf paths and obtain Repository Steward confirmation before first write.
5. Define deterministic commands for inventory, scan, review, query, generate, rebuild, and validate.
6. Define controlled fixtures and protected copies so destructive test actions never target original vault evidence.
7. Map every acceptance criterion to an executable test or evidence inspection.
8. Require a complete STD-002 Completion Record and path/hash manifest.

## 7. Minimum Acceptance Criteria

| ID | Requirement |
|---|---|
| AC-001 | Every approved G1 and N2 source is inventoried with exact path, type, size, and content hash. |
| AC-002 | Pre/post hashes prove zero source modifications. |
| AC-003 | Every fragment retains source path, source anchor where available, exact source wording, and any separate normalized interpretation. |
| AC-004 | Rejected, superseded, historical, and unresolved material remains discoverable and traceable. |
| AC-005 | Conflicts, ambiguous precedence, and uncertain clusters are reported without automatic resolution. |
| AC-006 | G1 and N2 receive stable identities and deterministic alias resolution; ambiguous identity decisions remain Tony-gated. |
| AC-007 | Merge/split lineage is approval-gated, atomic, reversible through history, and preserved across rebuilds. |
| AC-008 | Governance state, development state, canon state, review state, truth/visibility, POV access, reader access, retention, and precedence are independent and validated against leakage. |
| AC-009 | G1 and N2 Scene Hubs expose current structured state, source history, alternatives, conflicts, open questions, and exact provenance. |
| AC-010 | The derived store can be deleted and rebuilt from approved sources/manifests without losing irreplaceable information. |
| AC-011 | Two unchanged scans produce materially identical normalized outputs, excluding documented volatile metadata. |
| AC-012 | Changed sources are detected, stale Scene Hubs are marked, and incremental rescanning updates only affected derived state. |
| AC-013 | Interrupted scans recover safely without corrupting accepted prior state. |
| AC-014 | Orphaned and unclassified scene documents are reported. |
| AC-015 | No content is promoted to canon or another approval-dependent state. |
| AC-016 | No software, database, index, manifest, log, report, test, or operational artifact is written to Obsidian. |
| AC-017 | Stage A creates no new Obsidian folder and performs no vault write. |
| AC-018 | Tests include unit, integration, idempotence, rebuild, mutation-detection, conflict, alias-collision, leakage, interruption/recovery, source-preservation, and storage-boundary coverage. |
| AC-019 | The completion report lists every command, result, changed path, generated path, hash, limitation, and unresolved review item. |

## 8. Required User Test Experience

The implementation result must give Tony exact copy-and-paste commands to:

1. Inventory the G1/N2 pilot sources.
2. Run a read-only scan.
3. Review proposed scene identities and unresolved conflicts.
4. Generate or rebuild the derived store.
5. Query G1 and N2 by designation, alias, source, and category.
6. Generate both Scene Hubs outside the vault.
7. Run the complete automated validation suite.
8. Prove source hashes did not change.
9. Delete only a disposable derived-store fixture and prove deterministic rebuild.

Commands must operate on explicit approved paths and must not require Tony to infer environment variables, repository locations, or destructive targets.

## 9. Explicit Exclusions

- Full-vault migration.
- Source mutation or writeback.
- Automatic canon changes.
- Automatic conflict, precedence, merge, or split approval.
- NovelCrafter or external synchronization.
- External hosting or multi-user editing.
- Draft prose generation.
- Replacement of SDRs, workshop records, Scene Anatomy, Story Architecture, or registries.
- New Obsidian folder creation or vault writes during Stage A.

## 10. Stop Conditions

Stop the affected stage and return evidence when:

- G1/N2 source identity or authority cannot be verified.
- Implementation cannot be isolated from existing dirty repository work.
- A required source would be modified.
- State mapping would redefine approved Information State Governance.
- A technology choice would create irreplaceable derived-only information.
- Exact RC-006 leaf placement lacks Repository Steward confirmation.
- Vault publication is attempted without RC-009 write assignment and exact destination approval.
- A required acceptance criterion cannot be tested or traced to evidence.

Continue unaffected work where safe.

## 11. Required Return Package

The Delivery Lead returns an implementation-ready package to Tony containing:

- Task Package(s) for Stage A.
- Exact implementation and test paths.
- Exact G1/N2 source manifest.
- Scene identity/provenance schema or standard proposal requiring any remaining approval.
- Technology decision and rationale.
- Repository Steward leaf-placement confirmation.
- Acceptance traceability matrix AC-001 through AC-019.
- Implementation Engineer copy-and-paste instruction.
- Explicit statement that Stage B vault publication remains gated.

## 12. Return Route

Delivery Lead returns the complete implementation-ready package to Tony. Tony routes it to the Implementation Engineer. Implementation evidence returns to Tony, then to the Roadmap Manager for status reconciliation. Repository Committer and independent review remain separately governed. Tony alone approves vault write authority, exact Scene Hub destination, merge, and final lifecycle advancement.
