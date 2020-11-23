FROM debian:stable


RUN apt-get -y update && apt-get -y upgrade && \
   DEBIAN_FRONTEND=noninteractive apt-get install -y \
   python3 python3-pip curl wget aria2 bash zsh neofetch nmap netcat tor torsocks proxychains firefox-esr \ 
   pciutils \
   bash-completion && \
   apt-get autoremove -y && \
   apt-get clean

RUN install-additional.sh

RUN apt install nodejs npm

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
