FROM docker.io/debian:11-slim

MAINTAINER Simon Urbanek <simon.urbanek@R-project.org>

## base for R
RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true apt-get install -q -y \
  gcc g++ gfortran libcairo-dev libreadline-dev libxt-dev libjpeg-dev \
  libicu-dev libssl-dev libcurl4-openssl-dev subversion git automake make libtool \
  libtiff-dev libpcre2-dev liblzma-dev libbz2-dev gettext redis-server rsync curl \
  tk-dev pandoc texinfo

## TeX
RUN DEBCONF_NONINTERACTIVE_SEEN=true apt-get install -q -y \
  texlive texlive-fonts-recommended texlive-latex-extra

RUN DEBCONF_NONINTERACTIVE_SEEN=true apt-get install -q -y \
  libdbd-mysql-perl libjson-perl devscripts libportaudio2

RUN DEBCONF_NONINTERACTIVE_SEEN=true apt-get install -q -y \
  openjdk-11-jdk-headless xvfb

## additional required libraries
RUN apt-get update -qq && DEBCONF_NONINTERACTIVE_SEEN=true apt-get install -q -y \
  libproj-dev libharfbuzz-dev libxml2-dev libpoppler-dev libpoppler-cpp-dev \
  libgmp-dev libfribidi-dev tidy

RUN groupadd -g 1017 rforge && useradd -u 1017 -g 1017 -m -s /bin/bash rforge && \
    groupadd -g 601 svnuser && useradd -g 601 -u 601 -m -s /bin/bash svnuser

