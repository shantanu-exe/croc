#!/bin/sh

# Use different variable names to avoid clashing with readonly shell variables
export USER_ID=$(id -u)
export GROUP_ID=$(id -g)

docker compose build \
  --build-arg UID=$USER_ID \
  --build-arg GID=$GROUP_ID \
  pulp-docker

docker compose run --rm \
  -it \
  -e PS1="\[\033[01;32m\]osic:\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\] $" \
  -e DISPLAY=docker.for.mac.host.internal:0 \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  pulp-docker
