# Repository Contract — 600-repository/ (excluding repository-specifications/)

**Document ID:** RC-004
**Version:** 1.0.0
**Status:** Approved
**Document Owner:** Repository Steward
**Approval Authority:** Tony
**Approval Source:** Recorded Tony approval, 2026-08-03 — precedence Option 1 (RC-003 exclusively governs repository-specifications/; this contract excludes that subfolder wherever scopes overlap)
**Last Updated:** 2026-08-03

---

## 1. Contract Information

| Field | Value |
|---|---|
| Contract ID | RC-004 |
| Repository Path | `600-repository/`, excluding `600-repository/repository-specifications/` |
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
| Allowed Write | Repository Steward; Repository Committer (on approved Task Package) |
| Allowed Modify | Repository Steward; Repository Committer (on approved Task Package) |
| Allowed Archive | Repository Steward (on approved authorization) |
| Allowed Approval | Tony |

## 4. Controlled Artifacts

Confined to the approved `600-repository/` subfolders listed in `600-repository/SPECIFICATION.md`, **excluding `repository-specifications/`**, which remains exclusively governed by `RC-003`:

- `audits/` — Repository audit reports
- `health/` — Repository health reports
- `change-requests/` — Repository Change Requests
- `migrations/` — Structural migration records
- `reports/` — Repository reports
- `history/` — Repository history records

## 5. Governing Documents

- `000-standards/004-Repository-Standards.md` (STD-004)
- `000-standards/005-Folder-Structure-Specification.md` (STD-005)
- `000-standards/006-Naming-Standard.md` (STD-006)
- `000-standards/007-Metadata-Standard.md` (STD-007)
- `600-repository/SPECIFICATION.md`
- `100-governance/006-Repository-Change-Request-Policy.md` (GOV-006)

## 6. Validation

Repository validation for this location shall verify:

- Target path falls within an approved `600-repository/` subfolder listed above (repository-specifications/ excluded).
- Required metadata present per STD-007.
- Naming compliance per STD-006.
- No duplicate Document IDs — verified against live repository history (RC-001, RC-002, RC-003 confirmed distinct and pre-existing; RC-004 confirmed available at time of drafting per Committer's prior report, subject to final verification at commit time).
- No prohibited content (product source code, roadmap planning, user documentation).

## 7. Exceptions

**Exception ID:** RC-004-EXC-01
**Description:** `repository-specifications/` is excluded from this contract's scope.
**Reason:** Precedence conflict with pre-existing approved `RC-003`, resolved by Tony — child contract governs where scope overlaps.
**Approval Authority:** Tony
**Approval Date:** 2026-08-03
**Expiration Date:** None — permanent scope exclusion unless superseded by future approved revision.
