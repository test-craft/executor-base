FROM testcraft/base:1.0
MAINTAINER Levin Daniel

# Added to allow installation of FFMPEG
RUN sudo apt-get install -y software-properties-common
RUN sudo apt-get install -y software-properties-common python-software-properties
RUN sudo add-apt-repository -y ppa:mc3man/trusty-media

RUN sudo apt-get update

RUN apt-get update && apt-get install -y \
    x11vnc \
    xvfb \
    firefox \
    chromium-browser \
    make \
    g++ \
    python-pip \
    unzip

RUN sudo apt-get install -y --no-install-recommends default-jdk

#FFMPEG
RUN sudo add-apt-repository ppa:kirillshkrogalev/ffmpeg-next -y
RUN sudo apt-get install -y ffmpeg

# FIX for protractor
RUN rm -rf /root/.node-gyp

# Protractor
RUN npm install --unsafe-perm -g protractor

# Webdriver
RUN webdriver-manager update
