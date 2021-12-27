#!/bin/bash

pactl set-source-mute alsa_input.usb-Logitech_PRO_X_000000000000-00.mono-fallback toggle
STATUS=$(pactl list sources | grep -A 5 'Description: PRO X Mono' | grep 'Mute' | grep -E -o "yes|no")
if [[ $STATUS = "no" ]]; then
	polybar-msg hook mic-toggle 1
elif [[ $STATUS = "yes" ]]; then
	polybar-msg hook mic-toggle 2
else
    echo "Not working, check script."
fi
