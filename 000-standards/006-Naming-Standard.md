# Naming Standard

**Document ID:** STD-006  
**Version:** 1.0.1  
**Status:** Approved  
**Document Owner:** Product Delivery Organization

---

# Purpose

Defines the mandatory naming conventions for repositories, folders, documents, artifacts, branches, and identifiers used throughout the EENOS Product Delivery Organization.

---

# Principles

1. Every governed artifact shall have one unique Document ID.
2. Names shall remain stable throughout the artifact lifecycle.
3. Names shall communicate purpose rather than implementation.
4. Human readability takes precedence over unnecessary abbreviation.
5. Document numbering and Document IDs serve different purposes.

---

# Repository Names

Repository names shall use:

```text
Pascal-Case-With-Hyphens
```

Example:

```text
EENOS-Product-Delivery-Organization
```

---

# Folder Names

Top-level governed folders shall use:

```text
NNN-name
```

Examples:

```text
000-standards
100-governance
300-delivery
999-archive
```

Subfolders shall use:

```text
lowercase-with-hyphens
```

Examples:

```text
release-notes
change-requests
knowledge-base
```

---

# Governed Document Names

Governed Markdown documents shall use:

```text
NNN-Document-Name.md
```

Examples:

```text
001-Taxonomy-and-Glossary.md
004-Repository-Standards.md
005-Folder-Structure-Specification.md
```

The `NNN` filename sequence is scoped to the containing top-level folder.

The same numeric filename sequence may therefore appear in different top-level folders.

Example:

```text
000-standards/002-Task-Package-Specification.md
100-governance/002-Review-Authority-Matrix.md
```

Filename numbering does not establish global identity. The Document ID provides repository-wide identity.

---

# Document IDs

Document IDs shall use:

```text
PREFIX-NNN
```

Examples:

```text
STD-001
GOV-005
RM-042
ROLE-003
```

Document IDs are unique across the governed repository.

Document IDs are permanent and shall never be reused.

Existing governed role specifications that predate this standard shall receive a `ROLE-NNN` Document ID through an approved migration Task Package.

Until migrated, those existing specifications remain operational and shall not be treated as invalid solely because the identifier is absent.

---

# Branch Names

Feature branches shall use:

```text
feature/<artifact-id-or-name>
```

Examples:

```text
feature/std-006-naming-standard
feature/gov-006-repository-change-request-policy
```

Hotfix branches shall use:

```text
hotfix/<issue>
```

Release branches shall use:

```text
release/<version>
```

---

# Other File Names

Files that are not governed Markdown documents shall:

- Use lowercase letters, numbers, and hyphens where practical.
- Avoid spaces.
- Use meaningful names.
- Preserve required extensions.
- Follow any more specific artifact or folder standard.

Examples:

```text
metadata.yaml
overview-before.png
repository-audit-2026-07-31.md
```

Governed Markdown documents are exempt from the lowercase default and shall follow the Title-Case convention defined under Governed Document Names.

---

# Reserved Prefixes

| Prefix | Meaning |
|---|---|
| STD | Standard |
| GOV | Governance |
| RM | Roadmap Item |
| ROLE | AI Role Specification |
| DOC | Documentation |
| TMP | Template |
| RCR | Repository Change Request |
| RC | Repository Contract |

Additional prefixes require approval before use.

---

# Rules

1. Names shall not be changed without approved authorization.
2. Duplicate Document IDs are prohibited.
3. Filename numbering is scoped per top-level folder.
4. Document IDs are globally unique across the governed repository.
5. File names and Document IDs are independent.
6. Repository validation shall verify naming compliance.
7. Renaming or renumbering an approved governed artifact requires an approved Repository Change Request.

---

# Migration Requirement

The Repository Steward shall identify governed artifacts created before this standard that do not comply with required Document ID conventions.

Required corrections shall be implemented through approved Task Packages and shall preserve Git history.

---

# Success Criteria

Every governed artifact can be uniquely identified from its Document ID.

Every repository path can be interpreted consistently by humans, AI roles, and repository validation tools.
