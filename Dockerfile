FROM ubuntu:latest


# Install dependencies:
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    sudo \
    wget \
    zip \
    unzip \
    nmap \
    wget \
    rclone \
    aria2

RUN mkdir -p -vv /stuff

# Set work dir:
WORKDIR /home

# Copy files:
COPY . /home/
COPY /stuff /stuff

# Change Directory
WORKDIR /home/

# Run extras.sh and clean up APT:
RUN sh extras.sh \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Configure Bot and Rclone
RUN config.sh

# Install the bot:
RUN npm install

# Run bot script:
CMD bash startbot.sh
