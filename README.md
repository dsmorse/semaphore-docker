# Semaphore-docker

## DESCRIPTION
This project is a Docker wrapper around ansible-semaphore https://github.com/ansible-semaphore/semaphore


## NOTES
 A docker compose file is provided, to bring up the entire application.  Current workflow requires that the mysql db be popuplated by running the command
 
     semaphore -setup
     
 in order to do this in a docker environment your command might look like this:
 
     docker run -it --link semaphore_mysql_1:mysql semaphore semaphore -setup