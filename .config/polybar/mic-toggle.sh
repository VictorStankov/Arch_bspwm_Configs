#!/bin/bash

pactl set-source-mute alsa_input.usb-Kingston_HyperX_Quadcast_4110-00.analog-stereo toggle
STATUS=$(pactl list sources | grep -A 5 'Description: HyperX QuadCast Analog Stereo' | grep 'Mute' | grep -E -o "yes|no")
if [[ $STATUS = "no" ]]; then
	polybar-msg hook mic-toggle 1
elif [[ $STATUS = "yes" ]]; then
	polybar-msg hook mic-toggle 2
else
    echo "Not working, check script."
fi
