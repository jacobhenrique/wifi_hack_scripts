#!/bin/bash

for i in $(seq 1 11)
do
	echo "\n[+] Ouvindo o canal $i\n"
	ifconfig wlan1 down
	iwconfig wlan1 channel $i
	ifconfig wlan1 up
	sleep 2
	ifconfig wlan1 down
	iwconfig wlan1 mode Monitor
	ifconfig wlan1 up
	sleep 2
	tcpdump -vv -i wlan1 -n -c5 | grep "Beacon" | awk '{print $12, - CH $24}'
done
