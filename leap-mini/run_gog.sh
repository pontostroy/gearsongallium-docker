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
IMAGE_NAME="gog-mini"


####For Phoronix test suite add before gog-full mc
#-v="/some_dir_or_/home/username/.phoronix-test-suite:/home/gog/.phoronix-test-suite"
#####
PST=""
#PTS=-v="/some_dir_or_/home/username/.phoronix-test-suite:/home/gog/.phoronix-test-suite"
#


function show_help {
echo "Run with
         -p phoronix test suite dir
         -h show help message"
}
         
         
         
while getopts "h?p:" opt; do
    case "$opt" in
    h|\?)
        show_help
        exit 0
        ;;
    p)  PTS=(-v=$OPTARG:/home/gog/.phoronix-test-suite)
        echo "PTS BIND $PTS"
        ;;
    esac
done

shift $((OPTIND-1))

[ "$1" = "--" ] && shift      


CMD="$DOCKER $RM -e=$WD -e=$DISP -v=$XSOC -v=$DRI -v=$DIR -v=$SOUND  $PTS  $IMAGE_NAME $DOCRUN"
echo $CMD

exec $CMD