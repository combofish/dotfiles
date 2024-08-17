#!/usr/bin/env sh

# get info

for src in arm core uart pwm emmc; do
	echo "$src:\t$(vcgencmd measure_clock $src)"
done

for id in core sdram_c sdram_i sdram_p; do
	echo "$id:\t$(vcgencmd measure_volts $id)";
done

vcgencmd measure_temp
vcgencmd get_config int
vcgencmd get_mem arm && vcgencmd get_mem gpu
