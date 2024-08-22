#!/bin/bash 

set -e 

curl -L -o go.linux-amd64.tar.gz https://go.dev/dl/go1.22.4.linux-amd64.tar.gz
rm -rf /usr/local/go 

sudo ar -C /usr/local -xzf go.linux-amd64.tar.gz
rm -f go.linux-amd64.tar.gz

sudo rm -f /usr/local/bin/go
sudo ln -s /usr/local/go/bin/go /usr/local/bin/go

go version

go install golang.org/x/tools/gopls@latest

