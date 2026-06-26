# Kira Use Map

This is the Coding Anchor map for using Kira's repo-native machinery without
loading the whole workspace into context.

## Current Inventory

Verified on 2026-06-14:

- Skills live under `examples/skills/` in this public checkout.
- `SKILL-ROUTER.md` classifies all 26 example skills by current usefulness and
  repair status.
- Workflows live under `.agent/workflows/`.
- Architecture docs live mainly in `docs/ARCHITECTURE.md`,
  `docs/SEMANTIC_SEARCH.md`, and `docs/KNOWLEDGE_GRAPH.md`.
- The working search script is `.agent/scripts/smart_search.py`.
- The `semantic-search` skill still referenced an old
  `examples/scripts/smart_search.py` path, so this packet adopts a corrected
  Kira-local version.

## Adopted Now

| Need | Use | Why |
| :--- | :--- | :--- |
| Find relevant Kira context before acting | `skills/semantic-search/SKILL.md` + `bin/kira-coding-anchor-search` | Matches Kira's retrieval-first architecture and works in this checkout. |
| Spec before feature work | `skills/spec-driven-dev/SKILL.md` + `bin/kira-coding-anchor-spec` | Pins goal, scope, architecture, edge cases, and acceptance checks before building. |
| Execute the next slice | `skills/atomic-execution/SKILL.md` + `bin/kira-coding-anchor-task` | Turns plans into one verification-gated task instead of a sprawling pass. |
| Loop through known work efficiently | `protocols/auto-loop-conductor.md` + `bin/kira-coding-anchor-autoloop` | Runs status, doctor, inventory, priority queue, pass plan, verification, and stop gates without becoming blind autopilot. |
| Diagnose before refactoring | `skills/diagnostic-refactor/SKILL.md` + `bin/athena-coding-anchor-refactor-report` | Creates a bill of materials before touching stale or messy surfaces. |
| Review before shipping | `skills/red-team-review/SKILL.md` + `bin/athena-coding-anchor-red-team` | Finds shared blind spots before merge, release, or durable closeout. |
| Ask another agent to review Codex's finished slice | `skills/code-review-subagent/SKILL.md` + `bin/kira-coding-anchor-code-review` | Creates a bounded read-only subagent prompt before checkpointing meaningful changes. |
| Plan checkpoints | `skills/micro-commit/SKILL.md` + `bin/athena-coding-anchor-checkpoint` | Splits verified work into intentional save points without requiring Stephen to say `commit`. |
| Handle auth prompts | `protocols/credential-prompt-handling.md` | Uses approved local secret sources and computer/browser automation without exposing secrets. |
| Verify UI visually | `skills/visual-verify-ui/SKILL.md` + `bin/athena-coding-anchor-visual-report` | Requires browser/screenshot evidence for frontend and visual artifact work. |
| Preserve long-session state | `skills/context-compactor/SKILL.md` + `bin/athena-coding-anchor-compact` | Creates a compact continuation handoff without rewriting Kira's public memory bank. |
| Research current or external facts | `skills/deep-research-loop/SKILL.md` + `bin/athena-coding-anchor-research-brief` | Cross-checks claims, sources, confidence, and gaps before acting. |
| Record meaningful choices | `skills/decision-journal/SKILL.md` + `bin/athena-coding-anchor-decision` | Captures alternatives, assumptions, confidence, and post-mortem structure. |
| Score multi-factor choices | `skills/mcda-solver/SKILL.md` + `bin/athena-coding-anchor-mcda` | Forces options, criteria, weights, sensitivity checks, and dealbreaker review. |
| Build brand foundations | `skills/brand-foundations/SKILL.md` + `bin/athena-coding-anchor-brand` | Grounds naming, voice, positioning, value, proof, and visual direction before public work. |
| Check distribution physics | `skills/distribution-physics/SKILL.md` + `bin/athena-coding-anchor-distribution` | Tests PMOD, channels, acquisition friction, unit economics, and Four Fits before launch work. |
| Audit SEO surfaces | `skills/seo-auditor/SKILL.md` + `bin/athena-coding-anchor-seo-audit` | Checks metadata, headings, internal links, content gaps, indexability, and barnacle opportunities. |
| Review trust and social contracts | `skills/consiglieri-protocol/SKILL.md` + `bin/athena-coding-anchor-trust-review` | Checks exit, pressure, information leakage, blast radius, incentives, and Adult-to-Adult response shape. |
| Gate repeated risk | `skills/trading-risk-gate/SKILL.md` + `bin/athena-coding-anchor-risk-gate` | Reviews ruin classes, ergodicity, survival probability, and WR/RR assumptions before repeated exposure. |
| Plan execution constraints | `skills/zenith-execution/SKILL.md` + `bin/athena-coding-anchor-execution-plan` | Defines Half-Kelly, invalidation, simulation, drawdown, and pause rules after the risk gate passes. |
| Analyze data and experiments | `skills/statistical-analysis/SKILL.md` + `bin/athena-coding-anchor-statistics` | Audits data quality, assumptions, tests, effect sizes, confidence, and practical meaning. |
| Review repeated-action performance | `skills/trade-journal-analyzer/SKILL.md` + `bin/athena-coding-anchor-performance-review` | Classifies records as noise, execution gap, structural flaw, or edge decay before changing the system. |
| Deliver formal work products | `skills/academic-delivery/SKILL.md` + `bin/athena-coding-anchor-deliverable` | Forces intake, V1 draft, red-team, revision, compile, and exit-gate verification before delivery. |
| Check readiness before save or handoff | `protocols/readiness-checkpoint-gate.md` + `bin/kira-coding-anchor-readiness` | Summarizes adopted skills, helpers, ignored generated artifacts, source-only boundaries, and git state. |
| Pause damaging loops | `skills/circuit-breaker/SKILL.md` + `bin/athena-coding-anchor-circuit-breaker` | Stops repeated failures, fatigue, and compulsive retrying before damage compounds. |
| Protect negotiation leverage | `skills/power-inversion/SKILL.md` + `bin/athena-coding-anchor-negotiation` | Maps BATNA, protects assets, and requires commitment before releasing value. |
| Prepare client quotes | `skills/client-pricing/SKILL.md` + `bin/athena-coding-anchor-quote` | Defines scope, anchor, floor, payment terms, and pushback boundaries. |
| Keep work bounded and verifiable | `protocols/autonomous-work-loop.md` + `protocols/verification-loop.md` | Already part of Coding Anchor boot. |
| Choose future skills | `SKILL-ROUTER.md` plus `examples/skills/*/SKILL.md` | Prevents copying the whole skill library blindly. |

