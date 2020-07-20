#!/bin/sh

export prefix="${HOME}/.wine/wineprefix"
wprefix="Argentum"
prefixAO="${prefix}/${wprefix}"
prefix_waol="${prefixAO}/drive_c/Program Files/Argentum Online Libre/Launcher/Cliente"
prefixS32="${prefixAO}/drive_c/windows/system32"
prefixC="${prefixAO}/drive_c"
patchurl="https://github.com/ao-libre/ao-cliente/releases/download"
launchurl="https://github.com/ao-libre/ao-autoupdate/releases/download"
patchv="$(wget -q -O - 'https://github.com/ao-libre/ao-cliente/releases/latest' | cut -d \" -f 2 | grep -o "tag/.*" | sed 's/tag\///g' | tail -n 1)"
launchv="$(wget -q -O - 'https://github.com/ao-libre/ao-autoupdate/releases/latest' | cut -d \" -f 2 | grep -o "tag/.*" | sed 's/tag\///g' | tail -n 1)"

## INSTALACION

[ ! -e "aolibre-installer-${launchv}.exe" ] && wget "${launchurl}/${launchv}/aolibre-installer-${launchv}.exe"
[ ! -e "${patchv}.zip" ] && wget "${patchurl}/${patchv}/${patchv}.zip"
[ ! -d "${prefix_waol}" ] && mkdir -p "${prefix_waol}"

WINEPREFIX="${prefixAO}" wine "aolibre-installer-${launchv}.exe"
WINEPREFIX="${prefixAO}" winetricks -q mfc42 vcrun2013 vb6run riched30 directmusic ## DLLS

unzip -q -o "${patchv}.zip" -d "${prefix_waol}"
chmod 755 -R "${prefix_waol}"

## REGISTROS

cat <<EOF > "${prefix_waol}/ao_winxp.reg"
Windows Registry Editor Version 5.00



[HKEY_CURRENT_USER\Software\Wine\AppDefaults\Argentum.exe]

"Version"="winxp"



EOF

cat <<EOF > "${prefix_waol}/d3dopengl.reg"
Windows Registry Editor Version 5.00



[HKEY_CURRENT_USER\Software\Wine\AppDefaults\Argentum.exe\Direct3D]

"DirectDrawRenderer"="opengl"



EOF

cat <<EOF > "${prefix_waol}/dlloverrides.reg"
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\Wine\DllOverrides]
"*atl120"="native,builtin"
"*devenum"="native"
"*dmband"="native"
"*dmcompos"="native"
"*dmime"="native"
"*dmloader"="native"
"*dmscript"="native"
"*dmstyle"="native"
"*dmsynth"="native"
"*dmusic"="native"
"*dmusic32"="native"
"*dswave"="native"
"*mfc42"="native"
"*mfc42u"="native"
"*msvcp120"="native,builtin"
"*msvcr120"="native,builtin"
"*quartz"="native"
"*riched20"="native,builtin"
"*streamci"="native"
"*vcomp120"="native,builtin"
EOF

WINEPREFIX="${prefixAO}" wine regedit "${prefix_waol}/ao_winxp.reg"
WINEPREFIX="${prefixAO}" wine regedit "${prefix_waol}/d3dopengl.reg"
WINEPREFIX="${prefixAO}" wine regedit "${prefix_waol}/dlloverrides.reg"

# Si es una VM le da memoria de video para que no crashee al iniciar
vmcheck="$(cat /sys/class/dmi/id/product_name)"

[ "${vmcheck}" = "VirtualBox" ] && WINEPREFIX="${prefixAO}" winetricks videomemorysize=512
