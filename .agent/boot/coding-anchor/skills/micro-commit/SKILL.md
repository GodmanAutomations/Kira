---
name: micro-commit
description: Kira-local checkpoint hygiene for splitting verified work into atomic, intentional commits.
context_trigger: "checkpoint, save it, save this, lock it in, ship it, done, next slice, commit, git, atomic commit, split commit, commit hygiene, PR too big, save my work"
source: "Adapted from examples/skills/coding/micro-commit/SKILL.md and examples/protocols/engineering/ENG-43-micro-commit-protocol.md"
---

# Micro-Commit

Use this skill when Stephen asks to checkpoint, save work, lock in a slice,
split a large diff, or prepare a pull request.

Stephen usually will not say the word `commit`. Treat these as checkpoint
intent when a slice is verified:

- `save it`
- `save this`
- `lock it in`
- `checkpoint`
- `ship it`
- `that slice is good`
- `done with this`
- `next` after a verified durable slice

## Contract

- Inspect `git status --short` and the current diff before staging.
- Group changes into the smallest useful revertible units.
- Run or cite the relevant verification for each unit.
- Stage only the files that belong to the current unit.
- Use Conventional Commit format for commit messages.
- Never commit ignored runtime artifacts, secrets, receipts, local notes, or
  unrelated user/agent work.
- Do not require Stephen to use the word `commit`.
- Create a commit only when checkpoint intent is clear or Stephen directly asks
  to save/lock in the verified slice.

## Default Flow

1. Generate a checkpoint plan with `bin/athena-coding-anchor-checkpoint`.
2. Identify files that belong together.
3. Verify the unit.
4. Stage only that unit.
5. Commit with a narrow Conventional Commit message.
6. Stop and report status unless Stephen asks to continue.

## Boundary

The source skill says it can automatically execute commits. This
repo-local adaptation keeps Codex's safer boundary: the helper plans and
reviews; the agent commits only on clear checkpoint/save/lock-in intent.
