FROM ubuntu:xenial
LABEL maintainer="Charles Baynham <charles.baynham@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

ARG CACHE_DATE_BASE=2020-04-09

RUN apt-get update && apt-get install -y git

# Install python for pygments
RUN apt-get update && apt-get install -y python3-pip
RUN pip3 install Pygments

RUN apt-get update -q \
    && apt-get install -qy build-essential wget libfontconfig1 \
    && rm -rf /var/lib/apt/lists/*

# Install TexLive with scheme-basic
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz;
RUN mkdir /install-tl-unx;
RUN tar -xvf install-tl-unx.tar.gz -C /install-tl-unx --strip-components=1;
RUN echo "selected_scheme scheme-basic" >> /install-tl-unx/texlive.profile;
RUN /install-tl-unx/install-tl -profile /install-tl-unx/texlive.profile; \
    rm -r /install-tl-unx; \
	rm install-tl-unx.tar.gz

ENV PATH="/usr/local/texlive/2019/bin/x86_64-linux:${PATH}"
ENV HOME /data
WORKDIR /data

ARG CACHE_DATE_UPDATES=2020-04-09

RUN tlmgr install scheme-full

VOLUME ["/data"]