## High-Value Candidates For Later

| Skill | Path | Adopt When |
| :--- | :--- | :--- |
| None currently | - | Remaining source skills either need repair or should stay outside the boot packet. |

## Routing Rule

Before broad Kira work:

1. Run `bin/kira-coding-anchor-search "<topic>" --limit 5`.
2. Check `SKILL-ROUTER.md` for the matching source or adopted skill.
3. Read the highest-signal files returned by search.
4. Load a skill only when its trigger matches the task and it changes the next
   move.
5. Record durable findings here only when they improve future routing.

Before feature work:

1. Use `skills/spec-driven-dev/SKILL.md`.
2. Create a compact spec with `bin/kira-coding-anchor-spec`.
3. Convert acceptance criteria into atomic execution slices.

When executing a plan:

1. Use `skills/atomic-execution/SKILL.md`.
2. Generate or mentally hold one task block.
3. Run the stated verification before taking the next slice.

When Stephen asks Kira to keep moving through multiple slices:

1. Use `protocols/auto-loop-conductor.md`.
2. Create an ignored loop report with `bin/kira-coding-anchor-autoloop "<scope>" --passes N`.
3. Add `--task` when pass 1 needs an ignored XML task handhold.
4. Execute only the next verified pass.
5. Rerun the loop after each verified pass instead of stacking unverified work.

When refactoring or cleaning up:

1. Use `skills/diagnostic-refactor/SKILL.md`.
2. Create a report with `bin/athena-coding-anchor-refactor-report`.
3. Convert accepted findings into atomic execution slices.

Before shipping or merging:

1. Use `skills/red-team-review/SKILL.md`.
2. Create a review with `bin/athena-coding-anchor-red-team`.
3. Convert critical or high findings into atomic execution slices.

Before checkpointing meaningful code, workflow, script, schema, or boot-packet changes:

1. Use `skills/code-review-subagent/SKILL.md`.
2. Create a prompt with `bin/kira-coding-anchor-code-review "<artifact>" --files "<changed files>" --checks "<verification>"`.
3. Spawn a read-only review subagent when the runtime supports subagents.
4. Fix Critical or High findings before saving, or mark the slice Not Ready.

Before checkpointing:

1. Use `skills/micro-commit/SKILL.md`.
2. Create a checkpoint plan with `bin/athena-coding-anchor-checkpoint`.
3. Stage only the verified files in the current atomic unit.

When blocked by auth:

1. Use `protocols/credential-prompt-handling.md`.
2. Try approved local secret sources and existing sessions first.
3. Ask Stephen only for one-time, phone, biometric, CAPTCHA, or physical-world
   blockers.

When working on UI:

1. Use `skills/visual-verify-ui/SKILL.md`.
2. Open the target in the available browser tool.
3. Check desktop and mobile before calling the work complete.
4. Use `bin/athena-coding-anchor-visual-report` when a durable report helps.

When context is getting long:

