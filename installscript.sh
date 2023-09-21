#!/bin/bash

echo Running in $SHELL

apt-get update
apt-get upgrade

apt-get install vlc
apt-get install git
apt-get install python3

mkdir /var/git
git clone https://github.com/crabbymonkey/onepiecetv /var/git/onepiecetv
chmod -R a+rw /var/git/onepiecetv

cp /etc/systemd/system/tvbutton.service /var/git/tvbutton.service
cp /etc/systemd/system/tvplayer.service /var/git/tvplayer.service

systemctl enable tvbutton.service
systemctl enable tvplayer.service

shutdown -r now
