if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root"
    exit
else
    MACADDR=`head -n 1 /home/seen/bin/variables/rog_mac_address`
    USRNAME=`head -n 1 /home/seen/bin/variables/rog_user_name`
    read -s -p "Enter Password: " PASSWORD
    IPADDR=$(sudo arp-scan -l | awk "/$MACADDR/" | sed "s/$MACADDR.*//" | sed -e 's/[[:space:]]*$//')
    echo "$MACADDR: $USRNAME@$IPADDR"
    sudo mount -t cifs -o username=$USRNAME,password=$PASSWORD "//$IPADDR/KPOP" "/mnt/Music/KPOP"
    sudo mount -t cifs -o username=$USRNAME,password=$PASSWORD "//$IPADDR/Videos3" "/mnt/Videos3"
fi

