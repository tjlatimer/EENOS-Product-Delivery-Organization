# Folder Structure Specification

**Document ID:** STD-005  
**Version:** 1.0.1  
**Status:** Approved  
**Document Owner:** Product Delivery Organization

---

# Purpose

Defines the approved repository folder structure, folder ownership, permitted content, and audit rules for the EENOS Product Delivery Organization repository.

The Repository Steward shall use this specification as the authoritative source when auditing repository structure and artifact placement.

---

# Repository Root

```text
EENOS-Product-Delivery-Organization/
├── 000-standards/
├── 100-governance/
├── 200-roadmap/
├── 300-delivery/
├── 400-documentation/
├── 500-design-history/
├── 600-repository/
├── 700-ai-organization/
├── 999-archive/
└── README.md
```

No top-level folder may be created, renamed, moved, or retired without an approved Repository Change Request.

---

# Folder Specification Authority

This document is the authoritative source for the approved top-level repository structure, ownership, purpose, permitted content, prohibited content, and structural audit rules.

Each governed folder shall contain:

- `README.md`
- `SPECIFICATION.md`

The folder-level `README.md` provides local navigation and purpose.

The folder-level `SPECIFICATION.md` shall not independently redefine the folder. It shall:

- Reference this document.
- Identify the applicable section of this document.
- Define only approved folder-specific details not already governed here.
- Remain consistent with this document.

When a conflict exists, this Folder Structure Specification controls unless superseded by an approved revision.

---

# Top-Level Folder Specifications

## 000-standards

**Owner:** Product Delivery Organization

**Purpose:** Stores approved organizational standards, terminology, naming rules, metadata rules, templates, and style guidance.

**Permitted content:**

- Taxonomy and glossary
- Repository standards
- Task Package specifications
- Repository Contract specifications
- Folder structure specifications
- Naming standards
- Metadata standards
- Templates
- Style guides

**Prohibited content:**

- Roadmap items
- Delivery workspaces
- Source code
- Acceptance results
- Repository audit reports

---

## 100-governance

**Owner:** Product Delivery Organization

**Purpose:** Stores approved organizational governance, authority, policies, workflows, and responsibility assignments.

**Permitted content:**

- Organization overview
- Organization structure
- Role governance
- RACI matrices
- Review authority
- Artifact lifecycle
- Merge authority policy
- Repository Change Request policy
- Governance policies

**Prohibited content:**

- Active delivery artifacts
- Product documentation
- Source code
- Repository audit evidence

---

## 200-roadmap

**Owner:** Roadmap Manager

**Purpose:** Stores strategic direction, roadmap priorities, milestones, backlog items, release plans, and completed roadmap records.

**Permitted content:**

- Current roadmap
- Backlog
- Milestones
- Release plans
- Completed roadmap records

**Prohibited content:**

- Implementation worksheets
- Source code
- Test evidence
- User documentation

---

## 300-delivery

**Owner:** Delivery Lead

**Purpose:** Stores active and completed delivery workspaces for approved roadmap items.

**Approved subfolders:**

- `active/`
- `blocked/`
- `ready-for-implementation/`
- `implementation/`
- `validation/`
- `acceptance/`
- `completed/`

Each roadmap item shall use a unique workspace identified by its roadmap item ID.

Example:

```text
300-delivery/active/RM-0042/
├── metadata.yaml
├── specification.md
├── delivery-review.md
├── implementation-worksheet.md
├── developer-questions.md
├── developer-report.md
├── acceptance-test-plan.md
├── acceptance-results.md
├── documentation-report.md
└── screenshots/
```

**Prohibited content:**

- Organizational governance
- AI role prompts
- Repository standards
- Unrelated source code

---

## 400-documentation

**Owner:** Documentation & Knowledge Manager

**Purpose:** Stores published documentation and support knowledge.

**Approved subfolders:**

