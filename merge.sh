#!/bin/sh

SEASON="$1"

EPISODE="$2"
EPNUM=$(printf "%02d" $EPISODE)

LASTPART="$3"

PARTS="S${SEASON}E${EPNUM}_title.mkv + S${SEASON}_PAUSE.mkv"
for i in `seq 1 $LASTPART`; do
    PARTS=$PARTS" + S${SEASON}E${EPNUM}_${i}.mkv + S${SEASON}_PAUSE.mkv"
done

mkvmerge -q --title "S${SEASON}E${EPNUM}" --generate-chapters when-appending -o S${SEASON}E${EPNUM}.mkv $PARTS
