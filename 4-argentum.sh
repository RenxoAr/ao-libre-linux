#!/bin/sh
export prefix=$HOME/.wine/wineprefix
prefixA=$prefix/Argentum/drive_c/Program\ Files/Argentum\ Online\ Libre/Launcher/Cliente
cd "$prefixA"
WINEPREFIX=$prefix/Argentum WINEDEBUG=heap+all wine "$prefixA/Argentum.exe";
exit 0
