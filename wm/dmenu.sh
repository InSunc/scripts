#!/bin/bash
# Script to avoid repeating the same template for dmenu

options='-sb "#$T_FG" -sf "#$T_BG" -nb "#$T_BG" -nf "#$T_FG" -fn "M" -fn "Monaco:size=21"'

if [ "$1" == 'run' ]
then
    eval "dmenu_run $options"
else
    eval "dmenu $options -p $1"
fi
