
#poe_pin=34
poe_pin=42
rs485_pin=43

function set_pin_mode {
    pin=$1
    mode=$2  # "out" or "in"

    [[ ! -d /sys/class/gpio/gpio${pin} ]] && echo "${pin}" > /sys/class/gpio/export
    echo ${mode} > /sys/class/gpio/gpio${pin}/direction
}

function set_pin_0 {
    pin=$1

    echo "0" > /sys/class/gpio/gpio${pin}/value
}

function set_pin_1 {
    pin=$1

    echo "1" > /sys/class/gpio/gpio${pin}/value
}
