#!/bin/bash
printf '\e[8;50;150t'
cd $(dirname "$0")
DURATION=300
for f in media/*.png
do
	binaries/ffmpeg -ar 48000 -ac 2 -f s16le -i /dev/zero -loop 1 -i $f -c:a copy -c:v libx264 -preset ultrafast -s 1280x720 -r 59.94 -strict experimental -c:a aac -b:a 128k -t $DURATION -pix_fmt yuv420p $f.mov -y
done