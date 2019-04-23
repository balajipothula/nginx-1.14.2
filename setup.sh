#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 31 August 2016,
# Description : Installing nginx Docker image on Ubuntu.

# Note: Please run this script with sudo privilage.

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

# setting up the stable docker repository.
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# updating apt package index.
apt update

# installing latest version of docker ce.
apt -y install docker-ce docker-ce-cli containerd.io

# extracting "webapp" tar ball and removing.
tar xzf $HOME/nginx-1.14.2/webapp.tar.gz -C $HOME/nginx-1.14.2/ && rm $HOME/nginx-1.14.2/webapp.tar.gz

# pulling nginx-1.14.2 image from docker hub.
docker pull balajipothula/nginx-1.14.2

# running docker container with name(--name) "nginx" as daemon(-d),
# stdin(-i) with volume(-v) "webapp" on port(-p) "80".
docker run --name nginx -d -i -p 80:80 --privileged -v $HOME/nginx-1.14.2/webapp:/webapp balajipothula/nginx-1.14.2 sh

# executing docker container by name with stdin(-i), starting tomcat server.
docker exec -i nginx nginx -c /webapp/nginx/conf/nginx.conf
