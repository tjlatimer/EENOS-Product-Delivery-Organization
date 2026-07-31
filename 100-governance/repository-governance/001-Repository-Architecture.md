---
Document ID: GOV-REPO-001
Title: Repository Architecture
Version: 0.1.0
Status: Draft
Owner: Repository Steward
Approver: Tony
Created: 2026-07-31
Last Updated: 2026-07-31
Purpose: Defines the authoritative GitHub repository structure and placement rules.
Scope: This repository and its governed delivery artifacts.
Authority: Draft repository foundation pending Tony's approval.
Related Documents:
  - 100-governance/repository-governance/001-Repository-Architecture.md
---

# Repository Architecture

## Governing principles

1. Every folder has one accountable owner.
2. Every artifact has one approved home.
3. Roadmap items are traceable from specification through acceptance and documentation.
4. Top-level folders may be created, renamed, or retired only by the Repository Steward after approval.
5. The Repository Steward audits actual repository contents against this specification.
6. Every structural change is preserved in Git history and recorded under `600-repository/history/`.

## Root structure

```text
EENOS-Product-Delivery/
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

## Folder conventions

Every governed folder contains:

- `README.md`: concise navigation and usage guidance.
- `SPECIFICATION.md`: authoritative placement, ownership, permission, and audit rules.

## Roadmap-item workspace convention

Each delivery item uses a unique identifier and a self-contained workspace, for example:

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
    ├── before/
    └── after/
```

Not every artifact is required at item creation. Required artifacts are added as the item advances through its approved lifecycle.

## Structural-change behavior

When a role needs a folder that does not exist:

1. Do not create the folder.
2. Create a Repository Change Request using `600-repository/change-requests/TEMPLATE.md`.
3. State the proposed path, purpose, artifact types, owner, and why no existing folder is suitable.
4. Wait for the Repository Steward's disposition: approve, reject, or redirect to an existing location.

## Audit output requirements

Every detected error must report:

- rule violated;
- responsible role or commit author when available;
- current location;
- expected location;
- severity;
- corrective action;
- detection date;
- related commit or pull request when available.

## Revision history

| Version | Date | Change |
|---|---|---|
| 0.1.0 | 2026-07-31 | Initial repository architecture scaffold |
