#!/bin/bash

amixer -q -D "default:2" sset Mic toggle
STATUS=$(amixer -D "default:2" get Mic | grep -E "\[on\]|\[off\]" | cut -s -d ' ' -f 8 | uniq)

if [[ $STATUS = "[on]" ]]; then
	polybar-msg hook mic-toggle 1
elif [[ $STATUS = "[off]" ]]; then
	polybar-msg hook mic-toggle 2
else
    echo "Not working, check script."
fi
