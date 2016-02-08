FROM opensuse:leap
MAINTAINER github/pontostroy

RUN zypper --gpg-auto-import-keys ar -f   http://download.opensuse.org/repositories/home:/pontostroy:/X11/openSUSE_Leap_42.1/ pont; \
zypper --gpg-auto-import-keys ar -f http://download.opensuse.org/repositories/home:/mnhauke:/opencl:/testing/openSUSE_Leap_42.1/ opencl; \
zypper --gpg-auto-import-keys ar -f http://download.opensuse.org/repositories/games:/tools/openSUSE_Leap_42.1/ games-tools; \
zypper --gpg-auto-import-keys ar -f http://download.opensuse.org/repositories/games/openSUSE_Leap_42.1/ games; \
zypper --gpg-auto-import-keys ar -f http://download.opensuse.org/repositories/multimedia:/libs/openSUSE_Leap_42.1/ media_libs; \
zypper --gpg-auto-import-keys ref -s; \
zypper -n rm krb5-mini; \
zypper -n --gpg-auto-import-keys up; \
zypper -n in --no-recommends  Mesa Mesa-demos libtxc_dxtn Mesa-libGL1 Mesa-libd3d Mesa-libGLESv2-2 \
Mesa-libglapi0 bash libXpm4 clpeak clinfo libasound2 \
Mesa-libOpenCL Mesa-libGLESv1_CM1 libgbm1 libGLU1 libGLEW1_13 pciutils mc \ 
llvm-r600-clang libgomp1 libfreeimage3 libglut3 libgobject-2_0-0 libgthread-2_0-0 htop \
libX11-xcb1 libxcb1 libxcb-glx0 libxcb-present0 libXi6 libICE6 libSM6  libXtst6 libXinerama1 \
libxcb-xinerama0 libXfont1 libfreetype6 fontconfig glibc-locale fonts-config \
dejavu-fonts  bitstream-vera php5 php5-zip php5-bz2 php5-gd php5-mbstring \
php5-ctype php5-xmlreader php5-gettext php5-zlib php5-dom php5-pcntl php5-posix php5-curl php5-json \
libSDL-1_2-0  libSDL2-2_0-0 libSDL_gfx15  libSDL2_gfx-1_0-0 curl wget libgcrypt11 \
libSDL2_image-2_0-0 libSDL2_mixer-2_0-0 sudo libstdc++6 \
libcrypto36 libssl37 libtls9 libalut0 libphysfs1 libspeexdsp1 libspeex1 alsa alsa-utils apulse \
wine steam tar coreutils ca-certificates-cacert ca-certificates-mozilla \
Mesa-libd3d-32bit libbz2-1-32bit libGLEW1_13-32bit libXi6 libICE6-32bit libSM6-32bit  libXtst6-32bit libXinerama1-32bit libtxc_dxtn-32bit \
libSDL-1_2-0-32bit  libSDL2-2_0-0-32bit libSDL_gfx15-32bit  libSDL2_gfx-1_0-0-32bit libusb-1_0-0-32bit \
Mesa-libOpenCL-32bit libcrypto36-32bit  libssl37-32bit libtls9-32bit libgbm1-32bit libGLU1-32bit gconf2-32bit; \
zypper clean

RUN /usr/sbin/fonts-config; \
ln -s /sbin/lspci /usr/bin/lspci; \
ln -s /usr/lib64/libGLEW.so.1.13 /usr/lib64/libGLEW.so.1.5; \
ln -s /usr/lib64/libudev.so.1.4.0 /usr/lib64/libudev.so.0; \
ln -s /usr/lib64/libbz2.so.1 /usr/lib64/libbz2.so.1.0; \
ln -s /usr/lib/libGLEW.so.1.13 /usr/lib/libGLEW.so.1.5; \
ln -s /usr/lib/libudev.so.1.4.0 /usr/lib/libudev.so.0; \
ln -s /usr/lib/libbz2.so.1 /usr/lib/libbz2.so.1.0; \
rm -rf /var/log/zypper.log; \
rm -rf /etc/cron.daily/*; \
rm -rf /etc/cron.hourly/*; \
rm -rf /var/log/lastlog; \
rm -rf /var/log/zypp/*; \
rm -rf /var/log/pbl.log; \
rm -rf /usr/share/cracklib; \
rm -rf /usr/bin/dwp; \
rm -rf /usr/share/doc; \
rm -rf /var/share/wine/gecko; \
rm -rf /var/cache/zypp*; \
rm -rf /var/cache/zypp*; \
rpm -qa > /listrpms; \
date +"%m_%d_%Y" > /gog_version

RUN useradd -g users  -d /home/gog -m gog -s /bin/bash -p '*'; \
usermod -a -G wheel gog; \
echo "Defaults !insults" > /etc/sudoers; \ 
echo "gog ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers; \
echo "%wheel ALL=(ALL) NOPASSWD: ALL"  >> /etc/sudoers; \
mkdir -p /home/gog/.local/share/Steam; \
mkdir /home/gog/.wine; \
mkdir /home/gog/.steam; \
chown -hR gog:users /home/gog; \
passwd -d root

USER gog
COPY ./env.sh /home/gog/.bashrc

CMD mc