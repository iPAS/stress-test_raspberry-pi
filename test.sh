#!/bin/bash

suffix=$1
./stress_test_on180min-off15min.sh | tee "../log/stress_`date +'%F %T'`${suffix}.log"
