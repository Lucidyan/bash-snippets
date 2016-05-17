#!/bin/sh

#NAME            :flac-mp3-directsh 
#DESCRIPTION     :Direct converting splitted flac files to mp3
#DEPENDENCIES	   :moreutils(parallel), ffmpeg
#USAGE	 	 	     :Run from directory with CUE-file: ./flac-image-mp3.sh 
#AUTHOR		 	     :https://wiki.archlinux.org/index.php/Convert_Flac_to_Mp3
#DATE            :20160517
#VERSION         :0.1 
#==============================================================================

parallel-moreutils -i -j$(nproc) ffmpeg -i {} -b:a 320k {}.mp3 -- ./*.flac
rename .flac.mp3 .mp3 ./*.mp3
