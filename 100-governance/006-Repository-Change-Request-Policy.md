# Repository Change Request Policy

**Document ID:** GOV-006  
**Version:** 1.0.1  
**Status:** Approved  
**Document Owner:** Product Delivery Organization

---

# Purpose

Defines when a Repository Change Request (RCR) is required and the approval process for modifying the governed repository.

---

# Policy

A Repository Change Request shall be submitted before implementing any change that alters repository governance, structure, ownership, or standards.

Routine artifact creation and updates that comply with existing standards do not require a Repository Change Request.

---

# Repository Change Request Required

An RCR is required when a proposed change:

- Creates a new top-level repository folder.
- Removes a top-level repository folder.
- Creates a governed subfolder.
- Renames a governed folder.
- Renames or renumbers a governed artifact.
- Retires an individual governed artifact.
- Changes repository governance.
- Changes repository standards.
- Changes repository contracts.
- Changes ownership of a governed repository location.
- Introduces a new governed artifact type.
- Retires a governed artifact type.
- Changes repository permissions.

---

# Repository Change Request Not Required

An RCR is not required when a change:

- Creates an approved artifact.
- Updates an existing approved artifact.
- Corrects spelling, formatting, or broken links.
- Adds documents to an approved repository location.
- Creates a feature branch.
- Creates a Pull Request.

---

# Required Information

Every Repository Change Request shall include:

- Request ID
- Requestor
- Date
- Description
- Business Justification
- Impact Assessment
- Affected Repository Locations
- Governing Documents
- Approval Authority
- Approval Status

---

# Approval Workflow

1. Requestor prepares the Repository Change Request.
2. Repository Steward reviews repository impact and prepares a recommendation.
3. Organization Model Consultant performs the required independent governance review in accordance with the Review Authority Matrix.
4. Approval Authority approves or rejects the Repository Change Request.
5. Approved Repository Change Requests shall be referenced by any resulting Task Package as the Approval Source.

---

# Outcomes

## Approved

The approved Repository Change Request authorizes preparation of any required Task Package.

Implementation shall then proceed through the Artifact Lifecycle.

---

## Revision Required

The Repository Change Request is returned to the Requestor for revision.

After revision, it shall be resubmitted beginning with Repository Steward review.

---

## Rejected

Rejected Repository Change Requests shall be archived as part of the permanent governance record.

No implementation may proceed.

---

# Relationship to the Artifact Lifecycle

The Repository Change Request process is a governance approval process that precedes implementation.

When implementation is required, the approved Repository Change Request becomes the Approval Source for the resulting Task Package.

That Task Package then enters the Artifact Lifecycle beginning at the Author stage.

---

# Responsibilities

## Requestor

- Prepare the Repository Change Request.
- Provide business justification.
- Identify affected repository locations and artifacts.

---

## Repository Steward

- Review repository impact.
- Verify repository compliance.
- Recommend approval, revision, or rejection.

---

## Organization Model Consultant

- Perform the required independent governance review.
- Identify governance conflicts, omissions, and risks.
- Recommend approval, revision, or rejection.

---

## Approval Authority

- Approve or reject the Repository Change Request.
- Authorize implementation.

---

# Rules

1. Repository structure shall not change without an approved Repository Change Request.
2. Repository governance shall not change without an approved Repository Change Request.
3. Every approved Repository Change Request shall be traceable.
4. Repository Change Requests become part of the permanent repository history.
5. Repository Change Requests do not replace the Artifact Lifecycle; they authorize it when implementation is required.

---

# Success Criteria

Every repository structural or governance change is documented, independently reviewed, approved, and traceable.

Every approved Repository Change Request can be traced to the Task Package that implements it.
