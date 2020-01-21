#!/bin/bash

# core = CPU/GPU core
# sdram_c = controller
# sdram_i = Input/Output
# sdram_p = physical

for p in core sdram_c sdram_i sdram_p; do
    msg="${msg}, volt_${p}`vcgencmd measure_volts ${p} | sed 's/volt//'`"
done

echo ${msg[@]:2}
