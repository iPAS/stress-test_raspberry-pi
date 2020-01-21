#!/bin/bash

for p in arm core; do
    msg="${msg}, freq_${p}=`vcgencmd measure_clock ${p} | sed 's/freq.*=//'`"
done

echo ${msg[@]:2}
