#!bin/sh

# put your commands to install extra shit below:
# Check your logs on heroku to see if you were sucessfull

echo "NOTICE: extras.sh is runnning"


apt-get install -q -y \
    trace* \
    golang \
    perl \
    clang \
    openssh-server \
    netcat \
    tor \
    python3 \
    python3-pip \
    git \
    make \
    busybox \
    build-essential \
    nodejs \
    npm \
