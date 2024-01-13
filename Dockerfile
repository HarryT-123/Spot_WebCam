# syntax=docker/dockerfile:1

FROM ubuntu:22.04

RUN DEBIAN_FRONTEND=noninteractive \
  apt update -y && apt upgrade -y\
  && apt install -y ffmpeg/*

VOLUME /videos

COPY start.sh /start.sh
RUN chmod +x /start.sh

# Default 5 minutes
ENV looptime "300" 
ENV recordingdevice "/dev/video0"

ENTRYPOINT /bin/bash -l -c "/start.sh" $looptime $recordingdevice

#docker run -it --device=/dev/video0 -e looptime=10 test
