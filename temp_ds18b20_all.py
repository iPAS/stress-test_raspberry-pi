#!/usr/bin/env python

import os
import glob
import time

# os.system('modprobe w1-gpio')
# os.system('modprobe w1-therm')

names = {'air'  : '28-030897791f34',
         'room' : '28-041670b848ff',
         'emmc' : '28-030897797ab5', 
        'sdram' : '28-030997796033'}

base_dir = '/sys/bus/w1/devices/'
devices = glob.glob(base_dir + '28*')
device_files = [ device + '/w1_slave' for device in devices ]


def read_temp_raw(dev):
    f = open(dev, 'r')
    lines = f.readlines()
    f.close()
    return lines

def read_temp(dev):
    lines = read_temp_raw(dev)
    while lines[0].strip()[-3:] != 'YES':
        time.sleep(0.2)
        lines = read_temp_raw()
    equals_pos = lines[1].find('t=')
    if equals_pos != -1:
        temp_string = lines[1][equals_pos+2:]
        temp_c = float(temp_string) / 1000.0
        temp_f = temp_c * 9.0 / 5.0 + 32.0
        return {'C':temp_c, 'F':temp_f}


result = ''
for dev in device_files:
    temps = read_temp(dev)
    title = dev
    for name, code in names.items():
        if dev.find(code) >= 0:
            title = name
    result += '{}={}\'C, '.format(title, temps['C'])

print result[:-2]
