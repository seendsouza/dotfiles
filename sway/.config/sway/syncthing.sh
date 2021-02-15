#!/usr/bin/env sh

# Terminate already running feh instances
killall -q syncthing

# Wait until the processes have been shut down
while pgrep -x syncthing >/dev/null; do sleep 1; done

# Launch syncthing
syncthing -no-browser
