#!/bin/bash

export outputfilename=$(date '+/videos/output-%Y-%m-%d').mp4

# FFMPEG Options
# -f : format 
# -r : frame rate
# -s : resolution
# -i : device

if [ "$looptime" -eq 0 ]; then
  echo "Recording until stopped"
  ffmpeg -f video4linux2 -r 30 -s 1920x1080 -i $recordingdevice $outputfilename
else
  echo "Recording for $looptime seconds"
  ffmpeg -f video4linux2 -r 30 -s 1920x1080 -i $recordingdevice $outputfilename -t $looptime 
fi

# TODO enable looping
# TODO save file and exit gracefully
