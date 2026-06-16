---
name: client-pricing
description: Kira-local quote, scope, anchor, floor, and pricing-pushback skill.
context_trigger: "pricing, quote, proposal, how much should I charge, rate card, hourly rate, project fee, scope creep, pricing pushback, client budget"
source: "Adapted from examples/skills/business/client-pricing/SKILL.md"
---

# Client Pricing

Use this skill when Stephen needs to quote, price, defend, or re-scope work.

## Contract

- Do not price by hours unless the business model explicitly requires it.
- Prefer outcome, access, or deliverable value over time/output pricing.
- Separate anchor, target, floor, and walk-away.
- Never open at the floor.
- Never negotiate against yourself after stating the anchor.
- Ask for the client's budget before countering.
- Treat additions above 10% of agreed scope as a re-quote trigger.
- Pair with `power-inversion` when the client wants value before commitment.

## Default Flow

1. Define the deliverable and exclusions.
2. Identify deadline, speed premium, complexity premium, and risk.
3. Set anchor, target, floor, and walk-away.
4. State payment terms and commitment device.
5. Prepare pushback responses.
6. Write a scoped quote.

## Pushback Rules

- Within 20% of anchor: counter near midpoint.
- 40-60% of anchor: counter above floor and reduce scope if needed.
- Below floor: hold floor or walk.
- Three rounds maximum; after that it is haggling, not negotiation.

## Helper

Use `bin/athena-coding-anchor-quote "<deliverable>"` to create a local quote
template. Generated quote notes live under `quotes/` and are ignored by Git
unless Stephen deliberately promotes one.
