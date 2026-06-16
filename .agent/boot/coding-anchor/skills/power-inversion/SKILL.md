---
name: power-inversion
description: Kira-local negotiation and commitment-protection skill.
context_trigger: "negotiation, BATNA, leverage, pricing pushback, protect this deal, deposit, escrow, commitment, they want info first, too expensive"
source: "Adapted from examples/skills/quality/power-inversion/SKILL.md, examples/protocols/decision/DEC-64-commitment-device-framework.md, and examples/protocols/decision/DEC-163-precommitment-heuristic.md"
---

# Power Inversion

Use this skill when a deal, negotiation, sale, partnership, quote, or
information exchange could put Stephen in a weak position.

## Contract

- Map both sides' BATNA before recommending a move.
- Do not release valuable information, access, work, profiles, or strategy
  before securing commitment.
- Treat zero-cost words as weak signal; prefer deposits, forms, contracts,
  escrow, public commitments, or other costly signals.
- Preserve Stephen's ability to walk.
- Watch for pricing anchors that come from the counterparty rather than
  structural value.
- Use MCDA or decision journaling if the negotiation choice becomes
  multi-factor or durable.

## Default Flow

1. State the deal and what Stephen risks giving away.
2. Map Stephen's BATNA and the counterparty BATNA.
3. Identify the asset or leverage that must be protected.
4. Choose a commitment device.
5. Draft the next move in calibrated language.
6. Name the walk-away condition.

## Commitment Devices

- refundable deposit
- retainer or partial upfront payment
- signed scope of work
- penalty or bypass clause
- partial information release
- watermarking or audit trail
- escrow
- counterparty effort before Stephen effort

## Helper

Use `bin/athena-coding-anchor-negotiation "<deal>"` to create a local
negotiation prep note. Generated notes live under `negotiations/` and are
ignored by Git unless Stephen deliberately promotes one.
