# nginx-1.14.2
## alpine linux image with nginx, lua, sqlite, redis.
### Author: BALAJI POTHULA <*balaji.pothula@techie.com*>

#### Cloning nginx-1.14.2 from GitHub.
git clone https://github.com/balajipothula/nginx-1.14.2.git

##### Installing "docker" on Ubuntu OS and
##### setting "tomcat" server with "web application".
sudo sh $HOME/nginx-1.14.2/setup.sh

##### Adding current user to "docker" group.
##### Running docker as non-sudoer.
##### Note: Reboot required.
##### After Reboot sudo not required by "docker".
sudo usermod -a -G docker $USER

##### Pulling image from Docker Hub.
sudo docker pull balajipothula/nginx:1.14.2

##### Creating or Building image from Dockerfile.
##### username/repo:tag.
sudo docker build -t balajipothula/nginx:1.14.2 .

##### Saving docker image offline into local machine.
sudo docker save -o nginx-1.14.2.docker balajipothula/nginx:1.14.2

##### Loading offline docker image into machine.
sudo docker load -i nginx-1.14.2.docker

##### Displaying docker images.
sudo docker images

##### Displaying docker running containers.
sudo docker ps

##### Displaying docker all containers.
sudo docker ps -a

##### Running docker image with volume(-v) stdin(-i) daemon(-d) with port(-p) 80 for NGINX.
##### (It will create a volume inside the container)
sudo docker run --name nginx -d -i -p 80:80 --privileged -v $HOME/nginx-1.14.2/webapp:/webapp balajipothula/nginx:1.14.2 sh

##### Executing docker container by name with stdin(-i), startup  NGINX server.
sudo docker exec -i webapp nginx -c /webapp/nginx/conf/nginx.conf

# Executing docker container by name with stdin(-i), nginx process with config file
# and Reloading nginx master process.
sudo docker exec -i webapp nginx -c /webapp/nginx/conf/nginx.conf -s reload

##### Login into docker container.
sudo docker exec -i -t nginx sh

##### Starting docker container with name.
sudo docker start nginx

##### Stoping  docker container with name.
sudo docker stop nginx

##### Removing docker container with name.
sudo docker rm nginx

##### Removing docker image with username/repo:tag.
sudo docker rmi balajipothula/nginx:1.14.2

docker image build --tag=netconomy.net/nginx:1.24.0 --file=Dockerfile.NGINX .

docker container run --name=nginx --detach=true --restart=unless-stopped --volume=$HOME/nginx/conf:/nginx/conf --publish=127.0.0.1:80:80/tcp netconomy.net/nginx:1.24.0