- `wiki/`
- `user-guide/`
- `administrator-guide/`
- `support/`
- `release-notes/`
- `knowledge-base/`

**Permitted content:**

- User documentation
- Administrator documentation
- Support guides
- Release notes
- Knowledge articles
- GitBook publication content

**Prohibited content:**

- Draft implementation artifacts
- Repository audit records
- Roadmap prioritization records

---

## 500-design-history

**Owner:** Documentation & Knowledge Manager

**Purpose:** Preserves the visual evolution of the EENOS interface and documentation experience.

**Approved subfolders:**

- `ui/`
- `ux/`
- `screenshots/`
- `comparisons/`
- `evolution/`

Every visual record shall identify:

- Screen or page name
- Capture date
- Related roadmap item
- Related release or version
- Before or after state
- Description of visible changes

**Prohibited content:**

- Unidentified screenshots
- Unrelated images
- Source code
- Temporary design exports without metadata

---

## 600-repository

**Owner:** Repository Steward

**Purpose:** Stores repository governance evidence, audits, health reports, change requests, migration records, and repository history.

**Approved subfolders:**

- `repository-specifications/`
- `audits/`
- `health/`
- `change-requests/`
- `migrations/`
- `reports/`
- `history/`

**Permitted content:**

- Repository audit reports
- Repository health reports
- Repository Change Requests
- Structural migration records
- Repository history records
- Repository specifications

**Prohibited content:**

- Product source code
- Roadmap planning
- User documentation

---

## 700-ai-organization

**Owner:** Product Delivery Organization

**Purpose:** Stores AI role specifications, prompts, validation checklists, and review records.

Each role shall have one approved folder.

Approved role folders shall contain only:

- Role specification
- Platform-specific prompt
- Validation checklist
- Version history
- Review record

**Prohibited content:**

- Active delivery work
- Roadmap items
- Repository audits
- Product documentation

---

## 999-archive

**Owner:** Repository Steward

**Purpose:** Stores retired or superseded artifacts retained for historical traceability.

Artifacts shall not be placed in this folder without an approved archive action.

Archived artifacts shall retain:

- Original Document ID
- Original repository path
- Archive date
- Archive reason
- Authorizing record

---

# Placement Rules

1. Every artifact shall have one approved repository location.
2. Duplicate authoritative copies are prohibited.
3. Roles shall not create folders unless authorized by an approved Repository Change Request.
4. If no approved folder exists, the responsible role shall stop and submit a Repository Change Request.
5. Moving an artifact between governed folders requires an approved Task Package identifying the source path, target path, reason for the move, and Repository Steward as the responsible reviewing role.
6. A move that changes repository structure, ownership, or governing rules also requires an approved Repository Change Request.
7. Retired artifacts shall be archived, not deleted.
8. Git history shall remain intact when files are moved or renamed.

---

# Audit Requirements

The Repository Steward shall audit for:

- Unauthorized folders
- Missing `README.md`
- Missing `SPECIFICATION.md`
- Incorrect artifact placement
- Duplicate Document IDs
- Duplicate authoritative artifacts
- Orphaned files
- Invalid naming
- Missing metadata
- Broken references
- Unapproved archive actions

Every audit finding shall identify:

- Finding ID
- Severity
- Responsible role or commit author
- Current location
- Expected location
- Violated rule
- Corrective action
- Related commit or Pull Request

---

# Structural Change Process

When a role requires a folder that does not exist:

1. Stop work.
2. Create a Repository Change Request.
3. Identify the requested path.
4. Define its purpose.
5. Define permitted artifact types.
6. Identify the proposed owner.
7. Explain why no existing location is suitable.
8. Wait for approval and Repository Steward implementation.

---

# Success Criteria

A human or AI role can determine:

- Where an artifact belongs
- Who owns the location
- What content is permitted
- What content is prohibited
- Whether a structural change requires approval

without relying on chat history or undocumented assumptions.
