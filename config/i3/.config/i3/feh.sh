#!/usr/bin/env sh

# Terminate already running feh instances
killall -q feh 

# Wait until the processes have been shut down
while pgrep -x feh >/dev/null; do sleep 1; done

# Launch feh
feh --bg-scale ~/Pictures/bg.png

