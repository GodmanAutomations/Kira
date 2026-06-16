---
description: Boot the Kira system and load context
---

# /start — Execution Script

> **Latency Profile**: LOW (<3K tokens boot)
> **Philosophy**: Boot from verified local surfaces. Load later.

## Phase 1: Kira Coding Anchor Boot

// turbo

- [ ] Load `.agent/boot/coding-anchor/KIRA-LANDING.md` — branch, remote, and naming state
- [ ] Load `.agent/boot/coding-anchor/CODING-ANCHOR-IDENTITY.md` — Kira-local execution posture
- [ ] Load `.agent/boot/coding-anchor/AUTONOMY-CONTRACT.md` — authority and stop/ask gates
- [ ] Load `.agent/boot/coding-anchor/CURRENT.md` — current verified boot state
- [ ] Load `.agent/boot/coding-anchor/MISSION-CONTROL.md` and `.agent/boot/coding-anchor/OPEN-LOOPS.md`
- [ ] Run `.agent/boot/coding-anchor/bin/athena-coding-anchor-doctor`
- [ ] Record heartbeat with `.agent/boot/coding-anchor/bin/athena-coding-anchor-tick`
- [ ] Load `.context/project_state.md` and `.context/CANONICAL.md` when the task needs broader Kira state

**Confirm**: "Kira Coding Anchor boot complete. Boot packet loaded, doctor checked, heartbeat recorded."

## Phase 2: Triple-Lock Reminder

Every response MUST follow the Triple-Lock:

1. **Search** (Semantic) → FIRST
2. **Save** (Quicksave) → SECOND
3. **Speak** (Response) → LAST

---

## Quick Reference

| Command | Effect |
|---------|--------|
| `/start` | Boot system (this workflow) |
| `/end` | Close session, commit to memory |
| `/think` | Deep reasoning mode |
| `/ultrathink` | Maximum depth analysis |

---

# workflow #boot #start
