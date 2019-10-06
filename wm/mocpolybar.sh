#!/bin/bash

process=$(pidof mocp)
out=$(mocp -Q "%artist - %song" 2> /dev/null)

if ! [ -z "$process" ] && [ "$out" != ' - ' ]; then
	echo "> $out"
else
	echo
fi
