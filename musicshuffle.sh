#!/bin/sh
# Finds all "audio" (as displayed my the file command) files in a folder, looking through multiple layers of folders, sorts them randomly and plays in mpv
# by thescreechingbagel

find $1 -print0 | xargs -0 file -F '//' | awk -F '//' 'tolower($2) ~ /audio/ { print $1 }' | sort -R | sed s/^/\"/ | sed s/$/\"/ | xargs mpv
