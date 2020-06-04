#!/bin/bash

source gpio_pins.sh

set_pin_mode ${poe_pin} "out"
set_pin_0 ${poe_pin}
