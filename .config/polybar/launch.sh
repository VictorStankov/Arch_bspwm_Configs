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

STATUS=$(amixer -D "default:2" get Mic | grep -E "\[on\]|\[off\]" | cut -s -d ' ' -f 8 | uniq)

if [[ $STATUS = "[on]" ]]; then
	polybar-msg hook mic-toggle 1
elif [[ $STATUS = "[off]" ]]; then
	polybar-msg hook mic-toggle 2
fi
