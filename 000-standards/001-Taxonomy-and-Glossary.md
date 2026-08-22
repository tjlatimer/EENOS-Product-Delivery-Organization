# Taxonomy and Glossary

**Document ID:** STD-001  
**Version:** 1.1.0  
**Status:** Approved  
**Document Owner:** Product Delivery Organization  
**Related Repository Change Request:** RCR-004  
**Last Updated:** 2026-08-16

---

# Purpose

Defines the official terminology used throughout the EENOS Product Delivery Organization. All organizational documents, workflows, AI roles, repository artifacts, and standards shall use the terms defined in this glossary.

---

# Terms

| Term | Definition |
|------|------------|
| AI Handoff Package (AHP) | The standardized package used to transfer work, instructions, status, and routing information from one AI role to the next. |
| Approval Authority | The individual authorized to approve an artifact before implementation. |
| Artifact | Any version-controlled deliverable produced by the organization. |
| Artifact Specification | The governing document defining the required structure and content of a specific artifact type. |
| Commit Evidence Package | The evidence package produced by the Repository Committer containing the branch, commit hash, pull request, changed files, validation results, warnings, errors, and repository health impact. |
| Delivery Lead | The role responsible for preparing approved work for implementation and validating implementation readiness. |
| Document Owner | The role responsible for maintaining an organizational document. |
| Documentation & Knowledge Manager | The role responsible for published documentation, user documentation, support documentation, and GitBook verification. |
| Folder Specification | The standard defining the purpose, ownership, and permitted contents of a repository folder. |
| Governance Document | A document defining organizational rules, standards, authority, or policies. |
| Independent Review | A review performed by a role that did not create the artifact. |
| Metadata Standard | The standard defining the required metadata for organizational artifacts. |
| Naming Standard | The standard defining approved naming conventions for repository artifacts. |
| Organization Model Consultant | The independent organizational reviewer responsible for evaluating governance, organizational structure, AI roles, workflows, and standards. |
| Plugin | A packaged, distributable extension bundling one or more Skills, tools, or connectors for use by an organizational role. Governed as a distinct artifact type per RCR-004. |
| Repository Change Request | The formal request used to modify repository structure, governance, standards, or controlled repository artifacts. |
| Repository Committer | The implementation role responsible for committing approved artifacts into GitHub and producing a Commit Evidence Package. |
| Repository Contract | The document defining permitted operations within a repository location, including read, write, modify, archive, and approval permissions. |
| Repository Standards | The governing standards defining repository organization, structure, validation, and compliance requirements. |
| Repository Steward | The role responsible for repository organization, audits, structure, and compliance with repository standards. |
| Review Authority | The role assigned to perform an independent review of an artifact. |
| Review Authority Matrix | The governance document defining which artifacts require independent review and which role performs that review. |
| Roadmap Manager | The role responsible for selecting, defining, and prioritizing roadmap work items. |
| Skill | A governed, reusable unit of role instructions or capability that a role's `AGENTS.md` invokes by reference rather than duplicating inline. Governed as a distinct artifact type per RCR-004. |
| Task Package | The standardized package used to request work from an organizational role. |
| Task Package Specification | The governing document defining the required structure and contents of a Task Package. |
| Workflow | The approved sequence of activities used to move an artifact from creation through publication. |

---

# Usage Rules

1. These definitions are the authoritative terminology for the Product Delivery Organization.
2. Organizational documents shall use these terms consistently.
3. New organizational terms require approval before being added to this glossary.
4. Synonyms shall not replace approved terminology.

---

# Maintenance

The Repository Steward shall review this glossary whenever:

- A new organizational term is approved.
- An approved term changes.
- A new organizational role is created.
- An organizational artifact introduces terminology not defined here.

Any required updates shall be submitted as a Repository Change Request.

---

# Success Criteria

All organizational documentation uses a consistent, approved vocabulary.

This glossary remains the authoritative source for organizational terminology used throughout the Product Delivery Organization.

---

# Revision History

| Version | Date | Change | Approved By |
|---|---|---|---|
| 1.1.0 | 2026-08-16 | Added "Skill" and "Plugin" as governed artifact types per RCR-004. | Tony |
