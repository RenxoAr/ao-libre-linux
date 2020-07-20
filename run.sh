#!/bin/sh

export prefix="${HOME}/.wine/wineprefix"
prefixAO="${prefix}/Argentum/drive_c/Program Files/Argentum Online Libre/Launcher/Cliente"
prefixVM="Argentum"
vmcheck="$(cat /sys/class/dmi/id/product_name)"

if [ "${vmcheck}" = "VirtualBox ]; then
    WINEPREFIX="${prefix}/${prefixVM}" winetricks videomemorysize=512
else
    WINEPREFIX="${prefix}/Argentum" WINEDEBUG=heap+all wine "${prefixAO}/Argentum.exe"
fi
