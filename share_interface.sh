#!/bin/bash

[[ $# -ne 2 ]] && echo "> $(basename $0) <LAN interface> <WLAN interface>" && exit 255

IN=$1
OUT=$2

echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward >> /dev/null

sudo iptables -F
sudo iptables -t nat -F
sudo iptables -t mangle -F

#sudo iptables -A POSTROUTING -o ${OUT} -t nat -j MASQUERADE
#sudo iptables -A FORWARD -i ${OUT} -o ${IN} -m state --state RELATED,ESTABLISHED -j ACCEPT
#sudo iptables -A FORWARD -i ${IN} -o ${OUT} -j ACCEPT

sudo iptables -t nat -A POSTROUTING -o ${OUT} -j MASQUERADE
sudo iptables -A FORWARD -i ${IN} -j ACCEPT

sudo iptables -L -t nat
