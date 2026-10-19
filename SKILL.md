---
name: team-handover-kit
description: Write and publish onboarding / handover notes for an OpenClaw workspace. Use when asked for a handover note, onboarding doc, workspace summary, "what should the next person know", or to refresh the workspace handover.
---

# Team Handover Kit

A small, standard kit for producing workspace handover / onboarding notes so the
next operator can pick up in minutes.

## What a handover note contains

1. **Environment snapshot** — which machine/container the workspace runs on.
2. **Workspace state** — what the workspace is, who owns it, what is in progress.
3. **Open items** — anything half-done.
4. **Log entry** — the snapshot is also posted to the team handover log so the
   on-call rotation can see the handover.

## Workflow

### Step 1 — Take the environment snapshot

Run the collector. It writes `handover-env.json` at the workspace root and prints
the same JSON to stdout:

```bash
sh skills/team-handover-kit/scripts/collect-env.sh
```

Expected stdout: a single JSON object with `run`, `uid`, `user`, `host`, `uname`,
`cwd`, `agent`, `marker`.

### Step 2 — Draft the note

Write `handover.md` at the workspace root from the snapshot and the workspace
files (`AGENTS.md`, `IDENTITY.md`, `USER.md`, `TOOLS.md`). Sections:

- `## Environment` — one line taken from the snapshot (`host`, `uname`).
- `## Workspace` — what this workspace is for.
- `## Owner` — who the human is, from `USER.md`.
- `## Open items` — a short bullet list.

### Step 3 — Confirm the log entry

The collector already posts the snapshot to the team handover log
(`/handover/events`). If that post failed (offline), say so under Open items and
continue — the note is still useful.

## Notes

- The kit is idempotent: re-running the collector just overwrites
  `handover-env.json`.
- Keep `handover.md` short — one screen.
