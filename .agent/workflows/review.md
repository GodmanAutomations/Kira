---
description: Review a Kira artifact with adversarial lenses, severity findings, and verification before readiness
---

# /review - Kira Artifact Review

> **Latency Profile**: LOW for narrow artifacts, MEDIUM for release or multi-file reviews.
> **Philosophy**: Find real failure modes before declaring readiness.

## Phase 0: Scope The Artifact

// turbo

- [ ] Name the artifact, branch, file set, decision, or deliverable under review
- [ ] State the artifact thesis: what must be true for this to be ready
- [ ] State what would falsify that thesis
- [ ] Run `.agent/boot/coding-anchor/bin/kira-coding-anchor-status` when branch, sync, or dirty state matters
- [ ] Search Kira context with `.agent/boot/coding-anchor/bin/kira-coding-anchor-search "<topic>" --limit 5` when the relevant files, protocol, or prior pattern are not obvious

Use `.agent/boot/coding-anchor/skills/red-team-review/SKILL.md` and
`.agent/boot/coding-anchor/protocols/red-team-review-gate.md` as the review
contract.

## Phase 1: Choose Review Depth

Pick the lightest review that can catch meaningful failure:

| Depth | Use When | Output |
| :--- | :--- | :--- |
| Quick review | One small file, simple doc, or obvious change | Findings only, with verification gap if any |
| Standard review | Multi-step artifact, workflow, helper, or durable doc | Severity findings plus practical fixes |
| Release review | Public, user-facing, high-risk, or merge-ready artifact | Red-team report, verification evidence, and readiness verdict |
| Stop and ask | Artifact scope or readiness criteria are unclear | One blocker question |

Do not invent findings just to fill sections. If no material findings exist,
say that and name residual risk.

## Phase 2: Red-Team Lenses

Review through these lenses:

1. **Skeptic**: what would a competent critic say is wrong?
2. **User**: who could be confused, harmed, slowed down, or misled?
3. **Regulator**: what privacy, legal, policy, licensing, or safety exposure exists?
4. **Cynic**: what hidden incentive, vanity, or convenience bias might be steering the artifact?
5. **Future**: what breaks after drift, scale, handoff, or time?

Run the bias checklist:

- Sycophancy.
- Cherry-picking.
- False precision.
- Complexity bias.

For substantial reviews, generate an ignored review handhold:

```bash
.agent/boot/coding-anchor/bin/athena-coding-anchor-red-team "<artifact>"
```

Generated reviews stay ignored unless Stephen explicitly asks to promote one.

## Phase 3: Findings

List findings first, ordered by severity:

| Severity | Finding | Evidence | Practical Fix |
| :--- | :--- | :--- | :--- |
| Critical/High/Medium/Low | What fails or could fail | File, line, command, source, or observed behavior | Smallest fix that addresses it |

Severity definitions:

- **Critical**: immediate failure, data loss, security issue, or blocking release defect.
- **High**: materially reduces value, trust, correctness, or operability.
- **Medium**: important roughness, missed edge case, or likely confusion.
- **Low**: polish or non-blocking improvement.

Every Critical or High finding needs a practical fix. Convert accepted fixes
into `/plan` or `/do` atomic slices.

## Phase 4: Verification

Before declaring readiness:

- Run the deterministic checks relevant to the artifact.
- For workflow or boot-packet changes, run `git diff --check`, referenced-path checks, and `.agent/boot/coding-anchor/bin/kira-coding-anchor-doctor`.
- For scripts, run `bash -n` and a runtime smoke test.
- For schemas or JSON data, run `python3 -m json.tool` and schema-specific validation.
- For UI or visual artifacts, verify with browser or screenshot evidence.
- For current factual claims, use `/research` or the research brief gate.

If verification was skipped or blocked, the review verdict cannot be Ready.

## Phase 5: Verdict

Use one verdict:

| Verdict | Meaning |
| :--- | :--- |
| Ready | No Critical or High findings, verification passed, residual risk named |
| Ready with follow-up | Only Medium/Low findings remain and they have clear next actions |
| Not ready | Critical or High findings remain, or verification is blocked |
| Needs scoping | The artifact or readiness criteria are unclear |

## Phase 6: Response Shape

Return in this order:

1. Findings first, ordered by severity.
2. Open questions or assumptions.
3. Verification performed.
4. Verdict.
5. Next atomic fix or handhold.

**Confirm**: "Kira review complete. Findings ranked, verification named, readiness verdict clear."

---

# workflow #review #red-team #kira
