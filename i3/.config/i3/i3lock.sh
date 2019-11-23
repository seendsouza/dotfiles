#!/usr/bin/env bash

# Suspend dunst and lock, then resume dunst when unlocked.
# pkill -u $USER -USR1 dunst
i3lock -n -i $HOME/Pictures/bglock.jpg \
    --insidecolor=373445ff --ringcolor=ffffffff --line-uses-inside \
    --keyhlcolor=d23c3dff --bshlcolor=d23c3dff --separatorcolor=00000000 \
    --insidevercolor=fecf4dff --insidewrongcolor=d23c3dff \
    --ringvercolor=ffffffff --ringwrongcolor=ffffffff --indpos="x+86:y+1003" \
    --radius=15 --veriftext="" --wrongtext=""
# pkill -u $USER -USR2 dunst

