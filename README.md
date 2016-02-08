# Gearsongallium docker images

# Supported tags

- gog-full
```sh
docker pull pontostroy/gearsongallium-docker:gog-full
docker run --rm --privileged -ti -e "WORKDIR=/opt/`basename $PWD`/"  \
-e="DISPLAY=unix:0.0" \
-v="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
-v="/dev/dri:/dev/dri:rw" \
-v="/$PWD:/opt:rw" \
-v="/dev/snd:/dev/snd"  gog-full mc
```
---
- gog-mini
```sh
docker pull pontostroy/gearsongallium-docker:gog-mini
docker run --rm --privileged -ti -e "WORKDIR=/opt/`basename $PWD`/"  \
-e="DISPLAY=unix:0.0" \
-v="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
-v="/dev/dri:/dev/dri:rw"  \
-v="/$PWD:/opt:rw" \
-v="/dev/snd:/dev/snd"  gog-mini mc
```
---
# What is Gearsongallium?
openSUSE based images with opensource video stack from [gearsongallium](http://gearsongallium.com)
  - lastes mesa-git(nouveau, radeon, radeonsi, i965)
  - lastes llvm-svn and clang
  - wine-staging with gallium-nine support
  - linux steam
  - GUI and audio apps support
  - Phoronix test suite
  - easy to use with [run_gog.sh](https://github.com/pontostroy/gearsongallium-docker/blob/master/leap-full/run_gog.sh) shell script for binding dirs from host for steam, wine or phoronix test suite

Only what you need is docker and  not a very old version of kernel and x-server.
