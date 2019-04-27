## Node.js with Redis
### Author: BALAJI POTHULA <*balaji.pothula@techie.com*>

#### alpine linux image with nodejs, redis.

##### Installing "docker" on Ubuntu.
sudo sh install-docker.sh

##### Adding current user to "docker" group.
##### Running docker as non-sudoer.
##### Note: Reboot required.
##### After Reboot sudo not required by "docker".
sudo usermod -a -G docker $USER

##### Pulling image from Docker Hub.
sudo docker pull balajipothula/node.js:8.14.0

##### Creating or Building image from Dockerfile.
##### username/repo:tag.
sudo docker build -t balajipothula/node.js:8.14.0 .

##### Saving docker image offline into local machine.
sudo docker save -o node.js-8.14.0.docker balajipothula/node.js:8.14.0

##### Loading offline docker image into machine.
sudo docker load -i node.js-8.14.0.docker

##### Running docker container with application inside the 
##### volume(-v) stdin(-i) as daemon(-d) on port(-p) 3000.
sudo docker run --name nodejs -d -i -p 3000:3000 --privileged -v $HOME/Node.js/webapp:/webapp balajipothula/node.js:8.14.0 node /webapp/index.js &

##### Running docker container with volume(-v) stdin(-i) daemon(-d) on port(-p) 3000.
##### Note: It will create a volume inside the container
sudo docker run --name nodejs -d -i -p 3000:3000 --privileged -v $HOME/Node.js/webapp:/webapp balajipothula/node.js:8.14.0 sh

##### Executing docker container by name with stdin(-i), node process with nodejs app.
sudo docker exec -i nodejs node /webapp/index.js &

##### Checking docker container Process Status.
sudo docker exec -i -t nodejs ps -A

##### Login into docker container.
sudo docker exec -i -t nodejs sh

##### Starting docker container with name.
sudo docker start nodejs

##### Stoping  docker container with name.
sudo docker stop nodejs

##### Removing docker container with name.
sudo docker rm nodejs

##### Removing docker image with username/repo:tag.
sudo docker rmi balajipothula/node.js:8.14.0
