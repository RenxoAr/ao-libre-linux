#!/bin/bash
monov=5.1.0
geckov=2.47.1
wprefix=Argentum

export prefix=$HOME/.wine/wineprefix
prefixAO=$prefix/$wprefix

# Chequeamos y creamos las carpetas
if [ ! -d "$HOME/.wine" ]; then mkdir "$HOME/.wine"; fi
if [ ! -d "$prefix" ]; then mkdir "$prefix"; fi

# Otra comprobacion de carpeta...
if [ ! -d "$prefixAO" ]; then mkdir "$prefixAO"; fi

# Descargamos gecko(IE) y mono(dotnet) para wine
if [ ! -e "$HOME/.cache/wine/wine-mono-$monov-x86.msi" ]; then wget -P $HOME/.cache/wine http://dl.winehq.org/wine/wine-mono/$monov/wine-mono-$monov-x86.msi; fi
if [ ! -e "$HOME/.cache/wine/wine-gecko-$geckov-x86.msi" ]; then wget -P $HOME/.cache/wine http://dl.winehq.org/wine/wine-gecko/$geckov/wine-gecko-$geckov-x86.msi; fi

mkdir -p $prefix/share/wine/{mono,gecko}

cp "$HOME/.cache/wine/wine-mono-$monov-x86.msi" $prefix/share/wine/mono
cp "$HOME/.cache/wine/wine-gecko-$geckov-x86.msi" $prefix/share/wine/gecko

# Setea wine para este disco y hace un primer inicio para armar la imagen

echo ""
echo "##################################"
echo "Inicializando WINEPREFIX: Argentum"
echo "##################################"
echo ""
WINEPREFIX=$prefixAO WINEARCH=win32 winetricks win7
WINEPREFIX=$prefixAO wine msiexec /i $prefix/share/wine/mono/wine-mono-$monov-x86.msi
WINEPREFIX=$prefixAO wine msiexec /i $prefix/share/wine/gecko/wine-gecko-$geckov-x86.msi

echo "Listo!"

bash 3-cliente_dl-ins.sh

