#!/bin/bash

source gpio_pins.sh

set_pin_mode ${rs485_pin} "out"
set_pin_1 ${rs485_pin}
