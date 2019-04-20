## webapp-3.9
### Author: BALAJI POTHULA <*balaji.pothula@techie.com*>

alpine linux image with nginx, lua, sqlite, redis.

##### Installing "docker" on Ubuntu.
sudo sh install-docker.sh

##### Pulling image from Docker Hub.
docker pull balajipothula/webapp:3.9

##### Creating or Building image from Dockerfile.
##### username/repo:tag
docker build -t balajipothula/webapp:3.9 .

##### Loading offline docker image into local machine.
docker load -i webapp-3.9.docker
