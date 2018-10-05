#!/bin/sh

SEASON="$1"

EPISODES="$2"

PARTS=""
for i in `seq 1 $EPISODES`; do
    EPNUM=$(printf "%02d" $i)
    PARTS=$PARTS" + S${SEASON}E${EPNUM}.mkv"
done

mkvmerge -q --title "S${SEASON}" --generate-chapters when-appending -o S${SEASON}.mkv S${SEASON}E01.mkv $PARTS
