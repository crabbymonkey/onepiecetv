#!/bin/bash

echo Running in $SHELL

apt-get update
apt-get upgrade

apt-get install vlc
apt-get install git
apt-get install python

mkdir /var/git
git clone https://github.com/crabbymonkey/onepiecetv /var/git/onepiecetv

touch /etc/systemd/system/tvbutton.service
sudo nano /etc/systemd/system/tvbutton.service
