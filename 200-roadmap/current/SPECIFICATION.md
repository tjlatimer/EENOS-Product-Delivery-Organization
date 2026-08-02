# Current Roadmap Folder Specification

**Document ID:** DOC-002  
**Version:** 1.0.0  
**Status:** Approved  
**Document Owner:** Roadmap Manager  
**Approval Authority:** Tony  
**Approval Source:** Recorded Tony approval of the Product Roadmap onboarding proposal dated 2026-08-02  
**Last Updated:** 2026-08-02

---

# Purpose

Defines approved folder-specific requirements for:

```text
200-roadmap/current/
```

This specification supplements the `200-roadmap` section of the approved Folder Structure Specification.

It does not redefine the authority, ownership, purpose, permitted content, or prohibited content established by that standard.

---

# Governing Authority

This folder is governed by:

- `000-standards/004-Repository-Standards.md`
- `000-standards/005-Folder-Structure-Specification.md`
- `000-standards/006-Naming-Standard.md`
- `000-standards/007-Metadata-Standard.md`
- `200-roadmap/SPECIFICATION.md`

The `200-roadmap` section of the Folder Structure Specification controls if a conflict exists.

---

# Owner

The owning role is:

```text
Roadmap Manager
```

Ownership identifies maintenance responsibility and does not grant implementation, approval, repository modification, or merge authority.

---

# Permitted Content

This folder may contain:

- One authoritative current Product Roadmap.
- `README.md`.
- `SPECIFICATION.md`.
- Approved navigation or index artifacts required to locate the current Product Roadmap.

---

# Prohibited Content

This folder shall not contain:

- Duplicate authoritative Product Roadmaps.
- Individual backlog records.
- Completed roadmap records.
- Milestone records maintained as separate artifacts.
- Release plans maintained as separate artifacts.
- Repository audit evidence.
- Repository Change Requests.
- Task Packages.
- Product source code.
- Implementation workspaces.
- Unapproved structural artifacts.

---

# Authoritative Roadmap

The authoritative current Product Roadmap shall:

1. Possess a unique Document ID.
2. Use semantic versioning.
3. Use an approved lifecycle status.
4. Identify the Roadmap Manager as Document Owner.
5. Identify Approval Authority.
6. identify a traceable Approval Source.
7. Identify its Last Updated date.
8. Follow the approved governed-document naming convention.
9. Preserve existing roadmap-item identifiers.
10. Maintain roadmap history through Git history.
11. Exist in only one authoritative current-roadmap location.

---

# Naming

The Product Roadmap shall use:

```text
NNN-Document-Name.md
```

The initial approved Product Roadmap filename is:

```text
001-EENOS-Product-Roadmap.md
```

Structural files retain the filenames required by the Folder Structure Specification:

```text
README.md
SPECIFICATION.md
```

---

# Revision

A revision to the Product Roadmap shall:

1. Follow the Artifact Lifecycle.
2. Preserve the permanent Document ID.
3. Update the semantic version when required.
4. Update `Last Updated`.
5. Record an accurate lifecycle status.
6. Preserve existing roadmap-item identifiers.
7. Preserve repository history.
8. Avoid creating a duplicate authoritative roadmap.

---

# Validation

Repository validation shall verify:

- `README.md` exists.
- `SPECIFICATION.md` exists.
- Exactly one authoritative current Product Roadmap exists.
- The Product Roadmap filename is compliant.
- Mandatory metadata is present.
- The Document ID is unique.
- Version format is valid.
- Status is an approved value.
- Approval evidence is present.
- Internal Markdown links are valid.
- No prohibited artifacts are present.
- No duplicate authoritative roadmap exists.

---

# Structural Changes

No additional subfolder may be created under this location without authorization required by the Folder Structure Specification and Repository Change Request Policy.

---

# Success Criteria

A human or organizational role can identify the single authoritative current Product Roadmap, its owner, approval state, governing standards, and revision history without relying on undocumented context.
