# ao-libre-linux
Scripts para correr Argentum Online Libre en Linux


Acuerdense de hacerle chmod +x a los scripts

POR FAVOR REVISEN SU INSTALACIÓN DE WINE

TESTEADO CON WINE 5.9-STAGING en Manjaro KDE 20 y Ubuntu LTS 20.04

Script 1: Instala wine, winetricks y dependencias (la mayoria son lib32- (arch) o libNOMBRE (ubuntu) de 32 bits)
ELIJAN PARA SU DISTRO.

Script 2: Crea la estructuras de carpetas y el wineprefix y deberia instalar mono y gecko
  Si pregunta para instalar mono y gecko, acepten.

 !! IMPORTANTE: EL SCRIPT Nº2 LINKEA AUTOMATICAMENTE AL TERCERO !!

Script 3: Descarga, instala y configura el cliente de AO
  - Se instala el launcher
  - Elijan el idioma y despues todo aceptar
  - Dejen la carpeta default de instalación
  - Desmarquen "Iniciar el Launcher" y "Ver Leeme" cuando termine
  
Script 4: Este es el que hace arrancar el juego.

Si necesitan borrar la instalación, borran la carpeta --> $HOME/.wine/wineprefix/Argentum

Si no inicia con los scripts del 2 al 4 o tira errores, posiblemente sean faltantes de dependencias de wine


Todos los scripts trate de dejarlos lo mas configurables y sencillos posibles, no me maten por los errores de lógica, no sabo programar.

Con amor a la comunidad que tanto me dio.

Gracias Morgolock por tanto, perdon por tan poco.

