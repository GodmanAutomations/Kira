---
description: Research current or external facts with source discipline, confidence, and Kira handoff hygiene
---

# /research - Kira Research Workflow

> **Latency Profile**: MEDIUM by default. Expand only when the decision risk requires it.
> **Philosophy**: Research to answer the decision, not to exhaust the internet.

## Phase 0: Scope The Question

// turbo

- [ ] State the primary research question in one sentence
- [ ] Identify the decision, action, or artifact the research supports
- [ ] List three to five sub-questions only when they materially improve coverage
- [ ] Identify what could make the answer stale: date, policy, pricing, API behavior, law, release status, market condition, or local context
- [ ] Run `.agent/boot/coding-anchor/bin/kira-coding-anchor-status` when branch, sync, or dirty state matters

If the request is repo-local, search Kira first:

```bash
.agent/boot/coding-anchor/bin/kira-coding-anchor-search "<topic>" --limit 5
```

If the request depends on current external facts, use live/current sources.

## Phase 1: Choose Research Depth

Pick the lightest depth that can support the answer:

| Depth | Use When | Source Bar |
| :--- | :--- | :--- |
| Quick check | One narrow fact or repo-local lookup | One authoritative source or local file |
| Standard brief | Recommendation, comparison, pricing, docs, policy, or API behavior | Three relevant sources when available |
| Deep brief | High-cost decision, public claim, legal/financial/medical/regulatory risk, or conflicting sources | Primary sources first plus independent cross-checks |
| Stop and ask | The decision criteria are unknown and would change the answer | One blocker question |

Do not force deep research when a primary source answers the question cleanly.
Do not rely on a single secondary source for important claims.

## Phase 2: Source Discipline

Use `.agent/boot/coding-anchor/skills/deep-research-loop/SKILL.md` and
`.agent/boot/coding-anchor/protocols/research-brief-gate.md` as the operating
contract.

Research rules:

1. Prefer primary sources: official docs, source-of-record pages, standards, repos, papers, statutes, or direct data.
2. Use secondary sources for interpretation, not as sole evidence.
3. Compare dates and event timing before treating a result as current.
4. Mark unsupported or single-source claims as unverified.
5. Track contradictions and explain which source is stronger.
6. Record confidence and what would change the answer.
7. Link sources in user-facing answers when web/current research was used.

When a durable local handhold helps, generate an ignored research brief:

```bash
.agent/boot/coding-anchor/bin/athena-coding-anchor-research-brief "<topic>"
```

Generated briefs stay ignored unless Stephen explicitly asks to promote one.

## Phase 3: Synthesize

Use this output shape unless the user requested a stricter format:

1. **Answer**: direct result or recommendation.
2. **Evidence**: short source-backed findings.
3. **Conflicts or gaps**: contradictions, stale edges, or missing data.
4. **Confidence**: High, Medium, or Low with reason.
5. **Next action**: what to do, verify, buy, build, send, or decide next.

For substantial research, include a compact source inventory:

| Source | Type | Used For | Confidence |
| :--- | :--- | :--- | :--- |
| `<link or local path>` | Primary/Secondary/Local | Claim checked | High/Medium/Low |

## Phase 4: Act On The Result

If research supports implementation:

1. Convert the recommendation into a `/plan` or `/do` route.
2. Use `.agent/boot/coding-anchor/bin/kira-coding-anchor-spec "<scope>"` when feature success criteria are unclear.
3. Use `.agent/boot/coding-anchor/bin/kira-coding-anchor-task "<scope>"` for the first execution slice.
4. Verify the execution separately from the research.

If research creates an open loop:

- Add it to the final action list.
- Update `.agent/boot/coding-anchor/OPEN-LOOPS.md` only when it is durable Kira state, not ordinary task noise.

## Phase 5: Verify And Close

Before claiming research is complete:

- Confirm every important factual claim has a source, local file, or explicit uncertainty marker.
- Confirm source dates are compatible with the current date.
- Confirm generated research briefs remain ignored unless deliberately promoted.
- For repo workflow edits, run `git diff --check`, referenced-path checks, and `.agent/boot/coding-anchor/bin/kira-coding-anchor-doctor`.

**Confirm**: "Kira research complete. Question scoped, sources checked, confidence stated, next action clear."

---

# workflow #research #sources #kira
