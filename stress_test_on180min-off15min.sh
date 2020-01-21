#!/bin/bash

stress_period=$1
idle_period=$2

[[ -z ${stress_period} ]] && stress_period=$(( 180 * 60 ))
[[ -z ${idle_period} ]]   && idle_period=$(( 15 * 60 ))

. ./stress_test.sh
