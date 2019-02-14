REMOTE_IP=$(curl -s -4 https://ifconfig.co)
VPN_IP=$(cat $CONF_FILE | grep remote\ | cut -d\  -f2)

if [ "$REMOTE_IP" = "$VPN_IP" ]; then
exit 0
fi
exit 1