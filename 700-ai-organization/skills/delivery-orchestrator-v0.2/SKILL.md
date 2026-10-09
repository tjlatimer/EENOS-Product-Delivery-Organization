---
name: eenos-delivery-orchestrator-v0-2
description: Run proposed EENOS Delivery Orchestrator v0.2 for new human-observed delivery runs, beginning with Roadmap Manager while preserving the five-role normal path and Delivery Advisor exception handling. Do not use to resume v0.1 runs.
---

## Governance and traceability

- **Document ID:** [Unassigned — no reserved STD-006 prefix currently exists for Skill artifacts; flagged for Repository Steward]
- **Derived From:** Approved EENOS Governance (GOV-002, GOV-003, STD-001, STD-002, STD-005, RC-007)
- **Authority:** Governed role specifications remain authoritative. This Skill operationalizes role handoffs and does not alter, expand, or supersede approved role authority.

# EENOS Delivery Orchestrator v0.2 (Proposed)

Coordinate existing roles; do not perform or redefine their work.

## Required role sources

- Roadmap Manager: load the governed Skill identified in `config/role-registry.json`, then apply only [references/roadmap-manager-adapter.md](references/roadmap-manager-adapter.md) to wrap its native result.
- Delivery Manager: `H:\CODEX\skills\delivery-manager\SKILL.md`
- Repository Committer: `H:\CODEX\skills\repository-committer\SKILL.md`
- Implementation Engineer: `H:\CODEX\skills\implementation-engineer\SKILL.md`
- Independent Reviewer: `H:\CODEX\skills\.system\review-agent\SKILL.md` — host-capability implementation reference only (provisional/unratified; subject to missing approved Independent Reviewer role contract limitation per RM-033).
- Delivery Advisor: `H:\CODEX\skills\delivery-advisor\SKILL.md` (exception path only)

Each role agent must read its complete skill and required references before acting. The common result envelope wraps, but never replaces, the role's native package.

## Execution

1. Create a new v0.2 run with `New-OrchestratorRun`; it begins at Roadmap Manager.
2. Invoke each role with a real Codex subagent when acceptance or live execution requires it.
3. Save each role result as JSON, then submit it with `Submit-OrchestratorResult`.
4. If the result is blocked, route only when `requires_tony` is false and the registry grants the requested capability.
5. Persist the interrupted invocation and resume token before invoking the handler.
6. Verify the handler's external evidence before resuming the interrupted role.
7. Send candidate Tony escalations, unresolved routes, capability mismatches, unsafe routes, and repeated-route loops to Delivery Advisor.
8. Independently validate every Advisor disposition against the role registry, authorization, checkpoint, Tony flag, and resume token.
9. Escalate to Tony only after a valid Advisor result establishes that a Tony-reserved decision is required.

## Exception path

Delivery Advisor is never part of the normal four-role path. It is advisory only and receives no repository-write, implementation, approval, review, scope-change, governance, or authority-granting powers.

`STOP_UNSAFE` stops the unsafe route first and does not inherently escalate. Apply the Tony-decision test independently: route an existing authorized role when it can safely gather evidence or resolve the condition; otherwise escalate only for a Tony-reserved decision.

An Advisor recommendation cannot make an unauthorized route valid. Reject schema mismatches, self-routes, unregistered roles, capability mismatches, inconsistent Tony flags, and resume instructions that do not match the checkpoint.

## Normal v0.2 path

`Roadmap Manager → Delivery Manager → Repository Committer → Implementation Engineer → Independent Reviewer`

Roadmap Manager verifies the selected item's authoritative state and produces a bounded delivery assignment. It does not implement, create worktrees, modify software, review, expand scope, grant authority, or make Tony-reserved product decisions.

Keep the native Roadmap Manager Planning Handoff Package and Tony Action Card. The adapter adds the common result envelope; it does not replace or redesign the governed role.

Any Roadmap Manager candidate escalation passes through Delivery Advisor before `awaiting_tony`.

## Version isolation

Use this Skill only for new v0.2 runs. Do not load, rewrite, migrate, or resume v0.1 checkpoints with the v0.2 runtime. Existing v0.1 runs remain owned by the v0.1 Skill and runtime.

## Safety

- Git and GitHub are authoritative for implementation state.
- The coordinator writes only run artifacts; repository mutations belong to an authorized role.
- Resolve exact paths and reject paths outside the authorized repository root.
- Never reset hard, force-push, rewrite history, delete branches, merge, or recursively delete.
- Never push or create a pull request in the v0.1 acceptance test.
- Preserve unrelated work and verify Git state after every mutation.

## Prototype worktree authority

Only the disposable acceptance fixture grants Repository Committer authority to create and manage an isolated worktree inside that fixture repository. This is test authorization, not a role-contract or governance change.
