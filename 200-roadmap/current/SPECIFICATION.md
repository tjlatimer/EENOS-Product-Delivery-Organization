# Current Roadmap Folder Specification

**Document ID:** DOC-002  
**Version:** 1.0.0  
**Status:** Approved  
**Document Owner:** Roadmap Manager  
**Approval Authority:** Tony  
**Approval Source:** Recorded Tony approval of the consolidated Product Roadmap onboarding proposal dated 2026-08-02  
**Last Updated:** 2026-08-02

---

# Purpose

Defines approved folder-specific requirements for:

```text
200-roadmap/current/
```

This specification implements folder-specific controls under the approved `200-roadmap` requirements established by:

- `000-standards/005-Folder-Structure-Specification.md`

It does not approve, supersede, or change the status of:

- `200-roadmap/SPECIFICATION.md`

---

# Governing Authority

This folder is governed by:

- `000-standards/004-Repository-Standards.md`
- `000-standards/005-Folder-Structure-Specification.md`
- `000-standards/006-Naming-Standard.md`
- `000-standards/007-Metadata-Standard.md`

The `200-roadmap` section of STD-005 controls if a conflict exists.

---

# Owner

The owning role is:

```text
Roadmap Manager
```

Ownership identifies maintenance responsibility. It does not grant implementation, repository modification, approval, or merge authority.

---

# Required Files

This folder shall contain:

- `README.md`
- `SPECIFICATION.md`
- One authoritative current Product Roadmap

The initial authoritative Product Roadmap is:

```text
001-EENOS-Product-Roadmap.md
```

The `.gitkeep` placeholder shall be removed after the required files are added.

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
- Separately maintained milestone records.
- Separately maintained release plans.
- Repository audit evidence.
- Repository Change Requests.
- Task Packages.
- Product source code.
- Implementation workspaces.
- Unapproved structural artifacts.
- An obsolete `.gitkeep` after governed content is present.

---

# Authoritative Roadmap

The authoritative current Product Roadmap shall:

1. Possess a unique Document ID.
2. Use semantic versioning.
3. Use an approved lifecycle status.
4. Identify the Roadmap Manager as Document Owner.
5. Identify Approval Authority.
6. Identify a traceable Approval Source.
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

The initial approved filename is:

```text
001-EENOS-Product-Roadmap.md
```

The structural filenames required by STD-005 are:

```text
README.md
SPECIFICATION.md
```

---

# Metadata

Governed Markdown documents in this folder shall place STD-007 metadata directly beneath the document title using bold Markdown fields.

YAML front matter is not required by STD-007 and shall not replace the required field format.

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
- The `.gitkeep` placeholder has been removed.
- Exactly one authoritative current Product Roadmap exists.
- The Product Roadmap filename is compliant.
- Mandatory metadata is present.
- Document IDs are unique.
- Version formats are valid.
- Status values are approved.
- Approval evidence is present.
- Internal Markdown links are valid.
- No prohibited artifacts are present.
- No duplicate authoritative roadmap exists.
- The parent draft specification is not represented as approved.

---

# Structural Changes

The approved STD-005 structure already identifies `current/` as an authorized `200-roadmap` subfolder.

No additional subfolder may be created under this location without the authorization required by the Folder Structure Specification and Repository Change Request Policy.

---

# Success Criteria

A human or organizational role can identify the single authoritative current Product Roadmap, its owner, approval state, governing standards, and revision history without relying on undocumented context.
