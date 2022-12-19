#!/bin/bash

# Modified from https://github.com/replaceits/Simple-Lemonbar/

Clock() {
	TIME=$(date "+%H:%M:%S")
	echo -n $TIME
}

Calendar() {
	DATE=$(date "+%a %d/%m/%Y")
	echo -n $DATE
}

Sound() {
	NOTMUTED=$( amo=ixer sget Master | grep "\[on\]" )
	if [[ ! -z $NOTMUTED ]] ; then
		VOL=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master) | sed 's/%//g')
		echo $VOL
	else
		echo "MUTED"
	fi
}

while true; do
	echo "$(Sound) $(Clock) $(Calendar)"
	sleep 0.1s
done
