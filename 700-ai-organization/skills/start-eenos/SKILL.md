---
name: start-eenos
description: Governed conversational EENOS startup for an exact `Start EENOS` request in an authorized EENOS project.
---

# Start EENOS

Use this Skill only when the user's complete conversational request is exactly `Start EENOS`.

## Startup procedure

1. Establish a startup guard for the current request. If this Skill has already run for that request, do not invoke it again and continue with the current role's ordinary response.
2. Suppress the project's ordinary readiness greeting while startup is active.
3. Ask for the operating mode required by the current governed RM-011 mode authority. Accept only a currently valid mode; if the authority cannot be read or the supplied mode cannot be validated, return a clear owned blocking result.
4. Ask for a nonblank mission statement. Preserve the user's wording; do not synthesize a mission.
5. Apply the governed RM-010 startup handoff using the validated mode and mission. Preserve the host project's role, authority, routing, and stop conditions throughout startup.
6. Continue until the governed startup handoff completes or a clear owned blocker is returned.
7. On success, cancellation, or blocking, clear temporary startup state. Do not leave a partial mode, mission, guard, or handoff state behind.
8. Return the startup outcome through the host role's ordinary response contract.

## Cancellation and recursion

- Treat an explicit cancellation before handoff completion as cancellation, clean up temporary state, and return control to the host role.
- Never reissue `Start EENOS`, recursively delegate, or invoke this Skill more than once for the same user request.
- Near matches, embedded phrases, additional text, different casing, and all other requests do not trigger this Skill.

## Required evidence

Record or return, as the host role permits: project/role, exact-trigger observation, Skill version, validated mode, mission presence (without inventing content), RM-010 handoff outcome, recursion-guard result, cleanup result, blocker owner when applicable, and final outcome.

This Skill does not alter the host role's authority and does not authorize repository, roadmap, governance, implementation, approval, publication, or merge actions beyond that role's existing authority.
