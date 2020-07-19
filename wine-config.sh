#!/bin/sh

export prefix="${HOME}/.wine/wineprefix"
prefixAO="${prefix}/${wprefix}"
prefixshare="${prefix}/share/wine"
prefixcache="${HOME}/.cache/wine"
wprefix="Argentum"
monov="5.1.0"
geckov="2.47.1"
urlmono="http://dl.winehq.org/wine/wine-mono/${monov}/wine-mono-${monov}-x86.msi"
urlgecko="http://dl.winehq.org/wine/wine-gecko/${geckov}/wine-gecko-${geckov}-x86.msi"
vmcheck="$(cat /sys/class/dmi/id/product_name)"

[ ! -d "${HOME}/.wine" ] && mkdir "${HOME}/.wine"
[ ! -d "${prefix}" ] && mkdir -p "${prefix}"
[ ! -d "${prefixAO}" ] && mkdir -p "$prefixAO"
[ ! -d "${prefixshare}/mono" && "${prefixshare}/gecko" ] && mkdir -p "${prefixshare}/"{mono,gecko}

# Descargamos gecko(IE) y mono(dotnet) para wine
if [ ! -e "${HOME}/.cache/wine/wine-mono-${monov}-x86.msi" ]; then
    wget -P "${prefixcache} ${urlmono}"
fi

if [ ! -e "${HOME}/.cache/wine/wine-gecko-$geckov-x86.msi" ]; then
    wget -P "${prefixcache} ${urlgecko}"
fi

cp "${prefixcache}/wine-mono-${monov}-x86.msi" "${prefixshare}/mono"
cp "${prefixcache}/wine-gecko-${geckov}-x86.msi" "${prefixshare}/gecko"

if [ "${vmcheck}" = "VirtualBox ]; then
    WINEPREFIX=$prefixAO winetricks videomemorysize=512
else
    WINEPREFIX="$prefixAO" WINEARCH=win32 winetricks win7
    WINEPREFIX="$prefixAO" wine msiexec /i "${prefixshare}/mono/wine-mono-${monov}-x86.msi"
    WINEPREFIX="$prefixAO" wine msiexec /i "${prefixshare}/wine/gecko/wine-gecko-${geckov}-x86.msi"
fi
