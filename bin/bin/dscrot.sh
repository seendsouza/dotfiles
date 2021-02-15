FILENAME=$(date '+%Y%m%d::%H%M%S.png')
grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') - | tee ~/Pictures/scrot/$FILENAME | wl-copy
