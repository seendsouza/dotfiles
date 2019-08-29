# Use 25 MiB of RAM for debug logs
exec i3 --shmlog-size=26214400
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd
# xmodmap to activate on init
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

xset-b

export LD_PRELOAD=/usr/lib/libv4l/v4l2convert.so

