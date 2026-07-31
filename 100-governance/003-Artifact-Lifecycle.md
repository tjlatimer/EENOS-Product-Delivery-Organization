# Artifact Lifecycle

**Document ID:** GOV-003  
**Version:** 1.0.1  
**Status:** Approved  
**Document Owner:** Product Delivery Organization

---

# Purpose

Defines the mandatory lifecycle for every governed artifact within the EENOS Product Delivery Organization.

No governed artifact may bypass this lifecycle unless explicitly authorized through an approved governance document.

---

# Lifecycle

```text
Author ◄─────────────────────┐
    │                        │
    ▼                        │
Independent Review (if required)
    │                        │
    ▼                        │
Approval                     │
    │                        │
 ┌──┼──────────────┐         │
 │  │              │         │
 ▼  ▼              ▼         │
Approved  Revision Required  Rejected
 │              │             │
 ▼              └─────────────┘
Repository Commit             ▼
 │                         Archived
 ▼
Pull Request
 │
 ▼
Merge
 │
 ▼
GitBook Synchronization
 │
 ▼
Operational
```

---

# Lifecycle Stages

## 1. Author

The responsible role creates or updates the artifact.

**Output**

- Draft Artifact

---

## 2. Independent Review

Performed only when required by the Review Authority Matrix.

**Output**

- Review Report
- Disposition

---

## 3. Approval

Approval authority determines whether the artifact is approved for implementation.

**Output**

- Approved
- Rejected
- Revision Required

---

## 4. Repository Commit

The Repository Committer:

- Creates a branch.
- Commits the approved artifact.
- Pushes the branch.
- Produces a Commit Evidence Package.

---

## 5. Pull Request

The Repository Committer opens a Pull Request.

The Pull Request remains open until merged or closed.

Merge authority is defined by the Merge Authority Policy.

---

## 6. Merge

Approved Pull Requests are merged in accordance with the approved Merge Authority Policy.

---

## 7. GitBook Synchronization

Approved repository content is synchronized to GitBook.

The Documentation & Knowledge Manager verifies successful publication.

---

## 8. Operational

The artifact becomes the current approved organizational standard.

Previous approved versions remain available through Git history.

---

## Artifact Revision

Any revision to an approved artifact shall begin a new lifecycle at the Author stage.

Previous approved versions remain available through Git history.

---

## Archived

Rejected artifacts remain part of the organizational record and are retained in accordance with repository retention policies.

---

# Rules

1. Every governed artifact follows this lifecycle.
2. No artifact may bypass approval.
3. No artifact may bypass repository commit.
4. GitHub is the authoritative source.
5. GitBook is the published handbook.
6. Every stage produces a version-controlled record.

---

# Success Criteria

Every governed artifact has a complete, auditable history from creation through publication.
