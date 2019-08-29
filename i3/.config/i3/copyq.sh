#!/usr/bin/env sh

# Terminate already running feh instances
killall -q copyq

# Wait until the processes have been shut down
while pgrep -x copyq >/dev/null; do sleep 1; done

# Launch CopyQ
copyq
