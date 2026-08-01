# Repository Standards

**Document ID:** STD-004  
**Version:** 1.0.1  
**Status:** Approved  
**Document Owner:** Product Delivery Organization

---

# Purpose

Defines the mandatory standards governing the structure, organization, maintenance, and validation of the EENOS Product Delivery Organization repository.

These standards apply to every governed repository location, organizational role, and version-controlled artifact.

---

# Repository Principles

1. GitHub is the authoritative source of organizational truth.
2. GitBook is the published knowledge base synchronized from GitHub.
3. Every governed artifact shall reside in exactly one approved repository location.
4. Repository organization shall be deterministic and auditable.
5. Repository history shall be preserved.

---

# Repository Structure

The repository shall conform to the approved Folder Structure Specification when adopted.

Until that specification is approved, the current approved repository structure shall serve as the governing standard.

Top-level folders shall not be added, removed, or renamed without an approved Repository Change Request.

---

# Artifact Standards

Every governed artifact shall:

- Possess a unique Document ID.
- Declare a version.
- Declare a status.
- Declare a Document Owner.
- Be stored in its approved repository location.
- Follow the Naming Standard when adopted.
- Follow the Metadata Standard when adopted.

Until those standards are approved, existing approved document conventions remain the governing standard.

---

# Change Control

Repository changes shall follow:

1. Repository Change Request (when required)
2. Task Package
3. Artifact Lifecycle
4. Repository Commit
5. Merge Authority Policy

---

# Validation Requirements

Repository validation shall verify:

- Approved folder structure.
- Approved file naming conventions.
- Required metadata.
- Required governance references.
- Broken internal links.
- Duplicate Document IDs.
- Version consistency.
- Repository Contract compliance.

Validation failures shall prevent merge until corrected.

---

# Repository Responsibilities

Repository responsibilities are defined by their respective approved role specifications.

Repository Standards define compliance requirements but do not replace role specifications.

---

# Rules

1. Every governed artifact shall comply with these standards.
2. Repository validation is mandatory before merge.
3. Repository history shall not be rewritten except through approved repository maintenance procedures.
4. Repository Standards are governed artifacts and require independent review.

---

# Success Criteria

Every artifact is uniquely identifiable, correctly located, fully traceable, and validated before becoming part of the authoritative repository.

---

# Backlog Dependencies

The following standards shall be developed and approved as companion standards:

- Folder Structure Specification
- Naming Standard
- Metadata Standard

The following role specification shall be created:

- Repository Steward Role Specification
