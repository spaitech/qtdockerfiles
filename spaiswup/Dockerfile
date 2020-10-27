FROM ubuntu:18.04
MAINTAINER troman <rotkachenkoone@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt full-upgrade -y && apt install -y --no-install-recommends \
    build-essential \
    ssh \
    sshpass \
    python3.6 \
    git \
    python3-dev \
    python3-pip \
    python3-pyqt5 \
    python3-setuptools \
    locales \
    chrpath

# configuring local for correct reading of sources
RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

#generating key for uploading of artifacts
RUN mkdir ~/.ssh/ && ssh-keyscan -H 172.16.0.187 >> ~/.ssh/known_hosts
#order should not be changed due to different versions of nycl installed by paramiko and scp
RUN pip3 install pyocclient && \
    pip3 install scp && \
    pip3 install pexpect && \
    pip3 install paramiko
