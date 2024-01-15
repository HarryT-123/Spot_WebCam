# syntax=docker/dockerfile:1

FROM ubuntu:22.04

RUN DEBIAN_FRONTEND=noninteractive \
  apt update -y && apt upgrade -y\
  && apt install -y ffmpeg/*

COPY start.sh /start.sh
RUN chmod +x /start.sh

# Default infinite recording time
# We can override this with -e when running the container
ENV time "0" 
ENV recordingdevice "/dev/video0"

ENTRYPOINT /bin/bash -l -c "/start.sh" $time $recordingdevice

#docker run -it --device=/dev/video0 --mount type=bind,source=/media/harry/,target=/media/harry,bind-propagation=shared spotVideo

# TODO Make speicifc for dog, commit to git and load as add-on: https://dev.bostondynamics.com/docs/payload/docker_containers
# TODO Get memory stick for this from workshop