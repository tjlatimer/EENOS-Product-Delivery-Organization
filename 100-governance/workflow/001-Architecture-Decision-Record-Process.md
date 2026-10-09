# Architecture Decision Record (ADR) Process and Lifecycle

**Document ID:** PROC-001  
**Version:** 1.0.0  
**Status:** Approved  
**Document Owner:** Product Delivery Organization  
**Approval Authority:** Tony  
**Approval Source:** RM-013 Acceptance and Tony Approval  
**Last Updated:** 2026-09-22  

---

# 1. Purpose and Scope

This procedure defines the end-to-end lifecycle, formatting standards, review requirements, and immutability rules for **Architectural Decision Records (ADRs)** within the EENOS Product Delivery Organization.

ADRs provide an authoritative, immutable historical log of significant technical, structural, and architectural choices, capturing the context, alternatives considered, tradeoffs, and consequences.

---

# 2. When an ADR Is Required

An ADR is **mandatory** whenever an organizational role, engineer, or AI agent proposes:
1. **New Subsystem or Engine Architecture:** Introducing a new story intelligence engine, runtime capability, or workspace layer (e.g., Epistemic Horizon Engine, Reveal Convergence Engine).
2. **Platform & Runtime Integrations:** Adding or changing support for AI providers, reasoning platforms, or local models (e.g., Ollama integration, Gemini API, Claude runtime).
3. **Data Storage & Contract Paradigms:** Altering how checkpoints, recovery logs, SDRs, or character identities are persisted or structured.
4. **Architectural Decoupling:** Shifting from monolithic implementations to pluggable profiles (e.g., separating core narrative analysis from universe-specific story profiles).
5. **Cross-Cutting Tooling & Governance:** Introducing new linters, automated audit tools, or repository synchronization mechanisms.

An ADR is **not required** for:
- Routine bug fixes and patch releases.
- Internal code refactoring that strictly preserves existing public contracts and behavior.
- Adding tests, synthetic fixtures, or documentation enhancements.
- Routine minor dependency updates.

---

# 3. ADR Lifecycle & State Transitions

```text
  [Draft / Proposed]
          │
          ▼
   [Under Review]
    (OMC / Peer)
          │
     ┌────┴────────────┐
     ▼                 ▼
 [Approved]       [Rejected]
  (Tony)               │
     │                 ▼
     │             [Archived]
     ▼
[Operational]
     │
     ▼
[Superseded] (by new ADR)
```

### Lifecycle States
* **`Proposed`**: The ADR has been drafted using `TMPL-ADR-001` and is ready for technical review.
* **`Under Review`**: The ADR is undergoing independent architectural review.
* **`Approved`**: Tony Latimer has explicitly accepted and signed off on the decision. The decision is now binding.
* **`Rejected`**: The decision was evaluated and declined. The document remains in the repository as a historical record of why the approach was rejected.
* **`Superseded`**: The decision has been replaced by a subsequent ADR. The superseded ADR links directly to the superseding ADR.

---

# 4. The Immutability and Supersession Rule

To maintain absolute architectural traceability:
1. **Never Rewrite History:** Once an ADR is marked `Approved`, its core context, evaluated options, and decision outcome **cannot be edited** to reflect new choices.
2. **Explicit Supersession:** When a previous architectural decision is reversed, updated, or replaced:
   - A new ADR must be drafted.
   - The new ADR must include a `Supersedes: ADR-XXX` header.
   - The original ADR must be updated to status `Superseded` with a bidirectional link: `Superseded By: ADR-YYY`.

---

# 5. Standard ADR Structure (`TMPL-ADR-001`)

Every ADR must utilize the approved template and contain the following standard sections:
1. **Metadata Header:** Standard front matter (`Document ID`, `Title`, `Status`, `Date`, `Author`, `Approver`).
2. **Context and Problem Statement:** Clear description of the technical forces, architectural challenges, and requirements driving the decision.
3. **Decision Drivers:** The key architectural priorities (e.g., non-destructive operation, multi-universe flexibility, performance).
4. **Considered Options:** At least two distinct architectural approaches evaluated.
5. **Decision Outcome:** The chosen option with a rigorous rationale explaining why it prevailed over alternatives.
6. **Consequences:** Positive benefits, negative tradeoffs, and downstream impacts on existing subsystems.
7. **Compliance & Verification:** How the implementation of this decision will be validated.
