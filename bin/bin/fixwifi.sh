sudo ip link set wlan0 down
sudo systemctl stop NetworkManager
sudo systemctl stop dhcpcd
sudo systemctl start NetworkManager
sudo systemctl start dhcpcd
