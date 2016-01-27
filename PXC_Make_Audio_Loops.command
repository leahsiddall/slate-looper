#!/bin/bash
cd $(dirname "$0")
DURATION=$(binaries/ffprobe media/audio.* -show_format -v quiet | sed -n 's/duration=//p')
echo $DURATION
for f in media/*.png
do
	binaries/ffmpeg -i media/audio.* -loop 1 -i $f -c:a copy -c:v libx264 -s 1280x720 -r 59.94 -strict experimental -c:a aac -b:a 128k -t $DURATION -pix_fmt yuv420p $f.mov -y
done