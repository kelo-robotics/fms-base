FROM ubuntu:16.04

RUN apt update && \
    apt install -y sudo autoconf python3-pip python-wstool python3-tk curl \
                   wget cmake figlet build-essential checkinstall \
                   gcc g++ gcc-multilib libstdc++-5-dev lib32stdc++-5-dev \
                   git libyaml-cpp-dev uuid-dev && \

    # Install Python 3.6.9
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
    pip3 install wheel && \

    # Install basic python dependecies of related repositories
    pip3 install -r https://raw.githubusercontent.com/kelo-robotics/ropod_common/master/pyropod/requirements.txt && \
    pip3 install -r https://raw.githubusercontent.com/kelo-robotics/icalevents/master/requirements.txt && \

    sudo rm -rf /var/lib/apt/lists/*
