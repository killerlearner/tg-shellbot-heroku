FROM parrotsec/core:rolling
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 4.8-1

# Install components
RUN apt-get update; apt-get -y dist-upgrade;apt-get -y install parrot-pico;apt-get -y install parrot-mini parrot-tools-cloud; rm -rf /var/lib/apt/lists/*

RUN apt-get install -qq nodejs

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

RUN apt autoclean && apt clean

# Run bot script:
CMD bash startbot.sh
