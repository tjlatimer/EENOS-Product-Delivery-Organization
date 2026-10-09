# EENOS Governance Framework and Architecture Precedence

**Document ID:** GOV-001  
**Version:** 1.0.0  
**Status:** Approved  
**Document Owner:** Product Delivery Organization  
**Approval Authority:** Tony  
**Approval Source:** RM-013 Acceptance and Tony Approval  
**Last Updated:** 2026-09-22  

---

# 1. Purpose and Scope

This document establishes the master governance framework, authoritative document hierarchy, dual-domain separation, and decision precedence for the **Evolution Earth Narrative Operating System (EENOS)** Product Delivery Organization and its associated software systems.

All organizational repositories, software packages, autonomous AI agents, developer workflows, and creative runtime environments operate under the rules defined in this framework.

---

# 2. Core Governance Principles

### Principle 1: Sovereignty of Authorial Authority (`GOV-005`)
Tony Latimer is the sole and ultimate authority for:
- Constitution and governance amendments.
- Merging pull requests into any authoritative repository branch.
- Advancing roadmap items from `Validation` to `Done`.
- Promoting any story material, character identity, or lore into authoritative Story Canon.

### Principle 2: Non-Destructive Operation
No autonomous agent, AI model, linter, or automated script may alter author prose, re-sequence chapters, or delete creative drafts without explicit, verified human authorization. All story intelligence engines function strictly as advisory, diagnostic, and drafting-assistance tools.

### Principle 3: Strict Precedence and Conflict Resolution
When any two organizational documents, standards, specifications, or code implementations conflict, the artifact residing at the higher tier in the 7-Tier Precedence Hierarchy unconditionally governs.

### Principle 4: Dual-Domain Isolation (Product vs. Creative)
Product delivery infrastructure (software code, tests, CI/CD, repository architecture) and Creative Story Canon (characters, lore, timelines, prose) constitute two separate governance domains with distinct lifecycles, approval authorities, and storage paths.

### Principle 5: Immutability of Architectural Decisions
Architectural choices are documented in immutable Architectural Decision Records (ADRs). Once approved, an ADR is never edited to change a past decision; it may only be amended or superseded by a newly approved ADR.

---

# 3. The 7-Tier Precedence Hierarchy

The EENOS architecture is organized into seven distinct, ranked tiers of authority. In the event of ambiguity, discrepancy, or direct contradiction, authority flows strictly downward:

```
┌────────────────────────────────────────────────────────────────────────┐
│  Tier 0: Constitution (CONST)                                          │
│  • Immutable foundational charter, human safety, author sovereignty   │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
┌───────────────────────────────────▼────────────────────────────────────┐
│  Tier 1: Governance Policies (GOV)                                     │
│  • Organizational authority, review matrices, merge policy (GOV-005)   │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
┌───────────────────────────────────▼────────────────────────────────────┐
│  Tier 2: Architecture Decision Records (ADR)                           │
│  • Immutable technical and architectural choices, tradeoffs, contexts  │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
┌───────────────────────────────────▼────────────────────────────────────┐
│  Tier 3: Technical Standards (STD)                                     │
│  • System-wide contracts: metadata, naming, SDR schema, capability     │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
┌───────────────────────────────────▼────────────────────────────────────┐
│  Tier 4: Processes & Workflows (PROC)                                  │
│  • Step-by-step procedures for human and AI roles, handoff pipelines   │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
┌───────────────────────────────────▼────────────────────────────────────┐
│  Tier 5: Runtime & Feature Specifications (SPEC)                       │
│  • Subsystem behavioral contracts (RM-034, RM-037 specifications)      │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
┌───────────────────────────────────▼────────────────────────────────────┐
│  Tier 6: Implementation Artifacts & Source Code                        │
│  • Python packages, CLI tools, unit tests, fixtures, build scripts     │
└────────────────────────────────────────────────────────────────────────┘
```

### Detailed Tier Definitions

| Tier | Prefix | Artifact Type | Purpose & Scope | Approval Authority |
| :--- | :--- | :--- | :--- | :--- |
| **Tier 0** | `CONST` | **Constitution** | Defines existential system principles, author sovereignty, safety boundaries, and ethical invariants. | Tony Latimer |
| **Tier 1** | `GOV` | **Governance Policies** | Defines organizational structure, review matrices (`GOV-002`), artifact lifecycles (`GOV-003`), and merge authority (`GOV-005`). | Tony Latimer / OMC |
| **Tier 2** | `ADR` | **Architecture Decision Records** | Documents significant architectural choices, context, evaluated alternatives, tradeoffs, and consequences. | Tony Latimer |
| **Tier 3** | `STD` | **Technical Standards** | Defines rigid contracts, data formats, taxonomies (`STD-001`), folder structures (`STD-005`), naming (`STD-006`), and metadata (`STD-007`). | Product Delivery Org |
| **Tier 4** | `PROC` | **Processes & Workflows** | Prescribes standard operating procedures for humans and AI agents (e.g., ADR lifecycle, handoffs, session startup). | Product Delivery Org |
| **Tier 5** | `SPEC` | **Runtime & Feature Specs** | Defines functional and non-functional requirements for specific roadmap items and modules. | Delivery Lead / Tony |
| **Tier 6** | — | **Implementation Artifacts** | Concrete source code (`tools/`), test suites (`tests/`), fixtures, configuration files, and scripts. | PR Merge Authority (`GOV-005`) |

