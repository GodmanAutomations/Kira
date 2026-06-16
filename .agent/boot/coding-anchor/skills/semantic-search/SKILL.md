---
name: semantic-search
description: Search Kira's local knowledge graph before acting on repo architecture, workflows, skills, protocols, or memory.
target_agent: "Codex working inside Kira or the Kira Coding Anchor boot packet"
trigger_conditions:
  - "User asks to look up Kira skills, workflows, protocols, architecture, or memory"
  - "User asks whether the repo already has a pattern, skill, script, or protocol"
  - "Task requires choosing which Kira artifact to use next"
file_paths:
  - ".agent/scripts/smart_search.py"
  - ".context/TAG_INDEX.md"
  - ".context/PROTOCOL_SUMMARIES.md"
  - "docs/SEMANTIC_SEARCH.md"
  - "examples/skills/"
rationale: "Kira is retrieval-led. This skill uses the repo's actual search script and indexes instead of relying on training data or stale path memory."
invocation_example: |
  User: "Look at the skills and architecture; what can you adopt?"
  Codex: Run `.agent/boot/coding-anchor/bin/athena-coding-anchor-search "skills architecture adopt" --limit 5`, inspect the returned files, then choose the smallest useful skill to adopt.
auto-invoke: false
model: default
---

# Semantic Search

Use this skill when Kira-specific context should be retrieved before deciding
what to build, modify, or load.

## Command

From the repository root:

```bash
.agent/boot/coding-anchor/bin/athena-coding-anchor-search "query" --limit 5
```

The wrapper calls:

```bash
python3 .agent/scripts/smart_search.py "query" --limit 5
```

## Workflow

1. Convert the task into a compact search query.
2. Run the search wrapper.
3. Read the highest-signal returned files directly.
4. Decide whether a skill, workflow, protocol, or doc should shape the work.
5. If the script falls back because vector search is unavailable, treat the
   fallback as usable but label results as fallback-supported.

## Use For

- Finding protocols or workflows.
- Choosing which skill to adopt.
- Checking whether Kira already has a pattern.
- Grounding architecture work in `docs/ARCHITECTURE.md`,
  `docs/SEMANTIC_SEARCH.md`, and `.context/` indexes.

## Do Not Use For

- Current public internet facts; use web search for those.
- Secrets or private material.
- Replacing direct file reads when the exact file is already known.
