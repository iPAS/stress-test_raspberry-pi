#!/bin/bash

vcgencmd get_mem gpu
sudo raspi-config nonint do_memory_split 256

