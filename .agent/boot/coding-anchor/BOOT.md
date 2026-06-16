# Boot

Run from the repository root:

```bash
.agent/boot/coding-anchor/bin/athena-coding-anchor-boot
```

Boot sequence:

1. Confirm this is Athena Coding Anchor, not old Anchor/Gemini.
2. Read identity, autonomy, mission control, open loops, use map, skill router,
   and current state.
3. Run the doctor check.
4. Record a heartbeat when appropriate.
5. Load the operating protocols, including retrieval-led skill routing and
   diagnostic refactor scanning.
6. For unclear feature work, write a compact spec before implementation.
7. For implementation work, use atomic execution to take one verified slice at
   a time.
8. After a verified durable slice, surface a checkpoint option in plain
   language; Stephen does not need to remember the word `commit`.
9. If an API, password, token, or login prompt appears, use approved local
   secret sources directly and escalate only for human-presence blockers.
10. For UI or visual work, verify with browser/screenshot evidence before
    calling it done.
11. For long sessions, create a compact continuation handoff before context
    gets mushy.
12. For external/current facts, run the research brief gate before acting.
13. For meaningful choices, record the decision shape before outcome drift.
14. Before shipping or merging significant artifacts, run the red-team review
   gate.

If the boot feels thin, read:

- `config/codex-runtime-notes.md`
- `config/model-and-output-discipline.md`
- `config/hook-discipline.md`
- `AUTONOMY-CONTRACT.md`
- `CAPABILITY-MAP.md`
- `ATHENA-USE-MAP.md`
- `SKILL-ROUTER.md`
- `dashboards/TRUTH-LOG.md`
- `protocols/diagnostic-refactor-scan.md`
- `protocols/red-team-review-gate.md`
- `protocols/spec-first-gate.md`
- `protocols/visual-verification-gate.md`
- `protocols/autonomous-work-loop.md`
- `protocols/atomic-execution-loop.md`
- `protocols/context-handoff-gate.md`
- `protocols/credential-prompt-handling.md`
- `protocols/decision-journal-gate.md`
- `protocols/mission-routing.md`
- `protocols/micro-commit-gate.md`
- `protocols/research-brief-gate.md`
- `protocols/retrieval-led-skill-routing.md`
- `protocols/verification-loop.md`
- `skills/atomic-execution/SKILL.md`
- `skills/context-compactor/SKILL.md`
- `skills/decision-journal/SKILL.md`
- `skills/deep-research-loop/SKILL.md`
- `skills/diagnostic-refactor/SKILL.md`
- `skills/micro-commit/SKILL.md`
- `skills/red-team-review/SKILL.md`
- `skills/spec-driven-dev/SKILL.md`
- `skills/visual-verify-ui/SKILL.md`
