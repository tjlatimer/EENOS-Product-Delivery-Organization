# Start EENOS Behavioral Contract

## Trigger contract

The only trigger is a user's complete conversational request exactly equal to `Start EENOS`. It runs once, suppresses the ordinary readiness greeting during startup, and never recursively delegates. Near matches and all other requests follow ordinary role behavior.

## Startup contract

Startup collects and validates a current RM-011 mode, collects a nonblank user-authored mission, and performs the governed RM-010 handoff. It preserves the host role and returns either a completed handoff or a clear blocker owned by the appropriate authority.

Cancellation or blocking clears every temporary startup value. The Skill does not infer a mode or mission and does not expand any host role's authority.

## Acceptance traceability

| Criterion | Required behavior |
|---|---|
| C-AC-001 | Delivery Lead exact trigger starts governed startup and suppresses ordinary greeting. |
| C-AC-002 | Implementation Engineer, Repository Committer, and Roadmap Manager do the same in fresh tasks. |
| C-AC-003 | Startup reaches RM-010 handoff or returns a clear owned blocker with cleanup. |
| C-AC-004 | Near matches and non-triggers retain ordinary behavior. |
| C-AC-005 | Delegation occurs once with no recursion. |
| C-AC-006 | Host role remains intact after non-trigger, cancellation, or blocker. |
| C-AC-007 | Existing five PowerShell files remain unchanged and their regression tests are rerun later. |
| C-AC-008 | Required startup evidence fields are available. |
| C-AC-009 | Validation uses fresh observations for governed acceptance criteria. |
| C-AC-010 | Final inventory remains within the authorized target set. |
