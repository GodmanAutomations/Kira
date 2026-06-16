# Skill Router

This is the Coding Anchor routing layer for Athena's 26 example skills. It
keeps skill use retrieval-led and prevents copying the whole library into boot
context.

Verified: 2026-06-14

## Routing Rule

1. If the task is about Athena context, run `bin/athena-coding-anchor-search`.
2. If the task is implementation, use `skills/atomic-execution/SKILL.md`.
3. If a source skill matches, read its `SKILL.md` before using it.
4. Adopt a source skill into this packet only when it changes repeated Codex
   behavior and its paths work in this checkout.
5. Do not invoke source skills with missing scripts, missing directories, or
   private workspace assumptions until repaired.
6. Before checkpointing a long adoption run, use
   `protocols/readiness-checkpoint-gate.md` and
   `bin/athena-coding-anchor-readiness`.

## Adopted Now

| Skill | Local Path | Use When |
| :--- | :--- | :--- |
| `semantic-search` | `skills/semantic-search/SKILL.md` | Find Athena workflows, protocols, docs, memory, or prior patterns before deciding. |
| `atomic-execution` | `skills/atomic-execution/SKILL.md` | Turn a plan into one small, verification-gated implementation slice. |
| `diagnostic-refactor` | `skills/diagnostic-refactor/SKILL.md` | Produce a read-only bill of materials before changing messy or stale surfaces. |
| `red-team-review` | `skills/red-team-review/SKILL.md` | Stress-test significant artifacts before shipping, merging, or calling them ready. |
| `spec-driven-dev` | `skills/spec-driven-dev/SKILL.md` | Create a compact design spec before unclear or multi-file feature work. |
| `micro-commit` | `skills/micro-commit/SKILL.md` | Split verified work into intentional checkpoints when Stephen says save, lock it in, ship it, done, next, or checkpoint. |
| `visual-verify-ui` | `skills/visual-verify-ui/SKILL.md` | Verify frontend, layout, and visual artifact work with browser or screenshot evidence. |
| `context-compactor` | `skills/context-compactor/SKILL.md` | Preserve long-session state, current branch, verification, and next slice in a compact handoff. |
| `deep-research-loop` | `skills/deep-research-loop/SKILL.md` | Research external/current facts with source, conflict, and confidence discipline. |
| `decision-journal` | `skills/decision-journal/SKILL.md` | Record meaningful choices, assumptions, alternatives, and post-mortem classifications. |
| `circuit-breaker` | `skills/circuit-breaker/SKILL.md` | Pause repeated failures, fatigue, compulsive retries, or damaging autonomous loops. |
| `mcda-solver` | `skills/mcda-solver/SKILL.md` | Score multi-factor decisions with weighted criteria, dealbreakers, and sensitivity checks. |
| `brand-foundations` | `skills/brand-foundations/SKILL.md` | Build brand guides for naming, voice, positioning, value, proof, and visual direction. |
| `distribution-physics` | `skills/distribution-physics/SKILL.md` | Check PMOD, channels, acquisition friction, unit economics, and Four Fits before launch work. |
| `seo-auditor` | `skills/seo-auditor/SKILL.md` | Audit public pages for metadata, structure, internal links, content gaps, and search visibility. |
| `consiglieri-protocol` | `skills/consiglieri-protocol/SKILL.md` | Review high-stakes meetings, partnerships, collaborations, and loaded messages for trust and safety. |
| `trading-risk-gate` | `skills/trading-risk-gate/SKILL.md` | Review ruin classes, ergodicity, survival probability, and WR/RR assumptions before repeated exposure. |
| `zenith-execution` | `skills/zenith-execution/SKILL.md` | Plan sizing, invalidation, simulation, drawdown, and pause rules after a risk gate passes. |
| `statistical-analysis` | `skills/statistical-analysis/SKILL.md` | Audit data quality, assumptions, test choice, effect sizes, and practical interpretation. |
| `trade-journal-analyzer` | `skills/trade-journal-analyzer/SKILL.md` | Review repeated-action records for noise, execution gap, structural flaw, or edge decay. |
| `academic-delivery` | `skills/academic-delivery/SKILL.md` | Plan and verify formal reports, essays, decks, proposals, capstones, assignments, and client documents. |
| `power-inversion` | `skills/power-inversion/SKILL.md` | Protect negotiation leverage with BATNA mapping and commitment devices before releasing value. |
| `client-pricing` | `skills/client-pricing/SKILL.md` | Prepare quotes with scope, anchor, floor, payment terms, and pushback boundaries. |

## Adopt Soon

| Skill | Source Path | Why Next |
| :--- | :--- | :--- |
| None currently | - | Remaining source skills either need repair or should stay outside the boot packet. |

## Use From Source

| Skill | Source Path | Trigger Family |
| :--- | :--- | :--- |
| None currently | - | Use adopted local skills first; inspect source skills directly only during future repair/adoption passes. |

## Needs Repair Before Use

| Skill | Source Path | Issue |
| :--- | :--- | :--- |
| `semantic-search` | `examples/skills/research/semantic-search/SKILL.md` | Source skill points to stale `examples/scripts/smart_search.py`; local adopted version points to `.agent/scripts/smart_search.py`. |
| `marketing-swarm` | `examples/skills/business/marketing-swarm/SKILL.md` | References missing `.agent/swarms/marketing_team/` in this checkout. |
| `git-worktree-swarm` | `examples/skills/coding/git-worktree-swarm/SKILL.md` | References older protocol paths; use only after a dedicated multi-worktree repair pass. |
| `synthetic-parallel-reasoning` | `examples/skills/research/synthetic-parallel-reasoning/SKILL.md` | References missing `.agent/scripts/parallel_orchestrator.py`; examples script may exist elsewhere, but boot should not rely on it yet. |

## Classification Notes

- `examples/skills/` contains 26 `SKILL.md` files in this checkout.
- Several source skills encode private or domain-specific operating patterns.
  Use them from source unless repeated Athena boot work proves they belong in
  this packet.
- The current boot packet intentionally adopts only foundation skills:
  retrieval first, spec before feature work, diagnosis before refactor,
  adversarial review before shipping, one verified execution slice, then
  checkpoint hygiene that does not require Stephen to say `commit`, visual
  proof for UI work, compact handoffs for long sessions, research discipline
  for external facts, decision notes for meaningful choices, MCDA for weighted
  choices, circuit breakers for damaging loops, then power inversion for
  negotiation leverage, client pricing boundaries, brand foundations for
  naming, voice, positioning, and visual direction, then distribution physics
  for launch and channel viability, then SEO auditor for public/search
  surface triage, Consiglieri for trust and social-contract review, then
  trading-risk-gate and zenith-execution as generalized repeated-risk and
  execution-constraint gates, then statistical analysis for data and
  experiment interpretation, then trade-journal-analyzer as generalized
  post-action analytics.
- Academic delivery is adopted as a formal deliverable gate, preserving intake,
  V1-is-not-delivery, mandatory red-team, revision, compile, and exit checks
  while removing school-specific source framing.
- Readiness is a protocol/helper lane, not a source skill adoption: it exists
  to make checkpoint and handoff decisions concrete after many slices.
