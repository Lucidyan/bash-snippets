#!/bin/bash

#NAME           :zipeach.sh
#DESCRIPTION    :Compress Each Folder/Directory to Separate Archives in Linux
#USAGE          :Run in required folder with items
#DEPENDENCIES   :p7zip
#SOURCE 	:http://r3dux.org/2009/06/how-to-compress-each-folderdirectory-to-separate-archives-in-linux/ 
#==============================================================================

for folder in */
do
	7z a -mx9 -mmt "${folder%/}.7z" "$folder"
done
