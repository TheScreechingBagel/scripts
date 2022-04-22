#!/bin/sh 
# Webtoon downloader: bad edition
# Downloads webtoon from link provided and converts to PDF in alphabetical order
# Requires: gallery-dl , img2pdf , xidel 
# by bagel

echo "\n fetching info \n"
# get author 
author=$(xidel $1 -s -e /html/body/div[1]/div[3]/div/div[2]/div[1]/div[1]/div[2]/a) 
# get title
title=$(xidel $1 -s -e /html/body/div[1]/div[3]/div/div[2]/div[1]/div[1]/h3)
# convert spaces in title to underscores
ntitle=$(echo $title | tr ' ' '_') 

echo "\n saving images to /tmp/$ntitle \n"
# save starting directory
sdir=$(pwd)
# make a folder for the downloaded images in /tmp/
mkdir /tmp/$ntitle  

echo "\n downloading images \n"
# use gallery-dl to download the webtoon as images
gallery-dl $1 -d /tmp/$ntitle 
# cd into the tmp folder (sin)
cd /tmp/$ntitle

echo "\n creating pdf at $sdir/$ntitle.pdf \n"
# use img2pdf to combine the images into a single pdf, sorted alphabetically with leading zeros, and writing title+author
img2pdf --output "$sdir/$ntitle.pdf" $(ls -v *.jpg) --title "$title" --author "$author" 
