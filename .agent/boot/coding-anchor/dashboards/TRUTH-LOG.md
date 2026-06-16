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
- Decision: keep generated receipts and heartbeat files out of normal commits.
