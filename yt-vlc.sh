#!/bin/sh

#NAME            :yt-vlc.sh
#DESCRIPTION     :Watching YouTube videos in VLC player
#DEPENDENCIES	 :youtube-dl, vlc
#SYNOPSIS	 :./yt-vlc.sh URL 
#AUTHOR		 :Lucidyan
#DATE            :20160119
#VERSION         :0.1    
#==============================================================================

youtube-dl -o - -f 18 $1 | vlc -


