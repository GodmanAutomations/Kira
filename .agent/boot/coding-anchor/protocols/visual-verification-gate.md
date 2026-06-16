# Visual Verification Gate

Use this gate before declaring frontend, UI, layout, or visual artifact work
done.

## Gate

1. Identify the visual target: URL, file, route, component, or artifact.
2. Verify the app or artifact can be opened.
3. Inspect at least desktop and mobile viewports.
4. Check for overlap, clipping, unreadable text, broken assets, blank canvases,
   layout jumps, and obvious interaction failures.
5. Capture screenshots or create a visual report.
6. List any visual defects as follow-up slices before calling the work ready.

## Trust Rule

For UI work, build success is not enough. The claim is only verified after the
surface is seen in the relevant viewport or rendered artifact.

## Athena Boundary

Generated visual reports live under `visual-checks/` and are ignored by Git
unless Stephen explicitly asks to preserve one as a receipt artifact.
