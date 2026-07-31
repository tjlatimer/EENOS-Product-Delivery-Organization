---
Document ID: FOLDER-600-REPOSITORY
Title: 600-repository Folder Specification
Version: 0.1.0
Status: Draft
Owner: Repository Steward
Approver: Tony
Created: 2026-07-31
Last Updated: 2026-07-31
Purpose: Defines allowed use and audit rules for `600-repository/`.
Scope: This repository and its governed delivery artifacts.
Authority: Draft repository foundation pending Tony's approval.
Related Documents:
  - 100-governance/repository-governance/001-Repository-Architecture.md
---

# Folder Specification

## Purpose

Contains repository specifications, audits, health reports, change requests, migrations, and history.

## Owner

Repository Steward

## Allowed subfolders

- `repository-specifications/`
- `audits/`
- `health/`
- `change-requests/`
- `migrations/`
- `reports/`
- `history/`

## Allowed artifact types

Artifacts directly related to this folder's stated purpose and approved subfolders.

## Prohibited content

- Unrelated source code
- Duplicate copies of authoritative artifacts
- Unapproved folder structures
- Canon changes without explicit approval

## Naming rules

Use lowercase kebab-case for folders and descriptive Markdown filenames unless a role-specific specification requires otherwise.

## Required metadata

Governed Markdown documents must use the approved front matter standard once finalized under `000-standards/metadata/`.

## Audit rules

The Repository Steward verifies ownership, folder placement, naming, required metadata, duplicate artifacts, orphaned files, broken references, and unauthorized structural changes.

## Structural changes

Only the Repository Steward may implement folder creation, rename, move, or retirement after approval.
