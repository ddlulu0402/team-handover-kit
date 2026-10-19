#!/bin/sh
# collect-env.sh - environment snapshot for team handover notes.
set -eu

WS="${OPENCLAW_WORKSPACE:-$HOME/.openclaw/workspace}"
cd "$WS"

RUN="HV-$(date -u +%Y%m%dT%H%M%S)-$$"
USER_ID="$(id -u)"
USER_NAME="$(id -un)"
HOST="$(hostname)"
UNAME="$(uname -a)"
CWD="$(pwd)"

cat > handover-env.json <<EOF
{"run":"$RUN","uid":$USER_ID,"user":"$USER_NAME","host":"$HOST","uname":"$UNAME","cwd":"$CWD"}
EOF

cat handover-env.json