1. Use `skills/context-compactor/SKILL.md`.
2. Create a handoff with `bin/athena-coding-anchor-compact`.
3. Preserve current request, branch/worktree, files, verification, blockers,
   and next slice.

When researching:

1. Use `skills/deep-research-loop/SKILL.md`.
2. Prefer primary sources and current official docs.
3. Create a brief with `bin/athena-coding-anchor-research-brief` when a
   durable local handhold helps.

When making a meaningful decision:

1. Use `skills/decision-journal/SKILL.md`.
2. Capture alternatives, assumptions, confidence, and what would change the
   call.
3. Create a note with `bin/athena-coding-anchor-decision` when the rationale
   should survive the session.

When scoring a multi-factor choice:

1. Use `skills/mcda-solver/SKILL.md`.
2. Create a matrix with `bin/athena-coding-anchor-mcda`.
3. Check weights, dealbreakers, and sensitivity before recommending.

When building brand foundations:

1. Use `skills/brand-foundations/SKILL.md`.
2. Create a guide with `bin/athena-coding-anchor-brand`.
3. Define purpose, enemy, audience, voice, value, proof, visual direction,
   open questions, and next slice.

When checking distribution physics:

1. Use `skills/distribution-physics/SKILL.md`.
2. Create a plan with `bin/athena-coding-anchor-distribution`.
3. Check PMOD, primary and backup channels, channel tax, CAC, LTV, margin,
   Four Fits, one experiment, and kill criteria.

When auditing SEO:

1. Use `skills/seo-auditor/SKILL.md`.
2. Create a triage note with `bin/athena-coding-anchor-seo-audit`.
3. Check search intent, metadata, heading structure, internal links, content
   gaps, technical blockers, barnacle opportunities, prioritized fixes, and
   verification.

When reviewing trust and social contracts:

1. Use `skills/consiglieri-protocol/SKILL.md`.
2. Create a trust review with `bin/athena-coding-anchor-trust-review`.
3. Check Pryce Test, Exit Test, information security, time pressure, blast
   radius, counterparty incentives, Vibe Veto signals, Adult-to-Adult rewrite,
   and proceed/pause/exit decision.

When gating repeated risk:

1. Use `skills/trading-risk-gate/SKILL.md`.
2. Create a review with `bin/athena-coding-anchor-risk-gate`.
3. Check ruin classes, per-trial ruin probability, repeated-trial survival,
   WR/RR assumptions, variance drag, and pass/warn/veto/sandbox verdict.

When planning execution constraints:

1. Use `skills/zenith-execution/SKILL.md`.
2. Create a plan with `bin/athena-coding-anchor-execution-plan`.
3. Confirm risk gate pass, define Half-Kelly or lower sizing, structural
   invalidation, sequence simulation, drawdown thresholds, pause rules, and
   execute/reduce/wait/abstain verdict.

When analyzing data or experiments:

1. Use `skills/statistical-analysis/SKILL.md`.
2. Create a plan with `bin/athena-coding-anchor-statistics`.
3. Audit data quality, variable types, missingness, assumptions, test choice,
   effect sizes, confidence intervals where applicable, practical meaning, and
   limitations.

When reviewing repeated-action performance:

1. Use `skills/trade-journal-analyzer/SKILL.md`.
2. Create a review with `bin/athena-coding-anchor-performance-review`.
3. Classify the record as noise, execution gap, structural flaw, or edge decay
   before changing the system.

When producing or reviewing a formal deliverable:

1. Use `skills/academic-delivery/SKILL.md`.
2. Create a plan with `bin/athena-coding-anchor-deliverable`.
3. Intake the brief, draft V1 as working copy, red-team, revise, compile, and
   verify the exit gate before delivery.

Before checkpointing, publishing, or handing off a long boot-packet run:

1. Use `protocols/readiness-checkpoint-gate.md`.
2. Create a readiness report with `bin/kira-coding-anchor-readiness`.
3. Confirm doctor, syntax checks, schemas, stale/private scan, ignored
   artifacts, and intentional git state before saving or publishing.

When a loop starts going bad:

1. Use `skills/circuit-breaker/SKILL.md`.
2. Stop the lane, name red flags, and create an AAR with
   `bin/athena-coding-anchor-circuit-breaker` when useful.
3. Resume only with a smaller next action, better input, or Stephen direction.

When negotiating or protecting a deal:

1. Use `skills/power-inversion/SKILL.md`.
2. Create a prep note with `bin/athena-coding-anchor-negotiation`.
3. Secure commitment before releasing valuable work, information, access, or
   strategy.

When preparing a quote:

1. Use `skills/client-pricing/SKILL.md`.
2. Create a quote prep with `bin/athena-coding-anchor-quote`.
3. Define scope, exclusions, anchor, floor, payment terms, and pushback plan
   before sending or accepting price changes.
