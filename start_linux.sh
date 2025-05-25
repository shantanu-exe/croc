#!/bin/sh

docker compose build pulp-docker

docker compose run --rm -it \
  -e PS1="\[\033[01;32m\]osic:\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\] $" \
  -e DISPLAY=docker.for.mac.host.internal:0 \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  pulp-docker
