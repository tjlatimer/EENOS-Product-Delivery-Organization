# Repository Contract — RC-008

**Document ID:** RC-008  
**Version:** 1.0.0  
**Status:** Approved  
**Document Owner:** Repository Steward  
**Approval Authority:** Tony  
**Approval Source:** Recorded Tony approval, 2026-08-16, under the first-time-contract-creation ruling established for RC-001 (confirmed via RC-003 text); DEF-RM-010-001 Runtime Resolution  
**Last Updated:** 2026-08-16

## 1. Contract Information

| Field | Value |
|---|---|
| Contract ID | RC-008 |
| Repository Path | `700-ai-organization/Repository-Committer/`, `700-ai-organization/Roadmap-Manager/` |
| Version | 1.0.0 |
| Status | Approved |

## 2. Ownership

| Field | Value |
|---|---|
| Owning Role | Architecture Lead (per STD-005/`SPECIFICATION.md`'s general 700-ai-organization ownership — no carve-out proposed here, unlike the Skills exception) |
| Approval Authority | Tony |

## 3. Permissions

| Permission | Authorized Role(s) | Notes |
|---|---|---|
| Allowed Read | All roles | Organization-wide reference |
| Allowed Write | Repository Committer | Only for artifacts authorized by an approved Task Package |
| Allowed Modify | Repository Committer | Same basis |
| Allowed Archive | Repository Steward | Per STD-005 archive authority |
| Allowed Approval | Tony | Following OMC review when a governed role specification is later proposed (GOV-002) |

## 4. Controlled Artifacts

Platform-specific prompt only, at this time — per STD-005's permitted-content list. Role specification, validation checklist, version history, and review record remain **not yet populated**, pending the separately-tracked permanent role-specification work (GAP-2026-08-16-002). This contract does not assert those artifacts exist.

## 5. Governing Documents

STD-004, STD-005 (700-ai-organization section), STD-003, DEF-RM-010-001 Runtime Resolution (2026-08-16) as temporary governing authority in the absence of an approved role specification.

## 6. Validation

Confirm any write is authorized by an approved Task Package. Confirm committed platform-prompt content matches the source `AGENTS.md` content Tony directly authorized, without unauthorized alteration.

## 7. Exceptions

**RC-008-EXC-01:** These two folders' platform-prompt artifacts are governed temporarily by Tony's direct DEF-RM-010-001 authorization rather than an approved role specification. Expires upon approval of a permanent Repository Committer / Roadmap Manager role specification, at which point this contract should be revised to cite it.
