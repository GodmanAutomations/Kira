---
name: distribution-physics
description: Athena-local go-to-market, channel fit, and distribution viability skill.
context_trigger: "go-to-market, distribution, channel, GTM, launch, market entry, acquisition, organic vs paid, CAC, LTV"
source: "Adapted from examples/skills/business/distribution-physics/SKILL.md plus current Athena strategy protocols."
---

# Distribution Physics

Use this skill when a product, offer, service, or public project needs a real
path to market before build effort or launch work expands.

## Contract

- Reject "build it and they will come" as a strategy.
- Start with problem, market, operations, and distribution before tactics.
- Identify the primary acquisition channel and the cost paid for it: cash,
  time, relationship capital, platform risk, or equity.
- Check product-channel fit and channel-model fit before recommending a launch
  plan.
- Keep CAC, LTV, margin, and payback assumptions explicit.
- Treat "no viable channel" as a pivot signal, not a copywriting problem.

## Default Flow

1. Name product, audience, offer, and desired action.
2. Score PMOD: problem, market, operations, distribution.
3. Choose primary and backup channels.
4. Estimate channel friction, CAC, LTV, margin, and payback.
5. Check Four Fits: market-product, product-channel, channel-model,
   model-market.
6. Pick one testable next distribution experiment.
7. Name kill criteria, evidence needed, and next slice.

## Output Shape

Create a compact distribution plan with:

- product and audience
- PMOD scan
- channel shortlist
- unit economics assumptions
- Four Fits check
- experiment
- kill criteria
- open questions
- next slice

## Helper

Use `bin/athena-coding-anchor-distribution "<product>"` to create a local
distribution plan template. Generated plans live under `distribution-plans/`
and are ignored by Git unless Stephen deliberately promotes one.
