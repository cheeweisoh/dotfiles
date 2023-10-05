#!/bin/sh

run() {
	if ! pgrep -f "$1"; then
		"$@" &
	fi
}

run "/home/cheewei/.config/polybar/launch.sh"
run "/home/cheewei/.config/picom/launch.sh"
run "/home/cheewei/.config/nitrogen/launch.sh"
# run "/home/cheewei/.config/screenlayout/1920x1200.sh"
