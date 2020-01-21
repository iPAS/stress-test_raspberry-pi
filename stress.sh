
function iperf_server() {
    while true; do iperf -s; sleep 1; done; 
}

function iperf_client() {
    while true; do iperf -c 127.0.0.1 -b 10M -t 60; sleep 1; done;
}

function run_test() {
    # https://www.thegeekstuff.com/2010/05/bash-variables/
    local ret_var=$1
    local pids=()

    ## CPU stress test
    stress-ng --cpu 4 --cpu-load 100 --timeout 1y  &
    #pids=( "${pids[@]}" $! )
    pids+=( $! )


    ## GPU test
    omxplayer --loop --fps 30 --win '0 0 960 540' --alpha 128 test.mp4  &
    pids+=( $! )


    ## iperf server
    iperf_server  &
    pids+=( $! )


    ## iperf client
    iperf_client  &
    pids+=( $! )

    eval "$ret_var=( ${pids[@]} )"
}


function genocide() {
    kill ${test_pids[@]}
    killall iperf
    killall omxplayer.bin
}
