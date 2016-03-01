#!/bin/bash

if [ -x /usr/bin/xhost ] ; then
    /usr/bin/xhost +
fi
PW="$PWD"
OPTIND=1
DOCKER='docker run --privileged -ti'
# delete image changes after stop
RM="--rm"
#get current dir
#WD=(WORKDIR=/opt/`basename "$PW"`/)
WD=(WORKDIR=/opt/)
#
DISP="DISPLAY=$DISPLAY"
#X-server socket
XSOC="/tmp/.X11-unix:/tmp/.X11-unix:rw"
#dri path
DRI="/dev/dri:/dev/dri:rw"
#
SHM="/dev/shm:/dev/shm"
DBUS="/var/lib/dbus:/var/lib/dbus"
#set current dir as /opt/ in docker
DR="$PW:/opt:rw"
#sound
SOUND="/dev/snd:/dev/snd"
XDG=""
# run this at first
DOCRUN="mc"
#image name for docker use  sudo docker images
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
WD=$( echo "$WD" | sed 's/ /\\ /g' )
DR=$( echo "$DR" | sed 's/ /\\ /g' )

function show_help {
echo "Run with
         -w wine dir(usually ~/.wine)
         -s steam dir(usually ~/.local/share/Steam)
         -i steam app dir (usually ~/.local/share/Steam/steamapps)
         -p phoronix test suite dir (usually ~/.phoronix-test-suite)
         -n image name with tag
         -x XDG runtime dir (usually /run/user/1000)
         -c command to run (default mc)
         -h show help message"
}
         
         
         
while getopts "h?w:s:i:p:n:c:x:" opt; do
    case "$opt" in
    h|\?)
        show_help
        exit 0
        ;;
    w)  WINE="-v=$OPTARG:/home/gog/.wine:rw"
        echo "WINE BIND $WINE"
        ;;
    s)  STEAM=(-v=$OPTARG:/home/gog/.local/share/Steam/)
        echo "STEAN BIND $STEAM"
        ;;
    i)  STEAM="$STEAM -v=$OPTARG:/home/gog/.local/share/Steam/steamapps/"
        echo "STEAN + STEAM APP BIND $STEAM" 
        ;;
    p)  PTS="-v=$OPTARG:/home/gog/.phoronix-test-suite:rw"
        echo "PTS BIND $PTS"
        ;;
    n)  IMAGE_NAME="$OPTARG"
        echo "IMAGE NAME $IMAGE_NAME"
        ;;
    x)  XDG="-v=$OPTARG:/run/user/1000"
        echo "XDG PATH $XDG"
        ;;
    c)  DOCRUN="$OPTARG"
        echo "run $DOCRUN"
        ;;
    esac
done

shift $((OPTIND-1))

[ "$1" = "--" ] && shift      


CMD="$DOCKER $RM -e=$WD -e=$DISP -v=$XSOC -v=$DRI -v=$DR -v=$DBUS -v=$SHM -v=$SOUND $STEAM $PTS $WINE $XDG $IMAGE_NAME $DOCRUN"
echo "$CMD"

eval  $CMD