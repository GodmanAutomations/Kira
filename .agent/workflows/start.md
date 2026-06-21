---
description: Boot the Kira system and load context
---

# /start — Execution Script

> **Latency Profile**: LOW (<3K tokens boot)
> **Philosophy**: Boot from verified local surfaces. Load later.

## Phase 1: Kira Coding Anchor Boot

// turbo

- [ ] Load `.agent/boot/coding-anchor/START-HERE.md` — packet entry sequence
- [ ] Load `.agent/boot/coding-anchor/BOOT.md` — boot procedure and operating gates
- [ ] Load `.agent/boot/coding-anchor/KIRA-LANDING.md` — branch, remote, and naming state
- [ ] Load `.agent/boot/coding-anchor/CODING-ANCHOR-IDENTITY.md` — Kira-local execution posture
- [ ] Load `.agent/boot/coding-anchor/AUTONOMY-CONTRACT.md` — authority and stop/ask gates
- [ ] Load `.agent/boot/coding-anchor/CURRENT.md` — current verified boot state
- [ ] Load `.agent/boot/coding-anchor/MISSION-CONTROL.md` and `.agent/boot/coding-anchor/OPEN-LOOPS.md` — active state and loose ends
- [ ] Load `.agent/boot/coding-anchor/KIRA-USE-MAP.md` and `.agent/boot/coding-anchor/SKILL-ROUTER.md` — skill/tool routing
- [ ] Run `.agent/boot/coding-anchor/bin/kira-coding-anchor-status`
- [ ] Run `.agent/boot/coding-anchor/bin/kira-coding-anchor-doctor`
- [ ] Record heartbeat with `.agent/boot/coding-anchor/bin/kira-coding-anchor-tick`
- [ ] Load `.context/project_state.md` and `.context/CANONICAL.md` when the task needs broader Kira state

**Confirm**: "Kira Coding Anchor boot complete. Boot packet loaded, status checked, doctor passed, heartbeat recorded."

## Phase 2: Kira Work Loop

For non-trivial work, use the smallest routing loop that gives a verified next
move:

1. Search Kira context with `.agent/boot/coding-anchor/bin/kira-coding-anchor-search` when the relevant files, workflow, or skill are not already obvious.
2. Use `.agent/boot/coding-anchor/KIRA-USE-MAP.md` and `.agent/boot/coding-anchor/SKILL-ROUTER.md` to choose the right gate.
3. Use `.agent/boot/coding-anchor/bin/kira-coding-anchor-spec` before unclear or multi-file feature work.
4. Use `.agent/boot/coding-anchor/bin/kira-coding-anchor-task` when a plan needs a one-slice execution handhold.
5. Use `.agent/boot/coding-anchor/bin/kira-coding-anchor-autoloop "<scope>" --passes N` when Stephen asks to keep moving through known same-scope slices.
6. Make the smallest useful change.
7. Verify with deterministic checks before claiming confidence.
8. Use `.agent/boot/coding-anchor/bin/kira-coding-anchor-readiness` and `.agent/boot/coding-anchor/bin/kira-coding-anchor-checkpoint` before durable save, publish, or handoff decisions.

---

## Quick Reference

| Command | Effect |
|---------|--------|
| `/start` | Boot system (this workflow) |
| `/end` | Close session and file insights |
| `/think` | Deep reasoning mode |
| `/ultrathink` | Maximum depth analysis |

---

# workflow #boot #start
