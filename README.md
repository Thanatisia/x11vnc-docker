# x11vnc-docker

## Information
### Background
```
An attempt at running x11vnc (and by extensions, potentially all VNC/RDP connecions) within a docker containerized environment.

The goal is to eventually, by using this project as a baseline implementation of Display server graphical execution within a docker containerized environment, 
    I will be able to make a standalone GUI docker container runner template project

Currently failing pretty much at life itself

Jokes aside, this is currently sll a WIP, some bugs encountered:
- x11vnc refuses to
    1. Startup and run within the container
    2. Accept connections from a remote host (i.e. accessing via XRDP)
```

## Setup
### Dependencies
+ docker
+ docker-compose
- Build Tools
    - base-devel (pacman-based)/build-essential (apt-based)
        + make
- Display Server
    - xorg
        + xinit

### Pre-Requisites
- Setup Xorg working for a user
    - Prepare a .xinitrc file and .Xauthority (Generally after first startup)

### Using Makefile
- All
    ```console
    make stop remove build run log
    ```
- Build dockerfile image
    ```console
    make build
    ```
- Start
    ```console
    make start
    ```
- Stop
    ```console
    make stop
    ```
- Remove
    ```console
    make remove
    ```
- Run
    ```console
    make run
    ```

### Using docker run
- Build dockefile image
    ```console
    docker build --tag=thanatisia/x11vnc -f docker/Dockerfile .
    ```
- Starting up container
    ```console
	docker run -itd --name=x11vnc -e "DISPLAY=${DISPLAY}" -e "AUTH=/root/.Xauthority" -p "5906:5900" -v "${HOME}/.Xauthority:/root/.Xauthority:rw"  -v "${HOME}/.vnc:/root/.vnc:rw" -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" thanatisia/x11vnc
    ```
- Teardown/Drop container
    ```console
    docker stop x11vnc && docker rm x11vnc
    ```
- Restart container
    ```console
    docker container restart x11vnc
    ```
- Start a stopped container
    ```console
    docker container start x11-vnc
    ```
- Stop a running container
    ```console
    docker container stop x11-vnc
    ```

### Using docker-compose

## Documentations

## Resources

## References

## Remarks
