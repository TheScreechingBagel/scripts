#!/bin/sh

# picks random image from file list of paths, copies to clipboard and pastes
# first make hlist by adapting
# /bin/ls -d ~/$folder/* | sort -R > $hlist
# requires: X11 , xclip, xdotool

# mage by boogal
hlist=/home/bagel/misc/hlist
folder=/home/bagel/Pictures/h/
imagepath=$(head -n 1 $hlist)
fullpath=$folder$imagepath
notify-send "copied $fullpath"
echo "copied $fullpath"
xclip -selection clipboard -target image/png -i "$fullpath"
 
xdotool key ctrl+v

echo $imagepath >> $hlist
sed -i '1d' $hlist


