#!/bin/sh

export prefix="${HOME}/.wine/wineprefix"
prefixAO="${prefix}/Argentum/drive_c/Program Files/Argentum Online Libre/Launcher/Cliente"

WINEPREFIX="${prefix}/Argentum" WINEDEBUG=heap+all wine "${prefixAO}/Argentum.exe"
