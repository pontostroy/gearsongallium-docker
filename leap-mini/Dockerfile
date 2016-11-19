FROM opensuse:42.2
MAINTAINER github/pontostroy

RUN zypper --gpg-auto-import-keys ar -f   http://download.opensuse.org/repositories/home:/pontostroy:/X11/openSUSE_Leap_42.1/ pont; \
zypper mr -p 20 pont; \
zypper --gpg-auto-import-keys ar -f http://download.opensuse.org/repositories/home:/mnhauke:/opencl:/testing/openSUSE_Leap_42.1/ opencl; \
zypper --gpg-auto-import-keys ar -f http://download.opensuse.org/repositories/games:/tools/openSUSE_Leap_42.1/ games-tools; \
zypper --gpg-auto-import-keys ar -f http://download.opensuse.org/repositories/games/openSUSE_Leap_42.1/ games; \
zypper --gpg-auto-import-keys ar -f http://download.opensuse.org/repositories/security/openSUSE_Leap_42.2/ security; \
zypper --gpg-auto-import-keys ar -f http://download.opensuse.org/repositories/multimedia:/libs/openSUSE_Leap_42.1/ media_libs; \
zypper --gpg-auto-import-keys ref -s; \
zypper -n in --force-resolution  krb5; \
zypper -n up --gpg-auto-import-keys --force-resolution; \
zypper -n in --no-recommends --force-resolution  Mesa Mesa-demos Mesa-libva libtxc_dxtn Mesa-libGL1 Mesa-libGLESv2-2 \
Mesa-libglapi0 bash libXpm4 libasound2 libvulkan1 libvulkan_intel libvulkan_radeon vulkan libassimp3 xorg-x11-server-wayland \
Mesa-libGLESv1_CM1 libgbm1 libGLU1 libGLEW1_13 pciutils mc less libvdpau_radeonsi libvdpau_r600 libvdpau_nouveau \ 
llvm-r600-clang libgomp1 libfreeimage3 libglut3 libgobject-2_0-0 libgthread-2_0-0 htop \
libX11-xcb1 libxcb1 libxcb-glx0 libxcb-present0 libXi6 libICE6 libSM6  libXtst6 libXinerama1 \
libxcb-xinerama0 libfreetype6 fontconfig glibc-locale fonts-config \
dejavu-fonts  bitstream-vera php5 php5-zip php5-bz2 php5-gd php5-mbstring \
php5-ctype php5-xmlreader php5-gettext php5-zlib php5-dom php5-pcntl php5-posix php5-curl php5-json php5-openssl librtmp1 xrandr \
libxcb-xf86dri0 libxcb-xv0 libxcb-util1 libxcb-image0 libxcb-dpms0  libxcb-dpms0 libxcb-cursor0 libxcb-damage0 libxcb-render-util0 \
libxcb-composite0 libXTrap6 libXfont1  libXft2 libopusfile0 libmikmod3 \
libSDL-1_2-0  libSDL2-2_0-0 libSDL_gfx15  libSDL2_gfx-1_0-0 curl wget libgcrypt11 \
libSDL2_image-2_0-0 libSDL2_mixer-2_0-0 sudo libstdc++6  strace which \
libcrypto38 libssl39 libtls11 libalut0 libphysfs1 libspeexdsp1 libspeex1 alsa alsa-utils apulse; \
zypper clean

RUN /usr/sbin/fonts-config; \
ln -s /sbin/lspci /usr/bin/lspci; \
ln -s /usr/lib64/libGLEW.so.1.13 /usr/lib64/libGLEW.so.1.5; \
ln -s /usr/lib64/libudev.so.1.4.0 /usr/lib64/libudev.so.0; \
ln -s /usr/lib64/libbz2.so.1 /usr/lib64/libbz2.so.1.0; \
ln -s /usr/lib64/librtmp.so.1 /usr/lib64/librtmp.so.0; \
rm -rf /var/log/zypper.log; \
rm -rf /etc/cron.daily/*; \
rm -rf /etc/cron.hourly/*; \
rm -rf /var/log/lastlog; \
rm -rf /var/log/zypp/*; \
rm -rf /var/log/pbl.log; \
rm -rf /usr/share/cracklib; \
rm -rf /usr/bin/dwp; \
rm -rf /usr/share/doc; \
rm -rf /var/cache/zypp*; \
rpm -qa > /listrpms; \
date +"%m_%d_%Y" > /gog_version

RUN useradd -g users  -d /home/gog -m gog -s /bin/bash -p '*'; \
usermod -a -G wheel gog; \
echo "Defaults !insults" > /etc/sudoers; \ 
echo "gog ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers; \
echo "%wheel ALL=(ALL) NOPASSWD: ALL"  >> /etc/sudoers; \
passwd -d root

USER gog
COPY ./env.sh /home/gog/.bashrc
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/bin/bash","/docker-entrypoint.sh"]
