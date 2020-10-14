#!bin/sh

# put your commands to install extra shit below:
# Check your logs on heroku to see if you were sucessfull

echo "NOTICE: extras.sh is runnning"


apt-get install -q -y \
    perl \
    openssh \
    netcat \
    tor \
    python3 \
    python3-pip \
    git \
    nodejs \
    npm \
