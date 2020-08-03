#!/usr/bin/env bash

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.

# ln -sf /usr/share/zoneinfo/Europe/Zurich /etc/localtime

sudo apt-get update
sudo apt-get install -y librsvg2-bin poppler-utils

sed -i '/http {/a client_max_body_size 100M;' /etc/nginx/nginx.conf
