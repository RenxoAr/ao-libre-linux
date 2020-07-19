#!/bin/bash
# Manjaro Installer

echo "Instalando Librerias y despues wine"
sudo pacman -S lib32-gst-plugins-good lib32-gst-plugins-base lib32-gst-plugins-base-libs lib32-alsa-plugins lib32-libpulse lib32-openal gcc-multilib lib32-libxcomposite lib32-sdl lib32-libxinerama lib32-gtk2 lib32-libcups lib32-gnutls lib32-libidn lib32-p11-kit lib32-libtasn1 lib32-nettle lib32-gmp lib32-krb5 lib32-keyutils lib32-libldap lib32-openssl lib32-e2fsprogs lib32-gdk-pixbuf2 lib32-pango lib32-libxft lib32-cairo lib32-pixman lib32-libthai lib32-libdatrie lib32-atk lib32-mpg123 lib32-libltdl wine wine-mono wine_gecko winetricks playonlinux 

# Estas son necesarias para la musica pero estan rotas las dependencias: lib32-gst-plugins-bad lib32-gst-plugins-ugly
