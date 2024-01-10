# syntax=docker/dockerfile:1

FROM ubuntu:22.04

RUN DEBIAN_FRONTEND=noninteractive \
  apt update -y && apt upgrade -y\
  && apt install -y ffmpeg/*
