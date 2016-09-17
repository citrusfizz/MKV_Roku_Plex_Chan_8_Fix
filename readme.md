# MKVRokuPlexChan8Fix



## Description
There is an odd bug *currently* for the Roku platform Running Plex and Streaming video files.  This bug effects video that report as 7.1 DTS audio stream in Plex. More specifically, this effects .mkv files with "Channels: 8" in the metadata. The mkv metadata is a small amount of information in the file to let programs gain more information about the video. This bug will prevent the MKV video from playing audio track on the Roku via Plex with Direct streaming.
 #Have you ever had to enable subtitles in Plex on your Roku to be able to hear the audio?  That is because the Plex Media Server will transcode the file and burn in the subtitles. Which means that the transcoded video does not suffer from the bug. 
 
 
 # What does this Script do?
 This is a powershell script to find all MKV files in a specified directory and edit the metadata for any files that have "Channels: 8" in the mkv metadata in the file. This script is recursive by default and can be changed. 
 The script will change any files with this specific metadata, from Channels: 8  to Channels: 6  which will allow the Roku/Plex app to play the file correctly. This does not affect or modify the actual audio stream of the video.  This does not change every file.  Only files with the extension .mkv and only videos that have "Channels: 8" in the metadata

This script will take the directory you pass it and look for any file with the extension .mkv and then look for any matching file with "Channels: 8" in the metadata and change only that part of the metadata to "Channels: 6" instead of 8. It will no touch any files that don't don't have this specific metadata "Channels: 8".  This is a fully automated script as long as you have the prerequisites installed and set.

This Script uses tooks from this installation package https://www.fosshub.com/MKVToolNix.html to perform the lookup and change to the files. The rest is just powershell logic
 
 ```note: Some apps may use this metadata to display information about the video. This may result in the wrong information being displayed in such apps. ```

 # How to duplicate the bug
 1. Find an MKV movie with 7.1 DTS audio stream with the Plex app on the Roku.
 2. Try and play the movie with direct stream. Make sure its not transcoding the file before being sent to the Roku, Also make sure that no subtitles are enabled
 3. If the metadata of the file has "Channels: 8" The roku will not play the audio. The video will *look* fine however

# Installation/usuage.

 - Simply clone or copy MKVRokuPlexChan8Fix.ps1 onto your windows computer somewhere.
- Make sure to have MKVToolsNix installed.  If you need this installation file you can find it here. here https://www.fosshub.com/MKVToolNix.html
- Open MKVRokuPlexChan8Fix.ps1 with your prefered editor and find the variable *$MKVToolNixPath* and, if needed, change the path to wherever you installed the MKVToolNix tools. This should already be set to the default installation path
- Open up a powershell prompt (you might need to open as administrator) and change to the directory to where you saved this script.
-to run type:

```sh
C:\Pathtowhereyouclonedthescript\> ./MKVRokuPlexChan8Fix.ps1 -FolderPath "d:\path to bulk of your videos\"  
```
- any videos with the Channels: 8 in the meta data will be changed.  
- Once the script is complete, any videos should now play the audio stream fine in Plex on the Roku

 
# More info on the plex forum and where I got the original Fix. 
https://forums.plex.tv/discussion/204927/new-7-1-update-0-9-15-2-no-audio-playing-through-roku



x