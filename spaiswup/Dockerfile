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

RUN cd /tmp/ && \
    git clone https://git.dev-u.cn/TRoman/Nuitka && cd Nuitka && git checkout tags/0.6.8.4 && \
    # apply patch to SingleExe.scons to pass gcc linkflag -no-pie for correct launch of compiled binary
    # which Nuitka does not use by default, for details see https://gcc.gnu.org/onlinedocs/gcc/Link-Options.html#Link-Options
    # applicable only for Nuitka 0.6.8.4, should be reworked in case if another compiler version used
    sed -i '823i\\n    env.Append(LINKFLAGS=["-no-pie"])' /tmp/Nuitka/nuitka/build/SingleExe.scons && \
    python3 setup.py install

