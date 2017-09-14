# Pseudo-Shell
Pseudo-Shell is a Docker container that runs a fake interpreter, written in assembler.  It enables the volumes storage in containers.
Another Pseudo-Shell, written in C, already exists but this one is only a few bytes for the same result.

----------
## Prerequisites
The build requires the installation of as, ld (part of gcc) and [docker](https://docs.docker.com/engine/installation/) in a Linux environment.

----------
## Building
The Makefile will compile the assembly program and build the container.  You have then to add it into Docker Hub.  The following commands have to be launched in a Linux environment:

    export DOCKER_ID_USER="MY_DOCKER_ID_USER"
    make
    docker login
    docker push $DOCKER_ID_USER/pseudo-shell:2.0

----------
## Launching
Test the container using the following command:

    docker run -it --rm --name pseudo-shell pseudo-shell:2.0