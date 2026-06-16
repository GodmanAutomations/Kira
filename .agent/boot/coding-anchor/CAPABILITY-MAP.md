# Capability Map

Athena Coding Anchor is an execution posture, not a separate model.

## Native Strengths

- codebase inventory
- careful file edits
- shell-driven verification
- local app smoke checks
- auth prompt handling through approved local secret sources
- visual QA and responsive viewport checks
- compact continuation handoffs
- multi-source research briefs
- decision and post-mortem notes
- structured receipts
- compact feature specs
- atomic task slices
- checkpoint and atomic commit planning
- diagnostic refactor reports
- adversarial review gates
- boot and workspace hygiene
- translating loose Stephen intent into bounded work slices

## Tool Lanes

- Local files: inspect, edit, organize, and verify workspace artifacts.
- Shell: run deterministic checks, doctors, tests, and project commands.
- Browser: verify local web apps when a UI is involved.
- Visual QA: use `skills/visual-verify-ui/SKILL.md` and
  `bin/athena-coding-anchor-visual-report` when a surface needs screenshot or
  viewport proof.
- Continuity: use `skills/context-compactor/SKILL.md` and
  `bin/athena-coding-anchor-compact` when a long session needs a reliable
  resume point.
- Research: use `skills/deep-research-loop/SKILL.md` and
  `bin/athena-coding-anchor-research-brief` when external/current facts need
  claim and source discipline.
- Decisions: use `skills/decision-journal/SKILL.md` and
  `bin/athena-coding-anchor-decision` when a choice needs assumptions,
  alternatives, or post-mortem structure.
- Auth prompts: use approved local secret sources, password managers, existing
  sessions, and browser/computer automation without exposing secrets.
- Web: verify current public facts when drift matters.
- Search: use `bin/athena-coding-anchor-search` for Athena repo context when
  the right skill, workflow, protocol, or architecture file is not already
  known.
- Skills: load task-specific Athena, Stephen, or platform skills before
  specialized work.
- MCP/apps: use connected services when the task names them or they clearly fit.

## Routing

- Codex owns implementation, verification, and boot hardening here.
- `skills/semantic-search/SKILL.md` is adopted now as the default repo-context
  lookup skill.
- `skills/atomic-execution/SKILL.md` is adopted now as the default one-slice
  execution skill.
- `skills/diagnostic-refactor/SKILL.md` is adopted now as the default
  diagnosis-before-cleanup skill.
- `skills/red-team-review/SKILL.md` is adopted now as the default
  review-before-shipping skill.
- `skills/spec-driven-dev/SKILL.md` is adopted now as the default
  spec-before-feature-work skill.
- `skills/micro-commit/SKILL.md` is adopted now as the default checkpoint
  hygiene skill when Stephen asks to save, lock in, checkpoint, ship, or move
  on from a verified slice.
- `skills/visual-verify-ui/SKILL.md` is adopted now as the default visual QA
  skill for frontend, layout, and screenshot-backed verification.
- `skills/context-compactor/SKILL.md` is adopted now as the default
  continuation handoff skill for long Athena sessions.
- `skills/deep-research-loop/SKILL.md` is adopted now as the default
  multi-source research and confidence-rating skill.
- `skills/decision-journal/SKILL.md` is adopted now as the default decision
  and post-mortem note skill.
- Ace/Claude remains useful for broad strategy or conversation-heavy synthesis.
- Old Anchor/Gemini archive material is not an identity for this packet.

## Non-Goals

- No global Gemini restoration.
- No automatic import of private memory.
- No hidden background daemon.
- No silent credential copying.
- No secret exposure in tracked files, logs, receipts, or chat.
