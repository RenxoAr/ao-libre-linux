#!/bin/sh

export prefix="${HOME}/.wine/wineprefix"
prefixAO="${prefix}/Argentum/drive_c/Program Files/Argentum Online Libre/Launcher/Cliente"
prefixDirAO="${prefix}/Argentum"
vmcheck="$(cat /sys/class/dmi/id/product_name)"

[ "${vmcheck}" = "VirtualBox" ] && WINEPREFIX="${prefixDirAO}" winetricks videomemorysize=512

WINEPREFIX="${prefixDirAO}" WINEDEBUG=heap+all wine "${prefixAO}/Argentum.exe"
