#!/bin/bash

[[ -z ${stress_period} ]] && stress_period=$(( 10 * 60 ))
[[ -z ${idle_period} ]]   && idle_period=$(( 15 ))

test_pids=()
phase_begin=$(date +%s)

. ./stress.sh
. ./collection.sh

trap 'genocide; exit 0' SIGINT SIGTERM

while true; do

    ## Turn-on phase
    if [ ${#test_pids[@]} -eq 0 ]; then

        if [ $(( $(date +%s) - phase_begin )) -ge $(( idle_period )) ]; then
            run_test test_pids
            echo '>>> Run the stress-test jobs:' ${test_pids[@]}
            phase_begin=$(date +%s)
        fi

    ## Turn-off phase
    else

        if [ $(( $(date +%s) - phase_begin )) -ge $(( stress_period )) ]; then
            genocide
            echo '>>> Kill the jobs:' ${test_pids[@]}
            
            # while kill -0 ${test_pids[@]} 2>/dev/null; do
            #     echo '>>> Waiting jobs termination:' ${test_pids[@]} 
            #     show_temps
            #     sync 
            #     sleep 1
            # done

            test_pids=()
            phase_begin=$(date +%s)
        fi

    fi

    # echo '>>> Background jobs:' $(jobs -p)
    show_temps
    sync 
    sleep 1
done
