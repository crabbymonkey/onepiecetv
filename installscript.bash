#!/bin/bash

echo Running in $SHELL

apt-get update
apt-get upgrade

apt-get install vlc
apt-get install git

touch /etc/systemd/system/tvbutton.service
sudo nano /etc/systemd/system/tvbutton.service
