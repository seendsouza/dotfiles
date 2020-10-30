systemctl --user stop pulseaudio.socket
systemctl --user stop pulseaudio.service
systemctl --user start pulseaudio.service
systemctl --user start pulseaudio.socket
