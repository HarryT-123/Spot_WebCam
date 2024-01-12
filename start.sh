#!/bin/bash

export OUTPUT_FILENAME=$(date '+/videos/output-%Y-%m-%d').mp4

# SET WEBCAM UP HERE 
# -f : format 
# -r : frame rate
# -s : resolution
# -i : device

ffmpeg -f video4linux2 -r 30 -s 1920x1080 -i /dev/video2 $OUTPUT_FILENAME
