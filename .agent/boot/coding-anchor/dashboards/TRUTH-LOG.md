# Truth Log

Use this file for verified claims about the Athena Coding Anchor packet.

## 2026-06-14

- Verified: the Athena transplant worktree was created at
  `/Users/stephengodman/000_AI/agent-frameworks/Athena-Public-codex-boot`.
- Verified: the transplant branch is `codex/athena-coding-anchor-boot`.
- Verified: the source CodeX packet existed at adaptation time.
- Verified: `.agent/scripts/smart_search.py` is the working search script in
  this checkout; the example `semantic-search` skill referenced an old
  `examples/scripts/smart_search.py` path.
- Verified: `python3 .agent/scripts/smart_search.py "semantic search skill
  routing" --limit 5` returned Athena grounding with fallback because
  `GOOGLE_API_KEY` was missing.
- Decision: rebuild the useful shape as Athena-local boot mechanics, not as a
  restore of old Anchor/Gemini state.
- Decision: adopt a corrected `semantic-search` skill locally before adopting
  heavier coding or review skills.
- Decision: adopt `atomic-execution` next because it directly supports
  Stephen's "next slice" operating style with one verification-gated task at a
  time.
- Verified: `examples/skills/` contains 26 `SKILL.md` files in this checkout.
- Verified: `marketing-swarm` references missing `.agent/swarms/marketing_team/`
  in this checkout.
- Verified: `synthetic-parallel-reasoning` references missing
  `.agent/scripts/parallel_orchestrator.py` in this checkout.
- Decision: add `SKILL-ROUTER.md` as the compact skill classification surface
  before adopting more skills.
- Decision: adopt `diagnostic-refactor` because Athena has many stale paths and
  cleanup should start with a bill of materials, not a blind rewrite.
- Decision: adopt `red-team-review` because the boot packet is becoming
  durable enough to need an adversarial readiness gate before merge or release.
- Decision: adopt `spec-driven-dev` because Athena can now execute quickly and
  needs a compact requirements gate before unclear feature work.
- Verified: the source `micro-commit` skill referenced a missing
  `.context/memories/protocols/engineering/44-micro-commit-protocol.md` path;
  the current protocol exists at
  `examples/protocols/engineering/ENG-43-micro-commit-protocol.md`.
- Decision: adopt `micro-commit` as a planning and hygiene gate, not an
  automatic commit button, because Codex should commit only when Stephen
  explicitly asks.
- Decision: use checkpoint language around commits because Stephen does not
  reliably say or remember the word `commit`; after verified durable slices,
  Codex should surface save/lock-in/checkpoint options plainly.
- Decision: add credential prompt handling so Codex tries approved local secret
  sources and browser/computer automation before interrupting Stephen, while
  keeping secrets out of tracked files, logs, receipts, and chat.
- Verified: the source `visual-verify-ui` skill referenced a missing
  `.context/memories/protocols/engineering/99-visual-verification.md` path; the
  current protocol exists at
  `examples/protocols/engineering/ENG-99-visual-verification.md`.
- Decision: adopt `visual-verify-ui` so frontend and visual artifact work needs
  browser or screenshot-backed verification before being called complete.
- Verified: `.context/memory_bank/activeContext.md` exists in this checkout,
  but the boot packet will not rewrite it during this transplant.
- Decision: adopt `context-compactor` as a local ignored continuation handoff
  generator so long Athena Coding Anchor sessions keep branch, files,
  verification, and next-slice state.
- Decision: adopt `deep-research-loop` so external/current facts get source,
  conflict, and confidence discipline before driving implementation.
- Decision: adopt `decision-journal` so meaningful choices can preserve
  alternatives, assumptions, confidence, and post-mortem structure without
  overloading the truth log.
- Verified: the source `circuit-breaker` skill referenced an old
  `.agent/skills/protocols/safety/48-circuit-breaker-systemic.md` path; the
  current protocol exists at
  `examples/protocols/safety/SAF-48-circuit-breaker-systemic.md`.
- Decision: adopt `circuit-breaker` so repeated failures, fatigue, and
  compulsive retry loops trigger a pause/AAR instead of compounding damage.
- Decision: adopt `mcda-solver` so multi-factor choices get options, weights,
  sensitivity checks, and dealbreaker review before recommendations.
- Verified: `power-inversion` references Protocol 64 and Protocol 120; Protocol
  64 exists in this checkout as
  `examples/protocols/decision/DEC-64-commitment-device-framework.md`, while a
  current Protocol 120 file was not found in `examples/protocols/`.
