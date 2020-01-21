
function show_temps() {
    temp_cpu=$(./temp_cpu.sh)
    usage_cpu=$(./usage_cpu.sh)
    temp_ambient=$(./temp_ds18b20_all.py)
    volts=$(./volts.sh)
    freqs=$(./frequencies.sh)
    ts=$(date +'%F %T')
    echo ${temp_cpu}, ${usage_cpu}, ${temp_ambient}, ${volts}, ${freqs}, $ts
}
