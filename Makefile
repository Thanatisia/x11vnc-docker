# Makefile
# for 
# Docker container/image management

## Variables/Ingredients
CONTEXT=.
Dockerfile=docker/Dockerfile
IMAGE_NAME=thanatisia/x11vnc
CONTAINER_NAME=x11vnc
SHELL := /bin/bash

.PHONY := help
.DEFAULT_RULES := help

## Rules/Targets/Instructions
help:
	## Display Help menu
	@echo -e "help   : Display this help menu"
	@echo -e "build  : Build a docker image"
	@echo -e "remove : Remove/Delete a container"
	@echo -e "run    : Startup and run a docker image into a container"
	@echo -e "start  : Start a stopped container"
	@echo -e "stop   : Stop a running container"
	@echo -e "log    : Print out logs to standard output"

start:
	## Start a stopped container
	@docker start ${CONTAINER_NAME}

stop:
	## Stop a running container
	@docker stop ${CONTAINER_NAME}

remove:
	## Remove/delete a container
	@docker rm ${CONTAINER_NAME}

build: 
	## Build a docker image
	@docker build --tag=${IMAGE_NAME} -f ${Dockerfile} ${CONTEXT}

run:
	## Startup and run a docker image into a container
	@docker run \
		-itd \
		--name=${CONTAINER_NAME} \
		-e "DISPLAY=${DISPLAY}" \
		-e "AUTH=/root/.Xauthority" \
		-p "5906:5900" \
		-v "${HOME}/.Xauthority:/root/.Xauthority:rw" \
		-v "${HOME}/.vnc:/root/.vnc:rw" \
		-v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
		${IMAGE_NAME}

log:
	## Print out logfile
	@docker logs ${CONTAINER_NAME}


