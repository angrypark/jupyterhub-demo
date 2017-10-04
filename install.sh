#!/bin/bash
# install jupyterhub, dependencies
# run me with sudo
set -e

apt-get update
apt-get install \
  git build-essential \
  supervisor \
  npm nodejs-legacy \
  python3-dev python3-pip

# get rmate for admin
curl -sL  https://raw.githubusercontent.com/aurora/rmate/1423bf0773059209486bb808b5b0abea115339aa/rmate > /usr/local/bin/rmate
chmod a+x /usr/local/bin/rmate
which docker || curl -sSL https://get.docker.com | sh

pip3 install -r requirements.txt

npm install -g configurable-http-proxy

cp jupyterhub.conf /etc/supervisor/conf.d/jupyterhub.conf
supervisorctl reread
supervisorctl update
