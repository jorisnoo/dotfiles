#!/usr/bin/env bash

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.

# ln -sf /usr/share/zoneinfo/Europe/Zurich /etc/localtime

sudo apt-get update
sudo apt-get install cachefilesd --yes
sudo echo "RUN=yes" > /etc/default/cachefilesd

#sudo DEBIAN_FRONTEND=noninteractive apt-get --yes install php7.1-mcrypt php-imagick
#sudo service php7.1-fpm restart
#sudo service php7.2-fpm restart
