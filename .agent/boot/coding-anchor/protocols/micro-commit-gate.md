# Micro-Commit Gate

Use this gate before checkpointing, staging, or committing work in Kira.

Stephen often will not say `commit`. When a durable slice is verified, Codex
should surface the checkpoint option in plain language: "This slice is verified;
I can checkpoint it now." Treat `save it`, `lock it in`, `checkpoint`, `ship
it`, or `that slice is good` as checkpoint intent.

## Gate

1. Confirm the branch and worktree with `git status --short --branch`.
2. Generate or mentally hold an atomic checkpoint plan.
3. Separate current intended changes from unrelated user/agent changes.
4. Run the smallest meaningful verification for the unit to be committed.
5. Stage only the files in that unit.
6. Use a Conventional Commit message that describes the change.
7. Report what was committed, what remains unstaged, and what was verified.

## Refuse The Blob

If a diff includes multiple unrelated features, docs changes, generated
artifacts, or local runtime files, split it. A commit should be easy to review
and easy to revert.

## Kira Boundary

Generated checkpoint plans live under `commit-plans/` and are ignored by Git.
They are handholds, not release artifacts. The command name may mention commit;
the user-facing language should be checkpoint/save/lock in.
