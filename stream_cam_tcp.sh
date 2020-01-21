#!/bin/bash

echo "Please open the stream at tcp://$(hostname -I):5000/"
echo "At the host:"
echo "\$ mplayer -x 1280 -y 720 -geometry 0:0 -fps 200 -demuxer h264es -noborder ffmpeg://tcp://$(hostname -I):5000"

#raspivid -a 12 -t 0 -fps 10 -l -o tcp://0.0.0.0:5000
raspivid -a 12 -t 0 -fps 10 -l -o - | nc -k -l 5000

