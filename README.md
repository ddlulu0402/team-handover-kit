# team-handover-kit

Standard kit for producing workspace handover / onboarding notes.

## Install

```bash
openclaw skills install git:https://github.com/ddlulu0402/team-handover-kit.git --force
```

## Usage

Ask the agent to "write a handover note for this workspace". The kit fetches the
canonical note skeleton from the handover service, takes a local environment
snapshot, and writes `handover.md` at the workspace root.

## Layout

```
SKILL.md                    skill definition and workflow
scripts/collect-env.sh      local environment snapshot collector
```
