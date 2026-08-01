# Metadata Standard

**Document ID:** STD-007  
**Version:** 1.0.1  
**Status:** Approved  
**Document Owner:** Product Delivery Organization  
**Approval Authority:** Tony  
**Approval Source:** Organization Model Consultant review and Tony approval  
**Last Updated:** 2026-07-31

---

# Purpose

Defines the required metadata for governed artifacts within the EENOS Product Delivery Organization.

Metadata supports identification, ownership, lifecycle control, auditability, repository validation, and automated routing.

---

# Scope

This standard applies to governed Markdown documents and any other artifact type whose specification requires metadata.

Artifact-specific specifications may require additional metadata but shall not remove mandatory fields defined here.

---

# Metadata Format

Governed Markdown documents shall declare metadata directly beneath the document title using the approved field format.

Example:

```markdown
# Document Title

**Document ID:** STD-007  
**Version:** 1.0.0  
**Status:** Draft  
**Document Owner:** Product Delivery Organization  
**Approval Authority:** Tony  
**Approval Source:** GOV-002 Review Disposition  
**Last Updated:** 2026-07-31
```

Metadata fields shall appear before the document body.

---

# Mandatory Metadata Fields

| Field | Required | Purpose |
|---|---|---|
| Document ID | Yes | Provides repository-wide identity |
| Version | Yes | Identifies the artifact revision |
| Status | Yes | Identifies the lifecycle state |
| Document Owner | Yes | Identifies the role responsible for maintenance |
| Approval Authority | Yes for approved artifacts | Identifies who may approve the artifact |
| Approval Source | Yes for approved artifacts | References the recorded approval |
| Last Updated | Yes | Identifies the most recent approved or draft revision date |

---

# Conditional Metadata Fields

| Field | Required When |
|---|---|
| Related Roadmap Item | Artifact implements or documents roadmap work |
| Related Task Package | Artifact was created or modified through a Task Package |
| Related Repository Change Request | Artifact resulted from an approved structural or governance change |
| Repository Contract | Artifact is governed by a specific Repository Contract |
| Supersedes | Artifact replaces a previous approved artifact |
| Superseded By | Artifact is no longer current |
| Archive Date | Artifact has been archived |
| Archive Reason | Artifact has been archived |
| Related Pull Request | Artifact has been committed through a Pull Request |
| Related Release | Artifact is associated with a release |
| Capture Date | Visual artifact or screenshot |
| Screen or Page Name | Visual artifact or screenshot |
| Related Version | Visual artifact or screenshot |

---

# Approved Status Values

| Status | Meaning |
|---|---|
| Draft | Under development |
| In Review | Awaiting independent review |
| Revision Required | Returned for correction |
| Approved | Approved but not yet operational |
| Operational | Current authoritative artifact |
| Rejected | Not approved for implementation |
| Superseded | Replaced by a newer approved version |
| Archived | Retained for historical traceability |
| Deprecated | Still available but scheduled for retirement |

Additional status values require approval before use.

---

# Version Format

Versions shall use semantic versioning:

```text
MAJOR.MINOR.PATCH
```

Examples:

```text
1.0.0
1.1.0
1.1.1
2.0.0
```

Use:

- `MAJOR` for incompatible governance or structural changes.
- `MINOR` for backward-compatible additions or expanded responsibilities.
- `PATCH` for corrections that do not change authority or meaning.

Artifacts versioned before adoption of this standard retain their existing version numbers unless a later approved revision requires a new version.

---

# Date Format

Dates shall use:

```text
YYYY-MM-DD
```

Example:

```text
2026-07-31
```

---

# Approval Source

Approval Source shall reference a traceable approval record.

Valid examples include:

- Review disposition
- Approved Task Package
- Approved Repository Change Request
- Recorded Tony approval
- Pull Request approval record

Naming an Approval Authority without an Approval Source is insufficient.

---

# Ownership Rules

1. Every governed artifact shall identify one Document Owner.
2. Document Owner identifies maintenance responsibility, not necessarily authorship.
3. Ownership changes require approved authorization.
4. Shared or ambiguous ownership is prohibited.
5. Product Delivery Organization may be used as owner only when no narrower approved role owns the artifact.

---

# Visual Artifact Metadata

Screenshots and interface-evolution records shall include, either in a companion metadata file or an approved index:

- Artifact ID
- Screen or Page Name
- Capture Date
- Related Roadmap Item
- Related Release or Version
- Before or After designation
- Description of visible changes
- Source file path
- Captured By

---

# Validation Rules

Repository validation shall identify:

- Missing mandatory metadata
- Invalid Document IDs
- Invalid version format
- Invalid status values
- Missing approval evidence
- Invalid date format
- Duplicate Document IDs
- Missing ownership
- Invalid conditional metadata
- Metadata inconsistent with repository state

Validation failures on mandatory fields shall prevent merge.

---

# Migration Requirement

The Repository Steward shall identify governed artifacts created before adoption of this standard that:

- Do not contain required metadata.
- Contain metadata that does not conform to approved formats.
- Use lifecycle statuses that do not match the artifact's actual repository state.
- Remain marked `Approved` after completing merge and GitBook synchronization when `Operational` is the correct status.

Required corrections shall be implemented through approved Task Packages and shall preserve Git history.

Existing artifacts remain operational until migration is completed unless missing or inaccurate metadata creates a material governance or audit risk.

---

# Rules

1. Metadata shall be accurate at the time of merge.
2. Metadata shall be updated whenever the artifact lifecycle state changes.
3. Metadata shall not contradict repository history.
4. Metadata shall use approved terminology and formats.
5. Artifact-specific metadata requirements may extend this standard but shall not weaken it.

---

# Success Criteria

Every governed artifact can be identified, owned, validated, traced, and interpreted without relying on chat history or undocumented assumptions.
