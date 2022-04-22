#!/bin/sh
# Finds all video type files in a folder, looking through multiple layers of folders, sorts them randomly and plays in mpv
# by thescreechingbagel

find $1 -type f | file --mime-type --no-pad --files-from - | grep --fixed-strings ': video/' | sed 's/:.*//' | sort -R | sed s/^/\"/ | sed s/$/\"/ | xargs mpv --no-resume-playback
