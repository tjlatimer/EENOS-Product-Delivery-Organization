# Repository Change Request — Repository Committer Artifact Subfolders

**Document ID:** RCR-001
**Version:** 1.0.0
**Status:** Proposed
**Document Owner:** Repository Steward
**Approval Authority:** Tony
**Approval Source:** Pending — GOV-006 workflow not yet complete
**Last Updated:** 2026-08-03

**Requester:** Repository Steward
**Requested Date:** 2026-08-03
**Reviewed By:** Repository Steward
**Decision:** Pending
**Decision Date:** Pending

---

## Description

Add two governed subfolders to the approved Allowed Subfolders list in
`700-ai-organization/SPECIFICATION.md`: `Repository-Committer/` and
`Organization-Model-Consultant/`, consistent with the existing pattern for
the other seven AI roles.

## Business Justification

Both roles have approved or pending-approval role specifications and
operational prompts with no approved repository location to be committed
into. Without this change, neither role's governing artifacts can be
placed in the repository, blocking normal operation of both roles.

## Impact Assessment

Low impact. Adds two subfolders to an already-approved parent folder's
allowed list. Does not change folder ownership, does not affect any
existing committed artifact, and does not alter STD-005's top-level
structure.

## Affected Repository Locations

- `700-ai-organization/SPECIFICATION.md` (Allowed Subfolders list, updated)
- `700-ai-organization/Repository-Committer/` (new, created on approval)
- `700-ai-organization/Organization-Model-Consultant/` (new, created on approval)

## Proposed path

`700-ai-organization/Repository-Committer/`
`700-ai-organization/Organization-Model-Consultant/`

## Purpose

`700-ai-organization/SPECIFICATION.md` currently authorizes subfolders for
seven roles but omits Repository Committer and Organization Model
Consultant.

## Artifact types to be stored

Role specification, platform-specific prompt, validation checklist,
version history, review record — the same artifact types already approved
for the other role folders under this Folder Specification.

## Proposed owner

Architecture Lead (existing owner of `700-ai-organization/`, unchanged)

## Existing locations examined

`700-ai-organization/` and its seven currently-approved role subfolders —
none cover Repository Committer or Organization Model Consultant.

## Why no existing location is suitable

STD-005 and `700-ai-organization/SPECIFICATION.md` restrict
`700-ai-organization/` to the explicitly listed role subfolders. No other
approved location is scoped for AI role specifications and prompts.

## Governing Documents

- `000-standards/005-Folder-Structure-Specification.md` (STD-005)
- `100-governance/006-Repository-Change-Request-Policy.md` (GOV-006)
- `700-ai-organization/SPECIFICATION.md`

## Impact on repository specifications

Requires an update to `700-ai-organization/SPECIFICATION.md`'s "Allowed
subfolders" list only. No change to folder ownership, purpose, or STD-005.

## Approval Authority

Tony (final). Requires prior independent review by the Organization Model
Consultant per GOV-002.

## Approval Status

Not yet submitted for review.

## Repository Steward decision

Recommend Approval — pending Organization Model Consultant independent
review per GOV-002 and Tony's approval.

## Required migration or corrective action

None. No existing artifacts require migration; this only opens a new
approved location for artifacts not yet committed.
