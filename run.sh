#!/bin/sh
export prefix="${HOME}/.wine/wineprefix"
prefix_waol="${prefix}/Argentum/drive_c/Program Files/Argentum Online Libre/Launcher/Cliente"
prefixDirAO="${prefix}/Argentum"

patchv="$(wget -q -O - 'https://github.com/ao-libre/ao-cliente/releases/latest' | cut -d \" -f 2 | grep -o "tag/.*" | sed 's/tag\///g' | tail -n 1)"
patchurl="https://github.com/ao-libre/ao-cliente/releases/download"
aogitv="$(echo $patchv | tr -d 'v.')"
aolocalv="$(grep 'VERSIONTAGRELEASE' "${prefix_waol}/INIT/Config.ini" | tr -d 'VERSIONTAGLA=v.''\n''\r''\t'' ')"

iniciar_cliente () {
        echo "Iniciando el cliente ..."
        WINEDEBUG=fixme-all WINEPREFIX="${prefixDirAO}" WINEDEBUG=heap+all wine "${prefix_waol}/Argentum.exe"
}

instalar_cliente () {
        [ ! -e "${patchv}.zip" ] && wget "${patchurl}/${patchv}/${patchv}.zip"
        unzip -q -o "${patchv}.zip" -d "${prefix_waol}"
        chmod 755 -R "${prefix_waol}"
        echo "Instalación finalizada."
}

if [ "$aogitv" -lt "$aolocalv" ]; then
        echo "Tu versión es superior a la del servidor."
        echo "Reinstalando versión correcta ..."
        instalar_cliente
        iniciar_cliente
    elif [ "$aogitv" -gt "$aolocalv" ]; then
        echo "Hay una nueva versión del cliente disponible."
        echo "Actualizando Cliente..."
        instalar_cliente
        iniciar_cliente
    elif [ "$aogitv" -eq "$aolocalv" ]; then
        echo "Version OK !!"
        iniciar_cliente
    else
        echo "NO SE PUEDE INICIAR !! No se reconoce la versión del cliente."
        echo "Reinstalando por las dudas ... :D"
        instalar_cliente
        iniciar_cliente
fi
