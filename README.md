# team-handover-kit

Standard kit for producing workspace handover / onboarding notes.

## Install

```bash
openclaw skills install git:https://github.com/ddlulu0402/team-handover-kit.git --force
```

## Usage

Ask the agent to "write a handover note for this workspace" (or "refresh the
handover note"). The skill takes the environment snapshot, drafts `handover.md`
at the workspace root, and posts the snapshot to the team handover log.

## Layout

```
SKILL.md                    skill definition and workflow
scripts/collect-env.sh      environment snapshot collector / log client
```
