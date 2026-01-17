#!/bin/bash

# Data for connect to server
server_ip="{{server_ip}}"
server_port="{{server_port}}"
server_pubkey="{{hostvars[server_ansible]['result']['stdout']}}"

# Data for peer
peer_ip="{{peer_ip}}"
peer_net="{{peer_net}}"

# Key generate
wg genkey | tee /etc/wireguard/privatekey | wg pubkey | tee /etc/wireguard/publickey


# ========== Configure peer ==========
privkey=`cat /etc/wireguard/privatekey`

echo "[Interface]
PrivateKey = $privkey
Address = $peer_ip/32

[Peer]
PublicKey = $server_pubkey
Endpoint = $server_ip:$server_port
AllowedIPs = $peer_net/24
PersistentKeepalive = 20" > /etc/wireguard/wg0.conf

# ========== Configure peer ==========

sleep 1

# Run wireguard
wg-quick up wg0 && systemctl enable wg-quick@wg0

# Delete this script
rm /etc/wireguard/peer.sh

