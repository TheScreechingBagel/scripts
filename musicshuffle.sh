#!/bin/sh
# Finds all the .opus files in a folder, looking through multiple layers of folders, sorts them randomly and plays in mpv
# by thescreechingbagel

find $1 -type f -iname "*.opus" | sort -R | sed s/^/\"/ | sed s/$/\"/ | xargs mpv
