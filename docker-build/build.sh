#!/bin/bash

cd `realpath $(dirname $0)`
cd ..

# sudo UID=$(id -u $SUDO_USER) GID=$(id -g $SUDO_USER) docker compose build
sudo UID=$(id -u $SUDO_USER) GID=$(id -g $SUDO_USER) docker compose up --build