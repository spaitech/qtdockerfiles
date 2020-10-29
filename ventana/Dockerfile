FROM ubuntu:18.04

MAINTAINER frostasm <frostasm@gmail.com>

ARG QT_VERSION=5.9.8
ARG QT_DOWNLOAD_BASE_URL=https://download.qt.io

ENV DEBIAN_FRONTEND noninteractive
ENV QT_PATH /opt/Qt
ENV QT_DESKTOP $QT_PATH/${QT_VERSION}/gcc_64
ENV PATH $QT_DESKTOP/bin:$PATH

# Install updates & requirements:
#  * git, openssh-client, ca-certificates - clone & build
#  * locales, sudo - useful to set utf-8 locale & sudo usage
#  * curl - to download Qt bundle
#  * build-essential, pkg-config, libgl1-mesa-dev - basic Qt build requirements
#  * libsm6, libice6, libxext6, libxrender1, libfontconfig1, libdbus-1-3 - dependencies of the Qt bundle run-file
#  * libxi6, libgconf-2-4, libgtk-3-0, libx11-xcb1, libpq5, file - dependencies of the linuxdeployqt

RUN apt update && apt full-upgrade -y && apt install -y --no-install-recommends \
    git \
    ssh \
    sshpass \
    openssh-client \
    ca-certificates \
    locales \
    python \
    davfs2 \
    sudo \ 
    zip \
    curl \
    file \
    \
    libopencv-dev \
    \
    && apt-get -qq clean

#create ssh folder
RUN mkdir ~/.ssh/

RUN mkdir /tmp/yocto 
COPY ventana-yocto-1-8-2-sdk-20160328-1730-sh /tmp/yocto
RUN /tmp/yocto/ventana-yocto-1-8-2-sdk-20160328-1730-sh
ADD copys/ /opt/poky/1.8.2/
