# Review Authority Matrix

**Document ID:** GOV-002  
**Version:** 1.0.0  
**Status:** Approved  
**Document Owner:** Product Delivery Organization

---

# Purpose

Defines which organizational role is responsible for reviewing each type of artifact produced by the EENOS Product Delivery Organization.

The objective is to ensure every significant organizational decision receives independent review while avoiding unnecessary review of routine delivery artifacts.

---

# Review Principles

1. Review only where it adds measurable value.
2. Review organizational decisions independently.
3. Do not create unnecessary review bottlenecks.
4. Routine delivery artifacts follow the delivery workflow and do not require organizational review.
5. No role may approve its own work.

---

# Review Authority Matrix

| Artifact Type | Review Required | Owning Role | Independent Reviewer |
|---|---|---|---|
| Organization Structure | Yes | Product Delivery Organization | Organization Model Consultant |
| Organization Chart | Yes | Product Delivery Organization | Organization Model Consultant |
| Governance Documents | Yes | Product Delivery Organization | Organization Model Consultant |
| Repository Architecture | Yes | Product Delivery Organization | Organization Model Consultant |
| Repository Standards | Yes | Product Delivery Organization | Organization Model Consultant |
| AI Role Specifications | Yes† | Product Delivery Organization | Organization Model Consultant |
| AI Prompt Specifications | Yes | Product Delivery Organization | Organization Model Consultant |
| Workflow Definitions | Yes | Product Delivery Organization | Organization Model Consultant |
| RACI Matrix | Yes | Product Delivery Organization | Organization Model Consultant |
| Organizational Policies | Yes | Product Delivery Organization | Organization Model Consultant |
| Task Package Specification | Yes | Product Delivery Organization | Organization Model Consultant |
| Repository Contract | Yes | Product Delivery Organization | Organization Model Consultant |
| Repository Change Request | Yes | Repository Steward | Organization Model Consultant |
| Taxonomy & Glossary | No* | — | — |
| Repository README | No | — | — |
| Folder README | No | — | — |
| Folder Specification | No | — | — |
| Roadmap Items | No | Roadmap Manager | — |
| Feature Specifications | No | Delivery Lead | — |
| Implementation Worksheets | No | Delivery Lead | — |
| Test Plans | No | Delivery Lead | — |
| Repository Commits | No | Repository Committer | — |
| Repository Audits | No | Repository Steward | — |
| User Documentation | No | Documentation & Knowledge Manager | — |
| Support Documentation | No | Documentation & Knowledge Manager | — |
| Release Notes | No | Documentation & Knowledge Manager | — |

\*Review is only required if the Taxonomy introduces or changes organizational terminology or governance concepts.

†See Review Exceptions.

---

# Review Trigger

An artifact shall be submitted to the Organization Model Consultant when it:

- Changes organizational structure.
- Changes governance.
- Changes authority.
- Changes workflow.
- Introduces a new organizational role.
- Changes repository architecture.
- Defines a new organizational standard or policy.

---

# Review Exceptions

The Organization Model Consultant's own role specification, prompt, and operating model shall not be independently reviewed by the Organization Model Consultant.

They shall be reviewed directly by Tony.

---

# Approval Authority

Review does not constitute approval.

Final approval authority remains with Tony unless delegated through an approved governance document.

---

# Workflow

```text
Author
    │
    ▼
Reviewer
    │
 ┌──┴────────────┐
 │               │
 ▼               ▼
Approved     Revision Required
 │               │
 ▼               │
Approval ◄───────┘
 │
 ▼
Repository Committer
 │
 ▼
GitHub
 │
 ▼
GitBook
```

---

# Document Ownership

**Maintenance Responsibility**

Repository Steward shall review this matrix whenever:

- A new governed artifact type is approved.
- A new organizational role is created.
- A governance document is retired.
- A repository standard is added or removed.

Any required updates shall be submitted as a Repository Change Request.

---

# Success Criteria

Every artifact has a clearly defined review path.

Independent review is performed only where it provides measurable organizational value.

Routine operational documents proceed through the delivery workflow without unnecessary organizational review.
