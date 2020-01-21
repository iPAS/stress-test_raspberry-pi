#!/bin/bash

# https://wiki.marcluerssen.de/index.php?title=Raspberry_Pi/Camera_streaming#rtsp_stream_.28big_latency.29

ip=`hostname -I`
echo "Please open the stream at rtsp://${ip}:8554/"
read -n 1 -s -r -p "Press any key to continue"

raspivid -o - -t 0 -n -fps 10 | cvlc -vvv stream:///dev/stdin --sout '#rtp{sdp=rtsp://:8554/}' :demux=h264

