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
WD=(WORKDIR=/opt/`basename "$PW"`/)
#
DISP="DISPLAY=unix:0.0"
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
# run this at first
DOCRUN="mc"
#image name for docker use  sudo docker images
IMAGE_NAME="gog-full"
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
         -p phoronix test suite dir (usually ~./phoronix-test-suite)
         -h show help message
         -c command to run (default mc)
         -n image name with tag"
}
         
         
         
while getopts "h?p:n:" opt; do
    case "$opt" in
    h|\?)
        show_help
        exit 0
        ;;
    p)  PTS="-v=$OPTARG:/home/gog/.phoronix-test-suite"
        echo "PTS BIND $PTS"
        ;;
    n)  IMAGE_NAME="$OPTARG"
        echo "IMAGE NAME $IMAGE_NAME"
        ;;
    c)  DOCRUN="$OPTARG"
        echo "run $IMAGE_NAME"
        ;;
    esac
done

shift $((OPTIND-1))

[ "$1" = "--" ] && shift      


CMD="$DOCKER $RM -e=$WD -e=$DISP -v=$XSOC -v=$DRI -v=$DIR -v=$DBUS -v=$SHM -v=$SOUND  $PTS  $IMAGE_NAME $DOCRUN"
echo $CMD

eval  $CMD