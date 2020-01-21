#!/bin/bash

addr=$1
[[ "${addr}" == "" ]] && addr=192.168.1.70

function send_command() {
    local cmd=$1
    echo "${addr} > $cmd"
    eval "ssh pi@${addr} \"${cmd}\""
}

send_command "sudo date +'%F %T' -s '$(date +'%F %T')'"                   
send_command "sudo fake-hwclock save"
