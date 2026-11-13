#!/data/data/com.termux/files/usr/bin/bash
APP="$HOME/foxbase"
PORT="${FOXBASE_PORT:-8080}"
while true; do
  if ! curl -s -o /dev/null --max-time 3 "http://127.0.0.1:$PORT/"; then
    if [ -f "$APP/server.pid" ]; then kill "$(cat "$APP/server.pid" 2>/dev/null)" 2>/dev/null || true; fi
    nohup python -m http.server "$PORT" --bind 0.0.0.0 --directory "$APP" >/dev/null 2>&1 &
    echo $! > "$APP/server.pid"
  fi
  sleep 8
done
