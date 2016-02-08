#!/bin/sh

if [ -x /usr/bin/xhost ] ; then
    /usr/bin/xhost +
fi
OPTIND=1
DOCKER='docker run --privileged -ti'
RM="--rm"
WD=(WORKDIR=/opt/`basename $PWD`/)
DISP="DISPLAY=unix:0.0"
XSOC="/tmp/.X11-unix:/tmp/.X11-unix:rw"
DRI="/dev/dri:/dev/dri:rw"
DIR="/$PWD:/opt:rw"
SOUND="/dev/snd:/dev/snd"
DOCRUN="mc"
IMAGE_NAME="gog-full"
####For Steam 
#-v="/some_dir:/home/gog/.local/share/Steam" -v="/home/username/.local/share/Steam/steamapps:/home/gog/.local/share/Steam/steamapps"
#
STEAM=""
#STEAM=-v='/tmp/steam:/home/gog/.local/share/Steam" -v="/home/pont/.local/share/Steam/steamapps:/home/gog/.local/share/Steam/steamapps'
#
###For Wine add before gog-full mc
#-v="/some_dir_or_/home/username/.wine:/home/gog/.wine"
#
WINE=""
#WINE=-v="/some_dir_or_/home/username/.wine:/home/gog/.wine"
#
####For Phoronix test suite add before gog-full mc
#-v="/some_dir_or_/home/username/.phoronix-test-suite:/home/gog/.phoronix-test-suite"
#####
PST=""
#PTS=-v="/some_dir_or_/home/username/.phoronix-test-suite:/home/gog/.phoronix-test-suite"
#


function show_help {
echo "Run with
         -w wine dir
         -s steam dir
         -i steam app dir
         -p phoronix test suite dir
         -h show help message"
}
         
         
         
while getopts "h?wsip:" opt; do
    case "$opt" in
    h|\?)
        show_help
        exit 0
        ;;
    w)  WINE=(-v=$OPTARG:/home/gog/.wine)
        echo "WINE BIND $WINE"
        ;;
    s)  STEAM=(-v=$OPTARG:/home/gog/.local/share/Steam)
        echo "STEAN BIND $STEAM"
        ;;
    i)  STEAM=($STEAM -v=$OPTARG:/home/gog/.local/share/Steam/steamapps)
        echo "STEAN + STEAM APP BIND $STEAM" 
        ;;
    p)  PTS=(-v=$OPTARG:/home/gog/.phoronix-test-suite)
        echo "PTS BIND $PTS"
        ;;
    esac
done

shift $((OPTIND-1))

[ "$1" = "--" ] && shift      


CMD="$DOCKER $RM -e=$WD -e=$DISP -v=$XSOC -v=$DRI -v=$DIR -v=$SOUND $STEAM $PTS $WINE $IMAGE_NAME $DOCRUN"
echo $CMD

exec $CMD