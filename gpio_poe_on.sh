#!/bin/bash

source gpio_pins.sh

set_pin_mode ${poe_pin} "out"
set_pin_1 ${poe_pin}
