---
name: visual-verify-ui
description: Kira-local visual QA gate for frontend and UI work.
context_trigger: "check UI, screenshot, does this look right, visual QA, responsive, browser test, layout check, frontend, viewport"
source: "Adapted from examples/skills/coding/visual-verify-ui/SKILL.md and examples/protocols/engineering/ENG-99-visual-verification.md"
---

# Visual Verify UI

Use this skill when a slice changes a visual surface: layout, styling,
responsive behavior, interactive UI, screenshots, charts, empty states, or a
local web app.

## Contract

- Do not call visual work complete until it has visual evidence.
- Prefer browser verification over code inspection for UI claims.
- Check at least desktop and mobile; add tablet when layout is dense or
  breakpoint-sensitive.
- Capture or record what was inspected: URL, viewport, state, and result.
- Report defects as concrete visual observations, not guesses.

## Default Flow

1. Start or identify the local app/server.
2. Open the target URL with the available browser tool.
3. Inspect desktop and mobile viewports.
4. Capture screenshots or record clear visual observations.
5. Create a visual report with `bin/athena-coding-anchor-visual-report` when a
   durable handhold helps.
6. Convert visual defects into atomic execution slices.

## Boundary

This skill does not replace tests, type checks, or builds. It closes the gap
where a UI can compile and still look wrong.
