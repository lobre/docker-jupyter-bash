# jupyter-bash-notebook

A Docker image for having a Bash notebook

To build the image:

    docker build --rm -t jupyter/bash-notebook .
    docker run --rm -it -p 8888:8888 jupyter/bash-notebook

### Todo

 - [ ] Install docker
 - [ ] Install docker-compose
 - [ ] Start on a default notebook
 - [ ] Start without password
 - [ ] Auto start browser

