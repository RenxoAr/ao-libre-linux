#!/bin/sh

distro=$(head -n 1 /etc/os-release | cut -d "=" -f 2 | cut -d \" -f 2)
version=$(grep "VERSION_ID" /etc/os-release | cut -d "=" -f 2 | cut -d \" -f 2)
codename=$(grep "VERSION_CODENAME" /etc/os-release | cut -d "=" -f 2 | cut -d \" -f 2)
libaud32deb="libfaudio0_20.01-0~buster_i386.deb"
libaud64deb="libfaudio0_20.01-0~buster_amd64.deb"
libaud32ub="libfaudio0_19.07-0~bionic_i386.deb"
libaud64ub="libfaudio0_19.07-0~bionic_amd64.deb"

#  Para Debian:
#  wget "https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/Debian_10/i386/${libaud32deb}"
#  wget "https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/Debian_10/amd64/${libaud64deb}"


if [ "${distro}" = "Ubuntu" ]; then

    sudo dpkg --add-architecture i386
    wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
    echo "deb https://dl.winehq.org/wine-builds/ubuntu/ ${codename} main" | sudo tee -a /etc/apt/sources.list

    if [ "${version}" = "18.04" ] || [ "${version}" = "16.04" ]; then

        wget "https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/i386/${libaud32ub}"
        wget "https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/amd64/${libaud64ub}"        
 
        sudo dpkg -i "${libaudio32ub}"
        sudo dpkg -i "${libaudio64ub}"
    fi

    sudo apt-get update
    sudo apt-get install -y winehq-stable wine-stable wine-stable-amd64 wine-stable-i386 \
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

elif [ "${distro}" = "Manjaro" ]; then

    sudo pacman -S \
        lib32-gst-plugins-base \
        lib32-gst-plugins-base-libs \
        lib32-alsa-plugins \
        lib32-libpulse \
        lib32-openal \
        gcc-multilib \
        lib32-libxcomposite \
        lib32-sdl \
        lib32-libxinerama \
        lib32-gtk2 \
        lib32-libcups \
        lib32-gnutls \
        lib32-libidn \
        lib32-p11-kit \
        lib32-libtasn1 \
        lib32-nettle \
        lib32-gmp \
        lib32-krb5 \
        lib32-keyutils \
        lib32-libldap \
        lib32-openssl \
        lib32-e2fsprogs \
        lib32-gdk-pixbuf2 \
        lib32-pango \
        lib32-libxft \
        lib32-cairo \
        lib32-pixman \
        lib32-libthai \
        lib32-libdatrie \
        lib32-atk \
        lib32-mpg123 \
        lib32-libltdl \
        wine \
        wine-mono \
        wine_gecko \
        winetricks

fi
