#!/bin/bash

# ------------------------------------------------------------------------------
# Pre-requisites
# A machine with CentOS 7.0 installed.
# A non-root user with sudo permission on the machine.
# Instructions Originally from: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-centos-7
# Compiled By: Ralph O'Flinn

sudo yum check-update
curl -fsSL https://get.docker.com/ | sh
sudo systemctl start docker
sudo systemctl status docker
sudo systemctl enable docker

# The next command will add the current user to the docker group
sudo usermod -aG docker $(whoami)

