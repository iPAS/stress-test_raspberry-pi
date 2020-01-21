#!/bin/bash

echo 1 | sudo tee /sys/class/backlight/rpi_backlight/bl_power
read -n 1 -s -r -p "Press any key to continue"
echo 0 | sudo tee /sys/class/backlight/rpi_backlight/bl_power

