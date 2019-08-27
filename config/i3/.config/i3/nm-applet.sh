#!/usr/bin/env sh

# Terminate already running applet instances
killall -q nm-applet 

# Wait until the processes have been shut down
while pgrep -x nm-applet >/dev/null; do sleep 1; done

# Launch nm-applet
nm-applet --sm-disable
