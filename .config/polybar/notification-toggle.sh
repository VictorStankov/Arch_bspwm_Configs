#!/bin/bash

dunstctl set-paused toggle

if [[ $(dunstctl is-paused) == "true" ]]; then
	STATUS=1
else
	STATUS=2
fi

polybar-msg hook notification-toggle $STATUS
