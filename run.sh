#!/bin/sh

export prefix="${HOME}/.wine/wineprefix"
prefixAO="${prefix}/Argentum/drive_c/Program Files/Argentum Online Libre/Launcher/Cliente"
prefixDirAO="${prefix}/Argentum"

WINEPREFIX="${prefixDirAO}" WINEDEBUG=heap+all wine "${prefixAO}/Argentum.exe"
