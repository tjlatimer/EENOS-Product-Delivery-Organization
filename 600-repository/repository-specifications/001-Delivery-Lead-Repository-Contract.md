# Repository Contract — RC-001

**Document ID:** RC-001
**Version:** 1.0.0
**Status:** Approved
**Document Owner:** Delivery Lead
**Approval Authority:** Tony
**Approval Source:** Recorded Tony approval, 2026-08-03, following ruling that first-time Repository Contract creation does not require a Repository Change Request
**Last Updated:** 2026-08-03
**Related Task Package:** TP-2026-08-03-004
**Repository Contract:** RC-003

---

## 1. Contract Information

| Field | Value |
|---|---|
| Contract ID | RC-001 |
| Repository Path | `300-delivery/` |
| Version | 1.0.0 |
| Status | Approved |

## 2. Ownership

| Field | Value |
|---|---|
| Owning Role | Delivery Lead |
| Approval Authority | Tony |

## 3. Permissions

| Permission | Authorized Role(s) | Notes |
|---|---|---|
| Allowed Read | Delivery Lead | Full read, per Section 8 of ROLE-001 |
| Allowed Write | Delivery Lead | Limited to authorized workspace artifacts within `300-delivery/`, per ROLE-001 Section 8 |
| Allowed Modify | Delivery Lead | Own workspace artifacts, prior to Repository Commit |
| Allowed Archive | Not established by this contract | No approved authority currently evidences this grant |
| Allowed Approval | None | ROLE-001 Section 3 explicitly excludes approval authority |

## 4. Controlled Artifacts

Roadmap-item delivery workspace artifacts as defined in STD-005 (`300-delivery` section) and the Delivery Lead's Implementation Handoff Package (ROLE-001 Section 6), within approved subfolders (`active/`, `blocked/`, `ready-for-implementation/`, `implementation/`, `validation/`, `acceptance/`, `completed/`).

## 5. Governing Documents

- `000-standards/004-Repository-Standards.md` (STD-004)
- `000-standards/005-Folder-Structure-Specification.md` (STD-005)
- `000-standards/003-Repository-Contract-Specification.md` (STD-003)
- `700-ai-organization/Delivery-Lead/001-Delivery-Lead-Role-Specification.md` (ROLE-001)

## 6. Validation

Repository validation shall confirm that any write or modify operation in `300-delivery/` attributed to the Delivery Lead falls within an authorized workspace artifact type, that no write occurs outside `300-delivery/`, and that no artifact in this location is represented as approved by the Delivery Lead.

## 7. Exceptions

None currently approved.
