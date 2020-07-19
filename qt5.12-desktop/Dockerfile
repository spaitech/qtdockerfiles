FROM ubuntu:16.04
MAINTAINER frostasm <frostasm@gmail.com>

ARG QT_VERSION=5.12.0
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
RUN apt update && apt install -y software-properties-common
RUN add-apt-repository -y ppa:ubuntugis/ppa

RUN apt update && apt full-upgrade -y && apt install -y --no-install-recommends \
    make \
    git \
    openssh-client \
    ca-certificates \
    locales \
    sudo \
    curl \
    build-essential \
    gcc-multilib \
    g++-multilib \
    pkg-config \
    libgl1-mesa-dev \
    libsm6 \
    libice6 \
    libxext6 \
    libxrender1 \
    libfontconfig1 \
    libdbus-1-3 \
    \
    libboost-all-dev \
    \
    libxi6 \
    libgconf-2-4 \
    libgtk-3-0 \
    libx11-xcb1 \
    libpq5 \
    file \
    \
    libpoppler-qt5-dev \
    libopencv-dev \
    libzbar-dev \
    libkf5solid-dev \
    libkf5archive-dev \
    \
    bison \
    libssl-dev \
    libxcursor-dev \
    libxcomposite-dev \
    libxdamage-dev \
    libxrandr-dev \
    libfontconfig1-dev \
    libxss-dev \
    libsrtp0-dev \
    libwebp-dev \
    libjsoncpp-dev \
    libopus-dev \
    libminizip-dev \
    libavutil-dev \
    libavformat-dev \
    libavcodec-dev \
    libevent-dev \
    libasound2-dev \
    libbz2-dev \
    libcap-dev \
    libcups2-dev \
    libdrm-dev \
    libegl1-mesa-dev \
    libgcrypt11-dev \
    libnss3-dev \
    libpci-dev \
    libpulse-dev \
    libudev-dev \
    libxtst-dev \
    openssh-server \
    libsdl2-2.0-0 \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-libav \
    mesa-common-dev \
    libsdl2-dev \
    libglm-dev \
    libexif-dev \
    libgst-dev \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    gstreamer1.0-plugins-good \
    gstreamer1.0-libav \
    gstreamer1.0-vaapi \
    vainfo \
    fuse \
    libfuse2 \
    libpopt0 \
    rsync \
    wget \
    libsdl2-dev \
    unzip \
    xfce4 \
    xfce4-goodies \
    tightvncserver \
    gdal-bin \
    libgdal-dev \
    && apt-get -qq clean



COPY extract-qt-installer.sh install-linuxdeployqt.sh qt-installer-noninteractive.qs /tmp/qt/
COPY qtaccount.ini ~/.local/share/Qt

# Download & unpack Qt toolchains
# Download & unpack linuxdeployqt
# Download & unpack QtJsonSerializer
# Clean

RUN /tmp/qt/extract-qt-installer.sh \
    && find "$QT_PATH" -mindepth 1 -maxdepth 1 ! -name "${QT_VERSION}" -exec echo 'Cleaning Qt SDK: {}' \; -exec rm -r '{}' \;  \
    && /tmp/qt/install-linuxdeployqt.sh \
    && rm -rf /tmp/qt

# Reconfigure locale
RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales

# Add group & user + sudo
RUN groupadd -r user && useradd --create-home --gid user user && echo 'user ALL=NOPASSWD: ALL' > /etc/sudoers.d/user

USER user
WORKDIR /home/user
ENV HOME /home/user
