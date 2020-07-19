#!/bin/bash
# echo -e "\e[92mInstalando Librerias de wine...\e[39m"

patchurl=https://github.com/ao-libre/ao-cliente/releases/download
patchv=0.13.46

launchurl=https://github.com/ao-libre/ao-autoupdate/releases/download
launchv=1.6

wprefix=Argentum

export prefix=$HOME/.wine/wineprefix
prefixAO=$prefix/$wprefix
prefixA=$prefixAO/drive_c/Program\ Files/Argentum\ Online\ Libre/Launcher/Cliente
prefixS32=$prefixAO/drive_c/windows/system32
prefixC=$prefixAO/drive_c

echo ""
echo "##################################"
echo "Instalando Launcher AOLibre..."
echo "##################################"
echo ""
# Descargamos el launcher si no existe...
if [ ! -e "aolibre-installer-v$launchv.exe" ]; then wget "$launchurl/v$launchv/aolibre-installer-v$launchv.exe"; fi

echo -e "\e[92mInstalando Launcher de AO Libre...\e[39m"
WINEPREFIX=$prefixAO wine aolibre-installer-v$launchv.exe

echo ""
echo "##################################"
echo "Instalando winetricks DLLs..."
echo "##################################"
echo ""

WINEPREFIX=$prefixAO winetricks -q mfc42 vcrun2013 vb6run riched30 directmusic

echo ""
echo "##################################"
echo "Instalando Cliente WinXP..."
echo "##################################"
echo ""

# Descargamos el cliente de winxp si no existe...
if [ ! -e "v$patchv.zip" ]; then wget "$patchurl/v$patchv/v$patchv.zip"; fi

# Descomprimimos...
if [ ! -d "$prefixA" ]; then mkdir "$prefixA"; fi
unzip -q -o "v$patchv.zip" -d "$prefixA"
chmod 775 -R "$prefixA"

echo ""
echo "##################################"
echo "Registros..."
echo "##################################"
echo ""

echo -e 'Windows Registry Editor Version 5.00\n\n\n\n[HKEY_CURRENT_USER\Software\Wine\AppDefaults\Argentum.exe]\n\n"Version"="winxp"\n\n\n' > "$prefixA/ao_winxp.reg"
WINEPREFIX=$prefixAO wine regedit "$prefixA/ao_winxp.reg"

echo -e 'Windows Registry Editor Version 5.00\n\n\n\n[HKEY_CURRENT_USER\Software\Wine\AppDefaults\Argentum.exe\Direct3D]\n\n"DirectDrawRenderer"="opengl"\n\n\n' > "$prefixA/d3dopengl.reg"
WINEPREFIX=$prefixAO wine regedit "$prefixA/d3dopengl.reg"

echo "Windows Registry Editor Version 5.00

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

" > "$prefixA/dlloverrides.reg"

WINEPREFIX=$prefixAO wine regedit "$prefixA/dlloverrides.reg"

echo ""
echo "##################################"
echo "Listo !!"
echo "##################################"
echo ""
