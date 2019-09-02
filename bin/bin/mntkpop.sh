if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root"
    exit
else
    MACADDR=`head -n 1 ./variables/rog_mac_address`
    USRNAME=`head -n 1 ./variables/rog_user_name`
    echo $USRNAME
    read -s -p "Enter Password: " PASSWORD
    IPADDR=$(sudo arp-scan -l | awk "/$MACADDR/" | sed "s/$MACADDR.*//" | sed -e 's/[[:space:]]*$//')
    sudo mount -t cifs -o username=$USRNAME,password=$PASSWORD "//$IPADDR/KPOP" "/mnt/Music/KPOP"
    printf "\nMounted $IPADDR\n"
fi
