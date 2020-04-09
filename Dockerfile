FROM ubuntu:xenial
LABEL maintainer="Charles Baynham <charles.baynham@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -f git
RUN apt-get install -f texlive-full

ENV HOME /data
WORKDIR /data

# Install latex packages
RUN tlmgr install latexmk

