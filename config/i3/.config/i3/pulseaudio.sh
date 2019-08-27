#!/usr/bin/env sh
#Terminate already running pulseaudio instances
killall -q pulseaudio
# Wait until the processes have been shut down
while pgrep -x pulseaudio >/dev/null; do sleep 1; done
# Launch pulseaudio
pulseaudio --start
