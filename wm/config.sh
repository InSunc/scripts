#!/bin/bash

bspwm="$HOME/.config/bspwm/bspwmrc"
sxhkd="$HOME/.config/sxhkd/sxhkdrc"
brightness="$HOME/scripts/wm/brightness"
polybar="$HOME/.config/polybar/config"

opt=$(echo -e "brightness\nbspwm\nsxhkd\npolybar" | eval "$DMENU" 'Edit:')

case $opt in
	'brightness')
		sudo $brightness
		;;
	
	'polybar')
		eval "$TERMINAL -e '$EDITOR $polybar'"
		;;
	
	'bspwm')
		eval "$TERMINAL -e '$EDITOR $bspwm'"
		;;

	'sxhkd')
		eval "$TERMINAL -e '$EDITOR $sxhkd'"
		;;
esac

