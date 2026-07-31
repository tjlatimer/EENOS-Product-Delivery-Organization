---
Document ID: FOLDER-400-DOCUMENTATION
Title: 400-documentation Folder Specification
Version: 0.1.0
Status: Draft
Owner: Documentation & Knowledge Manager
Approver: Tony
Created: 2026-07-31
Last Updated: 2026-07-31
Purpose: Defines allowed use and audit rules for `400-documentation/`.
Scope: This repository and its governed delivery artifacts.
Authority: Draft repository foundation pending Tony's approval.
Related Documents:
  - 100-governance/repository-governance/001-Repository-Architecture.md
---

# Folder Specification

## Purpose

Contains published user, administrator, support, release, wiki, and knowledge documentation.

## Owner

Documentation & Knowledge Manager

## Allowed subfolders

- `wiki/`
- `user-guide/`
- `administrator-guide/`
- `support/`
- `release-notes/`
- `knowledge-base/`

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
