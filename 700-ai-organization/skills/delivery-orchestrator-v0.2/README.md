# EENOS Delivery Orchestrator v0.2 (Proposed)

## Governance and traceability

- **Document ID:** [Unassigned — no reserved STD-006 prefix currently exists for Skill artifacts; flagged for Repository Steward]
- **Version:** 0.2.0-candidate
- **Status:** Proposed
- **Owner:** Delivery Lead
- **Derived From:** Approved EENOS Governance (GOV-002, GOV-003, STD-001, STD-002, STD-005, RC-007)
- **Authority:** Governed role specifications remain authoritative. This Skill operationalizes role handoffs and does not alter, expand, or supersede approved role authority.

A minimal Codex-native prototype that coordinates the existing Delivery Manager, Repository Committer, Implementation Engineer, and Independent Reviewer roles.

The PowerShell module supplies deterministic state transitions, checkpointing, append-only JSONL audit events, role/capability routing, and independent Git worktree verification. The Codex skill supplies the agent execution protocol. No service, database, MCP server, web UI, Trello dependency, or governance artifact is introduced.

Delivery Advisor remains an exception-only advisory role. The v0.2 normal path is Roadmap Manager → Delivery Manager → Repository Committer → Implementation Engineer → Independent Reviewer. Existing v0.1 installations and checkpoints remain separate and unchanged.

## Run deterministic tests

```powershell
pwsh -NoProfile -File .\tests\unit.ps1
pwsh -NoProfile -File .\tests\behavioral.ps1
pwsh -NoProfile -File .\tests\roadmap-entry.ps1
```

## Real-subagent acceptance

The acceptance scenario is coordinated from a Codex task because Codex agent primitives are host capabilities rather than shell APIs. Create a disposable local repository, invoke real role subagents in the required sequence, submit their JSON envelopes through the module, and retain evidence under the run directory.

The acceptance fixture explicitly authorizes isolated worktree creation inside its temporary repository. It prohibits remotes, pushes, pull requests, merges, and access to production EENOS repositories.
