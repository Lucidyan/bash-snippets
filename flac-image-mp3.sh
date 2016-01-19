#!/bin/sh

#NAME            :flac-image-mp3.sh 
#DESCRIPTION     :Split FLAC-file with cue, converting to mp3
#DEPENDENCIES	 :shntool, cueprint, lame
#USAGE	 	 	 :Run from directory with CUE-file: ./flac-image-mp3.sh 
#AUTHOR		 	 :Lucidyan
#DATE            :20160119
#VERSION         :0.1a (OLD VERSION)    
#==============================================================================

FROMCP=`enca -e *.cue`
iconv -f $FROMCP -t UTF-8 *.cue > /tmp/list.cue

DATE=`grep "REM DATE" /tmp/list.cue | sed -e 's/REM DATE \(.*\)/\1/g'`
GENRE=`grep "REM GENRE" /tmp/list.cue | sed -e 's/REM GENRE \(.*\)/\1/g'`
COMMENT=`grep "REM COMMENT" /tmp/list.cue | sed -e 's/REM COMMENT \(.*\)/\1/g'`
NUMBER=`cueprint -d "%N" /tmp/list.cue`

shntool split -f /tmp/list.cue *.flac -t %n

for((I=1;I<=$NUMBER;I++));
do
	cueprint -n $I -t "ARTIST=\"%p\"\nALBUM=\"%T\"\nTRACKNUMBER=\"%n\"\nTITLE=\"%t\"\n" /tmp/list.cue > /tmp/tags
	. /tmp/tags
	J=`printf "%02d" $I`
	lame -b 192 --cbr \
	--ty "$DATE" \
	--tg "$GENRE" \
	--tc "$COMMENT" \
	--ta "$ARTIST" \
	--tl "$ALBUM" \
	--tn "$TRACKNUMBER" \
	--tt "$TITLE" \
	--add-id3v2 \
	--id3v2-only \
	$J.wav $J.mp3
	rm $J.wav
done

rm /tmp/list.cue /tmp/tags