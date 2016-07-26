# Semaphore-docker

## DESCRIPTION
This project is a Docker wrapper around ansible-semaphore https://github.com/ansible-semaphore/semaphore


## NOTES
 A docker compose file is provided, to bring up the entire application.  You can build and deploy:
 
     docker-compose up
     
 You can also just build the semaphore-docker images
 
     docker build -t semaphore-docker .
     
 Or you can pull the image from docker hub
 
    docker pull dsmorse/semaphore-docker
    
 optionally you can mount a volume into the container at /opt/data/semaphore/ to store all state on the docker host