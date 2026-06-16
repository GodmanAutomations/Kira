# Mission Control

Last updated: 2026-06-14

## Active Mission

Install the best parts of the CodeX Coding Anchor feel as an Athena-local boot
packet:

- crisp identity
- current-state landing
- open-loop tracking
- verified truth log
- retrieval-led skill routing
- spec-first feature gates
- credential prompt handling
- visual verification gates
- context handoff compaction
- source-backed research briefs
- decision journaling
- diagnostic refactor scans
- adversarial review gates
- atomic execution slices
- autonomous work loop
- true boot entrypoint
- no private-room identity restore

## Current Status

- Athena has a public framework workspace with existing workflows and docs.
- `/start` now has a concrete boot packet to load.
- `semantic-search` is adopted locally with a corrected wrapper around
  `.agent/scripts/smart_search.py`.
- `atomic-execution` is adopted locally as the default next-slice execution
  pattern.
- `diagnostic-refactor` is adopted locally as the default bill-of-materials
  scan before cleanup or refactor work.
- `red-team-review` is adopted locally as the default adversarial gate before
  shipping significant artifacts.
- `spec-driven-dev` is adopted locally as the default gate before unclear or
  multi-file feature work.
- `micro-commit` is adopted locally as the default checkpoint hygiene gate when
  Stephen asks to save, lock in, ship, checkpoint, move on from, or split a
  verified slice.
- `credential-prompt-handling.md` is the default rule when API keys,
  passwords, tokens, or login prompts block a task.
- `visual-verify-ui` is adopted locally as the default visual QA gate for
  frontend, layout, and screenshot-backed verification.
- `context-compactor` is adopted locally as the default continuation handoff
  skill for long Athena Coding Anchor sessions.
- `deep-research-loop` is adopted locally as the default multi-source research
  skill for external/current facts.
- `decision-journal` is adopted locally as the default decision and
  post-mortem note skill.
- `SKILL-ROUTER.md` now classifies the 26 example skills and marks stale-path
  hazards.
- The packet should be treated as posture and verification machinery, not as
  project business logic.

## Next Moves

1. Use this packet on the next serious Athena coding mission.
2. Search Athena context with `bin/athena-coding-anchor-search` before choosing
   skills or protocols for broad repo work.
3. Use `bin/athena-coding-anchor-spec` before unclear or multi-file feature
   work.
4. Use `bin/athena-coding-anchor-task` when a plan needs a concrete XML task
   handhold.
5. Use `bin/athena-coding-anchor-refactor-report` before editing messy or stale
   surfaces.
6. Use `bin/athena-coding-anchor-red-team` before shipping or merging
   significant boot artifacts.
7. Use `bin/athena-coding-anchor-checkpoint` after a verified durable slice,
   and prompt in plain language rather than waiting for Stephen to say
   `commit`.
8. Use `protocols/credential-prompt-handling.md` when auth blocks progress.
9. Use `bin/athena-coding-anchor-visual-report` when UI or visual artifact work
   needs proof beyond code/build success.
10. Use `bin/athena-coding-anchor-compact` before a long session loses the next
   handhold.
11. Use `bin/athena-coding-anchor-research-brief` for source-backed external
   research.
12. Use `bin/athena-coding-anchor-decision` for meaningful decisions or
   post-mortem handholds.
13. Create a mission note with `bin/athena-coding-anchor-mission` when a project
   effort needs a durable local handhold.
14. Use the truth log for verified claims.
15. Keep private CodeX room material out of Athena unless Stephen explicitly
   asks for a scoped adaptation pass.

## Definition Of Good

When booted, Codex should know:

- who it is in this packet
- what it is allowed to do
- what is currently true
- what loops are open
- what the next useful action is
- how to verify before declaring success
