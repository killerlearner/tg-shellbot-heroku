#!bin/sh

# put your commands to install extra shit below:
# Check your logs on heroku to see if you were sucessfull

echo "NOTICE: extras.sh is runnning"


apt-get install -q -y \
    trace* \
    golang \
    perl \
    ruby-full \
    clang \
    apache2 \
    openssh-server \
    netcat \
    tor \
    firefox \
    python3 \
    python3-pip \
    git \
    make \
    busybox \
    build-essential \
    nodejs \
    npm \
