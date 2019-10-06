#!/usr/bin/env bash

icon="$HOME/scripts/wm/lock.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

sleep 0.134 # skip closing of dmenu

maim "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
i3lock -i "$tmpbg"
