# syntax=docker/dockerfile:1

FROM ubuntu:22.04

RUN DEBIAN_FRONTEND=noninteractive \
  apt update -y && apt upgrade -y\
  && apt install -y ffmpeg/*

VOLUME /videos

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/bin/bash", "-l", "-c", "/start.sh"]

# TODO Add if statement and args for record time 
# TODO Add safe exit to save file and exit
