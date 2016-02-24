#!/bin/bash
set -e

export vblank_mode=0
export EDITOR=mcedit
export vblank_mode=0
export PATH=$PATH:/usr/sbin:/usr/bin/:/bin:/sbin:.
export container=docker
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_PAPER=en_US.UTF-8
export LC_NAME=en_US.UTF-8
export LC_ADDRESS=en_US.UTF-8
export LC_TELEPHONE=en_US.UTF-8
export LC_MEASUREMENT=en_US.UTF-8
export LC_IDENTIFICATION=en_US.UTF-8
export PWD=/opt
export WORKDIR=/opt
export XDG_RUNTIME_DIR=/run/user/1000/
export AUDIODRIVER=alsa

exec "$@"