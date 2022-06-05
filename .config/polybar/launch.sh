#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -r main &
polybar -r second &

echo "Polybar launched..."

sleep 0.1

if [[ $(dunstctl is-paused) == "true" ]]; then
	polybar-msg hook notification-toggle 1
else
	polybar-msg hook notification-toggle 2
fi

pactl set-source-mute  alsa_input.usb-Kingston_HyperX_Quadcast_4110-00.analog-stereo 1
STATUS=$(pactl list sources | grep -A 5 'Description: HyperX QuadCast Analog Stereo' | grep 'Mute' | grep -E -o "yes|no")
if [[ $STATUS = "no" ]]; then
	polybar-msg hook mic-toggle 1
elif [[ $STATUS = "yes" ]]; then
	polybar-msg hook mic-toggle 2
fi
