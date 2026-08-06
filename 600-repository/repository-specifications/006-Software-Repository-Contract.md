# Repository Contract — Software Repository (eenos-software-development)

**Document ID:** RC-006
**Version:** 1.0.0
**Status:** Approved — operational
**Document Owner:** Repository Steward
**Approval Authority:** Tony
**Approval Source:** Approved directly by Tony on 2026-08-06 following independent Organization Model Consultant review under RCR-003.
**Last Updated:** 2026-08-06

---

## Note on scope significance

Every existing Repository Contract (RC-001–RC-005) governs a location *inside* the already-governed EENOS Product Delivery Organization repository. This contract is materially different: it extends governance for the first time to an entirely separate GitHub repository (`eenos-software-development`) that currently has **no** approved contract, no entry in the Merge Authority Policy (GOV-005), and no Folder Structure Specification coverage (STD-005 is scoped explicitly to the Product Delivery Organization repository). The "first-time contract creation does not require an RCR" ruling recorded against RC-001 is therefore not treated as applicable precedent here without Tony's explicit confirmation — this contract was routed through the full Repository Change Request path (RCR-003) rather than assumed to qualify for that shortcut.

---

## 1. Contract Information

| Field | Value |
|---|---|
| Contract ID | RC-006 |
| Repository Path | GitHub: `tjlatimer/eenos-software-development` (all branches); Local development root: `H:\Development\EENOS`, per RM-026 (Validated — Interface Cutover Pending) |
| Version | 1.0.0 |
| Status | Approved — operational |

## 2. Ownership

| Field | Value |
|---|---|
| Owning Role | Repository Steward (governance, compliance, structure) |
| Approval Authority | Tony |

Operational roles are separated consistent with the existing organization model: the Repository Steward owns this contract and repository compliance; the Implementation Engineer performs implementation writes under an approved Task Package; the Repository Committer performs all commit, branch, push, Pull Request, and (subject to Tony) merge operations. No role other than the Repository Committer creates branches or commits.

## 3. Permissions

| Permission | Authorized Role(s) |
|---|---|
| Allowed Read | All AI roles; Tony |
| Allowed Write | Implementation Engineer — only under an approved Task Package/Implementation Handoff Package naming this contract, and only within an authorized isolated branch/worktree that does not disturb pre-existing uncommitted changes without separate explicit authorization |
| Allowed Modify | Implementation Engineer, under the same conditions as Write; Repository Steward, for repository-governance or compliance corrections under separate authorization |
| Allowed Archive | Repository Steward, on approved authorization |
| Allowed Approval | Tony — final approval of implementation results and of this contract; Organization Model Consultant performs the required independent governance review of this contract itself per GOV-002 before Tony's approval |

Branch creation, commit, push, and Pull Request are not modeled as STD-003 permission rows; they remain reserved exclusively to the Repository Committer, per the role-separation model in ROLE-001 Section 8. Merge authority rests with Tony under ROLE-001 Section 8; GOV-005 alignment is pending. **Open dependency:** GOV-005's Merge Authority table currently names only the Product Delivery Organization repository. Extending explicit merge authority to `eenos-software-development` requires a parallel revision to GOV-005 and is not resolved by this contract; flagged as a related but separate corrective action.

## 4. Controlled Artifacts

Based on the repository structure observed as of 2026-08-06 (this repository has no STD-005-style folder specification; the list below is descriptive, not a numbered-folder standard):

- `98_Workflow/` — product roadmap mirror, AI Runtime standards and specifications, workflow reports, runtime checkpoints
- `20_Story_Development/` — Scene Development Records and Story Architecture Records
- `99_Templates/` — templates
- `apps/` — application/interface source
- `tools/` — runtime and utility source code and tests
- `docs/` — architecture and design documentation
- `stabilization/` — frozen baseline snapshots
- Root-level governance/release documents (`GOV_*.md`, `STD_*.md`, `RELEASE_*.md`, `README.md`, `Start-EENOS.ps1`, `requirements-wp01.txt`)

**Explicitly out of scope / not governed by this contract:** `.codex-work/`, `.codex/`, `.agents/`, `.pytest_cache/`, and any other untracked, non-ignored local scratch content. These require a separate Repository Steward disposition (provenance review, and either formal adoption or removal) before being treated as governed artifacts. See Repository Steward Finding F5 (2026-08-06 compliance determination).

## 5. Governing Documents

- `000-standards/002-Task-Package-Specification.md` (STD-002)
- `000-standards/003-Repository-Contract-Specification.md` (STD-003) — this contract's own governing specification
- `000-standards/007-Metadata-Standard.md` (STD-007), where applicable to artifacts within this repository
- `100-governance/003-Artifact-Lifecycle.md` (GOV-003)
- `100-governance/005-Merge-Authority-Policy.md` (GOV-005) — pending extension to name this repository explicitly (see Section 3 open dependency)
- `100-governance/006-Repository-Change-Request-Policy.md` (GOV-006)
- `700-ai-organization/Delivery-Lead/001-Delivery-Lead-Role-Specification.md` (ROLE-001), Section 8, for cross-role access boundaries
- Content-level authorities remain in force and are not superseded by this contract, including but not limited to `STD_Scene_Development_Record_v1.1.md`, `STD_AI_Claude_Runtime_v1.2.md`, and `PROC_Runtime_Artifact_Sync_v1.1.md`. This contract governs repository access and permissions; it does not govern artifact content.

## 6. Validation

Repository validation for this location shall verify:

- Every implementation write traces to an approved Task Package/Implementation Handoff Package that names this contract as its governing Repository Contract.
- Every implementation occurs on an authorized, isolated branch/worktree that does not overwrite, discard, reset, or silently absorb pre-existing uncommitted changes.
- No commit, branch creation, push, or Pull Request is performed by any role other than the Repository Committer; no merge is performed without Tony's authority.
- No new dependency, framework, storage design, or interface technology is introduced without corresponding governing-document authorization.
- `.codex-work/` and other untracked local-scratch content is not cited as evidence of repository compliance until it receives a separate authorized disposition.

## 7. Exceptions

None at this time.

---

## Revision History

| Version | Date | Change |
|---|---|---|
| 1.0.0 | 2026-08-06 | Initial contract prepared by Repository Steward, independently reviewed under RCR-003, and approved directly by Tony. |
