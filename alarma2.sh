#!/bin/bash
if [[ $1 = "on" ]];then
	while true; do
		echo 1 > /sys/class/gpio/gpio12/value
		echo 1 > /sys/class/gpio/gpio6/value
		sleep 0.5
		echo 0 > /sys/class/gpio/gpio12/value
		echo 0 > /sys/class/gpio/gpio6/value
		sleep 0.5
	done
elif [[ $1 = "off" ]];then
	ps -au | grep "alarma2.sh on" | cut -d " " -f 9 > procesos.txt
	proceso=`head -n 1 procesos.txt`
	if [[ $proceso ]];then
		kill $proceso 2>/dev/null
	fi
	echo 0 > /sys/class/gpio/gpio5/value
	echo 0 > /sys/class/gpio/gpio6/value
	sleep 1
	echo 1 > /sys/class/gpio/gpio5/value
	echo 1 > /sys/class/gpio/gpio12/value
	sleep 1
	echo 0 > /sys/class/gpio/gpio12/value
	echo 0 > /sys/class/gpio/gpio5/value
fi