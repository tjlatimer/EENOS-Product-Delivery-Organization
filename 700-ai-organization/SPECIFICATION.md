---
Document ID: FOLDER-700-AI-ORGANIZATION
Title: 700-ai-organization Folder Specification
Version: 0.2.0
Status: Draft
Owner: Product Delivery Organization
Approver: Tony
Created: 2026-07-31
Last Updated: 2026-07-31
Purpose: Defines allowed use and audit rules for `700-ai-organization/`.
Scope: This repository and its governed delivery artifacts.
Authority: Draft repository foundation pending Tony's approval.
Related Documents:
  - 100-governance/repository-governance/001-Repository-Architecture.md
---

# Folder Specification

## Purpose

Contains role specifications, GPT prompts, validation checklists, and independent reviews.

## Owner

Product Delivery Organization

## Allowed subfolders

- `Roadmap-Manager/`
- `Delivery-Lead/`
- `Architecture-Lead/`
- `Implementation-Engineer/`
- `Repository-Committer/`
- `Documentation-and-Knowledge-Manager/`
- `Repository-Steward/`
- `Standards-Manager/`
- `skills/` — Shared Skill location; owned by Repository Steward per STD-005 exception. See STD-005 § 700-ai-organization.

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
