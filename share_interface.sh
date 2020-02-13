#!/bin/bash

[[ $# -ne 2 ]] && echo "> $(basename $0) <LAN interface> <WLAN interface>" && exit 255

LAN=$1
WLAN=$2

#echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward >> /dev/null
sudo sysctl -w net.ipv4.ip_forward=1

sudo iptables -F
sudo iptables -t nat -F
#sudo iptables -t mangle -F

#sudo iptables -A POSTROUTING -o ${WLAN} -t nat -j MASQUERADE
#sudo iptables -A FORWARD -i ${WLAN} -o ${LAN} -m state --state RELATED,ESTABLISHED -j ACCEPT
#sudo iptables -A FORWARD -i ${LAN} -o ${WLAN} -j ACCEPT

sudo iptables -A FORWARD -i ${WLAN} -o ${LAN} -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i ${LAN} -j ACCEPT
sudo iptables -t nat -A POSTROUTING -o ${WLAN} -j MASQUERADE

sudo iptables -L -t nat
