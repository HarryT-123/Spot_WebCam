#!/bin/bash

timeanddate=$(date '+%d_%m_%Y_%I_%M_%s_%p') 
outputfilename="/media/harry/USB-DISK/$timeanddate.mp4" # TODO make this specific to the dog

# FFMPEG Options
# -f : format 
# -r : frame rate
# -s : resolution
# -i : device

if [ "$time" -eq 0 ]; then
  echo "Recording until stopped"
  ffmpeg -f video4linux2 -s 1920x720 -i $recordingdevice $outputfilename
else
  echo "Recording for $time seconds"
  ffmpeg -f video4linux2 -s 1920x720 -i $recordingdevice $outputfilename -t $time 
fi
