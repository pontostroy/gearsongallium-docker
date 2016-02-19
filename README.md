# Gearsongallium docker images
[How-to,instructions and benchmarks](http://www.gearsongallium.com/?p=2708)
# Supported tags

- gog-full 
[![](https://badge.imagelayers.io/pontostroy/gearsongallium-docker:latest.svg)](https://imagelayers.io/?images=pontostroy/gearsongallium-docker:gog-full 'Get your own badge on imagelayers.io')
32\64 bit libs, wine and linux steam
```sh
sudo docker pull pontostroy/gearsongallium-docker:gog-full
sudo docker run --rm --privileged -ti \
-e "WORKDIR=/opt/`basename $PWD`/"  \
-e="DISPLAY=unix:0.0" \
-v="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
-v="/dev/dri:/dev/dri:rw" \
-v="/$PWD:/opt:rw" \
-v="/dev/snd:/dev/snd" pontostroy/gearsongallium-docker:gog-full mc
```
---
- gog-mini
64 bit libs
```sh
sudo docker pull pontostroy/gearsongallium-docker:gog-mini
sudo docker run --rm --privileged -ti \
-e "WORKDIR=/opt/`basename $PWD`/"  \
-e="DISPLAY=unix:0.0" \
-v="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
-v="/dev/dri:/dev/dri:rw"  \
-v="/$PWD:/opt:rw" \
-v="/dev/snd:/dev/snd"   pontostroy/gearsongallium-docker:gog-mini mc
```
---
# From git
```sh
git clone https://github.com/pontostroy/gearsongallium-docker.git

cd ./gearsongallium-docker

cd ./leap-full
#or
cd ./leap-mini

./build.sh
#or
sudo docker build -t gog-full .

./run_gog.sh

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
---
# run_gog.sh using examples
```sh
Run with
         -w wine dir(usually ~/.wine)
         -s steam dir(usually ~/.local/share/Steam)
         -i steam app dir (usually ~/.local/share/Steam/steamapps)
         -p phoronix test suite dir (usually ~/.phoronix-test-suite)
         -n image name or tag
         -h show help message
```
---
For wine
/home/pont/.wine wiil be available in docker /home/gog/.wine an you can use yours wine prefix in docker.
Current workdir directory will be available in docker /opt/
```sh
./run_gog.sh -n pontostroy/gearsongallium-docker:gog-full -w /home/pont/.wine
```
---
For phoronix test suite
/home/pont/.phoronix-test-suite wiil be available in docker /home/gog/.phoronix-test-suite an you can use yours phoronix-test-suite files in docker.
Current workdir directory will be available in docker /opt/
```sh
./run_gog.sh -n pontostroy/gearsongallium-docker:gog-full -p /home/pont/.phoronix-test-suite
```
---
For Steam
For Steam
/home/pont/.local/share/Steam (before using local copy of steam on docker logout from your local steam and do no use “Remember my password”, but it is better not to specify an already created Steam and simply specify an empty folder for Steam installation) will be available in docker /home/gog/.local/share/Steam, also you can bind ~/.local/share/Steam/steamapps  and  use yours game files in fresh installed steam.

If you do not have a sound, run steam with LD_PRELOAD
```sh
LD_PRELOAD=/usr/lib/libasound.so.2 steam
```

Current workdir directory will be available in docker /opt/

```sh
./run_gog.sh -n pontostroy/gearsongallium-docker:gog-full -s /home/pont/.local/share/Steam -i /home/pont/.local/share/Steam/steamapps

run_gog.sh -n pontostroy/gearsongallium-docker:gog-full -s ~/.local/share/Steam -c "env LD_PRELOAD=/usr/lib/libasound.so.2 steam"

```
---
# What work?
- Unigine valley and heaven
- Xonotic
- Lighsmark
- Gputest
- SOMA
- Grid Autosport
- Steam (linux)
- Wine(steam, gallium-nine)
- clpeak
- The Talos Principle
- DRI_PRIME
- mpv with vaapi\vdpau\opengl
- radeon vce
......