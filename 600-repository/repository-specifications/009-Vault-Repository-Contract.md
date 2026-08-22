# Repository Contract — Evolution Earth Obsidian Vault

**Document ID:** RC-009
**Version:** 1.0.0
**Status:** Approved
**Document Owner:** Repository Steward
**Approval Authority:** Tony
**Approval Source:** Repository Steward drafted (RCR-006 batch); Organization Model Consultant independent review completed, Recommend Approval; Tony approval recorded 2026-08-22.
**Last Updated:** 2026-08-22

---

## Note on scope significance

This is the first Repository Contract to govern a location outside any GitHub repository. STD-003 requires "every governed repository location shall have one Repository Contract" before that location is a place artifacts get authoritatively placed; no contract previously existed for the vault, so nothing could be bindingly classified into it. This contract exists to close exactly that gap — not to authorize any specific write yet (see Section 3).

## 1. Contract Information

| Field | Value |
|---|---|
| Contract ID | RC-009 |
| Repository Path | Local vault: `H:\Obsidian\Evolution Earth\Evolution Earth\` (path as observed under granted session access; Tony to confirm this is the intended authoritative vault root if a different root is meant) |
| Version | 1.0.0 |
| Status | Approved |

## 2. Ownership

| Field | Value |
|---|---|
| Owning Role | Repository Steward |
| Approval Authority | Tony |

## 3. Permissions

| Permission | Authorized Role(s) |
|---|---|
| Allowed Read | All AI roles; Tony |
| Allowed Write | **Not yet assigned.** No AI role currently has write authority into this vault location under approved governance. Assignment requires separate Tony authorization once a specific Scene Hub generation mechanism and role are proposed (expected: Implementation Engineer or a runtime process, under an approved Task Package — not decided by this contract). |
| Allowed Modify | Not yet assigned, same basis as Allowed Write |
| Allowed Archive | Repository Steward, on approved authorization |
| Allowed Approval | Tony |

## 4. Controlled Artifacts

**Scene Hub** — the sole controlled artifact type under this contract. A Scene Hub is eligible for this location only after it is classified as a novel-development artifact and its exact destination subpath is separately confirmed (RM-032 Work Plan Step 4: Organization Model Consultant classification, Repository Steward compliance confirmation, Tony approval — not yet completed as of this contract's approval).

**Explicitly out of scope:** software, databases, indexes (including any derived query store such as SQLite), logs, test output, and operational reports. This scope boundary reflects the originating RM-032 proposal's own Explicit Exclusions (Section 5: "Store software, databases, indexes, logs, test output, or operational reports in Obsidian") and Storage Classification Recommendation (Section 9). RM-032 itself remains at Proposal status and is not treated as governing authority here — this contract adopts the same boundary independently, as approved by Tony.

## 5. Governing Documents

- `000-standards/003-Repository-Contract-Specification.md` (STD-003) — this contract's own governing specification
- `000-standards/007-Metadata-Standard.md` (STD-007), where applicable
- `100-governance/006-Repository-Change-Request-Policy.md` (GOV-006)
- Content-level creative/narrative authorities (Scene Anatomy, SDR lifecycle, Story Architecture) remain in force and are not superseded by this contract; this contract governs repository access and permissions, not artifact content.

## 6. Validation

Repository validation for this location shall verify:

- No artifact type other than a classified Scene Hub is written here.
- No write occurs until Allowed Write is separately assigned by Tony (Section 3).
- Any Scene Hub written traces to a completed RM-032 Work Plan Step 4 classification and an approved Task Package.

## 7. Exceptions

None at this time. The unassigned Allowed Write/Modify permissions (Section 3) are a deliberate open item, not an exception — no write may occur until Tony assigns it.

---

## Revision History

| Version | Date | Change |
|---|---|---|
| 1.0.0 | 2026-08-22 | Initial contract. Repository Steward drafted; Organization Model Consultant independent review completed (Recommend Approval); Tony approval recorded 2026-08-22. |
