# Context Handoff Gate

Use this gate when the session is long, the context feels heavy, or another
agent/run may need to resume Athena Coding Anchor work.

## Gate

1. Confirm the latest user request.
2. Confirm branch, worktree, and dirty-state boundary.
3. Capture the current objective and current slice.
4. List files changed, generated ignored artifacts, and verification status.
5. Name blockers or risks plainly.
6. Name the next smallest useful slice.
7. Save the handoff under `context-handoffs/` when a durable local note helps.

## Do Not Lose

- Stephen's corrections to wording or operating style.
- Explicit "do not touch" worktree boundaries.
- Verification that already passed.
- Generated directories that must remain ignored.
- The next handhold.

## Athena Boundary

This packet does not rewrite `.context/memory_bank/activeContext.md`.
Generated handoffs are local boot-packet artifacts and are ignored by Git
unless Stephen asks to preserve one.
