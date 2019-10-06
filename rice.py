#!/bin/python

import os
import sys
import shutil

def help_msg():
	print('''USAGE:
	rice.py [OPTION] [DIR]
	OPTION:
	-l\tload from DIR
	-s\tsave to   DIR\n''')


args = sys.argv[1:]
_dir = args[1]
#--------------------------------
# Paths to config files and dirs
#--------------------------------
home_dir   = os.environ['HOME']
config_dir = home_dir + '/.config'

#nvim       = config_dir + '/nvim'
termite    = config_dir + '/termite'
polybar    = config_dir + '/polybar'
ranger     = config_dir + '/ranger'
i3         = config_dir + '/i3'
bspwm      = config_dir + '/bspwm'
sxhkd      = config_dir + '/sxhkd'
zathura    = config_dir + '/zathura'
compton    = config_dir + '/compton.conf'

shrc       = home_dir + '.shrc'
xinitrc    = home_dir + '.xinitrc'
mouse      = '/etc/X11/xorg.conf.d/40-libinput.conf'
kbd        = '/etc/X11/xorg.conf.d/10-keyboard.conf'
modprobe   = '/etc/modprobe.d/modprobe.conf'
env        = '/etc/environment'

paths = {}
#paths.update({nvim:True})
paths.update({termite:True})
paths.update({polybar:True})
paths.update({ranger:True})
paths.update({i3:True})
paths.update({bspwm:True})
paths.update({sxhkd:True})
paths.update({zathura:True})
paths.update({shrc:True})
paths.update({xinitrc:True})
paths.update({mouse:True})
paths.update({kbd:True})
paths.update({modprobe:True})
paths.update({env:True})
paths.update({compton:True})


# Check if all the paths exist
for path in paths:
	if not os.path.exists(path):
		paths[path] = False
		print(' # \'' + path + '\'' + ' doesn\'t exist')

for path in paths.items():
	if path[1] == True:
		if os.path.isdir(path[0]):
			shutil.copytree(path[0], _dir + '/' + path[0][path[0].rfind('/') + 1:])
		else:
			shutil.copy(path[0], _dir)

