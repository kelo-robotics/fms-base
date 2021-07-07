FROM ubuntu:16.04

ENV LANG C.UTF-8

RUN apt update && \
    apt install -y sudo autoconf python3-pip python-wstool python3-tk curl \
                   wget cmake figlet build-essential checkinstall \
                   gcc g++ gcc-multilib libstdc++-5-dev lib32stdc++-5-dev \
                   git libyaml-cpp-dev uuid-dev && \
    cd /usr/src && \
    apt install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev \
                   libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev \
                   libffi-dev && \
    wget https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tgz && \
    tar xzf Python-3.6.9.tgz && \
    cd Python-3.6.9 && \
    ./configure --enable-optimizations && \
    sudo make install && \
    pip3 install --upgrade pip && \
    pip3 install pyinstaller && \
    pip3 install icalendar && \
    pip3 install wheel

    # Install python dependencies of related repositories
RUN git clone --single-branch --branch develop https://github.com/kelo-robotics/ropod_common.git /opt/ropod_common && \
    cd /opt/ropod_common && \
    pip3 install -r requirements.txt && pip3 install --user -e .

RUN    sudo rm -rf /var/lib/apt/lists/*
