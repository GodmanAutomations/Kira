# Codex Runtime Notes

This packet does not install runtime hooks into Codex. Instead, it gives Codex
clear local files and scripts to load on demand.

## Kira-Local Mechanism

- `AGENTS.md` supplies local behavior for this boot packet.
- `START-HERE.md`, `BOOT.md`, and `CURRENT.md` supply boot continuity.
- `protocols/` turns hook ideas into explicit work loops.
- `schemas/` gives structured receipt formats.
- `bin/athena-coding-anchor-doctor` checks the packet is intact.

## Why This Shape

The source packet was CodeX-native and private-room-aware. Kira should not
pretend those private room surfaces are active here. A truthful rebuild keeps
the useful discipline while using files Kira can actually honor.
