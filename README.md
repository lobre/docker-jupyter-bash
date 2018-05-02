# jupyter-bash-notebook

A Docker image for having a Bash notebook

To build the image:

    docker build --rm -t jupyter/bash-notebook .
    docker run --name jupyter --rm -it -p 8888:8888 jupyter/bash-notebook

### Todo

 - [x] Install docker
 - [x] Install docker-compose
 - [x] Start on a default notebook
 - [x] Start without password
 - [ ] Auto start browser

