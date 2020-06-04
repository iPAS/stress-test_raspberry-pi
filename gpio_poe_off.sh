#!/bin/bash

source gpio_pins.sh

[[ ! -d /sys/class/gpio/gpio${poe_pin} ]] && echo "${poe_pin}" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio${poe_pin}/direction

#echo "1" > /sys/class/gpio/gpio${poe_pin}/value
echo "0" > /sys/class/gpio/gpio${poe_pin}/value

