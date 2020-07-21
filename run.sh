#!/bin/sh

export prefix="${HOME}/.wine/wineprefix"
prefixAO="${prefix}/Argentum/drive_c/Program Files/Argentum Online Libre/Launcher/Cliente"
prefixDirAO="${prefix}/Argentum"

WINEDEBUG=fixme-all WINEPREFIX="${prefixDirAO}" WINEDEBUG=heap+all wine "${prefixAO}/Argentum.exe"
