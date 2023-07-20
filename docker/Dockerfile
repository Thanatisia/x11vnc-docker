# Dockerfile
# for setting up
# x11vnc VNC server in docker

## Pull Image
FROM debian:latest

## Set Variables
### Program Variables
# ARG AUTH=
# ARG DISPLAY=

### Environment Variables
# ENV AUTH=~/.Xauthority
# ENV DISPLAY=:0
ENV AUTH=
ENV DISPLAY=

## Prepare packages
### Update package manager and install dependencies
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y bash x11vnc xorg xvfb

## Set Defaults
# SHELL ["/bin/bash"]

## Set Entrypoint
# ENTRYPOINT x11vnc -wait 50 -noxdamage -display ${DISPLAY} -forever -o /tmp/x11vnc.log -auth ${AUTH} -bg
# ENTRYPOINT x11vnc -wait 50 -noxdamage -display ${DISPLAY} -forever -auth ${AUTH}
# ENTRYPOINT x11vnc -wait 50 -noxdamage -display $DISPLAY_PORT -forever -auth $AUTH -usepw

## Run Command
# CMD echo -e "Display: $DISPLAY, Xauthority: $AUTH"
# CMD x11vnc -wait 50 -noxdamage -display $DISPLAY -forever -auth $AUTH
# CMD ["/bin/bash"]
CMD ["/usr/bin/x11vnc", "-forever", "-usepw", "-create"]
# CMD ["/usr/bin/x11vnc", "-forever", "-usepw", "-create", "-auth", "${AUTH}"]
# CMD ["/usr/bin/x11vnc", "-display", "${DISPLAY}", "-forever", "-usepw", "-create", "-auth", "${AUTH}"]

