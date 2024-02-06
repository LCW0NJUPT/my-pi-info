#!/bin/bash
# Script: my-pi-info-2.sh
# Purpose: Display the Broadcom CPU and GPU information of Raspberry Pi 4
# Author: LiuChenWei <https://github.com/LCW0NJUPT> under GPL v2.x+
# OS: Raspberry pi OS bookworm 64bit
# -------------------------------------------------------
while : ;do
echo "$(clear)"

cpu=$(</sys/class/thermal/thermal_zone0/temp)
cpufq=$(</sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq)

echo "$(date) @ $(hostname) @ lcw_temp_monitor"
echo "-------------------------------------------"
echo "GPUfreq => $(vcgencmd measure_clock core)Hz"
echo "CPUfreq => $((cpufq/1000))MHz"
echo "v3dfreq => $(vcgencmd measure_clock v3d)Hz"
echo "-------------------------------------------"

echo "GPU => $(vcgencmd measure_temp)"
echo "CPU => $((cpu/1000))'C"

echo "-------------------------------------------"
echo "Core_volt => $(vcgencmd measure_volts core)"
echo "$(vcgencmd read_ring_osc)"

echo "-------------------------------------------"
echo "throttled info => $(vcgencmd get_throttled)"

sleep 2

done
