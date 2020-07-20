# Argentum Online Libre en Linux

Scripts para correr Argentum Online Libre en Linux

Descargar solo **"install.sh"** y ejecutarlo con `sh install.sh`

**POR FAVOR REVISEN SU INSTALACIÓN DE WINE**

**TESTEADO CON WINE 5.9-STAGING en Manjaro KDE 20 y Ubuntu LTS 20.04**

Esto va a instalar wine, dependencias, el launcher y el cliente de AO Libre

**Si pregunta para instalar MONO y GECKO, le dan OK**

Una vez que llegue a la instalacón del LAUNCHER:

  - Elijan el idioma y despues todo aceptar
  - Dejen la carpeta default de instalación
  - Desmarquen "Ejecutar y "Ver Leeme" cuando termine (no funciona)
  
Cuando termine va a copiar y a iniciar el cliente.

**PARA CORRER EL CLIENTE USAR EL SCRIPT:** **`$HOME/.ao-libre-linux/run.sh`**

Si necesitan borrar la instalación, borran la carpeta --> `$HOME/.wine/wineprefix/Argentum`

El script descarga todo en la carpeta --> `$HOME/.ao-libre-linux`

Si no inicia o tira errores, posiblemente sean faltantes de dependencias de wine, pueden tratar de instalarlas a mano, son siempre las de 32 bits.



~~Todos los scripts trate de dejarlos lo mas configurables y sencillos posibles, no me maten por los errores de lógica, no sabo programar.~~
eso no va mas, Gracias Fenrir por la colaboración en que todo ande mas bonito y fluido.

Dedicado con amor a la comunidad que tanto me dio.

Gracias Morgolock por tanto, perdon por tan poco.

