# RM-038 — Multi-Tier Audit and Change Logging Engine

**Artifact Type:** Roadmap Planning Proposal  
**Roadmap ID:** RM-038  
**Status:** Proposal  
**Priority:** High  
**Type:** Major  
**Area:** Runtime Infrastructure / Governance / Provenance  
**Prepared By:** Roadmap Manager  
**Prepared Date:** 2026-09-22  
**Approval Source:** Tony Latimer directed capture on 2026-09-22  
**Implementation Authority:** Not granted  

---

## 1. Planning Determination

Developing a complex, decade-long multi-threaded novel universe (*Evolution Earth*) while evolving an autonomous operating system (EENOS) produces a continuous stream of creative decisions, lore modifications, and software capability changes. Currently:
1. **Conversational sessions** (AI brainstorming, drafting critique, intent formulation) are scattered across ephemeral chat contexts without a structured, searchable archival record.
2. **Vault mutations** (note creations, lore refinements, character sheet updates, canon promotions, and SDR alterations in the Obsidian vault) lack an immutable, human-readable centralized audit ledger.
3. **Software capability and runtime shifts** (new framework tools, script fixes, schema changes) lack a formalized, automated repository-level change tracking mechanism.

RM-038 establishes a unified, three-tier audit and change-logging infrastructure across EENOS to guarantee complete creative, lore, and runtime provenance without compromising novel vault purity or authorial voice.

---

## 2. Objective

Provide a robust, multi-tier provenance and audit capability that:
1. **Tier 1 — Chat Session Logging:** Automatically archives interactive author sessions into dual-artifact records (plain Markdown transcripts `.md` + structured JSON metadata `.json`) located strictly outside the creative narrative vault (e.g. `98_Workflow/Logs/Chat_Sessions/`).
2. **Tier 2 — Vault Change Log:** Maintains a persistent, human-readable audit ledger at `98_Workflow/VAULT_CHANGELOG.md` inside the Obsidian vault, tracking every file creation, modification, canon promotion, and SDR lifecycle event with author rationale and hash/diff markers.
3. **Tier 3 — Software Change Log:** Standardizes automated, governed `CHANGELOG.md` documentation following the *Keep a Changelog* specification and Semantic Versioning (SemVer) across `eenos-software-development` and `EENOS-Product-Delivery-Organization`.

---

## 3. Initial Scope

- **Chat Session Archival:**
  - Standardized session log filenames (e.g., `SESSION_<YYYYMMDD>_<UUID>.md` and `.json`).
  - Metadata schema: Session ID, timestamp, model provider and parameters, active operational mode, prompt/response pairs, author decisions recorded, and referenced/generated SDRs.
  - Full-text searchability and tag indexing across historical writing and critique sessions.
- **Vault Change Ledger (`98_Workflow/VAULT_CHANGELOG.md`):**
  - Append-only or structured tabular ledger capturing date/time, target path, mutation type (`CREATE`, `UPDATE`, `PROMOTE_CANON`, `ARCHIVE`), author rationale, and change summary.
  - Event-driven logging hooks when EENOS tools or SDR workflows alter vault artifacts.
  - Periodic integrity reconciliation verifying that vault state matches recorded ledger entries.
- **Software Changelog Governance:**
  - Formal `CHANGELOG.md` maintenance integrated into release and delivery pipelines.
  - Automatic changelog section population from pull requests, conventional commits, and milestone closures.

---

## 4. Exclusions & Guardrails

- **Zero Canon Pollution:** Chat session logs, prompts, and raw AI transcripts must NEVER be stored inside the primary narrative or lore folders of the Obsidian vault.
- **Author Sovereignty (`GOV-005`):** The audit engine records mutations and author intent; it does not restrict author edits or enforce mandatory paperwork during creative flow.
- **Performance & Non-Interference:** Logging operations must be asynchronous or lightweight, preventing any blocking lag during interactive authoring or vault browsing.

---

## 5. Governing References

- `H:\Obsidian\Evolution Earth\Evolution Earth\98_Workflow\VAULT_CHANGELOG.md`
- `H:\Development\EENOS\98_Workflow\ROADMAP_EENOS_Product.md`
- `GOV-002 EENOS Governance Review Classification`
- `GOV-005 Merge Authority Policy`
- `RM-001–RM-005 Scene Development Record Lifecycle`
- `RM-012 Runtime Artifact Synchronization`
- `RM-032 EENOS Scene Knowledge and Provenance Layer`
