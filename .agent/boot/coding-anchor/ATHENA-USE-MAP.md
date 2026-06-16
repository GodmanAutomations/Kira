# Athena Use Map

This is the Coding Anchor map for using Athena's repo-native machinery without
loading the whole workspace into context.

## Current Inventory

Verified on 2026-06-14:

- Skills live under `examples/skills/` in this public checkout.
- `SKILL-ROUTER.md` classifies all 26 example skills by current usefulness and
  repair status.
- Workflows live under `.agent/workflows/`.
- Architecture docs live mainly in `docs/ARCHITECTURE.md`,
  `docs/SEMANTIC_SEARCH.md`, and `docs/KNOWLEDGE_GRAPH.md`.
- The working search script is `.agent/scripts/smart_search.py`.
- The `semantic-search` skill still referenced an old
  `examples/scripts/smart_search.py` path, so this packet adopts a corrected
  Athena-local version.

## Adopted Now

| Need | Use | Why |
| :--- | :--- | :--- |
| Find relevant Athena context before acting | `skills/semantic-search/SKILL.md` + `bin/athena-coding-anchor-search` | Matches Athena's retrieval-first architecture and works in this checkout. |
| Spec before feature work | `skills/spec-driven-dev/SKILL.md` + `bin/athena-coding-anchor-spec` | Pins goal, scope, architecture, edge cases, and acceptance checks before building. |
| Execute the next slice | `skills/atomic-execution/SKILL.md` + `bin/athena-coding-anchor-task` | Turns plans into one verification-gated task instead of a sprawling pass. |
| Diagnose before refactoring | `skills/diagnostic-refactor/SKILL.md` + `bin/athena-coding-anchor-refactor-report` | Creates a bill of materials before touching stale or messy surfaces. |
| Review before shipping | `skills/red-team-review/SKILL.md` + `bin/athena-coding-anchor-red-team` | Finds shared blind spots before merge, release, or durable closeout. |
| Plan checkpoints | `skills/micro-commit/SKILL.md` + `bin/athena-coding-anchor-checkpoint` | Splits verified work into intentional save points without requiring Stephen to say `commit`. |
| Handle auth prompts | `protocols/credential-prompt-handling.md` | Uses approved local secret sources and computer/browser automation without exposing secrets. |
| Verify UI visually | `skills/visual-verify-ui/SKILL.md` + `bin/athena-coding-anchor-visual-report` | Requires browser/screenshot evidence for frontend and visual artifact work. |
| Preserve long-session state | `skills/context-compactor/SKILL.md` + `bin/athena-coding-anchor-compact` | Creates a compact continuation handoff without rewriting Athena's public memory bank. |
| Research current or external facts | `skills/deep-research-loop/SKILL.md` + `bin/athena-coding-anchor-research-brief` | Cross-checks claims, sources, confidence, and gaps before acting. |
| Record meaningful choices | `skills/decision-journal/SKILL.md` + `bin/athena-coding-anchor-decision` | Captures alternatives, assumptions, confidence, and post-mortem structure. |
| Keep work bounded and verifiable | `protocols/autonomous-work-loop.md` + `protocols/verification-loop.md` | Already part of Coding Anchor boot. |
| Choose future skills | `SKILL-ROUTER.md` plus `examples/skills/*/SKILL.md` | Prevents copying the whole skill library blindly. |

## High-Value Candidates For Later

| Skill | Path | Adopt When |
| :--- | :--- | :--- |
| `circuit-breaker` | `examples/skills/quality/circuit-breaker/SKILL.md` | Useful later as a fatigue/losing-streak stop rule for long autonomous lanes. |

## Routing Rule

Before broad Athena work:

1. Run `bin/athena-coding-anchor-search "<topic>" --limit 5`.
2. Check `SKILL-ROUTER.md` for the matching source or adopted skill.
3. Read the highest-signal files returned by search.
4. Load a skill only when its trigger matches the task and it changes the next
   move.
5. Record durable findings here only when they improve future routing.

Before feature work:

1. Use `skills/spec-driven-dev/SKILL.md`.
2. Create a compact spec with `bin/athena-coding-anchor-spec`.
3. Convert acceptance criteria into atomic execution slices.

When executing a plan:

1. Use `skills/atomic-execution/SKILL.md`.
2. Generate or mentally hold one task block.
3. Run the stated verification before taking the next slice.

When refactoring or cleaning up:

1. Use `skills/diagnostic-refactor/SKILL.md`.
2. Create a report with `bin/athena-coding-anchor-refactor-report`.
3. Convert accepted findings into atomic execution slices.

Before shipping or merging:

1. Use `skills/red-team-review/SKILL.md`.
2. Create a review with `bin/athena-coding-anchor-red-team`.
3. Convert critical or high findings into atomic execution slices.

Before checkpointing:

1. Use `skills/micro-commit/SKILL.md`.
2. Create a checkpoint plan with `bin/athena-coding-anchor-checkpoint`.
3. Stage only the verified files in the current atomic unit.

When blocked by auth:

1. Use `protocols/credential-prompt-handling.md`.
2. Try approved local secret sources and existing sessions first.
3. Ask Stephen only for one-time, phone, biometric, CAPTCHA, or physical-world
   blockers.

When working on UI:

1. Use `skills/visual-verify-ui/SKILL.md`.
2. Open the target in the available browser tool.
3. Check desktop and mobile before calling the work complete.
4. Use `bin/athena-coding-anchor-visual-report` when a durable report helps.

When context is getting long:

1. Use `skills/context-compactor/SKILL.md`.
2. Create a handoff with `bin/athena-coding-anchor-compact`.
3. Preserve current request, branch/worktree, files, verification, blockers,
   and next slice.

When researching:

1. Use `skills/deep-research-loop/SKILL.md`.
2. Prefer primary sources and current official docs.
3. Create a brief with `bin/athena-coding-anchor-research-brief` when a
   durable local handhold helps.

When making a meaningful decision:

1. Use `skills/decision-journal/SKILL.md`.
2. Capture alternatives, assumptions, confidence, and what would change the
   call.
3. Create a note with `bin/athena-coding-anchor-decision` when the rationale
   should survive the session.
