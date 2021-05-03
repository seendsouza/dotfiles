ZOOM_URL="$1"
CONF_NO=$(echo $ZOOM_URL | awk -F'[=/]' '{print $5}' | awk -F'[=?]' '{print $1}')
PASSWORD=$(echo $ZOOM_URL | awk -F'[=&]' '{print $2}')
xdg-open "zoommtg://zoom.us/join?action=join&confno=$CONF_NO&pwd=$PASSWORD"
