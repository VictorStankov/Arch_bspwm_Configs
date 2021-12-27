#!/bin/bash

if [[ -z "$(pgrep xautolock)" ]]; then
	STATUS=1
	xautolock -locker "i3lock-fancy-dualmonitor" -time 1 -corners "+00-" -notify 30 -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'" -cornerdelay 30 -cornerredelay 30 &
else
	STATUS=2
	killall -q xautolock
fi

polybar-msg hook lockscreen-toggle $STATUS
