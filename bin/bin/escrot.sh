FILENAME=$(date '+%Y%m%d::%H%M%S.png')
slurp | grim -g - - | tee ~/Pictures/scrot/$FILENAME | wl-copy
