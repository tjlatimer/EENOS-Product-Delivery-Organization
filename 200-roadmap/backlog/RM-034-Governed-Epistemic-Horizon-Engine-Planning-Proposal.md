# RM-034 — Governed Epistemic Horizon Engine

**Artifact Type:** Roadmap Planning Proposal  
**Roadmap ID:** RM-034  
**Status:** Proposal  
**Priority:** High  
**Type:** Major  
**Area:** Story Intelligence / Narrative Integrity / Knowledge Management  
**Prepared By:** Roadmap Manager  
**Prepared Date:** 2026-09-22  
**Approval Source:** Tony Latimer directed capture on 2026-09-22  
**Implementation Authority:** Not granted  

---

## 1. Planning Determination

*Evolution Earth*’s central narrative tension is powered by characters who operate with partial, asymmetric, or factually incorrect understandings of the universe:
- **Gabriel Lightner** believes Athena experimented on Sumitra and carries intense guilt and anger. *Ground truth:* Athena protected Sumitra; she never experimented on her as a test subject.
- **Sumitra** believes she is a rescued and chosen child of the Church of KAO. *Ground truth:* She was decanted as a Gen 4 Raferi, assigned to Gabriel and Athena, and acquired through a 4th Faction child-trafficking broker.
- **Noah Covarrin Lightner** knows about Irma (his internal AI) and his link to *The We*, but is completely unaware of Sumitra's existence, nor does he know that Athena's choice of his biological birth disrupted the system and catalyzed Sumitra's removal.
- **Hidden Canon Rule:** The connection between Sumitra and Noah must **never** be named in Book 1; it can only be orbited.

During extended writing sessions across dozens of chapters, an author faces severe risk of **Omniscient Bleed** (accidentally allowing a character's dialogue or interiority to reveal, react to, or imply knowledge they do not yet possess). RM-034 introduces a governed **Epistemic Firewall** to safeguard character perspectives and protect Hidden Canon.

---

## 2. Objective

Provide an author-controlled epistemic governance engine that:
1. Formulates and tracks the **Epistemic Horizon** (known facts, false beliefs, suspicions, and strictly forbidden knowledge) for each character by chronological beat.
2. Audits drafted scenes, character dialogue, and internal monologues against the character's active epistemic horizon.
3. Detects and flags omniscient leakage, unearned revelations, and premature disclosure of Hidden Canon.
4. Operates strictly in an advisory capacity, preserving author sovereignty with zero automated prose alteration.

---

## 3. Initial Scope

- **Epistemic Horizon Schema:** Deterministic JSON model recording character knowledge state (`known`, `falsely_believed`, `suspected`, `forbidden`) indexed by narrative beat.
- **Hidden Canon Protection Boundaries:** Explicit classification of narrative secrets (e.g. `HC-SUMI-NOAH-LINK`, `HC-ATHENA-INTENT`) with earliest-allowed revelation thresholds.
- **Scene Auditing Engine:** Text analysis checking character statements and thoughts against their active horizon.
- **Leakage Reporting:** Detailed advisory diagnostic highlighting potential epistemic violations with exact lines and reasoning.
- **Integration with Layered Drafting (RM-021):** Extends Layer 3 (Subtext & Withholding Matrix) into an automated knowledge boundary check.

---

## 4. Exclusions & Guardrails

- No automatic rewriting or editing of character dialogue or prose.
- No forcing characters into artificial ignorance if the author intentionally decides to advance their knowledge state.
- No public export of Hidden Canon records without author sign-off.
- Author remains sole authority (`GOV-005`) for promoting knowledge states across timeline beats.

---

## 5. Governing References

- `H:\Obsidian\Evolution Earth\Evolution Earth\08_Narrative\AUTHOR ONLY - Hidden Canon.md`
- `H:\Obsidian\Evolution Earth\Evolution Earth\08_Narrative\Embedded World Revelation (EWR).md` (`[EWR-ASYMMETRY]`)
- `RM-021 Layered Drafting Pipeline & Editorial Critique Engine`
- `RM-025 Governed Character Identity Contract`
- `RM-032 EENOS Scene Knowledge and Provenance Layer`
