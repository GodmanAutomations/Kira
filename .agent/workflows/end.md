---
description: Close the Kira session with verification, handoff, and checkpoint hygiene
---

# /end - Kira Session Close

> **Latency Profile**: LOW by default, higher only for long or high-signal runs.
> **Philosophy**: Close from current truth. Preserve only useful state.

## Phase 1: Scope The Close

// turbo

- [ ] Confirm the latest user request, current objective, and current slice
- [ ] Run `.agent/boot/coding-anchor/bin/kira-coding-anchor-status`
- [ ] Review `git status --short` and identify intentional changed paths
- [ ] Review generated ignored artifacts only when they help the handoff
- [ ] Decide whether this is a micro close or full close:
  - **Micro**: no durable decisions, no changed files, no open loops created
  - **Full**: changed files, decisions, verification evidence, blockers, or next-agent handoff needed

## Phase 2: Capture Useful State

For a full close, capture only the state that makes the next run safer:

1. Changed files and why they changed.
2. Verification checks that passed or remain unverified.
3. Generated ignored artifacts worth knowing about.
4. Open loops, blockers, or risks.
5. The next smallest useful handhold.

Update durable Kira surfaces only when the session changed their truth:

- `.agent/boot/coding-anchor/MISSION-CONTROL.md`
- `.agent/boot/coding-anchor/OPEN-LOOPS.md`
- `.agent/boot/coding-anchor/dashboards/TRUTH-LOG.md`
- `.agent/boot/coding-anchor/KIRA-USE-MAP.md`
- `.agent/boot/coding-anchor/SKILL-ROUTER.md`

For long sessions or likely resume points, run:

```bash
.agent/boot/coding-anchor/bin/athena-coding-anchor-compact "<scope>"
```

## Phase 3: Verify Before Close

Run the smallest deterministic checks for the touched surface:

- For boot-packet or workflow changes, run `.agent/boot/coding-anchor/bin/kira-coding-anchor-doctor`
- For Markdown-only workflow changes, run `git diff --check`
- For referenced paths, confirm the files or helpers exist
- For scripts, run `bash -n`
- For schemas, run `python3 -m json.tool`
- For meaningful code, workflow, script, schema, or boot-packet changes, follow or explicitly skip the code-review subagent gate
- For stale boot references, search for retired identity paths, missing docs, or private-only surfaces

Do not claim the close is clean unless the verification result is explicit.

## Phase 4: Readiness And Checkpoint

Before saving, publishing, or handing off a durable slice:

1. For meaningful code, workflow, script, schema, or boot-packet changes, create a review prompt with `.agent/boot/coding-anchor/bin/kira-coding-anchor-code-review "<scope>" --files "<changed files>" --checks "<verification>"`
2. Spawn a read-only code-review subagent with that prompt when the runtime supports subagents and the review is on the critical path
3. Fix Critical or High findings before saving, or mark the slice Not Ready
4. Run `.agent/boot/coding-anchor/bin/kira-coding-anchor-readiness "<scope>"`
5. Run `.agent/boot/coding-anchor/bin/kira-coding-anchor-checkpoint "<scope>"`
6. Confirm generated reports remain ignored unless deliberately promoted
7. Stage only the current atomic unit
8. Commit with a conventional-style message when the change belongs in git
9. Rebase before pushing a branch that already has an upstream
10. Push only the intended branch

Closeout does not require a generic numbered session log and does not force
every session into a commit. Checkpoint when the slice is verified and durable.

## Phase 5: Confirm

Report in this order:

1. Close status: clean, saved, pushed, blocked, or intentionally left dirty.
2. Changed files or commit hash, if any.
3. Verification that passed.
4. Anything unverified.
5. Next handhold.

**Confirm**: "Kira closeout complete. State checked, verification recorded, next handhold clear."

---

# workflow #session #end #closeout
