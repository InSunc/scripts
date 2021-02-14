#!/bin/bash

# Get the folder name
cd $1
aac_dir="${PWD##*/}"

# Crete a new dir
mkdir "$aac_dir"

for i in *.flac;
do 
	# Convert and copy into the new folder
	ffmpeg -i "$i" -acodec copy -vcodec copy -c:a aac -b:a 320k "$aac_dir/${i/.flac}.m4a"
done

