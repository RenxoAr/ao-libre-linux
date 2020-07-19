#!/bin/bash

# Fix para crash de video en VirutalBox (si lo estan corriendo en una VBox es necesario)
# Hay que correrlo una vez que se termino la instalación del cliente.

wprefix=Argentum
prefix=$HOME/.wine/wineprefix
prefixAO=$prefix/$wprefix

WINEPREFIX=$prefixAO winetricks videomemorysize=512
