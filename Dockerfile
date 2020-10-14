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
    aria2

RUN mkdir -p -vv /stuff

# Set work dir:
WORKDIR /home

# Copy files:
COPY startbot.sh /home/
COPY startup.sh /home/
COPY extras.sh /home/
COPY /stuff /stuff

# Run extras.sh and clean up APT:
RUN sh /home/extras.sh \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install the bot:
RUN git clone https://github.com/botgram/shell-bot.git \
 && cd shell-bot \
 && npm install

# Run bot script:
CMD bash /home/startbot.sh
