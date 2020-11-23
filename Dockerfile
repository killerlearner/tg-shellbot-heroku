FROM debian:stable


RUN apt-get -y update && apt-get -y upgrade && \
   DEBIAN_FRONTEND=noninteractive apt-get install -y -q \
   python3 python3-pip curl wget aria2 bash zsh neofetch nmap netcat tor torsocks proxychains firefox-esr \ 
   pciutils \
   bash-completion && \
   apt-get autoremove -y -q

RUN apt-get install -y nodejs npm

RUN mkdir -p -vv /stuff

# Set work dir:
WORKDIR /home

# Copy files:
COPY . /home/
COPY /stuff /stuff

# Change Permission
RUN chmod 755 *.sh

RUN ./install-additional.sh

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
