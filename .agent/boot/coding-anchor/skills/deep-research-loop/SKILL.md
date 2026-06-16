---
name: deep-research-loop
description: Athena-local multi-source research and claim-checking skill.
context_trigger: "research, deep dive, investigate, compile, multi-source, current facts, pricing, policy, docs, citations, literature search"
source: "Adapted from examples/skills/research/deep-research-loop/SKILL.md"
---

# Deep Research Loop

Use this skill when a task depends on external facts, current information,
policy, pricing, official documentation, or a decision that needs more than one
source.

## Contract

- Start with one clear research question.
- Prefer primary sources first: official docs, standards, repos, papers, or
  source-of-record pages.
- Use secondary sources for interpretation, not as the only evidence.
- Look for disagreement, stale dates, and missing context.
- Mark single-source claims as unverified.
- Give confidence ratings and say what would change the assessment.
- Include source links in the final answer when web research is used.

## Default Flow

1. Scope the question and 3-5 sub-questions.
2. Gather at least three relevant sources when the topic warrants depth.
3. Cross-reference claims and identify conflicts.
4. Synthesize findings into a short research brief.
5. Convert the result into a recommendation, next slice, or explicit unknown.

## Helper

Use `bin/athena-coding-anchor-research-brief "<topic>"` when a durable local
research handhold helps. Generated briefs live under `research-briefs/` and are
ignored by Git unless Stephen deliberately promotes one.
