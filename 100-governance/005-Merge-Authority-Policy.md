# Merge Authority Policy

**Document ID:** GOV-005  
**Version:** 1.0.1  
**Status:** Approved  
**Document Owner:** Product Delivery Organization

---

# Purpose

Defines who is authorized to merge Pull Requests within the EENOS Product Delivery Organization.

This policy separates implementation authority from merge authority to preserve governance, traceability, and repository integrity.

Approval Authority approves the content of an artifact before implementation. Merge Authority performs the final verification before an approved Pull Request is merged into the repository.

---

# Policy

The Repository Committer shall not merge Pull Requests unless merge authority has been explicitly granted.

Opening a Pull Request does not imply authority to merge it.

---

# Merge Authority

| Repository | Merge Authority |
|------------|-----------------|
| EENOS Product Delivery Organization | Tony |

Future delegation of merge authority shall be established only through an approved revision to this policy.

---

# Merge Preconditions

A Pull Request may be merged only when:

1. Required reviews are complete.
2. Required approvals have been granted.
3. Repository validation has passed.
4. No unresolved blocking issues remain.
5. The Pull Request is mergeable.

---

# Pull Request Outcomes

## Merged

The Pull Request is merged into the repository.

The artifact proceeds to GitBook Synchronization in accordance with the Artifact Lifecycle.

---

## Returned for Correction

Merge Authority may return a Pull Request for correction.

Returned Pull Requests shall be assigned back to the Repository Committer.

The Repository Committer shall implement only those corrections authorized by an amended Task Package or other approved authorization referenced by the Merge Authority. The Pull Request shall then be updated and resubmitted for merge.

This outcome represents a post-commit correction cycle and shall be incorporated into a future revision of the Artifact Lifecycle.

---

# Responsibilities

## Repository Committer

- Create branches.
- Commit approved artifacts.
- Push commits.
- Open Pull Requests.
- Produce a Commit Evidence Package.
- Stop.

---

## Merge Authority

- Review the Pull Request.
- Verify approvals.
- Verify validation.
- Merge the Pull Request.
- Return the Pull Request for correction when required.

---

# Rules

1. Merge authority is independent of implementation authority.
2. Merge authority shall not be assumed.
3. Repository Committers shall stop after opening the Pull Request unless explicitly granted merge authority.
4. Every merge shall be traceable through Git history.
5. Every returned Pull Request shall retain its review history.

---

# Success Criteria

Every Pull Request has a clearly identified Merge Authority.

No Pull Request is merged without the required approvals and validation.

Every Pull Request has a defined outcome.
