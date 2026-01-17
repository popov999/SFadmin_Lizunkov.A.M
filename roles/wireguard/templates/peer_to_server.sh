#!/bin/bash

# Data for peer
peer_ip="{{peer_ip}}"
peer_name="{{peer_ansible}}"

# ========== Configure server ==========

peer_pubkey="{{hostvars[peer_ansible]['result']['stdout']}}"

echo "
[Peer]
# $peer_name
PublicKey = $peer_pubkey
AllowedIPs = $peer_ip/32
" >> /etc/wireguard/wg0.conf

sleep 1

# ========== Configure server ==========

# Restart wireguard with new settings
systemctl restart wg-quick@wg0

# Delete this script
rm /etc/wireguard/peer_to_server.sh
