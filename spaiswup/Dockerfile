FROM ubuntu:18.04
MAINTAINER troman <rotkachenkoone@gmail.com>


RUN apt update && apt install -y build-essential \
    python3.6 \
    git \
    python3-pip \
    python3-pyqt5 \
    locales \
    chrpath

# configuring local for correct reading of sources
RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

#order should not be changed due to different versions of nycl installed by paramiko and scp
RUN pip3 install pyocclient && \
    pip3 install scp && \
    pip3 install pexpect && \
    pip3 install paramiko
