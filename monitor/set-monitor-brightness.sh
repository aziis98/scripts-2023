#!/usr/bin/env bash

if [[ $# -eq 0 ]]; then
	echo "Usage: $0 [--notify] <BRIGHTNESS_VALUE>"
	exit 1
fi

DO_NOTIFY=
if [[ "$1" = "--notify" ]]; then
	DO_NOTIFY=1
	shift
fi

if [[ ! -z "$DO_NOTIFY" ]]; then
	notify-send -i video-display "Display Brightness" "Querring available displays..."
fi

BRIGHTNESS_VALUE="$1"

MONITOR_DEVICE="/dev/i2c-$(ddccontrol -p \
	| grep -B 1 "DDC/CI supported: Yes" \
	| grep Device \
	| sed -re 's# - Device: dev:/dev/i2c-(.+)#\1#' \
)"

ddccontrol -r 0x10 -w "$BRIGHTNESS_VALUE" "dev:$MONITOR_DEVICE" >> ~/.cache/ddccontrol.log

if [[ ! -z "$DO_NOTIFY" ]]; then
	notify-send -i video-display "Display Brightness" "Updated display brightness"
fi