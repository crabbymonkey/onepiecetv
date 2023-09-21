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

### Running the Script

1. Review the contents of this script and the steps that it is going to do.
2. Make your way to the home directory `cd ~`.
3. Copy the install script from this repo `curl https://raw.githubusercontent.com/crabbymonkey/onepiecetv/main/installscript.sh -o ./installscript.sh`.
4. Make sure that the OS sees the file as executable `sudo chmod u+x ./installscript.sh`.
5. Run the script `sudo ./installscript.sh`.

### After the Script
After the Pi restarts your service should be running. Add any videos that you would like to have the device play in the `/var/git/onepiecetv/videos` directory, restart may be necessary. 
  
> Note: To get this working with VLC I had to add the resolution and aspect ratio of the screen in the Python script. The default I have in the script is for [this screen](https://www.amazon.com/dp/B07H8ZY89H?psc=1&ref=ppx_yo2ov_dt_b_product_details) if your screen has different dimensions then 480X320 with an aspect ration of 3:2 then please open `/var/git/onepiecetv/player.py` and edit the file based on the comment in the file for your display. If anyone knows of a way to not need these hard coded values I would like to implement that.
