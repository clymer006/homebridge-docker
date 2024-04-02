#!/bin/bash

##################################################################################################
# The Ultimate Homekit Hub.                                                                      #
# Copyright (C) 2022 Eddie dSuZa                                                                 #
#                                                                                                #
# This program is free software: you can redistribute it and/or modify                           #
# it under the terms of the GNU General Public License as published by                           #
# the Free Software Foundation, either version 3 of the License, or                              #
# (at your option) any later version.                                                            #
#                                                                                                #
# This program is distributed in the hope that it will be useful,                                #
# but WITHOUT ANY WARRANTY; without even the implied warranty of                                 #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                                  #
# GNU General Public License for more details.                                                   #
#                                                                                                #
# You should have received a copy of the GNU General Public License                              #
# along with this program.  If not, see <http://www.gnu.org/licenses/>.                          #
##################################################################################################
echo " "
echo " "
echo " "
# System Upgrade
echo "----------------------------------------------------------------"
echo "Commence System Upgrade"
echo "----------------------------------------------------------------"
sudo apt-get update && sudo apt-get upgrade -y
echo "----------------------------------------------------------------"
echo "System Upgrade Completed"
echo "----------------------------------------------------------------"
echo " "
echo " "
echo " "
# Docker setup
echo "----------------------------------------------------------------"
echo "Commence Docker Setup"
echo "----------------------------------------------------------------"
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
echo "----------------------------------------------------------------"
echo "Docker Setup Completed"
echo "----------------------------------------------------------------"
echo " "
echo " "
echo " "
echo "----------------------------------------------------------------"
echo "Create Necessary Directories"
echo "----------------------------------------------------------------"
mkdir /home/$USER/docker
mkdir /home/$USER/docker/mosquitto
mkdir /home/$USER/docker/mosquitto/config/
mkdir /home/$USER/docker/mosquitto/data/
mkdir /home/$USER/docker/zigbee2mqtt/
mkdir /home/$USER/docker/zigbee2mqtt/data/
echo " "
echo " "
echo " "
# Portainer setup
echo "----------------------------------------------------------------"
echo "Commence Compose Setup"
echo "copy compose file and environment file"
echo "----------------------------------------------------------------"
curl -fsSL https://raw.githubusercontent.com/clymer006/homebridge-docker/main/docker-compose.yml -o /home/$USER/docker/docker-compose.yml
curl -fsSL https://raw.githubusercontent.com/clymer006/homebridge-docker/main/.env -o /home/$USER/docker/.env
echo "----------------------------------------------------------------"
echo "Copy MQTT config"
echo "----------------------------------------------------------------"
echo " "
echo " "
sudo wget https://raw.githubusercontent.com/EddieDSuza/maxilife/main/mosquitto.conf -P /home/$USER/docker/mosquitto/config/
echo " "
echo " "
echo "----------------------------------------------------------------"
echo "Copy Zigbee2MQTT Config"
echo "----------------------------------------------------------------"
echo " "
echo " "
sudo wget https://raw.githubusercontent.com/EddieDSuza/techwitheddie/main/configuration.yaml -P /home/$USER/docker/zigbee2mqtt/data
echo " "
echo " "
echo "----------------------------------------------------------------"
echo "Run Docker Compose"
echo "----------------------------------------------------------------"
echo " "
echo " "
sudo docker compose up -d
echo " "
echo " "
echo "----------------------------------------------------------------"
echo "Portainer is reachable at homebridge.local:9000"
echo "----------------------------------------------------------------"
echo " "
echo " "
echo "----------------------------------------------------------------"
echo "Z2M Interface is reachable at homebridge.local:8081"
echo "----------------------------------------------------------------"
echo " "
echo " "
echo "----------------------------------------------------------------"
echo "Scrypted Interface is reachable at homebridge.local:10443 or port 11080"
echo "----------------------------------------------------------------"
echo " "
echo " "
echo "----------------------------------------------------------------"
echo "HEIMDALL Interface is reachable at homebridge.local:8201"
echo "----------------------------------------------------------------"
echo " "
echo " "
echo " "
echo "----------------------------------------------------------------"
echo "ALL PACKAGES INSTALLED WITH NO ERRORS"
echo "----------------------------------------------------------------"
echo " "
echo " "
echo " "
echo "Rebooting Now"
#sudo reboot
