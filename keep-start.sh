#!/data/data/com.termux/files/usr/bin/bash
APP="$HOME/foxbase"
if [ -f "$APP/keep.pid" ] && kill -0 "$(cat "$APP/keep.pid" 2>/dev/null)" 2>/dev/null; then exit 0; fi
nohup "$APP/keep.sh" >/dev/null 2>&1 &
echo $! > "$APP/keep.pid"
