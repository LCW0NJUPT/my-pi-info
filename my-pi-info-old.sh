#!/bin/bash
# Script: my-pi-info.sh
# Purpose: Display the Broadcom CPU and GPU information of Raspberry Pi 4 
# Author: LiuChenWei <https://github.com/LCW0NJUPT> under GPL v2.x+
# -------------------------------------------------------
while : ;do
echo "$(clear)"

cpu=$(</sys/class/thermal/thermal_zone0/temp)
echo "$(date) @ $(hostname) @ lcw_temp_monitor"
echo "-------------------------------------------"
echo "GPUfreq => $(vcgencmd measure_clock core)"
echo "CPUfreq => $(vcgencmd measure_clock arm)"
echo "v3dfreq => $(vcgencmd measure_clock v3d)"
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