---

# 4. Precedence & Conflict Resolution Matrix

When an artifact in one tier conflicts with an artifact in another tier:

1. **`CONST` overrules everything:** Any policy, standard, specification, or code contradicting Constitutional principles is null and void.
2. **`GOV` overrules `ADR`, `STD`, `PROC`, `SPEC`, and Code:** An architectural decision or technical standard cannot violate organizational governance (e.g., an ADR cannot grant AI autonomous merge rights in violation of `GOV-005`).
3. **`ADR` overrules `STD`, `PROC`, `SPEC`, and Code:** If an approved ADR establishes a new technical architecture, existing standards and specs must be updated to conform.
4. **`STD` overrules `PROC`, `SPEC`, and Code:** A process or feature specification cannot adopt non-compliant naming, invalid metadata, or unapproved data structures.
5. **`PROC` overrules `SPEC` on Workflow:** A runtime specification cannot invent novel handoff or review requirements that bypass approved organizational processes.
6. **`SPEC` overrules Code:** Implementation code that diverges from approved specification requirements is defective, regardless of whether the code compiles or tests pass.

---

# 5. Dual-Domain Governance: Product Delivery vs. Creative Canon

To protect the integrity of the creative fiction and the reliability of software tooling, EENOS strictly bifurcates governance into two domains:

```
┌──────────────────────────────────────┐      ┌──────────────────────────────────────┐
│       PRODUCT DELIVERY DOMAIN        │      │        CREATIVE CANON DOMAIN         │
├──────────────────────────────────────┤      ├──────────────────────────────────────┤
│ • Repositories & Tools (tools/*)     │      │ • Story Canon & Lore (08_Narrative)  │
│ • Unit Tests & Test Fixtures         │      │ • Character Arc & Identities (RM-025)│
│ • AI Prompt Frameworks & Skills      │      │ • Hidden Canon Boundaries (RM-034)   │
│ • Roadmap Items & Delivery Handoffs  │      │ • Story Philosophy Profiles (RM-036) │
│ • Software Pull Requests & Issues    │      │ • Draft Prose & Chapters             │
├──────────────────────────────────────┤      ├──────────────────────────────────────┤
│ Authority: Delivery Lead / Committer │      │ Authority: Tony Latimer (Author)     │
│ Target: software-repository / git    │      │ Target: Obsidian Creative Vaults     │
└──────────────────────────────────────┘      └──────────────────────────────────────┘
```

### Domain Isolation Rules
1. **Zero Silent Canon Mutation:** A software PR, tool enhancement, or bug fix can never modify story lore, character states, or chapter text.
2. **Synthetic Fixture Quarantine:** All automated tests in the Product Domain must utilize explicitly marked synthetic fixtures (`"synthetic": true`, `"canon_state": "non_canon_test_fixture"`). Live creative manuscripts must never be used as ephemeral test fixtures.
3. **Separate Promotion Paths:**
   - Software features are merged via GitHub PRs under `GOV-005`.
   - Story ideas are promoted to Canon only through Tony's explicit creative review in the author's Obsidian vault.

---

# 6. Multi-Universe Governance Architecture

EENOS is a universal Narrative Operating System capable of powering multiple distinct creative works (e.g., *Evolution Earth*, *Modern-Day Mystical Fantasy / Zodiac Tarot*).

### Separation of Core Engines and Universe Profiles
1. **Core Engines (Universe-Agnostic):**
   - Reside in the central software repository (`tools/`).
   - Contain zero hardcoded story lore, character names, or narrative secrets.
   - Execute domain-agnostic analysis (e.g., epistemic horizon auditing, moral complexity checking, convergence calculations).
2. **Story Profiles (Universe-Specific):**
   - Reside in pluggable profile registries (`StoryPhilosophyProfile`, `StoryConvergenceProfile`).
   - Grounded in the specific creative vault for that novel.
   - Define universe-specific governing questions, factions, secrets, and threads.

---

# 7. AI Agency and Operational Constraints

All AI agents, conversational assistants, and automated workers are bound by the following operating constraints:

1. **Advisory Posture:** AI provides diagnostic critique, identifies craft anti-patterns, models epistemic gaps, and suggests craft remedies. The AI does not decide artistic intent.
2. **Permissioned Action Boundary:**
   - AI may read and analyze governed documents freely.
   - AI may draft code, tests, and documentation on feature branches.
   - AI **must never** merge pull requests, close roadmap items, mark items `Done`, or delete repositories.
3. **Anti-Hallucination & Provenance Rule:**
   - When citing canon or governance rules, AI must provide exact source citations (`Document ID`, line number, or file path). Unsubstantiated or invented rules are treated as compliance violations.
