#!/bin/bash

# ------------------------------------------------------------------------------
# Pre-requisites
# A machine with CentOS 7.0 installed.
# A non-root user with sudo permission on the machine.
# Instructions Originally from: https://docs.docker.com/compose/install/
# Compiled By: Ralph O'Flinn

# https://github.com/docker/compose/releases

COMPOSEVER=1.24.1

sudo curl -L "https://github.com/docker/compose/releases/download/$COMPOSEVER/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Test the installation - Example
# $ docker-compose --version
# docker-compose version 1.24.0, build 1110ad01

# To uninstall
# sudo rm /usr/local/bin/docker-compose

