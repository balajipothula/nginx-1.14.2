#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 31 August 2016,
# Description : Installing Docker on Ubuntu.

# Note: Please run this script with root privilages.

# uninstalling old versions of docker.
apt -y remove docker docker-engine docker.io

# updating packages index.
apt update

# upgrading packages.
apt -y upgrade

# dist upgrading package.
apt -y dist-upgrade

# installing packages to allow apt to use repository over https.
apt -y install apt-transport-https \
               ca-certificates     \
               curl                \
               software-properties-common

# adding docker official gpg key.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# verifying gpg key.
#apt-key fingerprint 0EBFCD88

# deleting old docker gpg key(s).
#apt-key del 2C52609D

# setting up the stable docker repository.
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# updating apt package index.
apt update

# installing latest version of docker ce.
apt -y install docker-ce docker-ce-cli containerd.io

# running docker as non-sudoer.
# note: reboot required.
usermod -a -G docker $USER
