#!/bin/bash

stress_period=$1
idle_period=$2

[[ -z ${stress_period} ]] && stress_period=$(( 600 * 60 ))
[[ -z ${idle_period} ]]   && idle_period=$(( 3 * 60 ))

. ./stress_test.sh
