# One Piece TV
These Python scripts are used to make a modified version of the Desktop Simpsons TV found [here](https://withrow.io/simpsons-tv-build-guide) work. Please show the original author some love!

## Changes
This version contains a few changes:
1. This version uses VLC instead of omxplayer because omxplayer is no longer supported.
2. This version plays the episodes in order not randomly like the original.
3. I have created a setup script that will download the needed libraries and will set up the service in a common area so you do not have to use the `pi` home directory in the original version. **PLEASE REVIEW THE SETUP SCRIPT AND UNDERSTAND WHAT THE STEPS DO AND ANY CONSEQUENCES** (Do not blindly run any scripts even from me)

## Set Up
This step is to be done once all the hardware is working on the device. Once the hardware is functioning correctly you can simply copy over the `installscript.sh` to the Raspberry Pi and run `sudo chmod u+x ./installscript.sh` to make sure that the os sees the file as executable and then run the script with `sudo ./installscript.sh`. 

This script will do the following:
1. Run and Update and an Upgrade.
2. Install VLC, Git, and Python.
3. Make the directory `/var/git` which is in a common area.
4. clone this repo into `/var/git/onepiecetv`.
5. Grant access to all users the files in `/var/git/onepiecetv`.
6. Setup `tvbutton.service` and `tvplayer.service` services found in this repo.
7. Enable the services found in the above step.
8. Restart the Raspberry Pi.

When the Pi restarts your service should be running. Add any videos that you would like to have the device play in the `/var/git/onepiecetv/videos` directory.
