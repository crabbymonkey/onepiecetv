#!/bin/bash

echo Running in $SHELL

apt-get update
apt-get upgrade

apt-get install vlc
apt-get install git
apt-get install python3

sed -i 's/geteuid/getppid/' /usr/bin/vlc

mkdir /var/git
git clone https://github.com/crabbymonkey/onepiecetv /var/git/onepiecetv
chmod -R a+rw /var/git/onepiecetv

cp /var/git/tvbutton.service /etc/systemd/system/tvbutton.service
cp /var/git/tvplayer.service /etc/systemd/system/tvplayer.service

systemctl enable tvbutton.service
systemctl enable tvplayer.service

shutdown -r now
