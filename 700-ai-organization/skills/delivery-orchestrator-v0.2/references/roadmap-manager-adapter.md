# Roadmap Manager Orchestration Adapter v0.2

This adapter is an interface shim. It does not modify or supersede the governed Roadmap Manager Skill.

## Invocation

The Roadmap Manager agent must read its complete governed Skill and required platform prompt before acting. Verify both files against the SHA-256 values pinned in `config/role-registry.json`. Supply an approved roadmap item, current authoritative roadmap location/state, Tony decision evidence, and the current v0.2 run envelope.

## Native result preservation

Preserve the native Planning Handoff Package and required Tony Action Card. In an explicitly authorized orchestrated run, the Tony Action Card remains evidence of the Roadmap Manager's recommended route. The standard envelope distinguishes mechanical routing from a decision actually reserved for Tony.

## Delivery assignment

For a ready item, add `delivery_assignment` containing:

- roadmap item ID and authoritative source;
- verified current roadmap state;
- Tony approval/decision references;
- bounded delivery increment and objective;
- expected outcome;
- in-scope and out-of-scope boundaries;
- known dependencies;
- planning evidence and locations;
- governing planning references;
- Delivery Manager access requirements;
- native Planning Handoff Package path.

Return `status: completed`, `requires_tony: false`, and route normally to Delivery Manager only when these fields are supported by authoritative evidence.

## Exceptions

Return a blocker and checkpoint when an authorized role can gather missing evidence. Set `requires_tony: true` only for a candidate Tony-reserved roadmap, product, priority, ownership, scope, or authority decision. Every candidate escalation is reviewed by Delivery Advisor before `awaiting_tony`.

## Boundaries

The adapter grants no implementation, worktree, software-write, review, scope-expansion, governance, approval, or authority-granting capability. It only maps the existing role output into the orchestrator interface.
