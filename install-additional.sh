mkdir -p /tmp/install-additional
cd /tmp/install-additional

# Install Golang
#wget https://golang.org/dl/go1.15.5.linux-amd64.tar.gz
#tar -xvf go1.15.5.linux-amd64.tar.gz
#mv go /usr/local
#export GOROOT=/usr/local/go
#export GOPATH=$HOME/go
#mkdir -p $GOPATH/bin
#export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Install python packages
pip3 install sqlmap htmlement beautifulsoup4 yara-python requests selenium youtube-dl pafy pyrogram scapy cryptography frida frida-tools spidy-web-crawler

# Install golang tools
go get -v -u github.com/j3ssie/metabigor
go get -v -u github.com/ffuf/ffuf
go get -v github.com/OJ/gobuster
(go get -v github.com/Ullaakut/cameradar && \
cd $GOPATH/src/github.com/Ullaakut/cameradar && \
cd cmd/cameradar && \
go install)
curl -s "https://raw.githubusercontent.com/liamg/gitjacker/master/scripts/install.sh" | bash
go get -v github.com/haccer/subjack
go get -v -u github.com/rverton/webanalyze/cmd/webanalyze
curl -s "https://raw.githubusercontent.com/liamg/scout/master/scripts/install.sh" | bash
go get -v github.com/Ice3man543/hawkeye
go get -v github.com/c-sto/gogitdumper
go get -v github.com/naltun/eyes
