import os
import random
import time
from subprocess import PIPE, Popen, STDOUT

directory = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'videos')
startVideoFile = os.path.join(directory, 'startVideoFile.txt')
videos = []
startVideo = ""

if not os.path.exists(startVideoFile):
    with open(startVideoFile, 'x') as file:
        file.write("")

with open(startVideoFile, 'r') as file:
    startVideo = file.read()

def getVideos():
    global videos
    global startVideo
    videos = []
    for file in os.listdir(directory):
        if file.lower().endswith('.mp4'):
            videos.append(os.path.join(directory, file))
    videos = sorted(videos)
    if startVideo not in videos:
        startVideo = ""

def playVideos():
    global videos
    global startVideoFile
    global startVideo
    if len(videos) == 0:
        getVideos()
        time.sleep(20)
        return
    for video in videos:
        if startVideo != "":
            if video == startVideo:
                startVideo = ""
            else:
                continue
        with open(startVideoFile, 'w') as file:
            file.write(video)
            file.flush()
        playProcess = Popen(['cvlc', '--width=480', '--height=320', '--aspect', '3:2', '--no-osd', video])
        playProcess.wait()
    with open(startVideoFile, 'w') as file:
            file.write("")
            file.flush()

while (True):
    playVideos()
