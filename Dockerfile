FROM ubuntu:xenial
LABEL maintainer="Charles Baynham <charles.baynham@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

ARG CACHE_DATE_BASE=2020-04-09

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y texlive-full

ENV HOME /data
WORKDIR /data

ARG CACHE_DATE_UPDATES=2020-04-09

# Install / update latex packages
RUN tlmgr init-usertree
RUN tlmgr install latexmk
RUN tlmgr update --all

