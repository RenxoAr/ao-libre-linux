#!/bin/bash
sudo dpkg --add-architecture i386
wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -

sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'

sudo apt update

sudo apt install -y winehq-staging=5.9~focal wine-staging=5.9~focal wine-staging-amd64=5.9~focal wine-staging-i386=5.9~focal

sudo apt install -y \
winetricks \
gcc-multilib \
cabextract \
libasound2:i386 \
libasound2-plugins:i386 \
libpulse0:i386 \
libopenal1:i386 \
libdbus-1-dev:i386 \
libfontconfig1-dev:i386 \
libfreetype-dev:i386 \
libgnutls28-dev:i386 \
libgnutls30:i386 \
libjpeg-dev:i386 \
libpng-dev:i386 \
libtiff-dev:i386 \
libunwind-dev:i386 \
libxml2-dev:i386 \
libncurses-dev:i386 \
libncurses5:i386 \
libfaudio-dev:i386 \
libgstreamer1.0-dev:i386 \
libmpg123-0:i386 \
libmpg123-dev:i386 \
libsdl2-dev:i386 \
libsdl2-2.0-0:i386 \
libudev-dev:i386 \
libudev1:i386 \
liblcms2-dev:i386 \
libcups2:i386 \
libcups2-dev:i386 \
libglu1-mesa:i386 \
libglu1-mesa-dev:i386 \
libgsm1:i386 \
libgsm1-dev:i386 \
libgssapi-krb5-2:i386 \
libkrb5-3:i386 \
libkrb5-dev:i386 \
libusb-dev:i386 \
libusb-1.0-0:i386 \
libv4l-0:i386 \
libv4l-dev:i386 \
libxcomposite1:i386 \
libxinerama1:i386 \
libgtk2.0-0:i386 \
libidn11:i386 \
libp11-kit0:i386 \
libtasn1-6:i386 \
libnettle7:i386 \
libgmp10:i386 \
libkeyutils1:i386 \
libldap-2.4-2:i386 \
libssl1.1:i386 \
libgdk-pixbuf2.0-0:i386 \
libpango-1.0-0:i386 \
libxft2:i386 \
libcairo2:i386 \
libpixman-1-0:i386 \
libthai0:i386 \
libdatrie1:i386 \
libatk1.0-0:i386 \
libltdl7:i386 \
gstreamer1.0-plugins-good:i386 \
gstreamer1.0-plugins-bad:i386 \
gstreamer1.0-plugins-ugly:i386 \
gstreamer1.0-pulseaudio:i386
