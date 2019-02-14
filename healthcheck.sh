REMOTE_IP=$(curl -s https://ifconfig.co)
VPN_IP=$(cat $CONF_FILE | grep remote\ | cut -d\  -f2)

if [ "$REMOTE_IP" = "$VPN_IP" ]; then
exit 0
fi
exit 1