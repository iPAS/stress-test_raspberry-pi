#!/bin/bash

usage=$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]
echo "usage=${usage}"
