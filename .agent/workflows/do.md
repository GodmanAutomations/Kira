---
description: Universal Kira entrypoint that classifies intent, routes to the right gate, executes one verified slice, and leaves the next handhold clear
---

# /do - Kira Universal Router

> **Latency Profile**: LOW by default. Expand only when the task requires it.
> **Philosophy**: Find the live state, choose the smallest useful move, verify before confidence.

## Phase 0: Establish Current Truth

// turbo

- [ ] If the session is not booted, run `/start` first or load the same minimum Kira boot surfaces
- [ ] Run `.agent/boot/coding-anchor/bin/kira-coding-anchor-status` when branch, sync, or dirty state matters
- [ ] Read the latest user request and identify the intended outcome in one sentence
- [ ] Identify the smallest boundary that can answer the request without scanning unrelated areas

## Phase 1: Classify Intent

Pick one primary route before acting:

| Intent | Route | Gate |
| :--- | :--- | :--- |
| Simple answer or explanation | Answer directly from known or local context | Verify any repo-specific claim against files |
| Kira/repo context lookup | Search local Kira context | `.agent/boot/coding-anchor/bin/kira-coding-anchor-search "<topic>" --limit 5` |
| Implementation or fix | One atomic execution slice | `.agent/boot/coding-anchor/bin/kira-coding-anchor-task "<scope>"` when a task handhold helps |
| Repeated next-slice work | Bounded auto-loop conductor | `.agent/boot/coding-anchor/bin/kira-coding-anchor-autoloop "<scope>" --passes N --task` when a task handhold helps |
| Unclear or multi-file feature work | Spec before code | `.agent/boot/coding-anchor/bin/kira-coding-anchor-spec "<scope>"` |
| Refactor or cleanup | Diagnose before editing | `.agent/boot/coding-anchor/bin/athena-coding-anchor-refactor-report "<scope>"` |
| Review or shipping check | Red-team before confidence | `.agent/boot/coding-anchor/bin/athena-coding-anchor-red-team "<scope>"` |
| Current external facts | Research with current sources | `.agent/boot/coding-anchor/bin/athena-coding-anchor-research-brief "<scope>"` when a durable brief helps |
| UI or visual artifact | Visual verification gate | `.agent/boot/coding-anchor/bin/athena-coding-anchor-visual-report "<scope>"` when a report helps |
| Auth or credential prompt | Credential prompt protocol | `.agent/boot/coding-anchor/protocols/credential-prompt-handling.md` |
| Save, publish, handoff, or close | Readiness and checkpoint | `/end` plus readiness/checkpoint helpers |

Use `.agent/boot/coding-anchor/KIRA-USE-MAP.md` and `.agent/boot/coding-anchor/SKILL-ROUTER.md`
when the route is not obvious or a source skill may apply.

## Phase 2: Decide Whether To Ask Or Act

Act without another question when:

- The request has one reasonable interpretation.
- The change is non-destructive.
- The relevant source of truth is available in the repo.
- A reversible checkpoint can be made after verification.

Ask one blocker question only when:

- Two interpretations would produce materially different outcomes.
- A destructive, paid, public, or credential-sensitive action cannot be safely inferred.
- Required input is not discoverable from local context.

## Phase 3: Execute One Slice

For implementation work:

1. Search or read the smallest relevant surface.
2. Use `kira-coding-anchor-autoloop "<scope>" --passes N` when Stephen asks to keep moving through repeated slices.
3. Name the intended move.
4. Edit only the files in the current atomic unit.
5. Preserve unrelated user or agent work.
6. Avoid broad rewrites unless the chosen route explicitly calls for them.

For non-code work:

1. Extract concrete facts before explaining.
2. Prefer local authoritative files before memory or training data.
3. Use web/current-source research only when the fact is likely to drift or the user asks for current truth.
4. Keep the answer tied to the requested decision or next action.

## Phase 4: Verify

Run the smallest deterministic check that proves the slice:

- Markdown workflow change: `git diff --check` plus referenced-path check
- Boot-packet change: `.agent/boot/coding-anchor/bin/kira-coding-anchor-doctor`
- Auto-loop change: run `.agent/boot/coding-anchor/bin/kira-coding-anchor-autoloop "<scope>" --passes 2` and inspect the ignored report
- Script change: `bash -n <script>` and the relevant runtime smoke test
- JSON schema or data change: `python3 -m json.tool <file>` and schema-specific validation
- UI change: browser or screenshot verification across the relevant viewport
- Research/current-fact answer: cite current sources and name uncertainty

If verification fails, fix inside the same slice or report the exact blocker.

## Phase 5: Save Or Hand Off When Durable

When the slice is verified and should be preserved:

1. Run `.agent/boot/coding-anchor/bin/kira-coding-anchor-readiness "<scope>"` for larger or multi-slice work.
2. Run `.agent/boot/coding-anchor/bin/kira-coding-anchor-checkpoint "<scope>"`.
3. Confirm generated artifacts remain ignored unless deliberately promoted.
4. Stage only the files in the current atomic unit.
5. Commit and push only when the user asked, the workflow requires a durable checkpoint, or the ongoing slice pattern clearly implies save/publish hygiene.

For long sessions or a likely resume point, generate a compact handoff:

```bash
.agent/boot/coding-anchor/bin/athena-coding-anchor-compact "<scope>"
```

## Phase 6: Respond

Lead with the result, blocker, or next handhold:

1. What changed or what was found.
2. What verification passed.
3. What remains unverified, if anything.
4. The next smallest useful move.

Do not bury action items under summary text.

**Confirm**: "Kira /do route complete. Intent classified, slice verified, next handhold clear."

---

# workflow #do #router #kira
