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

## Adopt Soon

| Skill | Source Path | Why Next |
| :--- | :--- | :--- |
| `circuit-breaker` | `examples/skills/quality/circuit-breaker/SKILL.md` | Useful as a stop rule for fatigue, losing streaks, or repeated failed autonomous loops. |

## Use From Source

| Skill | Source Path | Trigger Family |
| :--- | :--- | :--- |
| `brand-foundations` | `examples/skills/business/brand-foundations/SKILL.md` | Brand, positioning, voice, visual identity. |
| `client-pricing` | `examples/skills/business/client-pricing/SKILL.md` | Quote, rate card, scope creep, commercial pricing. |
| `distribution-physics` | `examples/skills/business/distribution-physics/SKILL.md` | Go-to-market, channels, acquisition, launch viability. |
| `seo-auditor` | `examples/skills/business/seo-auditor/SKILL.md` | SEO audit, Lighthouse-style checks, ranking issues. |
| `mcda-solver` | `examples/skills/decision/mcda-solver/SKILL.md` | Multi-criteria decision matrices and weighted scoring. |
| `trading-risk-gate` | `examples/skills/decision/trading-risk-gate/SKILL.md` | Ruin checks, position risk, ergodicity, Law #1 trading gates. |
| `zenith-execution` | `examples/skills/decision/zenith-execution/SKILL.md` | Kelly sizing, stop loss, Monte Carlo, portfolio execution. |
| `consiglieri-protocol` | `examples/skills/quality/consiglieri-protocol/SKILL.md` | High-stakes social contracts, partnerships, trust gates. |
| `power-inversion` | `examples/skills/quality/power-inversion/SKILL.md` | Negotiation, BATNA, leverage, commitment protection. |
| `statistical-analysis` | `examples/skills/research/statistical-analysis/SKILL.md` | SPSS, regression, chi-square, reliability, p-values, ANOVA. |
| `academic-delivery` | `examples/skills/workflow/academic-delivery/SKILL.md` | Essays, reports, assignments, capstones, APA/MLA work. |
| `trade-journal-analyzer` | `examples/skills/workflow/trade-journal-analyzer/SKILL.md` | Trade journal stats, drawdown classification, edge review. |

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
  for external facts, then decision notes for meaningful choices.