- Decision: adopt `power-inversion` so negotiation, quote, partnership, and
  information-release work protects leverage with BATNA and commitment-device
  checks.
- Decision: adopt `client-pricing` while adapting the source skill's example
  rates into reusable anchor/floor/scope/pushback mechanics rather than
  hardcoded universal price truth.
- Verified: `brand-foundations` references
  `.context/memories/protocols/strategy/319-brand-foundations-7-blocks.md`,
  but that file was not found in this checkout.
- Decision: adopt `brand-foundations` from the source skill's live mechanics:
  purpose, enemy, psychographic audience, voice, value proposition, proof,
  visual direction, open questions, and next slice.
- Verified: `distribution-physics` references
  `.context/memories/protocols/business/106-distribution-physics.md`, but that
  file was not found in this checkout.
- Verified: current Athena distribution strategy lives in
  `examples/protocols/strategy/STR-162-product-market-operations-fit.md` and
  `examples/protocols/strategy/STR-526-business-viability-assessment.md`.
- Decision: adopt `distribution-physics` as PMOD plus channel tax, CAC/LTV,
  Four Fits, experiment, and kill-criteria mechanics, not as a dependency on
  the stale Protocol 106 path.
- Verified: `seo-auditor` references
  `.context/memories/protocols/marketing/279-seo-channel-strategy.md`, but
  that file was not found in this checkout.
- Verified: current SEO-adjacent checks exist in
  `docs/protocols/content/220-blog-post-gold-standard.md`,
  `examples/protocols/content/CNT-221-high-performance-ux-design.md`, and
  `examples/protocols/architecture/ARC-503-cognitive-clusters.md`.
- Decision: adopt `seo-auditor` as a technical and content triage gate for
  metadata, headings, internal links, content gaps, indexability, barnacle
  opportunities, prioritized fixes, and verification.
- Verified: the source `consiglieri-protocol` skill references
  `.agent/skills/protocols/decision/329-consiglieri-protocol.md`, but the
  current public checkout keeps the protocol at
  `examples/protocols/decision/DEC-197-consiglieri-protocol.md`.
- Verified: the source `consiglieri-protocol` skill references
  `.context/memories/protocols/psychology/20-adult-adult-communication.md`,
  but that file was not found in this checkout.
- Decision: adopt `consiglieri-protocol` as a public-safe trust and
  social-contract review gate, preserving Pryce Test, Exit Test, information
  security, time pressure, blast radius, Vibe Veto, incentive read, and
  Adult-to-Adult response mechanics without importing private/date-specific
  source framing.
- Verified: `trading-risk-gate` is grounded by
  `examples/protocols/safety/SAF-001-law-of-ruin.md` and
  `examples/protocols/decision/DEC-193-ergodicity-check.md`.
- Decision: adopt `trading-risk-gate` as a generalized repeated-risk gate for
  ruin classes, ergodicity, survival probability, and WR/RR assumptions; keep
  it advisory and non-executing.
- Verified: `zenith-execution` is grounded by the source skill and the
  Half-Kelly / volatility-gate material in
  `examples/protocols/decision/DEC-330-economic-expected-value.md`.
- Decision: adopt `zenith-execution` only as an execution-constraint planning
  layer that runs after risk-gate pass; it must not place trades, move money,
  rebalance portfolios, or bypass a ruin veto.
- Decision: adopt `statistical-analysis` while stripping the source skill's
  assignment-specific context; preserve data audit, assumption checks, test
  selection, effect sizes, confidence/uncertainty, practical interpretation,
  and report-ready summary mechanics.
- Decision: adopt `trade-journal-analyzer` as a generalized post-action
  analytics gate rather than a trading-only journal reader; preserve pattern
  extraction, planned-vs-actual gap analysis, drawdown/streak classification,
  edge health, and circuit-breaker escalation.
- Decision: add `readiness-checkpoint-gate.md` and
  `athena-coding-anchor-readiness` as a consolidation lane before save,
  publish, or handoff; readiness reports summarize adopted skills, helper
  coverage, ignored runtime artifacts, source-only boundaries, and git state.
- Decision: adopt `academic-delivery` as a public-safe formal deliverable gate
  rather than a school-specific assignment lane; preserve intake, scope,
  research, V1-is-working-draft, mandatory red-team, revision, compile, and
  exit-gate verification.
- Decision: keep generated receipts and heartbeat files out of normal commits.
