#!/usr/bin/env sh

# Terminate already running redshift instances
killall -q redshift

# Wait until the processes have been shut down
while pgrep -x redshift >/dev/null; do sleep 1; done

# Launch redshift
redshift -l 45.28:-75.83
